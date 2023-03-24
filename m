Return-Path: <throos@amazon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F7DC6FD20
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:00:17 +0000 (UTC)
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com [99.78.197.217])
 by mx.groups.io with SMTP id smtpd.web10.104094.1679670014930581706
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=kXvsw224;
 spf=pass (domain: amazon.de, ip: 99.78.197.217, mailfrom: prvs=44022c1a6=throos@amazon.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1679670016; x=1711206016;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5Ds6u2pXBE5F+GpqE1HWlBu/r3Z3+l+ka8gRCgsion4=;
  b=kXvsw224Xfn4E2E2yu9BT+8GS/bvsRhfSOxN8xOvQpcAs/kOzOO2l7FW
   aIeawWzaXEc3hBIkQXklWSqH3t5fh/uIGHVOkjXczafe84bx6u7fPkYJS
   WwbrV34O1ESBiIJTVSigyXCU/T4SX/aUEEgYfwT7g+hamiHWPf2tcokiP
   M=;
X-IronPort-AV: E=Sophos;i="5.98,288,1673913600"; 
   d="scan'208";a="197116431"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-pdx-2b-m6i4x-189d700f.us-west-2.amazon.com) ([10.25.36.210])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 15:00:13 +0000
Received: from EX19D016EUC001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
	by email-inbound-relay-pdx-2b-m6i4x-189d700f.us-west-2.amazon.com (Postfix) with ESMTPS id 1C88D415A2
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:00:12 +0000 (UTC)
Received: from u182adcbddbfb55.ant.amazon.com (10.85.99.86) by
 EX19D016EUC001.ant.amazon.com (10.252.51.169) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 24 Mar 2023 15:00:09 +0000
From: <throos@amazon.de>
To: <openembedded-core@lists.openembedded.org>
CC: Thomas Roos <throos@amazon.de>
Subject: [PATCH] change the default behavior of bitbake-layers and oe-setup-builddir to rel paths
Date: Fri, 24 Mar 2023 15:59:58 +0100
Message-ID: <20230324145958.278236-1-throos@amazon.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.85.99.86]
X-ClientProxiedBy: EX19D033UWA002.ant.amazon.com (10.13.139.10) To
 EX19D016EUC001.ant.amazon.com (10.252.51.169)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179040

From: Thomas Roos <throos@amazon.de>

This patch will use the $TOPDIR variable to create layer entries in bblayers.conf.
Instead of an absolute path this will create an relative path to $TOPDIR, which will
allow to move the bblayers.conf to different paths without modification of it.

Signed-off-by: Thomas Roos <throos@amazon.de>
---
 bitbake/lib/bblayers/action.py | 4 +++-
 scripts/oe-setup-builddir      | 5 +++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/bitbake/lib/bblayers/action.py b/bitbake/lib/bblayers/action.py
index 0d7fd6edd1..bd13e15a2f 100644
--- a/bitbake/lib/bblayers/action.py
+++ b/bitbake/lib/bblayers/action.py
@@ -26,7 +26,7 @@ def plugin_init(plugins):
 class ActionPlugin(LayerPlugin):
     def do_add_layer(self, args):
         """Add one or more layers to bblayers.conf."""
-        layerdirs = [os.path.abspath(ldir) for ldir in args.layerdir]
+        layerdirs = [os.path.relpath(ldir, findTopdir()) for ldir in args.layerdir]
 
         for layerdir in layerdirs:
             if not os.path.exists(layerdir):
@@ -38,6 +38,8 @@ class ActionPlugin(LayerPlugin):
                 sys.stderr.write("Specified layer directory %s doesn't contain a conf/layer.conf file\n" % layerdir)
                 return 1
 
+        layerdirs = [os.path.join('${TOPDIR}', ldir) for ldir in args.layerdir]
+
         bblayers_conf = os.path.join(findTopdir(),'conf', 'bblayers.conf')
         if not os.path.exists(bblayers_conf):
             sys.stderr.write("Unable to find bblayers.conf\n")
diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 89ae30f609..65a77b76fd 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -92,8 +92,9 @@ EOM
     # bitbake without the init script after the first run.
     # ##COREBASE## is deprecated as its meaning was inconsistent, but continue
     # to replace it for compatibility.
-    sed -e "s|##OEROOT##|$OEROOT|g" \
-        -e "s|##COREBASE##|$OEROOT|g" \
+    LAYERPATH='${TOPDIR}'/$(realpath --relative-to=$BUILDDIR $OEROOT)
+    sed -e "s|##OEROOT##|$LAYERPATH|"g \
+        -e "s|##COREBASE##|$LAYERPATH|"g \
         "$OECORELAYERCONF" > "$BUILDDIR/conf/bblayers.conf"
     SHOWYPDOC=yes
 fi
-- 
2.34.1




Amazon Web Services EMEA SARL
38 avenue John F. Kennedy, L-1855 Luxembourg
Sitz der Gesellschaft: L-1855 Luxemburg
eingetragen im Luxemburgischen Handelsregister unter R.C.S. B186284

Amazon Web Services EMEA SARL, Niederlassung Deutschland
Marcel-Breuer-Str. 12, D-80807 Muenchen
Sitz der Zweigniederlassung: Muenchen
eingetragen im Handelsregister des Amtsgerichts Muenchen unter HRB 242240, USt-ID DE317013094





