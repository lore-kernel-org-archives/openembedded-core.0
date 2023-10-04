Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FDF0E7C4E4
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 16:16:05 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web11.22814.1696436160699050497
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 09:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm2 header.b=S0mOkgZt;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=R5IcVRrt;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.25, mailfrom: pavel@zhukoff.net)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 07B655C01C5;
	Wed,  4 Oct 2023 12:16:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 04 Oct 2023 12:16:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1696436160; x=1696522560; bh=wx8ZADRF4T
	bf9qObxTi0xZ70Ln+XDr12Dqj5UzeMIRg=; b=S0mOkgZtOB4MGCWh/GV2M/D1hI
	yFC8fq63VijAHgwsLem8gp2mNT/2GmWVUCxrJ0IuUTXaKeP6lSn1CX/TGPSS0QCr
	LJR7NZa8jc1LWbphjLfrvN2z4vWzQR3qz/Zt3qy+FRXtstTxU3SoDr3JHqqDlB/u
	ybs5yXZZ2EgmWpGbT95UtyNYedNHkGo2I8hbQwnHTy+GhtjChFj/S9s5lbB/esjH
	pIqSfIQxxo5LzdJSC/4u8MUVmzitN6IpXfkeOKwFuvYUFMiFi+3/qBYcfYGh7iKk
	IjM3Lq+VWH8VeXIHY3KaqwrQmB83Zc5bCNz5mBESR24NGHhphlyLmBEAqCNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1696436160; x=1696522560; bh=wx8ZADRF4Tbf9
	qObxTi0xZ70Ln+XDr12Dqj5UzeMIRg=; b=R5IcVRrtKB7gykrdZ+mz3XNOvuYGg
	PAg9h8jhiRCos+ffchYxLNnKwF344md3id2xCygfHQkT7fyBqhNlqoWzbVmyQDyq
	Bnuo0kh1P/2ChlLHv8PzswYzZ+ANeoCp6ZpACqbh/SDs6lul0h9+7C4Ndd0HLVue
	RxLlQDu/PpQQItMTRZpeUWnjVbdas7J5WHhhLxlQHrXsRIkPRRrNXgTWz0gFD796
	4P8D4E3P02Niq6q9lDcnzxs9oQxTQ22oXjsCz0RSnaU3nsr4iSDGgynshB4Cu058
	ONztmQknDER1XuXejt8E5LAevrDVZvAsf0WgCUkeCx/mjHYdbq2TUaZ5g==
X-ME-Sender: <xms:v48dZciQKSR2t_axU4NIn17LuEbMKipnOF5ikgHiJKKi0uxv56t0hg>
    <xme:v48dZVBxHO7iW2KpOGvPKprSmVgYO7cfDtI3uyjqkbOJyrP3HGl4pEZyT_cbOPH0C
    i3ZsJSmZKqAaCWm9II>
X-ME-Received: <xmr:v48dZUF3Cr2uzTQsWGPRrTGWW5la61bcrnrJyQGXswT6JG9xG1Uo5HiDDWQRejI8N2M-zeBOCEQ2oghG3fR6wHQE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgedvgdeljecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
    dttdenucfhrhhomheprfgrvhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhkohhf
    fhdrnhgvtheqnecuggftrfgrthhtvghrnhepveefjeekjedugeeltdekjefhtedtfeejue
    ffheeikedvudfgtdffffelvddvfefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgrvhgvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:v48dZdSYaHe8SJHp_hT52yX6aUc_F4o2JkNAQZazXCebs_LWU9U4SA>
    <xmx:v48dZZxOi8geBgMNusYW9IUHcCQnlizWCtJC63bKJkWqLcU1xtkCSg>
    <xmx:v48dZb48p8yMys5dXnNuE6xkKGIc5wOqqjknL280HccJof_-m6D9lw>
    <xmx:wI8dZXbbHKLm9wYrsb2RE4aaDGfYu6Mu1XaT8XqwJiNlsjPoqV75kg>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Oct 2023 12:15:58 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH 1/3] dummy-sdk-package.inc: Filter packages which are marked for installation
Date: Wed,  4 Oct 2023 18:13:16 +0200
Message-ID: <20231004161318.576312-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 16:16:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188690

if packages is provided by dummysdk and in the same time marked for
installation with IMAGE_INSTALL it causes conflict in apt because virtual providers are
not taken into account if package is asked to be installed explicitly.
Filter such packages from provides/conflicts to workaround this problem.
This workaround brakes RPM usecase because of file conlicts with
DUMMYPROVIDES, use DUMMYPROVIDES_PACKAGES_MULTILIB instead (which
doesn't include file based conflicts).
While this is needed for the case of package_deb only adding it for all
package managers to not complicate the code.

Fixes: [Yocto #13338] [Yocto #14066]

Fixes:
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 target-sdk-provides-dummy : Conflicts: bash
E: Unable to correct problems, you have held broken packages.

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/recipes-core/meta/dummy-sdk-package.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/meta/dummy-sdk-package.inc
index bd26e39ad3..6ccafbf8bc 100644
--- a/meta/recipes-core/meta/dummy-sdk-package.inc
+++ b/meta/recipes-core/meta/dummy-sdk-package.inc
@@ -19,13 +19,14 @@ PR[vardeps] += "DUMMYPROVIDES"
 PR[vardeps] += "DUMMYPROVIDES_PACKAGES"
 
 DUMMYPROVIDES_PACKAGES ??= ""
-DUMMYPROVIDES_PACKAGES_MULTILIB = "${@' '.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split()])}"
+DUMMYPROVIDES_PACKAGES_FILTERED = "${@' '.join([pkg for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split() if d.getVar('IMAGE_INSTALL') is not None and pkg not in d.getVar('IMAGE_INSTALL').split()])}"
+DUMMYPROVIDES_PACKAGES_MULTILIB = "${@' '.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES_FILTERED').split()])}"
 DUMMYPROVIDES += "${DUMMYPROVIDES_PACKAGES_MULTILIB}"
 
 python populate_packages:prepend() {
     p = d.getVar("PN")
     d.appendVar("RPROVIDES:%s" % p, "${DUMMYPROVIDES}")
-    d.appendVar("RCONFLICTS:%s" % p, "${DUMMYPROVIDES}")
+    d.appendVar("RCONFLICTS:%s" % p, "${DUMMYPROVIDES_PACKAGES_MULTILIB}")
     d.appendVar("RREPLACES:%s" % p, "${DUMMYPROVIDES_PACKAGES_MULTILIB}")
 }
 
-- 
2.41.0


