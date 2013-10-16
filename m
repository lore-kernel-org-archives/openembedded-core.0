Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 314006C856
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 11:42:42 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id hp15so459664lab.1
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 04:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=mANz51hZHAer284qoGPDj+hU6w/6NbgtOZASgC8FLKE=;
	b=KMyavFEhbPPihE+wDW2FEErN55HzAsN0JxXHAOJy2Kg2BCep4NpvHXH1Cpoz7An0vc
	bteTyCTWAoNiaaKnHpMYs0YNib6xzzI23EXLW2G6QXdgDb/AHSoQroDR3c6pJu47LmAI
	v24J/0N4WXe9kFjfNaxHfe2n9FETgaLc/o3VePPr/guniTqMrqPApk83IW1MHiMxvagU
	4HrEzllY+8MDqtO0p3lR8npEjxveJJrXFtcpP1wcu0nYg6kPx4DGDLrPWEcSO+RQhbOj
	oIqPpURqMcpP6z7mSUreIaqmCEWwFSbwY6LlzgcjWH0mj2rjn1neZfoIhxWGy4UoH/Um
	lVfg==
MIME-Version: 1.0
X-Received: by 10.152.3.42 with SMTP id 10mr2144025laz.22.1381923763270; Wed,
	16 Oct 2013 04:42:43 -0700 (PDT)
Received: by 10.112.52.74 with HTTP; Wed, 16 Oct 2013 04:42:43 -0700 (PDT)
Date: Wed, 16 Oct 2013 13:42:43 +0200
Message-ID: <CAAQYJAt_8L4ESpzUiZ7EDW8w9gz1jn60WGkCHBUyCBE_rEik4w@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Openembedded-core@lists.openembedded.org
Subject: JFFS2 and -n, --no-cleanmarkers
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
X-List-Received-Date: Wed, 16 Oct 2013 11:42:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

unfortunately the creation of JFFS2 mages is hardcoding the
--no-cleanmarkers option (-n) after those two commits:

http://cgit.openembedded.org/openembedded-core/commit/meta/classes/image_types.bbclass?id=70a276509f0f006fcc269296afc3dcc88d2825e1

http://cgit.openembedded.org/openembedded-core/commit/meta/classes/image_types.bbclass?id=7c803cea58737ea0abc62cd21c3813d955f07224

Now, my idea is to revert the first one:

- IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime
--output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 -n
${EXTRA_IMAGECMD}"

+ IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime
--output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2
${EXTRA_IMAGECMD}"

About the second one, we could add a new var:

+JFFS2_NOCLEANMARKERS = "-n"

-EXTRA_IMAGECMD_jffs2 ?= "--pad ${JFFS2_ENDIANNESS}
--eraseblock=${JFFS2_ERASEBLOCK} --no-cleanmarkers"

+EXTRA_IMAGECMD_jffs2 ?= "--pad ${JFFS2_ENDIANNESS}
--eraseblock=${JFFS2_ERASEBLOCK} ${JFFS2_NOCLEANMARKERS}"


Now my doubt is about the default value for this variable.
Maybe better empty ?

+JFFS2_NOCLEANMARKERS = ""

The point is, only machines with NAND flash ough tto skip cleanmarkers
in the image for these are in the OOB area.

"On NOR memory every completely erased eraseblock begins with a
cleanmarker, cln_mkr is the size of the cleanmarker, if there is no
cleanmarker (NAND) then it is set to 0"

http://www.linux-mtd.infradead.org/faq/jffs2.html
http://www.inf.u-szeged.hu/jffs2/jffs2-anal/node23.html

Once there is common agreement I'll send a patch.

Thanks

Andrea

