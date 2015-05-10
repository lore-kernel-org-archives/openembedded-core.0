Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id AAF2860043
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 14:29:08 +0000 (UTC)
Received: by pdbqd1 with SMTP id qd1so126126535pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 07:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=4mLYrJzKWbJpaz9nHqqhFUEXRK8xqatOWTU8iME3OoQ=;
	b=ewE9YfGTdUg46Zgh+KeZv2BKGhdW4l6LfX0unmIPb53meXqPs3t5AtuXLRCqfKZwtz
	G+MsszRR2r1tuLYhlfrgJ6r8vSouXeBWl5a89T2otYgb85/5kZ9DY34ujnGMtDzdxP3w
	gLFX0w3gra2xTsfJBR1q1S+wmvt2IfPYvuARxzq1DDCmV0A4zIS7iLR9KTXlm/195boE
	TreJJLrCkKhxeSZleg/x/bT0Ip3HROwIHG5H1iHNpD+AgZFA+9bM5smmHRo7qkjOs8EF
	i0gxWc8yA4J2YReIkamvR7/OPeOVWU62nPCgAZ2PMew2A0M8o3LxtUMRzXPtEPzqhUVV
	gdTg==
X-Received: by 10.68.139.103 with SMTP id qx7mr11761957pbb.133.1431268149626; 
	Sun, 10 May 2015 07:29:09 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id mi1sm10307863pab.0.2015.05.10.07.29.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 May 2015 07:29:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 May 2015 07:28:56 -0700
Message-Id: <1431268136-6968-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH] rpm: fix build issue with gcc5
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
X-List-Received-Date: Sun, 10 May 2015 14:29:12 -0000

| tset.o:(.debug_loc+0xe8): undefined reference to `.LCL0'
| tset.o:(.debug_loc+0xf7): undefined reference to `.LCL0'

thanks Khem

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.14.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index 03a24f0..22b111a 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -110,6 +110,9 @@ inherit autotools gettext
 
 acpaths = "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
 
+FULL_OPTIMIZATION_powerpc_remove = "-O2"
+FULL_OPTIMIZATION_append_powerpc = " -Os "
+
 # Specify the default rpm macros in terms of adjustable variables
 rpm_macros = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:%{_etcrpm}/macros.*:%{_etcrpm}/macros:%{_etcrpm}/%{_target}/macros:~/.oerpmmacros"
 rpm_macros_class-native = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:~/.oerpmmacros"
-- 
2.3.5


