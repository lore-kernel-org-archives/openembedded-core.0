Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75E6C38142
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 23:56:58 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web08.5300.1661299018066797080
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 16:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=2Wq2544C;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25,
 mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 51E97320070D;
	Tue, 23 Aug 2022 19:56:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 23 Aug 2022 19:56:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1661299016; x=1661385416; bh=LX
	/HHis1Ql/H+1uIFRpsrwGd56v3TrBKxj7khlwbzQk=; b=2Wq2544CkitOoxLTmh
	BhtXchgUm3lQT9PTss0HCsxFfhIDml7ifvsrpk77/so9/keDvqVX6nG8WYPr1dQa
	9tFe7X7uL/+0wb9IPpVGjv/p+zO13YAioQhCp8+Z0S1RfLGB7SElfnO1wxFo/LF5
	hAO5Sb3imuwCpoyca6OmKav6Q9WsL9zAEEsupJ+6Nek44RMmWv+Let9b2S5WnAJD
	74Wt3hgnEoPupgGc90Zz/M/TJJCd0Eeg8YtObP8RzOEcQveyd5iMkEl3ZvgRov7L
	FE/6WyQ2CP63UJBHarXfqMfq55a8oce34dNJL4q72MaEJKwKbaEq+tfRQZMus+yq
	onJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1661299016; x=1661385416; bh=LX/HHis1Ql/H+
	1uIFRpsrwGd56v3TrBKxj7khlwbzQk=; b=lf5AvkQ7Pwuxb9FwYuvM1Bn79FT6v
	XmQuktkK9tFqFXpB0HUnOPqxPaIL2DJfo/ADLHn9oaHgtCrFaDYve9yj8aEc1pQ0
	842kU8qlAVNMJCe3r44u5w9POx2/C03PNrMOdhIxt+eBHHeuXtIcn26bQWwER41K
	gr5THp30gtXACKyZoQOytgUQ40jjPAt1Aacu5mmUnbkd+s0qf+zwn6sc7yQkno5c
	kGX3anaX+ewEpM5ZUdu6NCD06/y2D56AL+WeuBdZ27V/WJtIKNgrXm6ZiSmwkKMt
	rH+ZJeeX/Bub+bDTN/7BBaZnqjwurstOxCJpLJ59RnRMZ+GVpdyguisbw==
X-ME-Sender: <xms:SGkFY_CHuu7rwHrJGFQ398hHvLaL9rAy2A8FaCGQ4l8Ce96rU2RJsA>
    <xme:SGkFY1idw_Tsd0nCMNnJ3-bp9kCue0LdD_n5z59J23oYH5QgLmTVd8Mo2sEfH3X6e
    aNne4JvyL54zC0HxPw>
X-ME-Received: 
 <xmr:SGkFY6lmJ0um4BvCKfikigdDShY7nOvjfyeSncOupg_TrOZLP-V5IpdBYmwvDdb0Ee3r-oD79Cao840_pWMEkg4lmnVFeQ2EXPgLFWT_oFyAsa6k33h2CZkP>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejtddgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepjefhvefhgefgffejgeelke
    ejleeiffejgffgkeeggfffgfffieeffeeghefhtdffnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtoh
    hm
X-ME-Proxy: <xmx:SGkFYxz4sdxSjmiB4ovRF_UEQIsDzZjQcF2NTcByIgLgJOo7nrYjSw>
    <xmx:SGkFY0SQwxrbjEceXPVg4ts8CDz06AgduF9EILKV_fIA1Q-sulylTg>
    <xmx:SGkFY0YheJAtBUCdOddx87VbPysIvknh7-Lf8WxSAmpCRzxyCEKBiA>
    <xmx:SGkFY_JqbVeMS--8LqpVN2vVvnEGqL5dkobTnlXYPmgspTUr6iHV6Q>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Aug 2022 19:56:56 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH 5/6] rootfs-postcommands.bbclass: Follow function rename in
 rootfspostcommands.py
Date: Wed, 24 Aug 2022 01:56:23 +0200
Message-Id: <20220823235624.2488133-5-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220823235624.2488133-3-andrei@gherzan.com>
References: <20220823235624.2488133-3-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 23:56:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169766

From: Andrei Gherzan <andrei.gherzan@huawei.com>

'shadow_sort' was renamed to 'tidy_shadowutils_files' in
rootfspostcommands.py so we reflect this in
SORT_PASSWD_POSTPROCESS_COMMAND. This also creates a deprecation
function for 'shadow_sort'.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index bf1e992bb2..215e38e33d 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -63,7 +63,7 @@ inherit image-artifact-names
 # systemd_sysusers_create and set_user_group. Using :append is not
 # enough for that, set_user_group is added that way and would end
 # up running after us.
-SORT_PASSWD_POSTPROCESS_COMMAND ??= " sort_passwd; "
+SORT_PASSWD_POSTPROCESS_COMMAND ??= " tidy_shadowutils_files; "
 python () {
     d.appendVar('ROOTFS_POSTPROCESS_COMMAND', '${SORT_PASSWD_POSTPROCESS_COMMAND}')
     d.appendVar('ROOTFS_POSTPROCESS_COMMAND', 'rootfs_reproducible;')
@@ -221,9 +221,20 @@ serial_autologin_root () {
 	fi
 }
 
+python tidy_shadowutils_files () {
+    import rootfspostcommands
+    rootfspostcommands.tidy_shadowutils_files(d.expand('${IMAGE_ROOTFS}${sysconfdir}'))
+}
+
 python sort_passwd () {
+    """
+    Deprecated in the favour of tidy_shadowutils_files.
+    """
     import rootfspostcommands
-    rootfspostcommands.sort_passwd(d.expand('${IMAGE_ROOTFS}${sysconfdir}'))
+    bb.warn('[sort_passwd] You are using a deprecated function for '
+        'SORT_PASSWD_POSTPROCESS_COMMAND. The default one is now called '
+        '"tidy_shadowutils_files".')
+    rootfspostcommands.tidy_shadowutils_files(d.expand('${IMAGE_ROOTFS}${sysconfdir}'))
 }
 
 #
-- 
2.25.1


