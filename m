Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5730260797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 13:28:06 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id e3so62471291ioa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 06:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=rn4NA73uVu8a6Rz93qnDDrd92dBBu+CbNvNM8ElIbkE=;
	b=Szt9bXXfP/MSLbz1xuA0U/rNRerxE1VlMRrWSdzLVlG+0cTap1W8xi1La/292jOoQ1
	Fgx9WSv2UcIMuEUgUyy0puEwSDXaktdHC7quhV0yawVAc9qtoCdRiwvkNZgL7aApt9zM
	VyQx1gQddxQIr/Vy5aHjTJZAsZv8qhbBnDmlGVkRDYOEOBWEULwNhd5ex72WW8obxBL/
	bdOyc8lDkwihKJDD5xsTbvUOX4f6FbZpMsEtOW/cxt2owZu78aZqBOWXTBGR85fBdrhO
	1Zv6JAXtvRSNFVyw2wvGsyaNOqRoaN72LnsTmChn3D2ITfqENDzwTtGsJ/fS7BwsA+md
	kZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rn4NA73uVu8a6Rz93qnDDrd92dBBu+CbNvNM8ElIbkE=;
	b=aQ4kt+IESMPo/cOb9cLqTQxl4WZKOWaQmEBUST8CnnfikFQ4ctsbCdzTRGdLR8ZCyB
	zNJ/ZGP4A4Exx1WjZmEWCYrTOjUvFszYiq6svGdhGX+LLztgJbXzxFdHJZx8iam11gI1
	n6ViM3B78FcI+zZM6k11nt24UdeohKycvmF6IOm90G29eaP+OXSsaDVXHmr4h1cz4ksx
	JPyRtqYHpSPKpWoPhX8pVN3ciY3kTLEXBzS1uDpR4NLw9mpcnsklRIv0pjcSpk4DiDUP
	iT+hPKtpa8PWBz/hwIyEoh/olgtbcPhSMkEUs3m1RXA8uqasNqqySF9G3T+oUVj7WR5g
	HPgg==
X-Gm-Message-State: AD7BkJLMqCYC7wZdY08jn06+TUmCYw4YnmuJVukFTBfW2w7jfeFq5AS8yMvozkoplLOc/yYt
X-Received: by 10.107.151.74 with SMTP id z71mr30475382iod.43.1459171687380;
	Mon, 28 Mar 2016 06:28:07 -0700 (PDT)
Received: from pohly-mobl1.fritz.box
	(dyndsl-037-138-177-144.ewe-ip-backbone.de. [37.138.177.144])
	by smtp.gmail.com with ESMTPSA id o1sm3970287igh.0.2016.03.28.06.28.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Mar 2016 06:28:06 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Mar 2016 15:27:57 +0200
Message-Id: <1459171677-17268-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] buildhistory.bbclass: create image directory when needed
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
X-List-Received-Date: Mon, 28 Mar 2016 13:28:10 -0000

buildhistory_get_imageinfo() assumed that the buildhistory directory
for the image had already been created earlier. That assumption is not
true for special images (like the virtual swupd images from
meta-swupd) where the entire traditional do_rootfs/do_image is
skipped.

Creating files-in-image.txt still makes sense for such images, so
support them by creating the directory also in
buildhistory_get_imageinfo().

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/buildhistory.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 0b3b7ce..108275a 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -504,6 +504,7 @@ buildhistory_get_imageinfo() {
 		return
 	fi
 
+        mkdir -p ${BUILDHISTORY_DIR_IMAGE}
 	buildhistory_list_files ${IMAGE_ROOTFS} ${BUILDHISTORY_DIR_IMAGE}/files-in-image.txt
 
 	# Collect files requested in BUILDHISTORY_IMAGE_FILES
-- 
2.1.4


