Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5B8A673710
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Oct 2015 00:13:07 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so50717340wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 17:13:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=qmgKMcrRxLKJsnOqjbt3OY8jHVu0PVcN0pmJf0ky8Nk=;
	b=FN6M+reruUyBdLQluMjBH3b6XXNin8sWqCP8YH9CGWu7ANdsD1SETi9Y6lzE97dnVX
	CD4pdRnNCIeyAResTTcH00hZ5Y0SI2zz0keS6j2Vys8YmWgeXh/T0Wujt7FO6pM8J5pD
	ja8xqd/nC/cR1dTxp6jon+Jsj59Kn+YGBK/9QkugrukkyECkgjz+RTnNZa5HELyxrIo1
	QXVEcoaMIDpPZMZywWNTCDNTKYwEKIz9zc7OljvQ+93/5JX34FOvwPxwZVxum/KbnYJj
	UwVn71AIzKLOInyFpPXc4c/9yQeFPFHrF8XqE+mOQQdTkY/BfITHc9cMPKN0ljCAj7yM
	ij0Q==
X-Gm-Message-State: ALoCoQmYsPn9od0LRhxikuhxqCIi9okhd+BwiwD9rkvm8BDdisBadX8xBBVaeDQ6DVC3MLB2WafD
X-Received: by 10.194.184.7 with SMTP id eq7mr7526897wjc.26.1445645587702;
	Fri, 23 Oct 2015 17:13:07 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	ly4sm25171080wjb.4.2015.10.23.17.13.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Oct 2015 17:13:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Oct 2015 01:05:23 +0100
Message-Id: <1445645123-14558-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] sstate: respect GPG_BIN and GPG_HOME
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
X-List-Received-Date: Sat, 24 Oct 2015 00:13:09 -0000

The package feed signing code supports the user providing the path to the gpg
binary and an alternative gpg 'home' (usually ~/.gnupg), which are useful for
both deployment and QA purposes.

Factor out the gpg command line construction to a function which can fetch both
of these variables, and also use pipes.quote() to sanitise the arguments when
used in a shell context.

[ YOCTO #8559 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sstate.bbclass | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index d09e27a..ba18f54 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -268,6 +268,20 @@ def sstate_install(ss, d):
 sstate_install[vardepsexclude] += "SSTATE_DUPWHITELIST STATE_MANMACH SSTATE_MANFILEPREFIX"
 sstate_install[vardeps] += "${SSTATEPOSTINSTFUNCS}"
 
+def sstate_build_gpg_command(d, *args, **kwargs):
+    # Returns a list for subprocess.call() unless passed flatten=True when this
+    # returns a flattened string.
+    l = [d.getVar("GPG_BIN", True) or "gpg"]
+    if d.getVar("GPG_PATH", True):
+        l += ["--homedir", d.getVar("GPG_PATH", True)]
+    l += args
+
+    if kwargs.get("flatten", False):
+        import pipes
+        return " ".join(map(pipes.quote, l))
+    else:
+        return l
+
 def sstate_installpkg(ss, d):
     import oe.path
     import subprocess
@@ -296,7 +310,7 @@ def sstate_installpkg(ss, d):
     d.setVar('SSTATE_PKG', sstatepkg)
 
     if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG", True), False):
-        if subprocess.call(["gpg", "--verify", sstatepkg + ".sig", sstatepkg]) != 0:
+        if subprocess.call(sstate_build_gpg_command(d, "--verify", sstatepkg + ".sig", sstatepkg)) != 0:
             bb.warn("Cannot verify signature on sstate package %s" % sstatepkg)
 
     for f in (d.getVar('SSTATEPREINSTFUNCS', True) or '').split() + ['sstate_unpack_package'] + (d.getVar('SSTATEPOSTUNPACKFUNCS', True) or '').split():
@@ -672,12 +686,12 @@ sstate_create_package () {
 	else
 		tar -cz --file=$TFILE --files-from=/dev/null
 	fi
-	chmod 0664 $TFILE 
+	chmod 0664 $TFILE
 	mv -f $TFILE ${SSTATE_PKG}
 
 	if [ -n "${SSTATE_SIG_KEY}" ]; then
 		rm -f ${SSTATE_PKG}.sig
-		echo ${SSTATE_SIG_PASSPHRASE} | gpg --batch --passphrase-fd 0 --detach-sign --local-user ${SSTATE_SIG_KEY} --output ${SSTATE_PKG}.sig ${SSTATE_PKG}
+		echo ${SSTATE_SIG_PASSPHRASE} | ${@sstate_build_gpg_command(d, "--batch", "--passphrase-fd", "0", "--detach-sign", "--local-user", "${SSTATE_SIG_KEY}", "--output", "${SSTATE_PKG}.sig", "${SSTATE_PKG}", flatten=True)}
 	fi
 
 	cd ${WORKDIR}
-- 
2.1.4


