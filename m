Received: from mail-pd0-f177.google.com ([209.85.192.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UYsf4-0003eR-N4
	for openembedded-core@lists.openembedded.org;
	Sun, 05 May 2013 08:43:08 +0200
Received: by mail-pd0-f177.google.com with SMTP id g10so1513397pdj.22
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2013 23:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=GjvO2eW5C7xFjDswFcfdMvqOx3SJAL1KRFyR9W8F5v8=;
	b=YjXw14ZZUeS3jMf85SbNhBRuayg454ZwSKLV463Q35dwULnj7G4EMR8unEOrC3DdoC
	VyoU4TQuqSHca1CUQEkY5IAo7m/sirED7b/GsPUQ9vgx+ihojV0u8qZvbynaEiay76hD
	o91q4EkHE/TAV4Ov4hdPBKCn0k6w3/LjYAl9db2EPmxvuiCA4zOrSrFmSCzngKmvj9bd
	47ou0f9tmX+H+mIRVg09TQfMuJc77kwFq9Wd45B7yEHARz/XDY82IKb071OPBiq2RaOJ
	vKSvUc0RO/JCEYVB75mJgCvLw8uk5DlWrtxiVTjiNj7KFjT9GeI9tjjXaaaTFfe/SqWX
	4F8A==
X-Received: by 10.68.202.104 with SMTP id kh8mr20575085pbc.74.1367735108413;
	Sat, 04 May 2013 23:25:08 -0700 (PDT)
Received: from kraj-T420.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id 10sm18502482pbr.45.2013.05.04.23.25.06
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 04 May 2013 23:25:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2013 23:24:53 -0700
Message-Id: <1367735093-10221-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] gcc-configure-target: Add --enable-dependency-tracking to EXTRA_OECONF
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 May 2013 06:43:08 -0000
X-List-Received-Date: Sun, 05 May 2013 06:43:08 -0000

Fixes errors seen while compiling gcc 4.8 for target, errors like

| /home/khem/work/angstrom/build/tmp-angstrom_next-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/libatomic/cas_n.c:125:1: fatal error: opening dependency file .deps/cas_1_.lo.Ppo: No such file or directory

which are due to disabled dependency tracking but dependency files being still generated
while compiling libatomics.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-configure-target.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-target.inc b/meta/recipes-devtools/gcc/gcc-configure-target.inc
index 6cc374b..5f608d6 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-target.inc
@@ -5,4 +5,4 @@ EXTRA_OECONF_PATHS = " \
     --with-sysroot=/ \
     --with-build-sysroot=${STAGING_DIR_TARGET} \
     --with-native-system-header-dir=${STAGING_DIR_TARGET}${target_includedir} \
-    --with-gxx-include-dir=${includedir}/c++/"
+    --with-gxx-include-dir=${includedir}/c++/ --enable-dependency-tracking"
-- 
1.8.1.2



