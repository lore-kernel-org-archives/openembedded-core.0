Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id E025372638
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Dec 2014 16:31:57 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id hy4so3115195vcb.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Dec 2014 08:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=csjbiOWYxgxMIKMRzz/bPs9+IbmQGRWma8+sPPFEod4=;
	b=N1IPoHx2OqOt6I1btg7rnXzyhIUyvBBqz5WYphLs0Bn3aXZbsPpPQllMbvVG9xj3Ym
	t3JwbZM+JkfAPdRo2chDBlnaOlP+ZGE2CiOWsBYdU+rbc6SYLdmLjq2TTnxxdHyhMdWi
	K5kUbPyjH58UOVzfog4cB3Y/BatXWnpm0Ey0t8iewTQHf6iwSqbZJ/UqUIEfRaVdUy/k
	6PozvnP8229iiWYGZy/c+1tlNnLzQUSaVlManlnkAz/1jtJMRbt80AnViYj82MCThE/3
	MqtfkrcGB9uDlJx8rtqkRkjWkTN6Gq0kKqnYL4vk1fQwf/lGLVAxi9Z2H3M7EHuxwmM+
	n0og==
X-Received: by 10.53.9.42 with SMTP id dp10mr11677666vdd.88.1419438717777;
	Wed, 24 Dec 2014 08:31:57 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id ey1sm6065973vdb.23.2014.12.24.08.31.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Dec 2014 08:31:56 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Dec 2014 14:32:09 -0200
Message-Id: <1419438731-623-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 1/3] image_types.bbclass: Respect IMAGE_TYPEDEP dependencies
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
X-List-Received-Date: Wed, 24 Dec 2014 16:32:06 -0000

The IMAGE_TYPEDEP dependencies also need to be taken into account when
building an IMAGE_FSTYPE.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/image_types.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 1b8ceee..71b2ea9 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -21,6 +21,8 @@ def imagetypes_getdepends(d):
                 basetype = type[:-len("." + ctype)]
                 adddep(d.getVar("COMPRESS_DEPENDS_%s" % ctype, True), deps)
                 break
+        for typedepends in (d.getVar("IMAGE_TYPEDEP_%s" % basetype, True) or "").split():
+            adddep(d.getVar('IMAGE_DEPENDS_%s' % typedepends, True) , deps)
         adddep(d.getVar('IMAGE_DEPENDS_%s' % basetype, True) , deps)
 
     depstr = ""
-- 
2.1.3


