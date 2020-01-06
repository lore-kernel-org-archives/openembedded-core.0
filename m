Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2FA287F81E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 00:06:53 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f129so13678612wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Jan 2020 16:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=OQdVL0BE5A9dB/MIBipYH2KyztY0X+nK1ojWYg3HWUc=;
	b=RFhZsEKd7Kox72nFC8GsDueZklx83QSM1pb28jOHWlgDcEJ5R16ouvsh9HOSUbvJ/S
	02ib+LVyFkmKP/h2xxPszFSByXDIVJ6BBwNZuNFsjrfRJsccivPHyz7Zc8Nrle/xXM4Q
	cfSl1LEcgv7VoQgs7F5IiLeRnB1sRS27H8/es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OQdVL0BE5A9dB/MIBipYH2KyztY0X+nK1ojWYg3HWUc=;
	b=ra+QHa+2tjSkgXRBRzmPox2LM9maLDEMMlVKKczGNDbqiFWXq5uL0uT5uhiHoAKKaV
	2QYEF67Qe9jGLn95T84iIMA3sTKs8iI7Xx4u0kL3r1xkX0gapESq9WJoeVz+H7CcRsF7
	p49BMV/qzdaVg0OChJAj2o575EHA4+w7nK8g8FG3bMJbi6p++wcZGyZQ30WoAxN+WLpo
	FkAfxBxgosxzLPMGepVslozquGTXB4qiO9+527uSRG6YFzUQRhrLMQK7kYmyMrbs4YSe
	5w5YDCtGdjseb+7We6Hp2zMayb7Eci+S+E8439AIrrGn9JDp2jP2Q021aEGlXO2RO265
	fl8w==
X-Gm-Message-State: APjAAAVOLGOrIpm339w/5XDlU8twqD3KCgv7kLCTXz1BoNBkR8DRXn3j
	jMJJKNy5wYFRjwE2Hw/2mE+eQL26+VE=
X-Google-Smtp-Source: APXvYqzudKHJAAjdKNU5j8E/g9ggvvIE7Nb+BWY+P+nuK6u7nsaAxjLUi5El61gpvyYsZLi1ZPuM1A==
X-Received: by 2002:a1c:4e03:: with SMTP id g3mr32497951wmh.22.1578269213515; 
	Sun, 05 Jan 2020 16:06:53 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n10sm69174229wrt.14.2020.01.05.16.06.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 05 Jan 2020 16:06:53 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2020 00:06:48 +0000
Message-Id: <20200106000650.26105-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200106000650.26105-1-richard.purdie@linuxfoundation.org>
References: <20200106000650.26105-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/4] sstate: Improve SSTATE_PKG handling
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
X-List-Received-Date: Mon, 06 Jan 2020 00:06:53 -0000
Content-Transfer-Encoding: 8bit

Move the task handling code into the SSTATE_PKGNAME variable using a temporary variable.

This makes the code more understandable as as well as allowing the length of the
final sstate filename to be more easily accesses for following patches.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 7d2cb9eb840..5bd4031e536 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -11,11 +11,11 @@ def generate_sstatefn(spec, hash, d):
 SSTATE_PKGARCH    = "${PACKAGE_ARCH}"
 SSTATE_PKGSPEC    = "sstate:${PN}:${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}:${PV}:${PR}:${SSTATE_PKGARCH}:${SSTATE_VERSION}:"
 SSTATE_SWSPEC     = "sstate:${PN}::${PV}:${PR}::${SSTATE_VERSION}:"
-SSTATE_PKGNAME    = "${SSTATE_EXTRAPATH}${@generate_sstatefn(d.getVar('SSTATE_PKGSPEC'), d.getVar('BB_UNIHASH'), d)}"
+SSTATE_PKGNAME    = "${SSTATE_EXTRAPATH}${@generate_sstatefn(d.getVar('SSTATE_PKGSPEC'), d.getVar('BB_UNIHASH'), d)}_${SSTATE_CURRTASK}.tgz"
 SSTATE_PKG        = "${SSTATE_DIR}/${SSTATE_PKGNAME}"
 SSTATE_EXTRAPATH   = ""
 SSTATE_EXTRAPATHWILDCARD = ""
-SSTATE_PATHSPEC   = "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/*/${SSTATE_PKGSPEC}"
+SSTATE_PATHSPEC   = "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/*/${SSTATE_PKGSPEC}*_${SSTATE_PATH_CURRTASK}.tgz*"
 
 # explicitly make PV to depend on evaluated value of PV variable
 PV[vardepvalue] = "${PV}"
@@ -317,8 +317,8 @@ def sstate_installpkg(ss, d):
     from oe.gpg_sign import get_signer
 
     sstateinst = d.expand("${WORKDIR}/sstate-install-%s/" % ss['task'])
-    sstatefetch = d.getVar('SSTATE_PKGNAME') + '_' + ss['task'] + ".tgz"
-    d.appendVar('SSTATE_PKG', '_'+ ss['task'] + ".tgz")
+    d.setVar("SSTATE_CURRTASK", ss['task'])
+    sstatefetch = d.getVar('SSTATE_PKGNAME')
     sstatepkg = d.getVar('SSTATE_PKG')
 
     if not os.path.exists(sstatepkg):
@@ -440,8 +440,9 @@ python sstate_hardcode_path_unpack () {
 def sstate_clean_cachefile(ss, d):
     import oe.path
 
-    sstatepkgfile = d.getVar('SSTATE_PATHSPEC') + "*_" + ss['task'] + ".tgz*"
     if d.getVarFlag('do_%s' % ss['task'], 'task'):
+        d.setVar("SSTATE_PATH_CURRTASK", ss['task'])
+        sstatepkgfile = d.getVar('SSTATE_PATHSPEC')
         bb.note("Removing %s" % sstatepkgfile)
         oe.path.remove(sstatepkgfile)
 
@@ -612,7 +613,7 @@ def sstate_package(ss, d):
     tmpdir = d.getVar('TMPDIR')
 
     sstatebuild = d.expand("${WORKDIR}/sstate-build-%s/" % ss['task'])
-    d.appendVar('SSTATE_PKG', '_'+ ss['task'] + ".tgz")
+    d.setVar("SSTATE_CURRTASK", ss['task'])
     bb.utils.remove(sstatebuild, recurse=True)
     bb.utils.mkdirhier(sstatebuild)
     for state in ss['dirs']:
@@ -1081,17 +1082,17 @@ addhandler sstate_eventhandler
 sstate_eventhandler[eventmask] = "bb.build.TaskSucceeded"
 python sstate_eventhandler() {
     d = e.data
-    # When we write an sstate package we rewrite the SSTATE_PKG
-    spkg = d.getVar('SSTATE_PKG')
-    if not spkg.endswith(".tgz"):
+    writtensstate = d.getVar('SSTATE_CURRTASK')
+    if not writtensstate:
         taskname = d.getVar("BB_RUNTASK")[3:]
         spec = d.getVar('SSTATE_PKGSPEC')
         swspec = d.getVar('SSTATE_SWSPEC')
         if taskname in ["fetch", "unpack", "patch", "populate_lic", "preconfigure"] and swspec:
             d.setVar("SSTATE_PKGSPEC", "${SSTATE_SWSPEC}")
             d.setVar("SSTATE_EXTRAPATH", "")
+        d.setVar("SSTATE_CURRTASK", taskname)
         sstatepkg = d.getVar('SSTATE_PKG')
-        bb.siggen.dump_this_task(sstatepkg + '_' + taskname + ".tgz" ".siginfo", d)
+        bb.siggen.dump_this_task(sstatepkg + ".siginfo", d)
 }
 
 SSTATE_PRUNE_OBSOLETEWORKDIR ?= "1"
-- 
2.20.1


