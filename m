Return-Path: <dwagenknecht@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F71CC433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 19:06:43 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [136.243.223.33])
 by mx.groups.io with SMTP id smtpd.web10.1644.1646248000857091206
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 11:06:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: emlix.com, ip: 136.243.223.33, mailfrom: dwagenknecht@emlix.com)
Received: from mailer.emlix.com (unknown [81.20.119.6])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 549DC5FFE4;
	Wed,  2 Mar 2022 20:06:38 +0100 (CET)
From: Daniel Wagenknecht <dwagenknecht@emlix.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Wagenknecht <dwagenknecht@emlix.com>,
	Andrej Valek <andrej.valek@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][PATCH] copy_buildsystem: allow more layer paths
Date: Wed,  2 Mar 2022 20:05:55 +0100
Message-Id: <20220302190554.1953968-1-dwagenknecht@emlix.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 19:06:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162622

Layers could be located anywhere. The eSDK should work with them even if
they are not located in TOPDIR or in the same parent directory as
COREBASE.

For layers located in the same parent directory as COREBASE this preserve=
s
the intent from the previous
  copy_buildsystem: include layer tree during build structure creation
commit.

Related OE-Core rev: 5a59a6997f41e606d088e3e86812de56f72f543b

Signed-off-by: Daniel Wagenknecht <dwagenknecht@emlix.com>
---
This patch resolves issues like
  ERROR: my-image-1.0-r0 do_populate_sdk_ext: Failed to generate filtered=
 task list for extensible SDK:

  ### Shell environment set up for builds. ###
  [...]

  ERROR: bitbake failed:
  ERROR: The following layer directories do not exist:
  ERROR:    /build/tmp/work/my-board-linux/my-image/1.0-r0/sdk-ext/image/=
tmp-renamed-sdk/layers/../../../repo/layers/meta-my-layer
  ERROR: Please check BBLAYERS in /build/tmp/work/my-board-linux/my-image=
/1.0-r0/sdk-ext/image/tmp-renamed-sdk/conf/bblayers.conf
  ERROR: Logfile of failure stored in: /build/tmp/work/my-board-linux/my-=
image/1.0-r0/temp/log.do_populate_sdk_ext.68844

I tried to preserve the special casing to preserve the layer tree e.g. ge=
t the
following layer-structure in the eSDK:
  layers/poky/meta
  layers/meta-openembedded/meta-networking
  layers/meta-openembedded/meta-oe
For layers that are not located in a directory tree right next to COREBAS=
E we
don't have an anchor to determine what part of the layer tree we should k=
eep,
thus the layer tree will be flattened.

Alternative to this patch:
Delete the whole else / elseif block. This would lead to a layer structur=
e in
the eSDK like
  layers/poky/meta
  layers/meta-networking
  layers/meta-oe
thus flattening the layer tree. I'm personally not opposed to this approa=
ch,
but both 5a59a6997f41e606d088e3e86812de56f72f543b and
55ecf6988d3e3c0935cb6324a6ad2c75f1191a1d (OE-Core) show that there seems =
to be
a need / preference for keeping the layer tree.


 meta/lib/oe/copy_buildsystem.py | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsyst=
em.py
index d97bf9d1b9..79642fd76a 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -45,9 +45,6 @@ class BuildSystem(object):
=20
         corebase =3D os.path.abspath(self.d.getVar('COREBASE'))
         layers.append(corebase)
-        # Get relationship between TOPDIR and COREBASE
-        # Layers should respect it
-        corebase_relative =3D os.path.dirname(os.path.relpath(os.path.ab=
spath(self.d.getVar('TOPDIR')), corebase))
         # The bitbake build system uses the meta-skeleton layer as a lay=
out
         # for common recipies, e.g: the recipetool script to create kern=
el recipies
         # Add the meta-skeleton layer to be included as part of the eSDK=
 installation
@@ -100,11 +97,10 @@ class BuildSystem(object):
             layerdestpath =3D destdir
             if corebase =3D=3D os.path.dirname(layer):
                 layerdestpath +=3D '/' + os.path.basename(corebase)
-            else:
-                layer_relative =3D os.path.relpath(layer, corebase)
-                if os.path.dirname(layer_relative) =3D=3D corebase_relat=
ive:
-                    layer_relative =3D os.path.dirname(corebase_relative=
) + '/' + layernewname
-                layer_relative =3D os.path.basename(corebase) + '/' + la=
yer_relative
+            # If the layer is located somewhere under the same parent di=
rectory
+            # as corebase we keep the layer structure.
+            elif os.path.commonpath([layer, corebase]) =3D=3D os.path.di=
rname(corebase):
+                layer_relative =3D os.path.relpath(layer, os.path.dirnam=
e(corebase))
                 if os.path.dirname(layer_relative) !=3D layernewname:
                     layerdestpath +=3D '/' + os.path.dirname(layer_relat=
ive)
=20
--=20
2.33.1


