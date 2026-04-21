Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2297EF94CAA
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 20:10:33 +0000 (UTC)
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47872.1776802231395229239
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 13:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=OwQ0KJNw;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=LqeFPCpm;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.148, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 9C8821D00225;
	Tue, 21 Apr 2026 16:10:30 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 21 Apr 2026 16:10:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1776802230; x=1776888630; bh=xU
	sQBknALRZmWXKWsbmPa/Leel5SXplzdkBxSeCQ3bo=; b=OwQ0KJNwffFOC1eP07
	yB+dUJ6QKl2lsqUj0LOPCVhcoI2jxUsRsN7/ZVyXuqpnctsCc9QgU6lJSRs9E1QQ
	+QXHRN74795cGLzNVIzuBjoutn4BKCZXIIY1oKTj3eXmgKHE8OS6qPz/TvNPB6If
	QJztxhn1pv1fCKnc7eiAvgAXilQTu6Xb5uNEwiJ9/aW8Pzffxhn5uv53d2W1QzqG
	7sCJ1uI8Jv88XyJmia75FSMn3iwexOi36rzeEnYl6JxD+FyJoeijEzOT/4pv7bgK
	ZHGlfCK3gi4eLblnG+jQZg8kIhWuJmza8rNHb/xLayGeGkuafhgltlQN8DDUrCvk
	qLbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1776802230; x=1776888630; bh=xUsQBknALRZmWXKWsbmPa/Leel5S
	XplzdkBxSeCQ3bo=; b=LqeFPCpmW3PgIYrwOruwPL5qJmfF88pI/U1ij4yBhhJw
	rfvd8MUs6fsdo1/0zYjqmU2My771zcwez9f1bPcqlrHXzMX6iPVakxT850GNV6jn
	/CiXRQaEpKQi8oe0s4WcOmlAqJYiiEPOf+DqMOdpgNUj8lYysBkvnGFmQ/l8oZAg
	G1qFPuuOVaFDzNjaeJkjmK8xDvXKtti1CMeAG3HXYAv32W1wpW30V97rg5Pp9MBk
	Msi29GglHjatWSBYFIk1Cpzq/bzFZniFy2sKUJK5a9j5ca8Coln4kBb4lrvEQKPG
	7ktsOFMe45CrcvneEn779EjZi+niuKmT26H42VdJxg==
X-ME-Sender: <xms:tdnnacCSRUHqTFYlkZGqVXwJmqCt35CV3fswtUuu9iUaEEr6Pvsj5g>
    <xme:tdnnaV_zScedRZziMT1R71wPejC09ckQ4Hc8fcY2ML6uPMyi4BnKQzNM8M-cq-I9Q
    jlmFTRypVH5_YI2uC4E2nCg4lidWcfecbeauUnbXazZ69taDAkKt0Q>
X-ME-Received: <xmr:tdnnac8BNj3MP8L6ejj1eKmyI99_4IqJ6a2TinAtw2Jq_QKgnrkGFdDBhnpwTVbqT_8yrMyomklXrqQv7_msI25GzZJac9o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeivdefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheprfgruhhluceurghr
    khgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnhepje
    elteefleetkeduueefteffgeeltdeguefgveetteekveetieektdfftedtkefhnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsg
    grrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehprghulhesphgsrghrkhgvrhdruggvvhdprhgtphhtthhopehophgvnh
    gvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhr
    ghdprhgtphhtthhopehtfihovghrnhgvrhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:tdnnacdCPasBh4ZYIxbyKxrwyHk94zAayOYs7WkDtg6wYiud5rXxKg>
    <xmx:tdnnaVG06X73JA7saxUUr_pYXPYqnK_R-Z9dbvbRRltJTBsMD9e3Og>
    <xmx:tdnnaacNwIQ5QRd8Su3xk7kRFccpXIfpyM2qlwdjSINsVUm7Su3fbg>
    <xmx:tdnnafHj0Ofs8Ni380i4QCeb1g4aZ56ooaddJMK7LoLIjInIguWmCQ>
    <xmx:ttnnaXFJzRr5wnBc4Xc07GTpLm8_CH9Y7YNdECDt8P0xdlTkpX6JaUny>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Apr 2026 16:10:29 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Tue, 21 Apr 2026 21:10:20 +0100
Subject: [PATCH] image_types_wic: Introduce wicenv image type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-wicenv-v1-1-75450eff8364@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIAKzZ52kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyND3fLM5NS8Ml1Tc0uDZEsDMzNTAwsloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AdRvDNmoAAAA=
X-Change-ID: 20260421-wicenv-5790c9066508
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>, Trevor Woerner <twoerner@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=MOpop/LyZnDsIF+qVRPd9uHxk9QxWXDgHyRnuLVMooM=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWQ+v7n1G7uMzbL/nS/5Z7Mrh07KcTZ84bGM4/1E6+j3v
 ffEkt+LdJSyMIhxMciKKbJs7vl6/2mvI29GyC0FmDmsTCBDGLg4BWAi9XwM/3TXLNrbKnjaJdNo
 /YH5l9qz+trqI+f+3Xm1oOZdhfHhJ40M/0z/uMw70bk291uGeqxX5FeZvcnaRzza7i+6y/lhGSf
 XT0YA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 20:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235688

Now that wic is an external tool, using it outside of the normal Yocto
build workflow will become more common. So, we need a way for users to
specify that they want the .env file used by wic to be placed into
${DEPLOY_DIR_IMAGE}.

With this change, if you intend to use wic externally, you should
specify:

    IMAGE_FSTYPES += "wicenv"

As we now have a separate IMAGE_CMD for this, we no longer need to
deploy the .env file in do_rootfs_wicenv.

Signed-off-by: Paul Barker <paul@pbarker.dev>
Cc: Trevor Woerner <twoerner@gmail.com>
---
 meta/classes-recipe/image_types_wic.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index aa0680561b9a..ea8c1c94ca2f 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -224,11 +224,13 @@ python do_rootfs_wicenv () {
             if value:
                 envf.write('%s="%s"\n' % (var, value.strip()))
     envf.close()
-    # Copy .env file to deploy directory for later use with stand alone wic
-    depdir = d.getVar('IMGDEPLOYDIR')
-    bb.utils.copyfile(os.path.join(outdir, basename) + '.env', os.path.join(depdir, basename) + '.env')
 }
 addtask do_flush_pseudodb after do_rootfs before do_image do_image_qa
-addtask do_rootfs_wicenv after do_image before do_image_wic
+addtask do_rootfs_wicenv after do_image before do_image_wic do_image_wicenv
 do_rootfs_wicenv[vardeps] += "${WICVARS}"
 do_rootfs_wicenv[prefuncs] = 'set_image_size'
+
+IMAGE_CMD:wicenv () {
+	cp "${STAGING_DIR}/${MACHINE}/imgdata/${IMAGE_BASENAME}.env" \
+	   "${IMGDEPLOYDIR}/${IMAGE_BASENAME}.env"
+}

---
base-commit: 9a83f0878b6bacbc7b322cfec076b4e79ad7b8fb
change-id: 20260421-wicenv-5790c9066508

Best regards,
--  
Paul Barker


