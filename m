Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B03965E11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 06:08:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7C68BMR000270
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 23:08:13 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 11 Aug 2014 23:08:11 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Aug 2014 23:08:11 -0700
Message-ID: <0aea2ea3d6ede80c48808b19d848138be0da7483.1407823628.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1407823628.git.liezhi.yang@windriver.com>
References: <cover.1407823628.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] image.bbclass: image_types.bbclass is a must
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
X-List-Received-Date: Tue, 12 Aug 2014 06:08:12 -0000
Content-Type: text/plain

The image_types.bbclass is a must since we use this in image.bbclass:

[snip]
python () {
    deps = " " + imagetypes_getdepends(d)
    d.appendVarFlag('do_rootfs', 'depends', deps)
[snip]

The imagetypes_getdepends() is defined in image_types.bbclass. Use "+="
to replace "?=" since it is a must, so that the user can use
"IMAGE_CLASSES = foo.bbclass" in local.conf to add their own image
class.

NOTE: the IMAGE_CLASSES_append = " foo" doesn't work since we use this
in image.bbclass:
 IMAGE_CLASSES += "image_types"
 inherit ${IMAGE_CLASSES}

I think that it is because inherit takes effect before append?

Another way to fix the problem is:
IMAGE_CLASSES ?= ""
inherit image_types ${IMAGE_CLASSES}

But it seems that we need another name for IMAGE_CLASSES, for example
IMAGE_CLASSES_EXTRA, and also need update the doc, which would make it
complicated.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 82605f2..940bdb6 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -163,7 +163,7 @@ python () {
         d.appendVarFlag('do_bundle_initramfs', 'depends', " %s:do_rootfs" % initramfs_image)
 }
 
-IMAGE_CLASSES ?= "image_types"
+IMAGE_CLASSES += "image_types"
 inherit ${IMAGE_CLASSES}
 
 IMAGE_POSTPROCESS_COMMAND ?= ""
-- 
1.7.9.5


