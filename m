Return-Path: <patrick@advancedtelematic.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id E99BC785B0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 14:03:28 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id q66so5678951wrb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Nov 2017 06:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=advancedtelematic.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=wVSM5fCrqxqMlDIs3ZWuYAtjM82MVNAFF6IjAzGoC/Y=;
	b=v13n3LorTecLqJ+Xec+3sb9Kvmzt7M7VZ9qhox3Cjy+eFDQuzbFKbXDV53b/6TgkVb
	W0BWhNVxCdQSdpvv9C5XWqAbX1O92AUuWnh249GyPcrmLmWZeRLJmx44eIJin8PkcD5k
	PdpeQPAEn/YboFrbes2tIEJEXugCMycV1SAro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wVSM5fCrqxqMlDIs3ZWuYAtjM82MVNAFF6IjAzGoC/Y=;
	b=IZFV/1GZ1bka8pLshjD2ZCbhQLst5MBJAFHyb7KeWHFWmtkd79IOkhx80xUq8SG1gK
	gbyyb5r2NW4k22mCdBRfIToGBoxSnx+Axvgy5TvniNBInkkfARdsmra/60nS++Bb0OHB
	nduRfNwqczTxpy2Gj+Z5SPAnO7IXjCTNVrLMZKAnCtwxBF+u6IxibSMQ3H+8v1oysNcU
	Bi4HpvLndf0hiyDmuITyL8bQ7So01MlCemwFS0cfWfqQWHGe3xVPNhSI+s5vG5RJH75Z
	bGFTY+vyxOAOo/mQFQPlZk7op/a4+6tT7OXz06aoW9BgQchx73eL04u1d9pSGM1d4hay
	gqFg==
X-Gm-Message-State: AJaThX57hc9fUuEjHW788csNrnGIpihWQ5YYoo7Wf8V0UW6geMaKhEV8
	JZQDCbo1+09LYqa/qiKNaLqb0FuZbag=
X-Google-Smtp-Source: ABhQp+RJRdI62Zb0atMSwIH6fqo5DVfwYCRQiIrU7jnIqmd/rx80BO5pGRB+lCFDddG0Vhz5JEtMMw==
X-Received: by 10.223.179.26 with SMTP id j26mr579242wrd.123.1510236209443;
	Thu, 09 Nov 2017 06:03:29 -0800 (PST)
Received: from patrick-box.internal.advancedtelematic.com
	(p57bf9f95.dip0.t-ipconnect.de. [87.191.159.149])
	by smtp.gmail.com with ESMTPSA id
	k14sm4816812wrc.90.2017.11.09.06.03.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Nov 2017 06:03:28 -0800 (PST)
From: Patrick Vacek <patrick@advancedtelematic.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 15:03:10 +0100
Message-Id: <20171109140310.659-1-patrick@advancedtelematic.com>
X-Mailer: git-send-email 2.11.0
Cc: Patrick Vacek <patrick@advancedtelematic.com>
Subject: [PATCH] ca-certificates: Add /etc to SYSROOT_DIRS
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
X-List-Received-Date: Thu, 09 Nov 2017 14:03:29 -0000

From: Patrick Vacek <patrickvacek@gmail.com>

For recipes that depend on native ca-certificates.crt, /etc should be
added to the list of directories that automatically populate the
sysroot, otherwise the file may not be there.

Signed-off-by: Patrick Vacek <patrick@advancedtelematic.com>
---
 meta/recipes-support/ca-certificates/ca-certificates_20170717.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb b/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
index 59e7d51437..7d59fa6374 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://anonscm.debian.org/collab-maint/ca-certificates.git \
            file://sbindir.patch"
 
 S = "${WORKDIR}/git"
+SYSROOT_DIRS_class-native += "/etc"
 
 inherit allarch
 
-- 
2.11.0


