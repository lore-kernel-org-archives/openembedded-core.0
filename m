Return-Path: <ptsneves@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3811A753F1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 11:28:42 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v14-v6so12019676wro.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 04:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NTXCf36cbNikNEvEmxbPDEf7j0f34wmMsm3Jvu0nq84=;
	b=W1AGOBcdZEk5JXlbV+9gwkzCgduTTb/kPO353gbLKZJ7hqPTBHif/U6VVPEoFMgqkR
	RvuceDgZnFnAPjeMqKVsqHnLxuxlPnWY4Tp7/H6ROSKl+kHWLT1GeVnOilQxfl7touP1
	zu/+u0qOKNdVpcDT865iJH0oASpe754tqmcuS5GlJjU7WIWqWgC+N1EU2+gn8bDvRtEd
	wCIt3HqpJdF2wmzQ8RjUVp7DZP/QidE9sPBJ21OuIPk46l9yT0UL+Jn9E2Ysr3AlpPX+
	qur2Qx1w3NLEEMZX1hP5qPm0uMlJQs9ZkXXUwATkc5khKjU/8s/E3jnHT4V2/7AALPAC
	78FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NTXCf36cbNikNEvEmxbPDEf7j0f34wmMsm3Jvu0nq84=;
	b=F9wmf2K7+yK5KCk/8PtHNZjbZ/yHgimH7dq8ShF6cLbfmiZ7/ZR5bUZNy/rdHx2GCH
	sxIH8y/MyqnNyuPtWnTgeGHmersUSGwffTfAjCi7V2hGkiHTE+YLT0UfAT+WkkED/nbj
	wKRvpNQv2hzMZiSKRwRnsJoJl5cG9M3Rj15/RDOjKsi3WGzBSb5bGVa91qFGStCKpTdC
	8A2UVen0UWMhcFF8w9JQIfTwUexLXPPheD9JzkvKNPnwgzKTUth3C+lQlS+CubjbmH4q
	e6xmkm+j5P5ni5xj+MMQK6og9Bd8/XDFlhW4pDUrS91dgGH6wR0U+D47T9nHbJbCx04E
	iS2Q==
X-Gm-Message-State: AOUpUlEFNrfK+RCwuhOboi5Mw4ztuIGQDhg/cgwSyOjR5ck2todQgXTn
	E9C48bJfro6yYH/8ZxlDVxpMF1TrTA==
X-Google-Smtp-Source: AAOMgpdjRcyA+RjFhvYCI1+kKyEmCmM1Rnfi68S1bLHU55ytvDm2l3V4ysVJ9DkTkzWGqQmRy4N7kg==
X-Received: by 2002:a5d:6601:: with SMTP id
	n1-v6mr8561626wru.281.1533554922757; 
	Mon, 06 Aug 2018 04:28:42 -0700 (PDT)
Received: from localhost.localdomain (64.196.28.37.rev.vodafone.pt.
	[37.28.196.64]) by smtp.gmail.com with ESMTPSA id
	k6-v6sm9336022wrv.92.2018.08.06.04.28.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Aug 2018 04:28:41 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 13:27:01 +0200
Message-Id: <1533554821-10772-4-git-send-email-ptsneves@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533554821-10772-1-git-send-email-ptsneves@gmail.com>
References: <1533554821-10772-1-git-send-email-ptsneves@gmail.com>
Subject: [meta-oe][PATCH v2 4/4] masterimage: Check for rootfs path instead of file.
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
X-List-Received-Date: Mon, 06 Aug 2018 11:28:42 -0000

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


