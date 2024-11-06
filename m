Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4EE9D59F6B
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 19:07:08 +0000 (UTC)
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by mx.groups.io with SMTP id smtpd.web11.54342.1730920024020522232
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 11:07:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=fm1 header.b=X5mAdfYE;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=nalYZvbw;
 spf=pass (domain: cold-front.org, ip: 103.168.172.158, mailfrom: jsbronder@cold-front.org)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5A6C6114013B;
	Wed,  6 Nov 2024 14:07:03 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Wed, 06 Nov 2024 14:07:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1730920023; x=
	1731006423; bh=uGoSVa9K6fLaW7j61NpSIa/wpkIBQpY9EPiuUEcqXJk=; b=X
	5mAdfYEaV1F/8Iojd6VBX/UFR8+txT3eaQEMdMirbmKO3ngtnEyipu4fNTRJjqV+
	cJALH9lrEsXyEDr35dakIfQCOFx9lWmIW3x2ia/I7JeAFVNKsWhnPXz+AuH7Bcnu
	3iENZXK0ogE8XiUvLSwVwSHjAu5GpSyyC8e9VdyunEXzzmQP+jI8o1GivOEB3vZD
	IvRw2w3TfldLCiQGKU+B+OSJA7XdisFVK6KhtFnn62nEWvrqcDxzRmvlYGH7Y6r8
	FpnUg7GOovzv/B1t25jrJ14Y1EE27DGsGKvwaMLwZIdLtyToVIJVrp/jTw4lE845
	kVP+vk0YoE1/r7ayjVp8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1730920023; x=1731006423; bh=u
	GoSVa9K6fLaW7j61NpSIa/wpkIBQpY9EPiuUEcqXJk=; b=nalYZvbwEAxzEg08n
	5BqaL6QjDz58g0DVcxq0DSNvyIUY5Vhs0i7bneGrpNkRbmKajKHNDREte4VbvfIZ
	L0GrFp/ztVkxyNKLoVk5oUtuWdmqZqkNWakLojJJezqMhQ8fh4QPlODt+ZAZ7b7v
	68DWGpr8FWP6I+Cca+RwaadXflzf0lGjZS3D4Mn+Q3MLCAaEZ6kJv72WffnC06ji
	3nR8qRq8lMa1ZvxwrPcBX36ZlwYaEEQzG5xid7KpZr43eMH0EmR0g9QzqOzzbWUs
	m+UkCx7d36HyKF80thxmhIj6Zjrz4yvLtH2eQOspH8xZ7aSc0GFFTuYG/ukk9kIn
	JwH0g==
X-ME-Sender: <xms:V74rZyg2GK1uRuJZ1lxfpyGx64CKKxvkCKipUDLwbGpzexlI7Z3bOA>
    <xme:V74rZzAbzVg-ptJHZluVEyRHn4lCyah88U9IdbIgls2QTrhbg9h7fFoVhF4Tpy-rY
    t_gD64GzBOuuTN3Gg>
X-ME-Received: <xmr:V74rZ6ELYr19AVr5BEZ_dJvhO_Y-Juy0qqCREm4Z33m6Esw_XVjMD9RK-dkevscdkEiqNdGuhszs093ff9tNDPd6fx_1ByxdVPbPve3lUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrtddvgdduudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggv
    rhcuoehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrth
    htvghrnhepheekkeettdegkedtgfefuefgkeeuleelgffgtdehueduudeuleeviedvhedt
    keeinecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpghhithhhuhgsrd
    gtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    jhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhgpdhnsggprhgtphhtthhope
    dvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdq
    tghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhope
    hjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:V74rZ7QFgVTK9A78xRFI5cihvRg8q5iO0O4fCH2IVvuxFCnsYRXtYQ>
    <xmx:V74rZ_zpQnwuuX1qqAD9ffaUIz5ljddfNNKq82y42lnEUM_nQ_HRTQ>
    <xmx:V74rZ56k7MMBHmeJw4GkCYRWE8nIeHDM-FN5Gh9jveUeLtsP__2B2w>
    <xmx:V74rZ8yc7T8uQQYwNeh51cuql7sfjghdcC9SPWhSEjD8Ej9JRkQHFQ>
    <xmx:V74rZ6-6KqZstg1zpE_47wVbDz9eqWZ3EjpOWAKh0EkzrfGVlP6tm5HX>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Nov 2024 14:07:02 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-core@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [PATCH v2 2/2] bitbake.conf: require lz4 instead of lz4c
Date: Wed,  6 Nov 2024 14:06:43 -0500
Message-ID: <20241106190643.610702-2-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241106190643.610702-1-jsbronder@cold-front.org>
References: <20241106190643.610702-1-jsbronder@cold-front.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 19:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206801

With bitbake commit 'bb: compress: use lz4 instead of lz4c' we require
lz4, not lz4c [1].  Going as far back as Ubuntu 16.04/Fedora 25, they
are packaged together so it should be safe to simply adjust the
requirement from lz4c to lz4.

Note that the two are largely the same, but upstream has considered lz4c
deprecated since at least 2018 [2].

1. https://git.openembedded.org/bitbake/commit/?id=907472034b344e4eb73cfd43059a413469f52e1c
2. https://github.com/lz4/lz4/pull/553

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index eda505c861..14e761e2e7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -517,7 +517,7 @@ HOSTTOOLS += " \
     [ ar as awk basename bash bunzip2 bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
     cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
     fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
-    head hostname iconv id install ld ldd ln ls lz4c make md5sum mkdir mkfifo mknod \
+    head hostname iconv id install ld ldd ln ls lz4 make md5sum mkdir mkfifo mknod \
     mktemp mv nm objcopy objdump od patch perl pr printf pwd \
     python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
     sha1sum sha224sum sha256sum sha384sum sha512sum \
-- 
2.46.1


