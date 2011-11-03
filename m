Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RM5T6-0002ly-D3 for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 23:09:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA3M2t0s001548
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Nov 2011 22:02:55 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01532-01 for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2011 22:02:47 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA3M2gVC001535
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Nov 2011 22:02:43 GMT
Message-ID: <1320357763.20107.84.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 03 Nov 2011 22:02:43 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] bitbake.conf: Drop remaining TERMCMD pieces and document OE_TERMINAL usage instead
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Nov 2011 22:09:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

[Yes, this one is against meta-yocto, I'll fix it to apply the same
change to OE-Core's local.conf.sample in the final version]
---
diff --git a/meta-yocto/conf/local.conf.sample b/meta-yocto/conf/local.conf.sample
index da3f8df..ca8636c 100644
--- a/meta-yocto/conf/local.conf.sample
+++ b/meta-yocto/conf/local.conf.sample
@@ -190,20 +190,16 @@ USER_CLASSES ?= "image-mklibs image-prelink"
 # Under certain circumstances the system may need input from you and to do this it 
 # can launch an interactive shell. It needs to do this since the build is 
 # multithreaded and needs to be able to handle the case where more than one parallel
-# process may require the user's attention. The default is to use xterm.
+# process may require the user's attention. The default is iterate over the available
+# terminal types to find one that works.
 #
 # Examples of the occasions this may happen are when resolving patches which cannot
 # be applied, to use the devshell or the kernel menuconfig
 #
-# If you do not use (or have installed) xterm you will need to
-# uncomment these variables and set them to the terminal you wish to use
-# 
-# Supported shell prefixes for *_TERMCMD and *_TERMCMDRUN are:
-# GNOME, SCREEN, XTERM and KONSOLE
+# Supported values are auto, gnome, xfce, rxvt, xcreen, konsole (3.x only), none
 # Note: currently, Konsole support only works for KDE 3.x due to the way
 # newer Konsole versions behave
-#TERMCMD = "${XTERM_TERMCMD}"
-#TERMCMDRUN = "${XTERM_TERMCMDRUN}"
+#OE_TERMINAL = "auto"
 # By default disable interactive patch resolution (tasks will just fail instead):
 PATCHRESOLVE = "noop"
 
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 4067408..3f42b4f 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -331,19 +331,6 @@ def check_sanity(e):
     if not data.getVar( 'DISPLAY', e.data, True ) and data.getVar( 'IMAGETEST', e.data, True ) == 'qemu':
         messages = messages + 'qemuimagetest needs a X desktop to start qemu, please set DISPLAY correctly (e.g. DISPLAY=:1.0)\n'
 
-    if data.getVar('PATCHRESOLVE', e.data, True) != 'noop':
-        # Ensure we have the binary for TERMCMD, as when patch application fails the error is fairly intimidating
-        termcmd = data.getVar("TERMCMD", e.data, True)
-        term = termcmd.split()[0]
-        if not check_app_exists(term, e.data):
-            messages = messages + "The console for use in patch error resolution is not available, please install %s or set TERMCMD and TERMCMDRUN (as documented in local.conf).\n" % term
-        elif "konsole" in term:
-            import oe.terminal
-            vernum = oe.terminal.check_konsole_version(term)
-            if vernum:
-                if vernum.split('.')[0] == '2':
-                    messages = messages +  'Konsole from KDE 4.x will not work as TERMCMD/TERMCMDRUN, please specify a different terminal or set PATCHRESOLVE = "noop" to disable interactive patch resolution.\n'
-
     if os.path.basename(os.readlink('/bin/sh')) == 'dash':
         messages = messages + "Using dash as /bin/sh causes various subtle build problems, please use bash instead (e.g. 'dpkg-reconfigure dash' on an Ubuntu system.\n"
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9938a67..d405b6a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -589,26 +589,6 @@ FAKEROOTENV = "PSEUDO_PREFIX=${STAGING_DIR_NATIVE}${prefix_native} PSEUDO_LOCALS
 FAKEROOTDIRS = "${PSEUDO_LOCALSTATEDIR}"
 PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
 
-
-##################################################################
-# UI/Interaction Configuration
-##################################################################
-
-export SHELLCMDS = "bash"
-# Some common terminal programs to choose from
-GNOME_TERMCMD = 'gnome-terminal --disable-factory -t "$TERMWINDOWTITLE"'
-GNOME_TERMCMDRUN = '${GNOME_TERMCMD} -x $SHELLCMDS'
-SCREEN_TERMCMD = 'screen -D -m -t "$TERMWINDOWTITLE"'
-SCREEN_TERMCMDRUN = '${SCREEN_TERMCMD} $SHELLCMDS'
-XTERM_TERMCMD = 'xterm -T "$TERMWINDOWTITLE"'
-XTERM_TERMCMDRUN = '${XTERM_TERMCMD} -e $SHELLCMDS'
-KONSOLE_TERMCMD = 'konsole -T "$TERMWINDOWTITLE"'
-KONSOLE_TERMCMDRUN = '${KONSOLE_TERMCMD} -e $SHELLCMDS'
-
-# Set a default
-TERMCMD ?= "${XTERM_TERMCMD}"
-TERMCMDRUN ?= "${XTERM_TERMCMDRUN}"
-
 ##################################################################
 # Miscellaneous utilities.
 ##################################################################




