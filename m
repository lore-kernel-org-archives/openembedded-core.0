Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gthomas@mail.chez-thomas.org>) id 1SUe8S-0006AL-Kf
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 15:19:26 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 996)
	id B47F4F811F0; Wed, 16 May 2012 07:09:24 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 May 2012 07:09:23 -0600
Message-Id: <1337173763-27981-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] Fix X server on PowerPC when using GCC 4.7.x
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
X-List-Received-Date: Wed, 16 May 2012 13:19:26 -0000

The function XaceHook() was trying to do something like this:
   void *ptr;
   switch(XX) {
      case a:
         define_some_structure A;
         ptr = &A;
         break;
      case b:
         define_some_structure B;
         ptr = &B;
         break;
   }
   call_some_function(ptr);

Clearly this is not even legal - the scope of the variables A & B
is not well defined outside of the switch cases.  This code pattern
stopped working on PowerPC with GCC >= 4.7.1 (it has worked forever
up to & including 4.6.3).  Replace this sequence with legal code:
   switch(XX) {
      case a:
         define_some_structure A;
         call_some_function(&A);
         break;
      case b:
         define_some_structure B;
         call_some_function(&B);
         break;
   }
---
 .../fix-bogus-stack-variables.patch                |  130 ++++++++++++++++++++
 .../xorg-xserver/xserver-kdrive_1.7.99.2.bb        |    3 +-
 2 files changed, 132 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-bogus-stack-variables.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-bogus-stack-variables.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-bogus-stack-variables.patch
new file mode 100644
index 0000000..0946dfb
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-bogus-stack-variables.patch
@@ -0,0 +1,130 @@
+Index: xorg-server-1.7.99.2/Xext/xace.c
+===================================================================
+--- xorg-server-1.7.99.2.orig/Xext/xace.c
++++ xorg-server-1.7.99.2/Xext/xace.c
+@@ -87,8 +87,7 @@ void XaceHookAuditEnd(ClientPtr ptr, int
+  */
+ int XaceHook(int hook, ...)
+ {
+-    pointer calldata;	/* data passed to callback */
+-    int *prv = NULL;	/* points to return value from callback */
++    int res = Success;
+     va_list ap;		/* argument list */
+     va_start(ap, hook);
+ 
+@@ -109,8 +108,8 @@ int XaceHook(int hook, ...)
+ 	    rec.parent = va_arg(ap, pointer);
+ 	    rec.access_mode = va_arg(ap, Mask);
+ 	    rec.status = Success; /* default allow */
+-	    calldata = &rec;
+-	    prv = &rec.status;
++	    CallCallbacks(&XaceHooks[hook], &rec);
++	    res = rec.status;
+ 	    break;
+ 	}
+ 	case XACE_DEVICE_ACCESS: {
+@@ -119,8 +118,8 @@ int XaceHook(int hook, ...)
+ 	    rec.dev = va_arg(ap, DeviceIntPtr);
+ 	    rec.access_mode = va_arg(ap, Mask);
+ 	    rec.status = Success; /* default allow */
+-	    calldata = &rec;
+-	    prv = &rec.status;
++	    CallCallbacks(&XaceHooks[hook], &rec);
++	    res = rec.status;
+ 	    break;
+ 	}
+ 	case XACE_SEND_ACCESS: {
+@@ -131,8 +130,8 @@ int XaceHook(int hook, ...)
+ 	    rec.events = va_arg(ap, xEventPtr);
+ 	    rec.count = va_arg(ap, int);
+ 	    rec.status = Success; /* default allow */
+-	    calldata = &rec;
+-	    prv = &rec.status;
++	    CallCallbacks(&XaceHooks[hook], &rec);
++	    res = rec.status;
+ 	    break;
+ 	}
+ 	case XACE_RECEIVE_ACCESS: {
+@@ -142,8 +141,8 @@ int XaceHook(int hook, ...)
+ 	    rec.events = va_arg(ap, xEventPtr);
+ 	    rec.count = va_arg(ap, int);
+ 	    rec.status = Success; /* default allow */
+-	    calldata = &rec;
+-	    prv = &rec.status;
++	    CallCallbacks(&XaceHooks[hook], &rec);
++	    res = rec.status;
+ 	    break;
+ 	}
+ 	case XACE_CLIENT_ACCESS: {
+@@ -152,8 +151,8 @@ int XaceHook(int hook, ...)
+ 	    rec.target = va_arg(ap, ClientPtr);
+ 	    rec.access_mode = va_arg(ap, Mask);
+ 	    rec.status = Success; /* default allow */
+-	    calldata = &rec;
+-	    prv = &rec.status;
++	    CallCallbacks(&XaceHooks[hook], &rec);
++	    res = rec.status;
+ 	    break;
+ 	}
+ 	case XACE_EXT_ACCESS: {
+@@ -162,8 +161,8 @@ int XaceHook(int hook, ...)
+ 	    rec.ext = va_arg(ap, ExtensionEntry*);
+ 	    rec.access_mode = DixGetAttrAccess;
+ 	    rec.status = Success; /* default allow */
+-	    calldata = &rec;
+-	    prv = &rec.status;
++	    CallCallbacks(&XaceHooks[hook], &rec);
++	    res = rec.status;
+ 	    break;
+ 	}
+ 	case XACE_SERVER_ACCESS: {
+@@ -171,8 +170,8 @@ int XaceHook(int hook, ...)
+ 	    rec.client = va_arg(ap, ClientPtr);
+ 	    rec.access_mode = va_arg(ap, Mask);
+ 	    rec.status = Success; /* default allow */
+-	    calldata = &rec;
+-	    prv = &rec.status;
++	    CallCallbacks(&XaceHooks[hook], &rec);
++	    res = rec.status;
+ 	    break;
+ 	}
+ 	case XACE_SCREEN_ACCESS:
+@@ -182,15 +181,15 @@ int XaceHook(int hook, ...)
+ 	    rec.screen = va_arg(ap, ScreenPtr);
+ 	    rec.access_mode = va_arg(ap, Mask);
+ 	    rec.status = Success; /* default allow */
+-	    calldata = &rec;
+-	    prv = &rec.status;
++	    CallCallbacks(&XaceHooks[hook], &rec);
++	    res = rec.status;
+ 	    break;
+ 	}
+ 	case XACE_AUTH_AVAIL: {
+ 	    XaceAuthAvailRec rec;
+ 	    rec.client = va_arg(ap, ClientPtr);
+ 	    rec.authId = va_arg(ap, XID);
+-	    calldata = &rec;
++	    CallCallbacks(&XaceHooks[hook], &rec);
+ 	    break;
+ 	}
+ 	case XACE_KEY_AVAIL: {
+@@ -198,7 +197,7 @@ int XaceHook(int hook, ...)
+ 	    rec.event = va_arg(ap, xEventPtr);
+ 	    rec.keybd = va_arg(ap, DeviceIntPtr);
+ 	    rec.count = va_arg(ap, int);
+-	    calldata = &rec;
++	    CallCallbacks(&XaceHooks[hook], &rec);
+ 	    break;
+ 	}
+ 	default: {
+@@ -208,9 +207,7 @@ int XaceHook(int hook, ...)
+     }
+     va_end(ap);
+  
+-    /* call callbacks and return result, if any. */
+-    CallCallbacks(&XaceHooks[hook], calldata);
+-    return prv ? *prv : Success;
++    return res;
+ }
+ 
+ /* XaceCensorImage
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
index 360a0f3..dc17e2b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
@@ -7,7 +7,7 @@ RDEPENDS_${PN} += "xkeyboard-config"
 EXTRA_OECONF += "--disable-glx"
 
 PE = "1"
-PR = "r29"
+PR = "r30"
 
 SRC_URI = "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2 \
 	file://extra-kmodes.patch \
@@ -21,6 +21,7 @@ SRC_URI = "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2 \
 	file://crosscompile.patch \
 	file://error-address-work-around.patch \
 	file://nodolt.patch"
+        file://fix-bogus-stack-variables.patch \
 #	file://kdrive-evdev.patch
 #	file://kdrive-use-evdev.patch
 #	file://enable-builtin-fonts.patch
-- 
1.7.7.6



