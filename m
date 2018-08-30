Return-Path: <ptsneves@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 175017949D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 17:49:56 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id f1-v6so7989980ljc.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 10:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NTXCf36cbNikNEvEmxbPDEf7j0f34wmMsm3Jvu0nq84=;
	b=MBSY5aS+WeY0V1WfI+9loZuUxWpfHOYvp5bmhTIi1xRENk2ZPwLHx/1l8ydgKzUck3
	wROFILHaLfQWp2OaDQNt1hwM88CTc1q35I5YYic85z9TgM3B96ItUc0hki3SRyFGeJ2O
	IvoQynEzjzop1hgVB1qJyJ0Yu21ifiU/AfE28TmrfNv1JHaom6xBOuG0S7ln4QWf/xQi
	tn23NYoisaeS7Zkxbzg4CQ7sq2D9WmVfbZOUpBFdjxD92kimVjtjWrhDqpYPT5VK2zkb
	I02pY8BV7nEwJKDzM6K8HeLmWY8QaPzOxsUcKBUzCqzl7HVUGfS4p9EOGu8A310lf9/Z
	345A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NTXCf36cbNikNEvEmxbPDEf7j0f34wmMsm3Jvu0nq84=;
	b=fLvecS8YLXQzEa83XVVPwP44dJ2atgdZFLTYP1yFpYnPRytHk6LyqbvyQ4YpWt5pz0
	NAmQGbf70R4ZES8iNQXo9wk5+YgKKhXs/J0ywuZqRGwIk9SMAVxrJEcHmxN3avoFf53q
	l3y8bF4i8WH5ElRDdnnK3WJiJgEfMxmDl5uZNjU7fNlINFkCpK/eJhn2o3ZQAUkoKqjr
	CF3b808McG+8zd9q5y83WLyz86MhaOp1ywrlF/Q3cptmbMqoj2O3NkA7O0oyELNceOtx
	s6bjzHdByNU6kMC31DiiG49xqSErmSLB4mN2/PjEf9893d3wuG8n5hHw0H9nohf6oUp0
	nSCQ==
X-Gm-Message-State: APzg51AlRaa42uO+PAew48x62JpNHpSayIVAiWi6s0H7VtdIcOoN+5+q
	3czZKjRhv4nT7SgLu20SzWWx/1I=
X-Google-Smtp-Source: ANB0VdapHGTpcUKVJyLsYgMOBSi4EvyeIrVHFXG1+UmPW4VTcDkx38j7lRprlDMDl+zagrMeQa6R6A==
X-Received: by 2002:a2e:5c07:: with SMTP id
	q7-v6mr7838511ljb.119.1535651397504; 
	Thu, 30 Aug 2018 10:49:57 -0700 (PDT)
Received: from pneves-XPS-15-9550.home
	(dynamic-62-87-243-12.ssp.dialog.net.pl. [62.87.243.12])
	by smtp.gmail.com with ESMTPSA id
	t25-v6sm1368907ljb.89.2018.08.30.10.49.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Aug 2018 10:49:56 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Aug 2018 19:49:35 +0200
Message-Id: <1535651376-25467-3-git-send-email-ptsneves@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535651376-25467-1-git-send-email-ptsneves@gmail.com>
References: <1535651376-25467-1-git-send-email-ptsneves@gmail.com>
Subject: [meta-oe][PATCH v2 3/4] masterimage: Check for rootfs path instead of file.
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
X-List-Received-Date: Thu, 30 Aug 2018 17:49:57 -0000

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


