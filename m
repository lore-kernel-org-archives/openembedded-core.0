Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77369C4332F
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 12:09:11 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web08.10799.1633522150534167367
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 05:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm3 header.b=wuhiw+gg;
 spf=pass (domain: gherzan.com, ip: 66.111.4.25, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id BFD2B5C0668;
	Wed,  6 Oct 2021 08:09:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 06 Oct 2021 08:09:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm3; bh=zgm15Utj4I3QxA/KsRlMkw9wzM
	hmnXnTbjGzCP5nZ7Q=; b=wuhiw+ggIPQYum7zd9Zsya7FObZNsQ0N3YQkH76Pul
	HcAfl8bLQ9bU0nu1iwJLGEj7ARbgJsAgBQUyq/4JWGDRLWSUDaYQEGJwtGVaQfbq
	SWalQhfL+aaSLrd3oDGbzc6fWooMVyjz+Ru5LLxJYHusqp3CSCFHWBtU4uW4NLBn
	5bQpjPxbOGYjhHw4stJxcQmG6dqqlnQAXhyP2wH7w7pWtRRBCdBobAu+KWpcdGPK
	JVkdfg9oZEAiC4h1OcD7Es8qywdUT+oZOSDR9RjwC0vqXSHl1YAvIgJUl+m4Y7qm
	9ZIDpvF5WkAG4Mw0e/HX7KvS0F6RV2dfGbGT8/KisrnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=zgm15Utj4I3QxA/Ks
	RlMkw9wzMhmnXnTbjGzCP5nZ7Q=; b=YGf3tIoq7d3ZcyETj2RJgGY2zeK7k98LE
	0clWga2qu8QHWcVD9U8TfnXCZ2JQLBvu9LZ5qcktKtx94nYeEOLyyOfk52HsF7/i
	V00j86nJ8wI80WQGV66pDqZj47T9qQBhLcoisiQF0zWDDc3a7oWqdbvnvNNIdScT
	dpVw/urSHRXOkhph2ABpmWLKqzlFV1wFNXxI+4/WFLzg/mxKhmFQMJmmymVkXdh4
	XrOhR80Zsshaip1UIQBbD7UEET/NHG83g0Hic/yzmZLtN2S112d506alGWkTO0IF
	7c1aApPreAazAGepMj1yusCrIVsO2PwTv7651kH+/mjWqfdDrplwQ==
X-ME-Sender: <xms:5JFdYS1dIkXxqltegNe7k1Ytrx9UcagWfLpaRswbGd51ERApQyB8Kw>
    <xme:5JFdYVE2yoKHzO-fI5Lf1jnkadKFJAgUitQAt4132O8tP237MibvUvU_QrULQW5Dx
    TOh7hLCJfMVfg8_WBc>
X-ME-Received: 
 <xmr:5JFdYa4-8qQ4uFIzVNyxVDNlFIn0lDOlM3yPdGfkE2kWnD8d8PqxBl8ozLIBHVwn6Q>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvtddrudeliedggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehghhgv
    rhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpedvteeutdeutdfhvefggfeifeehve
    ethfeuffekgeeiiefgkefhheehjeeijeejudenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:5JFdYT1wwNBWOKP1fFcob-I4-aKAAfELMZxOBblE5AOxXFflzYi8HQ>
    <xmx:5JFdYVFcRmHg7aZ6oDlDvWWu1J4FGTRJLbrdfF8k1tYiqEasuhnmtg>
    <xmx:5JFdYc-weHvRe7pvixgRYAwqNPSHW7jlgyPIwYctPTQ9NZpWi9FC6Q>
    <xmx:5ZFdYTNmrKV5aWKEdIorf5mc03NkFipeOg3R7mvGRioI1gx5rejlyw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Oct 2021 08:09:06 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH] qemu: Define libnfs PACKAGECONFIG
Date: Wed,  6 Oct 2021 13:08:33 +0100
Message-Id: <20211006120833.2965619-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 12:09:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156694

From: Andrei Gherzan <andrei.gherzan@huawei.com>

The upstream qemu recipe uses host's pkg-config files as a solution to
detecting host's SDL. This has a side effect of using other host
libraries that are later queried by the configure script. This can get
into a situation when the host provides libnfs (for example) and because
later this dependency is not in place anymore, qemu will fail at
runtime.

This change adds a PACKAGECONFIG definition for libnfs that is disabled
by default, in turn disabling the pkgconfig autodetection in configure.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 76e8da159c..4c94060222 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -203,6 +203,8 @@ PACKAGECONFIG[vhost] = "--enable-vhost-net,--disable-vhost-net,,"
 PACKAGECONFIG[ust] = "--enable-trace-backend=ust,--enable-trace-backend=nop,lttng-ust,"
 PACKAGECONFIG[pie] = "--enable-pie,--disable-pie,,"
 PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
+# libnfs is currently provided by meta-kodi
+PACKAGECONFIG[libnfs] = "--enable-libnfs,--disable-libnfs,libnfs"
 
 INSANE_SKIP:${PN} = "arch"
 
-- 
2.33.0


