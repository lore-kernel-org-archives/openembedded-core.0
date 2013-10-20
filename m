Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id ABAF76D1BD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 22:34:32 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id e50so1810298eek.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 15:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3lDKj1kjMhOCrzhZW3gG6wwfAprCziAAz3jVbYDXZ1w=;
	b=MNhNpIsoXZN+Xd5+n8kzwGqFv5NW/sbfrDvvPQ8Qs7ZeyUD7lzUc1juv3Ajj3IdcrJ
	lTHIAzKr4F05xGJgXONq9Fe3KPXTeteSWRc4mJAnpuat4VLAUKwIyNZRFTWOy98t+NS8
	MlwUu+F8VFbmZZYZCOEYBcomWVDgIbQ2DGkjzBya7tMlHIAtj71er8l8Q9WQ8TRFpXfj
	lfYiVHpTbBGho0/vo+Ga4WD3NBizVj1ekEvFWlksRMp54sVweVBC24LjCN3q/h7Y9FUz
	psX+fj2kgDWkMgu8+jC+B4/N5CT06xiCl8YTxuD2o9fOvBOV53TuXwx/RT2nxbIAw6Gb
	H2Cw==
X-Received: by 10.15.74.197 with SMTP id j45mr18572725eey.40.1382308473663;
	Sun, 20 Oct 2013 15:34:33 -0700 (PDT)
Received: from mizar.localdomain
	(host218-209-dynamic.16-79-r.retail.telecomitalia.it.
	[79.16.209.218])
	by mx.google.com with ESMTPSA id j7sm35752601eeo.15.2013.10.20.15.34.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Oct 2013 15:34:33 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2013 00:34:18 +0200
Message-Id: <cover.1382307169.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH 0/5] JFFS2 images: bugfixes and enhancements
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
X-List-Received-Date: Sun, 20 Oct 2013 22:34:33 -0000

The first patch is a bugfix allowing the creation of images with cleanmarkers
for devices with NOR flash.
The second and the third ones are fixes for the options passed to sumtool.

After those first patches it is possible to customize again i.e.

 EXTRA_IMAGECMD_JFFS2 = "--pad=14680064 -l --erase-block=${JFFS2_ERASEBLOCK}"

In the normal case (NAND flash) only JFFS2_ERASEBLOCK is necessary and
having to redeclare the full EXTRA_IMAGECMD_jffs2 seems counter-intuitive
and has revealed to be error-prone.

So, the fourth and fifth patches are proposed enhancements to further parametrize
for both jffs2 and sum.jffs2 images by using two new optional vars like done for
JFFS2_ERASEBLOCK:

JFFS2_ERASEBLOCK = "0x20000"
JFFS2_NOCLEANMARKERS = ""
JFFS2_PADDING = "--pad=14680064"

Andrea Adami (5):
  image_types.bbclass: do not force --no-cleanmarkers for jffs2
  image_types.bbclass: fix endiannes for sumtool (jffs2 summary)
  image_types.bbclass: fix EXTRA_IMAGECMD_sum.jffs2
  image_types.bbclass: add JFFS2_NOCLEANMARKERS variable
  image_types.bbclass: add JFFS2_PADDING variable

 meta/classes/image_types.bbclass | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

-- 
1.8.1.5


