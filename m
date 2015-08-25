Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8605865CCD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 16:54:11 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so20896119wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 09:54:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hu5DA8tXPA/FEprICZk/L59Oj9u5m4SjlcqlBCmvMMo=;
	b=kgNR8g2lne49/HYfjeYikgE4EEiD9qP1cikriwyhv1PCT4W0AgCuiwqQKpIvjzdHwM
	SQthluzvyIB0YZdZYWwM+lYnwWCIt1C0ir/O0b8YOWe+5/3/7+Orn0XgVnlsY8K7iUwu
	+31BwbXRnKuOXjfA4BZG0u69i1Sum/ubf2sjs+Hda2fsYmYwwoz4lWrUjgGjGxVLR8xw
	+gOqcXaHNdDikXnXD6Q3ppB8k571bklYveBU2SKEe7sb6deh3Y8QlPrBq8ebwkLw77Ng
	9wUD6ePtg0z6oI+E3m3mqDpOejJnDzYuRtEfSNwECBL//xc9M/vSXH3KME7WGpVa9jog
	Gq5w==
X-Gm-Message-State: ALoCoQlCldFcQrVMYF5lXvIeHLpDbZgR0WP68rltbt1YCfWfGmKs0BTRiBMtAr6xjDBH1UO5JJbw
X-Received: by 10.194.62.77 with SMTP id w13mr52139462wjr.118.1440521650984;
	Tue, 25 Aug 2015 09:54:10 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	wx9sm27948544wjb.6.2015.08.25.09.54.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Aug 2015 09:54:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2015 17:47:41 +0100
Message-Id: <1440521261-5444-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH][RFC] sstate: implement basic signing/validation
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
X-List-Received-Date: Tue, 25 Aug 2015 16:54:12 -0000

To provide some element of integrity to sstate archives, allow sstate archives
to be GPG signed with a specified key (detached signature to a sidecar .sig
file), and verify the signatures when sstate archives are unpacked.

TODO: fetch .sig from remote sstate mirrors

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sstate.bbclass | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 4e6afef..69145e5 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -54,6 +54,11 @@ EXTRA_STAGING_FIXMES ?= ""
 
 SIGGEN_LOCKEDSIGS_CHECK_LEVEL ?= 'error'
 
+# The GnuPG key ID to use to sign sstate archives (or unset to not sign)
+SSTATE_SIG_KEY ?= ""
+# Whether to verify the GnUPG signatures when extracting sstate archives
+SSTATE_VERIFY_SIG ?= "0"
+
 # Specify dirs in which the shell function is executed and don't use ${B}
 # as default dirs to avoid possible race about ${B} with other task.
 sstate_create_package[dirs] = "${SSTATE_BUILDDIR}"
@@ -298,6 +303,10 @@ def sstate_installpkg(ss, d):
     d.setVar('SSTATE_INSTDIR', sstateinst)
     d.setVar('SSTATE_PKG', sstatepkg)
 
+    if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG", True), False):
+        if subprocess.call(["gpg", "--verify", sstatepkg + ".sig", sstatepkg]) != 0:
+            bb.warn("Cannot verify signature on sstate package %s" % sstatepkg)
+
     for f in (d.getVar('SSTATEPREINSTFUNCS', True) or '').split() + ['sstate_unpack_package'] + (d.getVar('SSTATEPOSTUNPACKFUNCS', True) or '').split():
         bb.build.exec_func(f, d)
 
@@ -604,6 +613,7 @@ def pstaging_fetch(sstatefetch, sstatepkg, d):
 
     # Try a fetch from the sstate mirror, if it fails just return and
     # we will build the package
+    # TODO attempt to fetch (and silently handle) the .sig file
     for srcuri in ['file://{0}'.format(sstatefetch),
                    'file://{0}.siginfo'.format(sstatefetch)]:
         localdata.setVar('SRC_URI', srcuri)
@@ -665,6 +675,11 @@ sstate_create_package () {
 	chmod 0664 $TFILE 
 	mv -f $TFILE ${SSTATE_PKG}
 
+	if [ -n "${SSTATE_SIG_KEY}" ]; then
+		rm -f ${SSTATE_PKG}.sig
+		gpg --detach-sign --local-user ${SSTATE_SIG_KEY} --output ${SSTATE_PKG}.sig ${SSTATE_PKG}
+	fi
+
 	cd ${WORKDIR}
 	rm -rf ${SSTATE_BUILDDIR}
 }
-- 
2.1.4


