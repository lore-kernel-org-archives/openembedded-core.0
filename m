Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4B2AE76E4A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 01:36:42 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id o11so7766537qge.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 17:36:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+xdj1WbYhdygxseKUDLtvacGCeXb94uHtxEwJyiZCHE=;
	b=RkIKrsct/OGPVsDsvwNSxCxyuBGCIXoDBQmbi9wz7UcDd28cuL+OP4NSEeEWLqBw0M
	2E1cwRyRaDS/wYVmrDV/SZtf0SMufSU+RMHCnywlXPGPdFro10yRDQQ9FVZQm3Anpsnu
	K3UkwU4tgUZkz/tBOTwCzlg02uCvTPX9CIEt6zFUIrPhyb+fWJ2AnjAY6CR0Qq8TOSb1
	LocjHDe+7nl/M3cB+wMGFe+YGHGFp3qedSWDhNyHzTkpvrISvomhXyYvaPItJ1yoFXZK
	GsY8yvRF8+lMFYBjs1FJJN5lWp/qekkYhzgO7elQHvHjIzywvmyGsoSCmKp43PyqEKJw
	K6nQ==
X-Gm-Message-State: AG10YOR5iypdvm4z8khDMQIF/6olIWsH9RToY9HYVIri1C+9svSTzBVvbx5kFDYdty2mEQ==
X-Received: by 10.140.163.6 with SMTP id j6mr14188675qhj.36.1453599403806;
	Sat, 23 Jan 2016 17:36:43 -0800 (PST)
Received: from build-slave.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	a130sm5965267qhd.9.2016.01.23.17.36.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Jan 2016 17:36:43 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 20:36:30 -0500
Message-Id: <1453599391-24309-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH 1/2] php: check for existance of directory before 'rmdir' in do_install_append_class-target
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
X-List-Received-Date: Sun, 24 Jan 2016 01:36:43 -0000

---
 meta-oe/recipes-devtools/php/php.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 67d2362..793ffe8 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -166,7 +166,9 @@ do_install_append_class-target() {
 
     TMP=`dirname ${D}/${TMPDIR}`
     while test ${TMP} != ${D}; do
-        rmdir ${TMP}
+        if [ -d ${TMP} ]; then
+            rmdir ${TMP}
+        fi
         TMP=`dirname ${TMP}`;
     done
 
-- 
1.9.1


