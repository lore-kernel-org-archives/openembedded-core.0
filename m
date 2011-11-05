Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RMk3O-00065F-Pi
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Nov 2011 18:29:15 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Nov 2011 10:23:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,461,1315206000"; d="scan'208";a="33625106"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.12])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Nov 2011 10:23:00 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Nov 2011 10:22:33 -0700
Message-Id: <607373195e6d8f8327c1a4e5bc359e0dbb7f9463.1320513631.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 03/28] bitbake.conf: Drop remaining TERMCMD pieces and document OE_TERMINAL usage instead
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
X-List-Received-Date: Sat, 05 Nov 2011 17:29:15 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: ddb825c87dd3e59d50841a993080a00d1459b1e7)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

[Yes, this one is against meta-yocto, I'll fix it to apply the same
change to OE-Core's local.conf.sample in the final version]
---
 meta/classes/sanity.bbclass |   13 -------------
 meta/conf/bitbake.conf      |   20 --------------------
 meta/conf/local.conf.sample |   12 ++++--------
 3 files changed, 4 insertions(+), 41 deletions(-)

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
diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 84ed964..73ab9f8 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -168,20 +168,16 @@ USER_CLASSES ?= "image-mklibs image-prelink"
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
 
-- 
1.7.6.4



