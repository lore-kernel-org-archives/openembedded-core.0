Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 20C8A79612
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 09:24:18 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id a108-v6so4979358wrc.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 02:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=iD74rmLdevgtIpSg/ND05md5ApZilq6AEKxcWrEiYOA=;
	b=Ly6J3zfdZzvnVOny76O/NasUhD53fOg6jJ7L9n5Pg/YGd3l23aE29EfkmfptJ6UOOp
	losrxfRaROjFDm3x9W+sp0tp7XyeDGEgVKVrfnrgZukvkt8W0kAgtaavuIsJ4vDc3Ged
	7GlZ6kEGIaFUKY5l6W8rgmmjSy+Tl2ouJV0QooX7izvNawpSrU6fZ9s3kcHEdgFs+S49
	vwaYRP/BdHbPbmc/0KE1ie+9hP9c1ZA7YSMwwhieRwpJOZsAuSIEIlRnCOnippZZtTC5
	0ctRfy64mRODgOaw6s4LxCoVHfFV0QHK/ZHCYHtxf7fnoed5hCk7QtFtzlcJi2TOycFS
	iHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=iD74rmLdevgtIpSg/ND05md5ApZilq6AEKxcWrEiYOA=;
	b=pt7JqU6aPl/AoW6W0H64fF6VUb6i79eUEdRcD4e6rl02K+HvuqkiRPA/iGn8YuhAco
	2roxFT4zRHoDrOG2UN80/+q8AVDFPdTa3oGyJqQBNFlNvPr5R+U/0Yhoj+TXpVmZaDwo
	0tHN7cHdrfyV6+PwWBdTqjMXWsJlsQsVDJScE2NLI63DWbqN6ciYhJn2w4PFAkgVjpFV
	IxWYa4tarBAq0c4SnWlGMNrGw3oIx7LIs1GpTwQxWff/46bqBEVJjp94lpkrWpRyMhsB
	Kmppw6+0MZrcK9YvO74K0dIk7141uCMwPoli7IbFXsUIy2P35vdiy/Kd+3SbjwPMOAxW
	USBw==
X-Gm-Message-State: APzg51BEoZjzdG7uvQ21r5DQD/6sUFvMG3QodpJ3eBXr/daHAozZRD+d
	cVi3Nk4Jb6+Zxka+POYuCsSOglEH
X-Google-Smtp-Source: ANB0VdYO4U5pYcrRt21MyTz0gK6wrW3AzggVh3S5af/KMFliau1EgqlWUfk4YRQBusCe7V0uhmWgPw==
X-Received: by 2002:a5d:5344:: with SMTP id
	t4-v6mr28446648wrv.257.1537349058671; 
	Wed, 19 Sep 2018 02:24:18 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	x24-v6sm33597818wrd.13.2018.09.19.02.24.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Sep 2018 02:24:18 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2018 11:24:13 +0200
Message-Id: <20180919092413.2312-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [PATCH v4] distutils{, 3}.bbclass: improve error messages
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
X-List-Received-Date: Wed, 19 Sep 2018 09:24:18 -0000

For non-python developers it's difficult to identify where start
searching in case of errors. Fixing and marking the string to
grep for might help finding some root causes of issues slightly
quicker.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/classes/distutils.bbclass  | 8 ++++----
 meta/classes/distutils3.bbclass | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index e7d48ab907..9862731493 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -21,13 +21,13 @@ distutils_do_compile() {
          STAGING_INCDIR=${STAGING_INCDIR} \
          STAGING_LIBDIR=${STAGING_LIBDIR} \
          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS} || \
-         bbfatal_log "${PYTHON_PN} setup.py build execution failed."
+         bbfatal_log "'${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS}' execution failed."
 }
 
 distutils_stage_headers() {
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
-        bbfatal_log "${PYTHON_PN} setup.py install_headers execution failed."
+        bbfatal_log "'${PYTHON_PN} setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS}' execution for stage_headers failed."
 }
 
 distutils_stage_all() {
@@ -36,7 +36,7 @@ distutils_stage_all() {
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
         PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
-        bbfatal_log "${PYTHON_PN} setup.py install (stage) execution failed."
+        bbfatal_log "'${PYTHON_PN} setup.py install ${DISTUTILS_STAGE_ALL_ARGS}' execution for stage_all failed."
 }
 
 distutils_do_install() {
@@ -45,7 +45,7 @@ distutils_do_install() {
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_INSTALL_ARGS} || \
-        bbfatal_log "${PYTHON_PN} setup.py install execution failed."
+        bbfatal_log "'${PYTHON_PN} setup.py install ${DISTUTILS_INSTALL_ARGS}' execution failed."
 
         # support filenames with *spaces*
         # only modify file if it contains path  and recompile it
diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index 1d0c54a513..834e322474 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -23,14 +23,14 @@ distutils3_do_compile() {
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
         build ${DISTUTILS_BUILD_ARGS} || \
-        bbfatal_log "${PYTHON_PN} setup.py build_ext execution failed."
+        bbfatal_log "'${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS}' execution failed."
 }
 distutils3_do_compile[vardepsexclude] = "MACHINE"
 
 distutils3_stage_headers() {
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
-        bbfatal_log "${PYTHON_PN} setup.py install_headers execution failed."
+        bbfatal_log "'${PYTHON_PN} setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS}' execution for stage_headers failed."
 }
 distutils3_stage_headers[vardepsexclude] = "MACHINE"
 
@@ -40,7 +40,7 @@ distutils3_stage_all() {
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
         PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
-        bbfatal_log "${PYTHON_PN} setup.py install (stage) execution failed."
+        bbfatal_log "'${PYTHON_PN} setup.py install ${DISTUTILS_STAGE_ALL_ARGS}' execution for stage_all failed."
 }
 distutils3_stage_all[vardepsexclude] = "MACHINE"
 
@@ -50,7 +50,7 @@ distutils3_do_install() {
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_INSTALL_ARGS} || \
-        bbfatal_log "${PYTHON_PN} setup.py install execution failed."
+        bbfatal_log "'${PYTHON_PN} setup.py install ${DISTUTILS_INSTALL_ARGS}' execution failed."
 
         # support filenames with *spaces*
         find ${D} -name "*.py" -exec grep -q ${D} {} \; -exec sed -i -e s:${D}::g {} \;
-- 
2.17.1


