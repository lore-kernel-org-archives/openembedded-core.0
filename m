Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id B55EB731A1
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 15:43:40 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id n124so196090999lfd.2
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 07:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=VRKKN9DPbEy+o9GP7wrk8rsgrPpDd7vzeXvbH5u+AwE=;
	b=etvyGFZ27ChS+Emm6Y+1oJSjiXizj7GiXXcxNXxitmlAksRm9JxRXiGRM7rDWG7Ga/
	IRD3QcxQA+BnryGwKlcaq2V3+Q5qC4GeCRptT9UYuTI2cItbXCv/T477YPAvitK8if+8
	hTYQriF/RbYBWQZdxqAsuGSE9WYx09WbbM/aDpWVlEwlomfkiUO3MtWYkKcX43j9DUpp
	zbTl2rbZr5xw1j8BO5dRgdWQ2jWwXh0XDSFM4wzZAjG/L4EOteOL2YxIh8d/sZmWnhyZ
	YJUsHVOXOPcmGAtfoz/Tit6bGAFpfyJBLgC68nwJ5DPffxbxfqPcdyGb0AuL5rmW2kmO
	gvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VRKKN9DPbEy+o9GP7wrk8rsgrPpDd7vzeXvbH5u+AwE=;
	b=jSFoMAhEJKB7CBxzvhBNRa1BST9iMcLxNTmeanqiPTAzDjmvq2bPsSp/2i4F8HMlsb
	AQGZybEPujpsJJDbFF8RvlVtrFM+MoNoBfJ/qwt3U3qhrO/S5hFlbh4f9cheEcFxB8tt
	aPEf8qPV3c5J48nfOdydYaHR7yqxqIpWlD3AKwFi852eSWhREYmKQeyOZsjNbVgKtLMq
	V95+dMEqUCp5GZLvLEYVjror5s2XhtFvgBURKpG240ik9O2MjdcsUMcgqn3jrCKlxqJp
	SdLvnA9dWXVAMi0tBhEHaN5c9ZHojhbCasEqv4wZiyLegVgA1sgiovDcBVrKYF6nI0jt
	vgPg==
X-Gm-Message-State: AIkVDXL4Hf6CbQi3nfiO38MmT4SmfXmy45NisqGQ7rehMQRdizbrqHa1BZON47F2tX13jA==
X-Received: by 10.46.72.1 with SMTP id v1mr7642207lja.12.1485791020405;
	Mon, 30 Jan 2017 07:43:40 -0800 (PST)
Received: from kristian-mender.cfengine.com ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	c143sm3814659lfc.13.2017.01.30.07.43.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Jan 2017 07:43:39 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: OE-core <Openembedded-core@lists.openembedded.org>,
	Ed Bartosh <ed.bartosh@linux.intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patrick Ohly <patrick.ohly@intel.com>
Date: Mon, 30 Jan 2017 16:43:38 +0100
Message-Id: <1485791018-10161-1-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] wic-tools: Do not remove sysroot with rm_work, because wic needs it.
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
X-List-Received-Date: Mon, 30 Jan 2017 15:43:43 -0000

The sysroot of wic-tools is needed for wic, but if rm_work is enabled,
it will be removed before wic has a chance to use it, hence this fix.

Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
---
 meta/recipes-core/meta/wic-tools.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index 0a53b73..d8988a4 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -9,6 +9,10 @@ DEPENDS_append_x86-64 = " syslinux grub-efi"
 INHIBIT_DEFAULT_DEPS = "1"
 inherit nopackages
 
+# The sysroot of wic-tools is needed for wic, but if rm_work is enabled, it will
+# be removed before wic has a chance to use it, hence the exclusion below.
+RM_WORK_EXCLUDE += "${PN}"
+
 python do_build_sysroot () {
     bb.build.exec_func("extend_recipe_sysroot", d)
 
-- 
2.7.4


