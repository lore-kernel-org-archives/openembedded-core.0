Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id D48B478211
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 14:45:45 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id r66so1489093qke.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 07:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=CNeRZh/upotJXTkYIsacbXSbCVVxs+7JFHzemIVV1II=;
	b=WB17PcEcCsvhy8hrkOOMDPtfTwuSwdpNwe7QFUIkleOcq754VXsMD2Hg15RFJP+E8J
	jzOr+v3QmUnRv4KjB9irE63v318DJF9Ce59d/sbWosg5IkU1FHgukAb+X0XmAqnxAETv
	AIr+Fgs8zGg9Nl5kyv6vo3EuYbSQ8w25q247SYB7rvJy/tW0inyr6Ix2F5Vl3bqOo5Z6
	CHSFgwQq1P5MS2QsrhlgKwMZJqP/JH3qZw8RFlu6TOVqbndOeE4W1VsyRG6rpuUqrUsk
	z7NAhAAK4uJDZYlqqaJTHNtHQ7rrIprPpyaZw7Yd9VJTx34s6i6iNoHi4Qr9/X2vV1nJ
	AIxg==
X-Gm-Message-State: AHPjjUhE5KoeCiC5xv/ry3Ofix7PZ6doeSEwXq7zXT1lvzrmoXOWEFYs
	7AJ3j7ZLr0zh7x09
X-Google-Smtp-Source: AOwi7QDJ/UfZRKNKIVeLmOE1glUWE8mqKdzVI1Nmbpyi0EDUYT/vqcNp0DOnGWTpGswXWFZ4kq1gYg==
X-Received: by 10.55.72.81 with SMTP id v78mr4089822qka.333.1504881946529;
	Fri, 08 Sep 2017 07:45:46 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	i41sm1391322qta.23.2017.09.08.07.45.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 07:45:45 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 11:45:38 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 11:44:47 -0300
Message-Id: <20170908144454.14308-6-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908144454.14308-1-otavio@ossystems.com.br>
References: <20170908144454.14308-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4 05/12] goarch.bbclass: Replace logic for setting GOARM
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Sep 2017 14:45:46 -0000

From: Will Newton <will.newton@gmail.com>

The previous logic applied a regex to TUNE_FEATURES which could
set the GOARM value to 7 incorrectly, for example when dealing
with an arm1176 core. Simplify to check for the presence of
"armv7" instead. At the same time add a check for "armv6" and
set GOARM to 6 in that case.

Signed-off-by: Will Newton <willn@resin.io>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v4:
- new patch to consolidade in a single patchset all golang changes

Changes in v3: None
Changes in v2: None

 meta/classes/goarch.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 7960ac5f9e..0f0d8b6a60 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -45,8 +45,11 @@ def go_map_arch(a, d):
 
 def go_map_arm(a, f, d):
     import re
-    if re.match('arm.*', a) and re.match('arm.*7.*', f):
-        return '7'
+    if re.match('arm.*', a):
+        if 'armv7' in f:
+            return '7'
+        elif 'armv6' in f:
+            return '6'
     return ''
 
 def go_map_os(o, d):
-- 
2.14.1


