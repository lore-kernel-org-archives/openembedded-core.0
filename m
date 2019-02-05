Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id F008D6C1BD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 22:19:50 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id t200so648353wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2019 14:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GrXHzv9NJ7g+ohwXodE5H9iGgzNofMJxngOqgOvut1g=;
	b=Wj27Dnau3EVWLTIfocHg5hqzqman8sCK1umM6BVJgdnVLNoss4pNAXEDbOjATLJZNg
	eWBeqI+phJeNshrLQO1fLmTjj6LMoCgbxWMlkzdNSet0P+Cly3Rz8gLcfm2OGefiVnf2
	qSIozSYpFWoamLw0qADW/jIaktZNvra6/4nkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GrXHzv9NJ7g+ohwXodE5H9iGgzNofMJxngOqgOvut1g=;
	b=L0mT+ifqoBnk6cRMlaXRfotW5++ITkUVf7322tT1Fvt3/Uc0cNpDpcl07n/daYR4tB
	lv2ah6BXuliyiObVb/Y2ELUQ9TSkXOjkF0w0P9Uj1dRNK88kBoxKQ7GamHAKGPpm1us0
	oe5xHh6e0oNJvmt666CAAoj8/r0mI2qMnCC/JDaLg7IvSWL2x2aMP5OD6GnUWTfAMzNP
	usTg/9CDQ/Sn0+D3YaBlqyUujx/JPs/z1qUhW3Kb+y9t4Fy1in//7l+8pTZIGhlQcwP/
	GBkN1plrvGTgJY+LYxskvn4vp9/t1fkLuAsTI+jBqg5zYorT4e4lR8KHXRn/3QiKNdlN
	VahA==
X-Gm-Message-State: AHQUAuYQQdOOFPZ9jLzkk5yz3tr1ZvIKQbtpEtZKmNB6K8dzzgKtU2kR
	Qr/0ROHDwko+MDrJ6N9zTm7NIuROei8=
X-Google-Smtp-Source: AHgI3IaHcvuQX/qLdd0E3RTse5FvY7VUyzygsvJ2IYzOloY+KhVUDFDwkQPvV6XCI7JW0mwJcvyhNg==
X-Received: by 2002:a7b:c757:: with SMTP id w23mr581473wmk.59.1549405191295;
	Tue, 05 Feb 2019 14:19:51 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c9sm8887756wrs.84.2019.02.05.14.19.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Feb 2019 14:19:50 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 22:19:49 +0000
Message-Id: <20190205221949.16281-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] archiver/package_rpm: Fix the worst src.rpm generation race
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
X-List-Received-Date: Tue, 05 Feb 2019 22:19:51 -0000
Content-Transfer-Encoding: 8bit

The package_rpm code is writing outside the task's sstate directory into
the sstate of do_deploy_archives. This is "out of spec" since if the
task is installed from sstate, the files are not restored. This means
the files may appear/disappear, things are not deterministic and there are
races.

Extend the do_package_write_rpm code to handle writing the src.rpm into
place to avoid these issues. There are other problems but this avoids races
around this file.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/archiver.bbclass    | 6 ++++++
 meta/classes/package_rpm.bbclass | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index e321a0e3621..af9f010dfc4 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -37,8 +37,11 @@ ARCHIVER_MODE[recipe] ?= "0"
 DEPLOY_DIR_SRC ?= "${DEPLOY_DIR}/sources"
 ARCHIVER_TOPDIR ?= "${WORKDIR}/deploy-sources"
 ARCHIVER_OUTDIR = "${ARCHIVER_TOPDIR}/${TARGET_SYS}/${PF}/"
+ARCHIVER_RPMTOPDIR ?= "${WORKDIR}/deploy-sources-rpm"
+ARCHIVER_RPMOUTDIR = "${ARCHIVER_RPMTOPDIR}/${TARGET_SYS}/${PF}/"
 ARCHIVER_WORKDIR = "${WORKDIR}/archiver-work/"
 
+
 do_dumpdata[dirs] = "${ARCHIVER_OUTDIR}"
 do_ar_recipe[dirs] = "${ARCHIVER_OUTDIR}"
 do_ar_original[dirs] = "${ARCHIVER_OUTDIR} ${ARCHIVER_WORKDIR}"
@@ -117,6 +120,9 @@ python () {
     if d.getVarFlag('ARCHIVER_MODE', 'srpm') == "1" and d.getVar('PACKAGES'):
         if "package_rpm" in d.getVar('PACKAGE_CLASSES'):
             d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_package_write_rpm' % pn)
+            d.appendVarFlag('do_package_write_rpm', 'dirs', ' ${ARCHIVER_RPMTOPDIR}')
+            d.appendVarFlag('do_package_write_rpm', 'sstate-inputdirs', ' ${ARCHIVER_RPMTOPDIR}')
+            d.appendVarFlag('do_package_write_rpm', 'sstate-outputdirs', ' ${DEPLOY_DIR_SRC}')
             if ar_dumpdata == "1":
                 d.appendVarFlag('do_package_write_rpm', 'depends', ' %s:do_dumpdata' % pn)
             if ar_recipe == "1":
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 5dafb3e7cb6..1a64cb271ac 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -694,7 +694,7 @@ python do_package_rpm () {
     cmd = cmd + " --define '_tmppath " + workdir + "'"
     if d.getVarFlag('ARCHIVER_MODE', 'srpm') == '1' and bb.data.inherits_class('archiver', d):
         cmd = cmd + " --define '_sourcedir " + d.getVar('ARCHIVER_OUTDIR') + "'"
-        cmdsrpm = cmd + " --define '_srcrpmdir " + d.getVar('ARCHIVER_OUTDIR') + "'"
+        cmdsrpm = cmd + " --define '_srcrpmdir " + d.getVar('ARCHIVER_RPMOUTDIR') + "'"
         cmdsrpm = cmdsrpm + " -bs " + outspecfile
         # Build the .src.rpm
         d.setVar('SBUILDSPEC', cmdsrpm + "\n")
-- 
2.20.1


