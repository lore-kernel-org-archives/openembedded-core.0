Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 32CA778236
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:46:29 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id q8so5486637qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 05:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=c5+vnwgziReKHQKYbFx8pGlWobqZ5xSVPT6iJcHx3WA=;
	b=jwVuueJ++n6mQT1qahoCzxgRBcoeYf4b2OTjxATsgeBupe3/9WmeIhExc7DSeby8FY
	t5UqCsuKocMWJI/h8IU9hHnY4wi8xGPeF9StAM144Y1ySRT92Y3db0npLGdiuWFnRdFO
	G8O8qEyzRynaJb7fMu84HV3pBMyKhigT7XqrWjwAttLgwxRvb+Zxr4wHKVIlM3eyv7QG
	p4bxDlbMzmF98YPuDiI7yqz3CSny8gzQugBSuIJ1mn4a/XAavcZzafZArkeCunoV5Y84
	B62NKMt87cwrYrUdYWcDgPD7bStUE3TL64ms4+SmP1h2+Pu2a16003j41kDeIE+6iXvM
	zsAw==
X-Gm-Message-State: AHPjjUgp74RN6XZeRdfUsRgp1kvs6zsbbz3p4N7CLR06hO0DCWSbkGA5
	eiSMRs8INS61CPxM
X-Google-Smtp-Source: AOwi7QAFkoygspOZQ0r+aPXCQ3sKyNoLL3HXcIJx20VXGdw7iO34abFu5AhGiZ1lVwh/WEqXMnAArw==
X-Received: by 10.200.2.147 with SMTP id p19mr15127661qtg.242.1505133990383;
	Mon, 11 Sep 2017 05:46:30 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	z75sm5776344qkb.71.2017.09.11.05.46.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 05:46:29 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 09:46:24 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 09:45:36 -0300
Message-Id: <20170911124558.2863-5-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911124558.2863-1-otavio@ossystems.com.br>
References: <20170911124558.2863-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 04/26] goarch.bbclass: Replace logic for setting GOARM
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
X-List-Received-Date: Mon, 11 Sep 2017 12:46:29 -0000

From: Will Newton <will.newton@gmail.com>

The previous logic applied a regex to TUNE_FEATURES which could
set the GOARM value to 7 incorrectly, for example when dealing
with an arm1176 core. Simplify to check for the presence of
"armv7" instead. At the same time add a check for "armv6" and
set GOARM to 6 in that case.

Signed-off-by: Will Newton <willn@resin.io>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6: None
Changes in v5: None
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


