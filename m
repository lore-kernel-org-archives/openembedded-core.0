Return-Path: <contact@schnwalter.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633CECCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 10:23:57 +0000 (UTC)
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.web11.4978.1761647032401928211
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 03:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@schnwalter.eu header.s=fm1 header.b=hXR1Z7jX;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=WJipbP6V;
 spf=pass (domain: schnwalter.eu, ip: 103.168.172.146, mailfrom: contact@schnwalter.eu)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id B0627EC04BE;
	Tue, 28 Oct 2025 06:23:51 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 28 Oct 2025 06:23:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1761647031; x=1761733431; bh=KZXCm9s77CBNebEcXnhhb
	fEYGnYQ8rqnA6889eAYXHM=; b=hXR1Z7jXQZCa7tywv4MxGF04Pa6E85mPlOQMy
	Ky+SfUJSovYzHKTO3AuMhqkSJm5gB7LJwkaF2BOWAka59Xfojml+1ttBJyvTZq8E
	DE9JEWV+TasTkOOgQiLGz8EHzwqksqTXkRBCZ5MkFOtNR72aB2gb6fXyhosHGPCx
	S/fsfOFEPLHRFim3J9ZqmZTKcTOBdcqGLZxiUcj5pq48ngztQGNVzXg2gg8N7tP9
	Qf0tpj5SrS3IjAs6TfsxtTWuZHfAdrxOTcs+l2qWSO/ENgLAprwIJjjqlKs9QZSS
	jvaV2xf0rBB7IzjaKIu8Vhdgy7993OjK9hg5AiIuAEM49tWEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1761647031; x=1761733431; bh=KZXCm9s77CBNebEcXnhhbfEYGnYQ8rqnA68
	89eAYXHM=; b=WJipbP6VvRqBQhlUmaltYYMGwEJmrOiHDf5sAM+Ef5WQChYabTs
	4gExSeL4j75B97Wk0T+D14O8tIKVp++WzFllGMFuDLytX8P6Y/62alIEx80QcfF7
	fc2c065mSYodtNingjo5+f1XwVXc284TZ8TbxOdEYF9R6yE1lq3fYEanggJXhTmu
	CoC3pTaxUJH/ad5jHveUdfYValwMw0r3aWNGziopox0DqAuyCwEmRcXIUuY2yGcO
	146ipJ/qW5ldCA+fOW8takQPSiN03TqPqWW5arGnOv2j373m5/gWLSa6eHZd5MA0
	RqgW3GGAMWEz3pikwEES5uJtY/2Nbj8Hu7A==
X-ME-Sender: <xms:t5kAaaKcKgfgR_y0RwTQ7dB66mO8GpVwksem1hEQ1aqmXCs7PcDOsQ>
    <xme:t5kAaZFR1t0gtk2niUi2Ot4Whas7uqJwNYPD2AhzW0RSrqjZ2MTecEJy_oqFFR9AQ
    Kb51iHArCqOCerpGFbCRM82SaRCD-wu93BUOwzhVCNyuIWgXNN8aFU>
X-ME-Received: <xmr:t5kAaQVsV223Aj5CknpJP2McXYeUnrWnvRGX6b4FMF3VhAO7OMSSUMgT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduiedtiedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtredttd
    enucfhrhhomhephggrlhhtvghrucghvghrnhgvrhcuufevjffpgffkfffgtfcuoegtohhn
    thgrtghtsehstghhnhifrghlthgvrhdrvghuqeenucggtffrrghtthgvrhhnpefgkeejhf
    euffdvkeduheegudeuffeuvdfggfekffffgedvgfekgeevieevueffueenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohhnthgrtghtsehstg
    hhnhifrghlthgvrhdrvghupdhnsggprhgtphhtthhopedupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhoph
    gvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:t5kAaUj9VmwkD7Px0iKP3omx06VYBi9K0cxVcECTVcVFFxrIsDo36w>
    <xmx:t5kAaRR9HdhZ2rh7U5ac5oB2PKoqmfIyctBg-5dm7YZkVq2ZWSmPHw>
    <xmx:t5kAaXEmCetKgOWH6edjIQ2_Fgq_9QtF-zTdca6lk1nF4sb6gBFvBA>
    <xmx:t5kAaZntmcjZsJtXMsqJkupziWTeeHseaOo0hIfFRLgHn1e_26Dv9Q>
    <xmx:t5kAaRt8kzPYPTwwVx2yQBXsisp839qemIbEfPkG9l1IhmH6d1siQpIz>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Tue,
 28 Oct 2025 06:23:50 -0400 (EDT)
From: Walter Werner SCHNEIDER <contact@schnwalter.eu>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] core-image-weston: Add wayland as required feature.
Date: Tue, 28 Oct 2025 12:20:51 +0200
Message-ID: <20251028102341.955681-1-contact@schnwalter.eu>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 10:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225388

Running bitbake on the image without a DISTRO causes a "Nothing PROVIDES
'weston-xwayland'" error, and it doesn't help new users understand how to
get over the issue. With this change, you are guided by the errors and
can easily fix your image build by either adding the required
DISTRO_FEATURES or by setting a DISTRO, if you know the root cause.

Signed-off-by: Walter Werner SCHNEIDER <contact@schnwalter.eu>
---

The fist patch didn't include an explenation. The same also happens when
trying to build core-image-sato without a DISTRO, I will provide a patch
for that, if this is the correct fix for this type of issue.

 meta/recipes-graphics/images/core-image-weston.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/images/core-image-weston.bb b/meta/recipes-graphics/images/core-image-weston.bb
index 62305cc1ce..96d9c34bfa 100644
--- a/meta/recipes-graphics/images/core-image-weston.bb
+++ b/meta/recipes-graphics/images/core-image-weston.bb
@@ -4,9 +4,11 @@ IMAGE_FEATURES += "splash package-management ssh-server-dropbear hwcodecs weston
 
 LICENSE = "MIT"
 
-inherit core-image
+inherit core-image features_check
 
 CORE_IMAGE_BASE_INSTALL += "gtk+3-demo"
 CORE_IMAGE_BASE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'weston-xwayland matchbox-terminal', '', d)}"
 
 QB_MEM = "-m 512"
+
+REQUIRED_DISTRO_FEATURES = "wayland"

