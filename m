Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D74C433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 10:27:01 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web10.5630.1655893611195794508
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 03:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm2
 header.b=0UMcpHZE;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.20,
 mailfrom: pavel@zhukoff.net)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 270AB32008C3;
	Wed, 22 Jun 2022 06:26:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 22 Jun 2022 06:26:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1655893609; x=1655980009; bh=DLd/uXB5BAzLiKCao9t39OcXZ
	bcN4DvFkiTMFWexi+I=; b=0UMcpHZEh3nHyMiQMINY1ucoFeaN8Mx3uX95Kasjp
	N2c8Y67mTi8xIVmmQVgHrGLZljMM1fHsn7JnQetKCbQwy48JsjNG8/NHTKbufFMY
	AYOFJcJ3+bbi1ZnvjS6NGrEx8Z5IwZD5HFisQOVwVZ0hp+nsir5DznWF0fmJ5KQT
	1Nx087iAtZrMwdjlyIzx6+SMY0kY2jOdm4SBpwFlq+wCrMkA0fucQqCRFWVrjzU8
	LIAV15V0X4MReyLl/iIAVwAVZDLGZD253gNJkpCpEDtIJ8Jqlqyju3k0C+aXZWXF
	12S8c71kflKF+QZ9cvq6AeabN0SStIFJgOey6dfpWfssw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1655893609; x=1655980009; bh=DLd/uXB5BAzLiKCao9t39OcXZbcN4DvFkiT
	MFWexi+I=; b=bGwomXFi1w0hL/CqB9FxWmyHd2XyGvDIQNfTx/ZuJ5sNfzxvtnB
	CTSVkXeplbypwhw1xue+MovmbzOaGNAcr7wZjdjUN6sc9HnenE7+fHgkoM2uzucH
	q4yuSuLIarIOUWYJHkTw5zAouj+oiMGgoR49AiX/Tx7zFSxW+jvuNYBYxD0zORK0
	C269LQ+/0LykBxSqWcWoZvoB56bUY5aHNSP1uo1hzS44I/KXS71DHFN4SrPSyJDZ
	jb5T6ElHAZEKn8POrOInCeBCHZSkRi4ti/7YV9XyJHBwe5LPB4d9Gz7FUnS19FKi
	LB3TU+e38xGJzFcvb5hRFAbnIJ521RsFSyQ==
X-ME-Sender: <xms:ae6yYp5ZbyYVM_z0r6kLGSlFeg83K9v2Qm9eAjBxXnL4YvvZWIj0ag>
    <xme:ae6yYm44i1G_NDubTfH4CU8YTOdqhHyGBc83iJzxLJgCaefbP9hr4inYvD4jdLXED
    9_3baKsQAMnZzzZEfo>
X-ME-Received: 
 <xmr:ae6yYgczwi0oCdOTr4zf4KtgqcuhHX434sL-AWcAYUDyh-99RYycEL3OD1-fg9RU3_9rGPqhKo-XJ6t2GIINyvo>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhho
    fhhfrdhnvghtqeenucggtffrrghtthgvrhhnpedtveetkeejudduhefhtdfhtefhvdffhe
    elffdtffeileefudelieeuffdvffdtieenucffohhmrghinhepghhithhhuhgsrdgtohhm
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrvh
    gvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:ae6yYiJw31b9g8r_eIJIPstUYI6oLCDK6-UEDjxudJRWKg19dHR01g>
    <xmx:ae6yYtIOfdOAo2QsGqqP1QaeYgvf3h7pVQoSh1kXE40D-HEMglGGbQ>
    <xmx:ae6yYryXDq6WjlTbWbq_J1zTaEN_5a5qBGSwy-bxx8897BuxNRvnZA>
    <xmx:ae6yYrids2fNPBlLBrZruoldhPUihwydQMFQwczCQQ5GvoYiDkaZwQ>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 06:26:48 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: pavel@zhukoff.net,
	Pavel Zhukov <pavel.zhukov@huawei.com>
Subject: [PATCH] systemd: update upstream status of merged patches
Date: Wed, 22 Jun 2022 12:26:14 +0200
Message-Id: <20220622102613.12256-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 10:27:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167225

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 .../systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch         | 2 +-
 .../systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch b/meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch
index a3e148ec3b..08e8af0a5b 100644
--- a/meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch
+++ b/meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch
@@ -3,7 +3,7 @@ From: Pavel Zhukov <pavel.zhukov@huawei.com>
 Date: Mon, 20 Jun 2022 11:24:52 +0200
 Subject: [PATCH] Add sys/file.h for LOCK_
 
-Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/23790]
+Upstream-Status: Backport [19df770fe14da601d4e54e1592c11c10ffe4df5a]
 
 Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
 
diff --git a/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch b/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
index 4db5d6d97f..58767c7c35 100644
--- a/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
+++ b/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Add sys/stat.h for S_IFDIR
 ../git/src/shared/mkdir-label.c:13:61: error: use of undeclared identifier 'S_IFDIR'
         r = mac_selinux_create_file_prepare_at(dirfd, path, S_IFDIR);
 
-Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/23441]
+Upstream-Status: Backport [29b7114c5d9624002aa7c17748d960cd1e45362d]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
-- 
2.35.1


