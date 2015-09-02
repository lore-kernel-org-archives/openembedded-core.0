Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6118777032
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 15:48:31 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so17206488igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 08:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=xn7leWWUaXGsRpZRL0quwYNCiTGKxDjX3AqXDU0Pu2I=;
	b=MEa+45J1p5GcxmDyWdHM/NPbZbRr1jrE6cB2gXU8uScPltkweR5ukc/k2b/I7SZNJe
	ZE6JsYgCJWI+Yqf0m6pqtvhwLSj1jw/ZbTC2O6mUwz6TGvL2UyoA/4kP5iODQhcNF4VY
	/dzWSHgzrxVk3fprZz8CO95Xc2ApdSdR9I4RgmcEd7UrRJColZ43Fn75+VSDXdcghyeh
	VHO8avPjbVSLaYXSPWjtJnuG22dQgYE6muwLLpsY2UVLkFw/oXXmAmZf7QcLlTF0Qx76
	HGe+1GX9fHLM2jLYfs8xlLNSIhRUQguYw2zXCCS5IsPgng/7rAFD3+rNh3LbSl7DFjjb
	QWPA==
X-Gm-Message-State: ALoCoQm+oCGdtz7CqO+z0hun/SU9MomJw8X/9jf+V++/wh7Ay4Tu9bEQvyjNPCuGiPpK4n7ro4kT
X-Received: by 10.50.18.40 with SMTP id t8mr3747144igd.57.1441208912170;
	Wed, 02 Sep 2015 08:48:32 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FD7A.dip0.t-ipconnect.de.
	[93.232.253.122]) by smtp.gmail.com with ESMTPSA id
	o189sm17258398ioe.30.2015.09.02.08.48.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Sep 2015 08:48:31 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 17:48:40 +0200
Message-Id: <e0cab1af2f3fa08d0a4d202c65fae83a927e1567.1441207840.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
References: <3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1441207840.git.patrick.ohly@intel.com>
References: <cover.1441207840.git.patrick.ohly@intel.com>
Subject: [PATCH 04/10] initramfs-framework: add separate init_verbose log level parameter
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
X-List-Received-Date: Wed, 02 Sep 2015 15:48:32 -0000

Using the general purpose "debug" and "verbose" kernel parameters to
increase logging in the init script has the disadvantage that it
also increases logging in other components, making the output hard
to read (in particular with "debug").

The new init_verbose parameter only affects the init script:
  init_verbose, init_verbose=1, init_verbose=true: enable just some info messages
  init_verbose=2: debug messages

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/init | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index e8f4713..cd55ee2 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -14,6 +14,13 @@
 # 'foo=value' as 'bootparam_foo=value'
 # 'foo' as 'bootparam_foo=true'
 # 'foo.bar[=value] as 'foo_bar=[value|true]'
+#
+# Special boot parameters always recognized by initramfs-framework (see modules
+# like "debug" for additional ones):
+# debug: enable debug logging (beware, also enables debug output in other system components)
+# verbose: similar do debug, just less output
+# init_verbose[=true|1|2]: same output as for verbose when no value or true/1 are given,
+#                          same as debug for 2 - only affects logging in initramfs-framework
 
 # Register a function to be called before running a module
 # The hook is called as:
@@ -45,12 +52,12 @@ msg() {
 
 # Prints information if verbose bootparam is used
 info() {
-	[ -n "$bootparam_verbose" ] && echo "$@" >/dev/console
+	( [ -n "$bootparam_verbose" ] || [ "${bootparam_init_verbose:-0}" -gt 0 ] ) && echo "$@" >/dev/console
 }
 
 # Prints information if debug bootparam is used
 debug() {
-	[ -n "$bootparam_debug" ] && echo "DEBUG: $@" >/dev/console
+	( [ -n "$bootparam_debug" ] || [ "${bootparam_init_verbose:-0}" -gt 1 ] ) && echo "DEBUG: $@" >/dev/console
 }
 
 # Prints a message and start a endless loop
@@ -89,6 +96,11 @@ for p in `cat /proc/cmdline`; do
 	fi
 done
 
+# Simplify log level check in debug() and info().
+if [ "x$bootparam_init_verbose" = "xtrue" ]; then
+	bootparam_init_verbose=1
+fi
+
 # use /dev with devtmpfs
 if grep -q devtmpfs /proc/filesystems; then
 	mkdir -p /dev
-- 
2.1.4


