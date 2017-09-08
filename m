Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id D5CF178219
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 21:05:33 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id h15so2255648qta.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 14:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=lvbcw/LcNOMqVxekoDAjzm15wrlv9SLMdRDdv95msrs=;
	b=JG7gm0CmnLT/x4BfJIuzKpcbVZL+SJIZSQd1Ol4RBoMXjD0LbOcYnykT4tShKTAiVh
	eXHiWQge6r6MP6Q68ChKXjBQhtWOr/37vk3JSSEda7HApQu2x0CGMvO5q2r9PvhIJFu6
	rE1u75UaPKTQvddRBYKnAz3cUEX0NIu7oocGM7pIfwHn9CpgyYfQVF4OnpnZAQFeFeB7
	TE3LxZdGRBXCa6wWbJyFMpC63SWGA3t2OwRTmT5u9CfrkLEN0tHUNPBlWDcGfMbjaD8Z
	6DKVw5cvEx8AqNj1uFHQc9yDXf41lCUkLl9kc3bTjwVcOF9UUSvUCWCZRWtBAIDXfYK6
	jcqw==
X-Gm-Message-State: AHPjjUjA7QRJVo3PoIOMSjE56mkeT2840/rrM7ra3+/g3RMpiVedVI1h
	uoP/5B+b3o8XYsEr
X-Google-Smtp-Source: AOwi7QABi0N/W9L6DX3l1v3PyqVSfYDP0cIBUGOSHxGT+OQxdyYI9wkBxxaydXGSn9D9sH2uxmee8A==
X-Received: by 10.237.56.198 with SMTP id k64mr5754981qte.224.1504904733945;
	Fri, 08 Sep 2017 14:05:33 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	b26sm1333737qkj.64.2017.09.08.14.05.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 14:05:32 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 18:05:25 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 18:04:34 -0300
Message-Id: <20170908210444.25763-5-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908210444.25763-1-otavio@ossystems.com.br>
References: <20170908210444.25763-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 04/14] goarch.bbclass: Replace logic for setting GOARM
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
X-List-Received-Date: Fri, 08 Sep 2017 21:05:34 -0000

From: Will Newton <will.newton@gmail.com>

The previous logic applied a regex to TUNE_FEATURES which could
set the GOARM value to 7 incorrectly, for example when dealing
with an arm1176 core. Simplify to check for the presence of
"armv7" instead. At the same time add a check for "armv6" and
set GOARM to 6 in that case.

Signed-off-by: Will Newton <willn@resin.io>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


