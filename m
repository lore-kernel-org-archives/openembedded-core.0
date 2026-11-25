Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32959.1795568188578729792
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 16:56:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.53 with ESMTP; 25 Nov 2026 09:56:26 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.122.207)
	by 156.147.1.126 with ESMTP; 25 Nov 2026 09:56:26 +0900
X-Original-SENDERIP: 10.177.122.207
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH] kernel-module-split: fix re-signing of modules built in a subdirectory
Date: Wed, 25 Nov 2026 09:56:19 +0900
Message-ID: <20261125005619.45574-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 00:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251128
Content-Type: text/plain; charset="utf-8"

From: "mark.yang" <mark.yang@lge.com>

Out-of-tree modules built in a subdirectory of ${S}, such as
lttng-modules, are not signed again after package stripping and end up
in the packages without a signature.

A kernel with CONFIG_MODULE_SIG_FORCE=y then refuses to load them.
modprobe fails with "Key was rejected by service" and the kernel logs:

  Loading of unsigned module is rejected

To reproduce, set CONFIG_MODULE_SIG=y and CONFIG_MODULE_SIG_ALL=y in
linux-yocto and build lttng-modules. In log.do_package, modules_sign
enters ${S}, signs nothing and succeeds:

  NOTE: make ... M=.../lttng-modules-2.16.0 modules_sign
  make[1]: Entering directory '.../lttng-modules-2.16.0'
  make[1]: Leaving directory '.../lttng-modules-2.16.0'

Since 02890c1eff10 ("kernel-module-split: Remove get_ext_mod")
modules_sign always gets M=${S}, but lttng-modules runs Kbuild in
${S}/src and modules.order is only there.

Use MODULES_MODULE_SYMVERS_LOCATION, which module.bbclass already uses
to find Module.symvers in the same directory. modules_sign then signs
the modules:

  NOTE: make ... M=.../lttng-modules-2.16.0/src modules_sign
    SIGN    .../lttng-modules/lttng-ring-buffer-client-discard.ko

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta/classes-recipe/kernel-module-split.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 9a7f04f37b..1722687365 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -69,7 +69,7 @@ post_strip_kernel_modules_signing(){
         oe_runmake \
             -C ${KBUILD_OUTPUT}  \
             MODLIB=${PKGD}${KERNEL_MODULE_INSTALL_PREFIX} \
-            ${@'M=%s' % '${S}' if not "virtual/kernel" in d.getVar('PROVIDES') else ''} \
+            ${@'M=${B}/%s' % (d.getVar('MODULES_MODULE_SYMVERS_LOCATION') or '') if not "virtual/kernel" in d.getVar('PROVIDES') else ''} \
             modules_sign
     fi
 }
