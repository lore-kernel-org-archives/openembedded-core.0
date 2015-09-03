Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6C39576FF2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 18:45:47 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so29344837wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 11:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=j3H1gDnb6odsgu5iBG7Qbm0/duuxLs8lHHouGynjK9Y=;
	b=lYFfrugXooDtWM4t5QK7ro/05QOyCExIIl8m6v2DEFt8krUt4jdX/vdMCdQNnQ1cv+
	h1DPq3//axdbHRMexJDkUwTqiM5CweiuxjIB1+EYJM2WDceyI7gjnWNEWjZpguX7nnZ6
	X8IbMfLTt/+r9UqtNsRBDHBvjx1EnhdEWi94SVHRUBu68+fqRcrqmKqubx6MqKk1Qwiv
	FD2TWYBy4quNORh94mMGvhQCvol7YRjj8LpPwUHI48XYJZyR0iLlu9pTDp4YXbgifp+F
	65hcawrLmUII+zRoMsmXE9hyMC8AP/qAevoVgCuFLDVqGE+MwSDoslGdPCA19cd8Y0Vl
	Lhhw==
X-Gm-Message-State: ALoCoQkUrwjpx+8TMT0dN4e96kvS3QYbPD1uArrzUe3eL2lfrLMBJ6uDlkW0JPz2zPZtRS5aAea4
X-Received: by 10.180.186.195 with SMTP id fm3mr17400535wic.1.1441305947650;
	Thu, 03 Sep 2015 11:45:47 -0700 (PDT)
Received: from flashheart.home
	(host212-140-113-248.range212-140.btcentralplus.com.
	[212.140.113.248])
	by smtp.gmail.com with ESMTPSA id 4sm39063672wjt.46.2015.09.03.11.45.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Sep 2015 11:45:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 19:39:07 +0100
Message-Id: <1441305547-26111-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH][V2] sstate: implement basic signing/validation
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
X-List-Received-Date: Thu, 03 Sep 2015 18:45:50 -0000

To provide some element of integrity to sstate archives, allow sstate archives
to be GPG signed with a specified key (detached signature to a sidecar .sig
file), and verify the signatures when sstate archives are unpacked.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sstate.bbclass | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 4e6afef..77313bc 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -54,6 +54,13 @@ EXTRA_STAGING_FIXMES ?= ""
 
 SIGGEN_LOCKEDSIGS_CHECK_LEVEL ?= 'error'
 
+# The GnuPG key ID and passphrase to use to sign sstate archives (or unset to
+# not sign)
+SSTATE_SIG_KEY ?= ""
+SSTATE_SIG_PASSPHRASE ?= ""
+# Whether to verify the GnUPG signatures when extracting sstate archives
+SSTATE_VERIFY_SIG ?= "0"
+
 # Specify dirs in which the shell function is executed and don't use ${B}
 # as default dirs to avoid possible race about ${B} with other task.
 sstate_create_package[dirs] = "${SSTATE_BUILDDIR}"
@@ -298,6 +305,10 @@ def sstate_installpkg(ss, d):
     d.setVar('SSTATE_INSTDIR', sstateinst)
     d.setVar('SSTATE_PKG', sstatepkg)
 
+    if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG", True), False):
+        if subprocess.call(["gpg", "--verify", sstatepkg + ".sig", sstatepkg]) != 0:
+            bb.warn("Cannot verify signature on sstate package %s" % sstatepkg)
+
     for f in (d.getVar('SSTATEPREINSTFUNCS', True) or '').split() + ['sstate_unpack_package'] + (d.getVar('SSTATEPOSTUNPACKFUNCS', True) or '').split():
         bb.build.exec_func(f, d)
 
@@ -605,7 +616,8 @@ def pstaging_fetch(sstatefetch, sstatepkg, d):
     # Try a fetch from the sstate mirror, if it fails just return and
     # we will build the package
     for srcuri in ['file://{0}'.format(sstatefetch),
-                   'file://{0}.siginfo'.format(sstatefetch)]:
+                   'file://{0}.siginfo'.format(sstatefetch),
+                   'file://{0}.sig'.format(sstatefetch)]:
         localdata.setVar('SRC_URI', srcuri)
         try:
             fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
@@ -665,6 +677,11 @@ sstate_create_package () {
 	chmod 0664 $TFILE 
 	mv -f $TFILE ${SSTATE_PKG}
 
+	if [ -n "${SSTATE_SIG_KEY}" ]; then
+		rm -f ${SSTATE_PKG}.sig
+		echo ${SSTATE_SIG_PASSPHRASE} | gpg --batch --passphrase-fd 0 --detach-sign --local-user ${SSTATE_SIG_KEY} --output ${SSTATE_PKG}.sig ${SSTATE_PKG}
+	fi
+
 	cd ${WORKDIR}
 	rm -rf ${SSTATE_BUILDDIR}
 }
-- 
2.1.4


