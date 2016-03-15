Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id A42B56FF64
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 13:11:11 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id m184so22988466iof.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 06:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=eZqinow47sHRhjN8RUzmKR72IbwQdQfTvPH9uKxSKCk=;
	b=rnUwwpFEAdCIbOGhfCq7Vboiz27/5pkr2fItPnHE+dXCm+pf8sceCve732BamtRzFT
	Q3C/+tJ44JbA8Ktw/txLYz89sqENIomwNW+u012UDWEDwVE9ho4+D3b/+jVOa361ijak
	lyD3um0fUdoPdAj1HAT82k4gHmklNdhSlhrAbiDxB9SUhf4+wtLRyuLyGI9M3YGo37Q+
	I6Pb1ehKigmpZlaEeQeuyRWBrR+yInMSmBXFALvK94qdpz2A5AcXovtdqO6vr//YniPb
	sPrHdOOQJMwR8FanqU4yYEVCXHXRXz1gRHlxgaDbebPLSfREEOHnZTB3L2/p5epHnnpX
	ELDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eZqinow47sHRhjN8RUzmKR72IbwQdQfTvPH9uKxSKCk=;
	b=bV/lTCaqE9dPicHHXGCk6Ji6E8ZpHe3qNy5Yk1vMTDv3ALCGbaGZRkJCkel7YFm8qz
	R7LtapfauYUc7ezT+RwVz836oMD7dOndOGdxHRbSx27W3fyeXMs4HRDiRY0qyP3/NvCE
	1ukW9opFw3Rm7K9uBxMwxuIKF1Y7NRgSBxE/lCZgErjLXIWfDo0xqFce2eQa46ySM3gX
	URmMo6ebKZKiuRWBHRPDvz5OcGecudQYj0fVTopJQS6rKZmwQeUiEZSxiqfW8+yibGZD
	vQErWY3KXBqP+HqbwNKH4P42pfNEGt0zQ8SwzUkpd+i0PHjQxxNVNTA0L0bwmngh53+n
	3WaA==
X-Gm-Message-State: AD7BkJJbQmZFx2fDjf9pIIJDByoJ8+86TIi1ncUllsd3hF3OKHem5WHYmtD8gdwOJiKe38Jn
X-Received: by 10.107.10.150 with SMTP id 22mr27865778iok.85.1458047472532;
	Tue, 15 Mar 2016 06:11:12 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A577BD.dip0.t-ipconnect.de.
	[87.165.119.189])
	by smtp.gmail.com with ESMTPSA id j7sm8640603ige.5.2016.03.15.06.11.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Mar 2016 06:11:11 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Mar 2016 14:11:07 +0100
Message-Id: <1458047467-30688-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] image.bbclass: track ROOTFS_POSTUNINSTALL_COMMAND in do_rootfs vardeps
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
X-List-Received-Date: Tue, 15 Mar 2016 13:11:14 -0000

The list of variables influencing do_rootfs was not updated when
introducing ROOTFS_POSTUNINSTALL_COMMAND. As a result, making changes
in commands listed there or the variables they depend on did not trigger
a re-run of do_rootfs.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index c61d814..3ab432e 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -98,7 +98,7 @@ do_rootfs[depends] += " \
 do_rootfs[recrdeptask] += "do_packagedata"
 
 def rootfs_command_variables(d):
-    return ['ROOTFS_POSTPROCESS_COMMAND','ROOTFS_PREPROCESS_COMMAND','ROOTFS_POSTINSTALL_COMMAND','OPKG_PREPROCESS_COMMANDS','OPKG_POSTPROCESS_COMMANDS','IMAGE_POSTPROCESS_COMMAND',
+    return ['ROOTFS_POSTPROCESS_COMMAND','ROOTFS_PREPROCESS_COMMAND','ROOTFS_POSTINSTALL_COMMAND','ROOTFS_POSTUNINSTALL_COMMAND','OPKG_PREPROCESS_COMMANDS','OPKG_POSTPROCESS_COMMANDS','IMAGE_POSTPROCESS_COMMAND',
             'IMAGE_PREPROCESS_COMMAND','ROOTFS_POSTPROCESS_COMMAND','RPM_PREPROCESS_COMMANDS','RPM_POSTPROCESS_COMMANDS']
 
 python () {
-- 
2.1.4


