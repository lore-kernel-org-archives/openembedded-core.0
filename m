Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f195.google.com (mail-ig0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id 22AA9602D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 03:47:53 +0000 (UTC)
Received: by mail-ig0-f195.google.com with SMTP id qu10so1425954igc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 20:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/fAjaHSMyORYY2RCeqXFnwu9TdC4EjTNitJZ9l1JmIs=;
	b=l98WVb6MkvKQ2iMm3lBfhIX54GTPUCA2ZL8+kDalfhF2xptwu7alSyvlvt/LVTpfit
	a+Agybyyl7xsLW8suyzk9m4NkEcLHKNChkOW5tfCI6w7f5H6xXUHJ0YVj3W6SL7PZw65
	ClNbf29NwWEsVxoyH0Vu2kIHKkUKXjWdRHMnOaslGCBsGsYKDkg1q8knpNBhjMZWt4GQ
	FXh85Wb8K+e1LpOB4PQno4o7smGgKY82nK7kki/1rhxiX4GwsFdEq8CZykEAo6m8l4w5
	non+VIC2DqiyjCvLAA1MY3Nh/hi1NoEhycy6xWrvcDKQHt7cQS4lwfreczC3ATH8CHzs
	mwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/fAjaHSMyORYY2RCeqXFnwu9TdC4EjTNitJZ9l1JmIs=;
	b=lCkpEQZXzrRvDJ0rd5TvAI2K8G1O+I94s1b1/T+fWJb3tn1yH/cXwAfD/RXm0EVG1d
	3nwk873hAGTpid5U/vwLZ2KY7EHE8m3FmVcxr76Qo1MogYtzPiYOwWNRf95GYBYnp7Z+
	UoaJpKWfY85jmdaELOpRsyZFWxea+rR3PMepi4VY8+EGe8a2DGlhD2yHQ4qh50V5x9i3
	J2ic8JlXE7xj3YVdDVpt/o7QasF5QtpO1Q64VR2mfnQ8wjSDuCy2lqSaBErN94GvSTId
	QvVNENRdUnesUwjhFN5rwHji1dd2p9CRV0SACL3+PCL6sHhVyX9OS4hVW2GQaE2nz6Qe
	LhNQ==
X-Gm-Message-State: AOPr4FU0MgH5BRy+KTs+Cd+Oz/77HGHX5aWJoecgOq5Hm06GyLE64hiOIdCh72OFNtyg8g==
X-Received: by 10.50.41.226 with SMTP id i2mr2097101igl.33.1460692073902;
	Thu, 14 Apr 2016 20:47:53 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id j7sm4752274igv.22.2016.04.14.20.47.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Apr 2016 20:47:52 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Apr 2016 20:47:46 -0700
Message-Id: <1460692066-24047-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] image.bbclass: don't emit redundant IMAGE_CMD_xxx functions
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
X-List-Received-Date: Fri, 15 Apr 2016 03:47:56 -0000

IMAGE_CMD_xxx commands are always inlined within do_image_xxx.

When IMAGE_CMD_xxx is defined as a function (e.g. IMAGE_CMD_btrfs,
IMAGE_CMD_cpio, etc), a redundant copy of the function will be emitted
by default. Remove IMAGE_CMD_xxx 'func' flags to prevent that.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---

This has been tested and seems to work as expected, however I'm not
100% sure I fully understand the implications of localdata -vs- d
or realt -vs- t in this code, so please review before merging.

 meta/classes/image.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index f471f1a..ca6dda4 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -388,6 +388,10 @@ python () {
             bb.fatal("No IMAGE_CMD defined for IMAGE_FSTYPES entry '%s' - possibly invalid type name or missing support class" % t)
         cmds.append(localdata.expand("\tcd ${DEPLOY_DIR_IMAGE}"))
 
+        # Since a copy of IMAGE_CMD_xxx will be inlined within do_image_xxx,
+        # prevent a redundant copy of IMAGE_CMD_xxx being emitted as a function.
+        d.delVarFlag('IMAGE_CMD_' + realt, 'func')
+
         rm_tmp_images = set()
         def gen_conversion_cmds(bt):
             for ctype in ctypes:
-- 
1.9.1


