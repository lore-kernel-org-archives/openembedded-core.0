Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D837C32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 13:16:10 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web12.2912.1660914969782996189
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 06:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm1
 header.b=WtUYHcJx;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.25,
 mailfrom: pavel@zhukoff.net)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id C118E32005C1;
	Fri, 19 Aug 2022 09:16:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 19 Aug 2022 09:16:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1660914968; x=1661001368; bh=7BeMnb8Q5FF9OIgIUbP+BtDz7
	KWaZPzdD5WivbYjsZA=; b=WtUYHcJxmzzCpBpJRd7IJVnp+nPyuxuBXrRBG9o2p
	W3KY+c4BgUvP/TZyHWN8WWi1iMXeXZQcZUr441uDci7ms41rgJjb+KcDGAPH5Jog
	nyJ4l8nIkBdZhSKJRd0txHWROz/DiykKHLK6iBDORmwPFETaWoOE+yXyjBDmHXOL
	4QXgmBqwG9zIdhnLSYn9f7PBbM9h21Nwc3c9NqLf12nbk+DNbPVjm+2Ly2r6vXuU
	N9sRt/cjMoJd/UkUGkOKyySz1Ykm7vezIdZMp/+33Np/ST5lK5xZBot+qPBxUddW
	sZW+Jey++OzH8pVuOCIs1WKQ3dvSOA9MQ1uqW7IxKY+IA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1660914968; x=1661001368; bh=7BeMnb8Q5FF9OIgIUbP+BtDz7KWaZPzdD5W
	ivbYjsZA=; b=i7jGFKOEc+LZ+rOzPpQAPgNiSuCaFKFatVngGu0e+9jBGaZDIJG
	PCx0T6aPnzhsP7EUs+37ikiCBSBqsIOFYY9fzOg04PE3XzhlB606GaePWx+iykV5
	JjVNYYsPInpdYmuRcU9sGvXqswyzK2mHHcntVB+S+JgTiLQlGTsxVxP+BByAxXSS
	mKm+DSj6IyiB8k+0QJT/dxEgagGAHadiEbdYqAspcUdrQUBhTEsbO/+gFr/Oajtm
	ZhItIuaQ4fNvnSHE/VYtNIa4yCIXh8+z2CVxDVYwx8FAkYkB5hQslAlVN1O+2m6A
	9hMzJO3w9TdQBiR2hd0uYq6XkrPBDKJl/cQ==
X-ME-Sender: <xms:F43_Yml3Q_WnRKQKunw9etEGtcPfCka-2vspDX5bWs1aeyEYQi46DA>
    <xme:F43_Yt1JxHU5O8qw7snKjDP4jiVwff1h4FgMmIjkHeQOYeDvS5LKeo-8zVHiYg8jQ
    uKC3au0N0cHLlBhoiw>
X-ME-Received: 
 <xmr:F43_YkpZDDQJj8sUA9Nx3xMK6a6fB3twwdEgakXSm3BnBc_jngmyTeewFTq9pfE0DXv5-CR04K2Gxk1rcFIMXdA>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdeiuddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhho
    fhhfrdhnvghtqeenucggtffrrghtthgvrhhnpedtveetkeejudduhefhtdfhtefhvdffhe
    elffdtffeileefudelieeuffdvffdtieenucffohhmrghinhepghhithhhuhgsrdgtohhm
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrvh
    gvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:F43_YqnslQKDW0GJYw1H5Llk7DxS89DigrRWbb8B_vdzdgEGjqYpYw>
    <xmx:F43_Yk1ehcJNK0ro9AQeojLMZqVCAESliWouxW7ctrc8ErRTZ-gUIA>
    <xmx:F43_YhvxZNviTSXnW-adXDgr7pWXbheyvLgxhlIZaGyewTarxwdVwg>
    <xmx:GI3_Yh-EFLqjNDp-wawgraJkXJqX_qDAv1FngdwLqBxlrlHCOoIwvg>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Aug 2022 09:16:07 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: pavel@zhukoff.net,
	Pavel Zhukov <pavel.zhukov@huawei.com>
Subject: [PATCH v2 1/2] package_rpm: Do not replace square brackets in %files
Date: Fri, 19 Aug 2022 15:15:36 +0200
Message-Id: <20220819131536.5353-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 13:16:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169628

This reverts commit f95adb749619e70920c6cc6cd01c6d02cd348fd8.
At some point RPM stopped treating "[]?" characters in quoted text as a glob
This causes rpmbuild error [1] in oe-core if package contains filenames
with such characters [Yocto #13746]. Reverting commit which replaces "[]" with "?"
fixes the issue.
It should be safe now becuase rpm tries to use filename directly if not
found by glob [2].

[1]
| error: File not found: /mnt/builds/yocto/build/build/tmp/work/core2-64-poky-linux/testrpm/0.0.1-r0/package/42 All-Time Classics (E) ?v1.1?.cht
|     File not found: /mnt/builds/yocto/build/build/tmp/work/core2-64-poky-linux/testrpm/0.0.1-r0/package/42 All-Time Classics (E) ?v1.1?.cht
|

[2] https://github.com/rpm-software-management/rpm/commit/c16c70cbd6b31cd93541d5c22d23ba98d212ad3d

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 meta/classes-global/package_rpm.bbclass | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 63c1b077a30..81a2060b68d 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -199,8 +199,6 @@ python write_specfile () {
             if path.endswith("DEBIAN") or path.endswith("CONTROL"):
                 continue
             path = path.replace("%", "%%%%%%%%")
-            path = path.replace("[", "?")
-            path = path.replace("]", "?")
 
             # Treat all symlinks to directories as normal files.
             # os.walk() lists them as directories.
@@ -220,8 +218,6 @@ python write_specfile () {
                     if dir == "CONTROL" or dir == "DEBIAN":
                         continue
                     dir = dir.replace("%", "%%%%%%%%")
-                    dir = dir.replace("[", "?")
-                    dir = dir.replace("]", "?")
                     # All packages own the directories their files are in...
                     target.append('%dir "' + path + '/' + dir + '"')
             else:
@@ -236,8 +232,6 @@ python write_specfile () {
                 if file == "CONTROL" or file == "DEBIAN":
                     continue
                 file = file.replace("%", "%%%%%%%%")
-                file = file.replace("[", "?")
-                file = file.replace("]", "?")
                 if conffiles.count(path + '/' + file):
                     target.append('%config "' + path + '/' + file + '"')
                 else:
-- 
2.35.1


