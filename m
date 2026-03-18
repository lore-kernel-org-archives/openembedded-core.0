Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED4910775ED
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 17:15:07 +0000 (UTC)
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19755.1773854097962100942
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 10:14:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=mK+kEZZr;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=45P8VHf/;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5531114001D1;
	Wed, 18 Mar 2026 13:14:57 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Wed, 18 Mar 2026 13:14:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773854097;
	 x=1773940497; bh=fIe8Z5xMRnjySH/k8k+mCJkmuwLaCsHJSlJNBn1Kb68=; b=
	mK+kEZZrFpEWgON2ql5QyDxGMoIaxM+cqFXNCGkDm+vm0+5vPQ2X/VfsSeRacYuG
	KSNSdMMezoUv6id1c7u9tM8sDCutFdvYROdLxdGtC2gQ4d+6Xh/ADE5f+O4crGgH
	irZKPoTpj8HZiyH6G+vDMzc96AjZNPr1IQPQVTezcDBsz1Q/WO5MjD0tx8r7ITPY
	tF7WTJUwZoQ6r/JwOM3D7ZdVd78Vg/RCiFg2cixbjvKJqcJHYyNEd1W7m4RIwVOL
	bHLblIPrb3at38/t0kgA1+mJOHwWCrL6D9PlZcLP49oknzkkPP03qhrSU6pCpXoO
	teWZBTE7Q30xD+n9cIndmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773854097; x=
	1773940497; bh=fIe8Z5xMRnjySH/k8k+mCJkmuwLaCsHJSlJNBn1Kb68=; b=4
	5P8VHf/ph9Z+xpb3bzNWKt3JAKPOfSDswGwpHXQ8qwEqqOk9iTXKv90JxYy0h0Nk
	xzPgcSRXgjrDxQsDi7ut3tO3VwBbuyTJEyLYFonaDeOTT+XXgRlZtGCt+urSxluS
	M0txM6ZVdBA8wp1s19FrJULp5vwQUmMQf1oKeQoofvHkNWVIfbfUW9R+A6jwyL6r
	xpBR11xeHbGnBkNoTS+xwGP5CjjbYJIYGA9RtIoky5/2HisXomKa4DD3nP+7dVl/
	L9kQRGsIgcDH7oSGtQSUwi9yvIgX69n4w31B5quFWXOKdim0rb4bPii8Up55kRBk
	DiD0bh2e9L+G0Oc5e6RUw==
X-ME-Sender: <xms:kd26adKhMe2D7uFgXnhpiHs-JJspKHvbAsQE5XDWPHlb-5joEeOM-Q>
    <xme:kd26afIxsLcIt-D0MDMhEUHZYSqrVm5x339UD6HPaUkI71oq_3ppaPr8PZkf_SFYZ
    vfwqoGjfUWRkumykXa1utXreoVPuBo7GB-N1uniPxhyzgRfXvu3zD0>
X-ME-Received: <xmr:kd26aTWmRZ6B2OsCexrn8cRj4zofEghu98Zzp4KsX9vt2IF5Aa9CqSXnrG0II9AlssQ1Z8QfOMiHbwyyrxtsTQZl9jnUTwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdegjedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejre
    dtredtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgv
    rhdruggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefue
    efffelvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtph
    htthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehprghulhesphgsrghr
    khgvrhdruggvvhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlih
    hsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:kd26aZirsU31zqJcAL0x0fj8D4iJr0nBMxNglOyd-7lcQ8iTamvZdw>
    <xmx:kd26aW8dt57pgKpOeQx4eDOSgQiXxioOI-4kgFY9PaHAtKNMseTOug>
    <xmx:kd26abAtVRq0YTNPF6kNq4pEU8eLsKdnrn2QGZJWPzRsnKP3ucJ1cg>
    <xmx:kd26abJGJVd4knli8kgLmrAMHrNQifv52mwTpAFrMW2ClnBuJvX55Q>
    <xmx:kd26aTvJaz_XQqz2tewpOTChqGByJ49eaOvIDdxgBdJeH8f9y0Zpb-LF>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Mar 2026 13:14:56 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 18 Mar 2026 17:14:51 +0000
Subject: [PATCH 08/12] initscripts: Make SRC_URI arch independent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-fix-checklayer-2-v1-8-388ba6ce47cd@pbarker.dev>
References: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
In-Reply-To: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=997; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=ZiqkR5IE2ZSo9xLOjOQwZmwjv2UhdsOVuxBvl0q9f5I=;
 b=kA0DAAoWq2NU7J269G4ByyZiAGm63YnICsqm+vMD/sfotoZONw0wlCeJyFve1lhLNPeOceVfs
 oh1BAAWCgAdFiEEs4z13+WNQQ1oVNogq2NU7J269G4FAmm63YkACgkQq2NU7J269G4TJAEAs9U5
 RJDKJMUBoTVgtzAjbE8rhEWTeoA9Yt5s7XkxLQMA/1BtDrMZQW8vZWqTodhGpPSRKUjOCaVAiRw
 +tmMvYygH
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 17:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233425

Avoid making SRC_URI unnecessarily dependent on the target architecture.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index c984257c5c8f..23411b6a7149 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -32,14 +32,12 @@ SRC_URI = "file://functions \
            file://save-rtc.sh \
            file://dmesg.sh \
            file://logrotate-dmesg.conf \
+           file://alignment.sh \
            ${@bb.utils.contains('DISTRO_FEATURES','selinux','file://sushell','',d)} \
 "
 
 S = "${UNPACKDIR}"
 
-SRC_URI:append:arm = " file://alignment.sh"
-SRC_URI:append:armeb = " file://alignment.sh"
-
 KERNEL_VERSION = ""
 
 DEPENDS:append = " update-rc.d-native"

-- 
2.43.0


