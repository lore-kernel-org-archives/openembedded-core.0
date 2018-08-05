Return-Path: <ptsneves@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id BDC3278A84
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Aug 2018 14:43:50 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g1-v6so6415608wru.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2018 07:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NTXCf36cbNikNEvEmxbPDEf7j0f34wmMsm3Jvu0nq84=;
	b=apgKSm7JUes2M6dZNN4D3c5nNVru0ra/7twtBVcu8C9I3b99Mi3U+I4aRB46NlM2Ay
	h6h0w2x76HccfvgTnQlczqiWNcybH97nHNFNs0ESJL6iIZlhnlAZaxBFS60TzhBVx0oP
	S9EzhKCaN5jXp/O5TxVPywl3QHBs6pnuOL3X2yFW5pJmuldsT1eqrwb07Ri2O1fErIoL
	0QzHQZxHdJTyhXyTQo8h+VFbfYH4MclNiio/5psClloyUA15Bt4jg/xf5GJ4o5m8tFNG
	/hCbANqdLV0a1eMSb7W6x5mO2ahd4YROoQdkwBlJOl9hWLiIZiCOQWcxEKbEtNRHMU3U
	Zjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NTXCf36cbNikNEvEmxbPDEf7j0f34wmMsm3Jvu0nq84=;
	b=PQ9bwOtVTHAo4NwOXx0WbJfZhjjpV8I+IjCgsWtT98iZsL1PAffLwOlT46An8dxhUp
	YOR7ykfpmM9usBnzbU4r9dCIiZ0g6JIZl67ndjcJyFtZNuobzlxfseB3ju+6JBShM23Y
	AkZHozE2c9jqfo/YtrB00+h7Qju3Gx3YzOtnUazbEFO/hTZuGtK47z5uHpa3LYeqaqB5
	XRqpOKIedmlpBg+PxMB/XoZPLgCTe19rRrNYik26visrJW4uG263IDrRpUATm+rDUaNY
	TC9BhxVewO9MW0iLVy7pl/gCA3iMTre6Ja2rT6ZnGKqanSf2Nda0mzUnfyvI70I+LWLo
	K2gw==
X-Gm-Message-State: AOUpUlHdyfQ3GucwDBdUR523v0Ka2z/rC+t8G602tc3HKwf8IIm6MsBF
	/U6EtGiNFtD+xGy1pOZ/6c4g4jpE8A==
X-Google-Smtp-Source: AAOMgpdgifBRdgxLfjEcKnsQ+1MkXeEmko+z0RbSzDPp5uitO3fTFt5vYoRfeJX3kckqpdfw7mwdFA==
X-Received: by 2002:adf:ed41:: with SMTP id
	u1-v6mr7045280wro.262.1533480231402; 
	Sun, 05 Aug 2018 07:43:51 -0700 (PDT)
Received: from localhost.localdomain (64.196.28.37.rev.vodafone.pt.
	[37.28.196.64]) by smtp.gmail.com with ESMTPSA id
	b13-v6sm11073701wrs.43.2018.08.05.07.43.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 05 Aug 2018 07:43:50 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Aug 2018 16:40:41 +0200
Message-Id: <1533480041-6431-4-git-send-email-ptsneves@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533480041-6431-1-git-send-email-ptsneves@gmail.com>
References: <1533480041-6431-1-git-send-email-ptsneves@gmail.com>
Subject: [PATCH 4/4] masterimage: Check for rootfs path instead of file.
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
X-List-Received-Date: Sun, 05 Aug 2018 14:43:51 -0000

The rootfs might be a directory path or a file path. A
case in point is if the test wants to deploy a rootfs
directly by rsyncing it to the target or even use it
as part of a tftp server.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/lib/oeqa/controllers/masterimage.py | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index 26e3870..fb8ab50 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -51,11 +51,7 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
         self.image_fstype = self.get_image_fstype(td)
         self.rootfs = os.path.join(td['DEPLOY_DIR_IMAGE'], td['IMAGE_LINK_NAME'] + '.' + self.image_fstype)
         self.kernel = os.path.join(td['DEPLOY_DIR_IMAGE'], td["KERNEL_IMAGETYPE"] + '-' + td['MACHINE'] + '.bin')
-        if not os.path.isfile(self.rootfs):
-            # we could've checked that IMAGE_FSTYPES contains tar.gz but the config for running testimage might not be
-            # the same as the config with which the image was build, ie
-            # you bitbake core-image-sato with IMAGE_FSTYPES += "tar.gz"
-            # and your autobuilder overwrites the config, adds the test bits and runs bitbake core-image-sato -c testimage
+        if not os.path.exists(self.rootfs):
             bb.fatal("No rootfs found. Did you build the image ?\n"  \
               "If yes, did you build it with IMAGE_FSTYPES += \"{}\" ?"  \
               "\nExpected path: {}".format(" ".join(self.supported_image_fstypes), self.rootfs))
-- 
2.7.4


