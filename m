Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F92E94104
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 19:13:07 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web10.2714.1696619577475003142
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 12:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm2 header.b=UTaBe9kV;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=B6IDxlQS;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.28, mailfrom: pavel@zhukoff.net)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 431AF5C0213;
	Fri,  6 Oct 2023 15:12:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 06 Oct 2023 15:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1696619576; x=
	1696705976; bh=rvfLrWbVx4vbxiDlxN5VXNxsJQJSXrE6CgzoHMFqw6Q=; b=U
	TaBe9kVDBnaZ3rVKxCXlb79AwbRDdkw2yJTZBZf58PTWTjrRS6CC7ImSbPZ2Usp1
	+pfXSXLI9235M/iSzUPxUsqC1XWC71qkXMxszGRSY0cIC/dZKlnhN/auUJR2eplh
	BQxEvT0t5uyz3+BkkwehJK9yAKbO9eCX9Qry+cbBKscNjTnM+mCD1zWOi9TzcVM5
	vzWGPNirhmmsbHYmsaBeblSJQB3yKUopi39gfeqz3iBxITpn7am/wBor6TOd5GFv
	Zj8gv/4Hnf+1KUsclQigvCanewnL8ZrdPLEvMCMTdaYigZXqJx6UVsO6oCrWWv63
	ouU80LfBkG5mzFSEJoXuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1696619576; x=
	1696705976; bh=rvfLrWbVx4vbxiDlxN5VXNxsJQJSXrE6CgzoHMFqw6Q=; b=B
	6IDxlQSCXPsnDfJT+TUYt6tVDfbT4AJkAB07gszY9CL8vEWD85yXoPTXyYCzDrbE
	5nJZuDQDYiOHuKPy9/X5Mq9Fxfh+GsUavzrqkpIt7moMh4idhlxsqUsKPKpV/a12
	k98c1ny+kRn9t3H3+3BZVno4mIny9CWnNVzJe0IaQE3EKuNUaDT1hXnCmsR2BIeW
	4j84gmsSOtnimKOFtdToDFnBoV4pz2S9tU18/XpYRUX7X2u8aDwhcNn8apFuJ5P7
	HkddF5GKL0zYVnRjixqxf3xIfOsXFZ1Nxu03ZkSzAa7n+FsVozsauTqiK2DFFX0V
	cPOM7ztPW69SgQCTR7R1Q==
X-ME-Sender: <xms:OFwgZS33bItyR0SPcXi8FYjZqnAfreth1-pJM2M9a8BwyHByckJeWQ>
    <xme:OFwgZVHI6W7T5vGVV9nvTcf6q6-8riz_VMg5zRnIXe8Jh_Jl32KlX0HsCBYJzjx14
    k_8aH183q3BHBqQfrA>
X-ME-Received: <xmr:OFwgZa5ojyNAGXuAUn_7RxWOac1P9M4bZkT1nGPKI6Z8BMtrN9vNXEx9Ye3yl6G6tcqXzr9Fm4uqQ3JH5q_llegP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgeeigddufedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhu
    khhofhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeegieevvdeiieekheekfeeigfdtue
    ejffeugedutdeutdetffdvgfetledtleekveenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:OFwgZT1SZ6WLiLSc-ganxnq2_n00nUFyWFjV2HUdtSzgFzrsVuK21g>
    <xmx:OFwgZVGWYDOEqRtDqN4FIF43CH329NdxXGbeMbMLp_iEyMWrShUNvQ>
    <xmx:OFwgZc9iv_iHL85Qt017YkuDh0xQGFlR0BAOrHG63TJy-9DBEIlrZw>
    <xmx:OFwgZYOt8wJflgDuYTmjeW6hcRrwvrDhVXYZamQgSmcV5o9NxwbFbw>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Oct 2023 15:12:55 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH v2 2/4] package_deb: Revert versioned providers workaround
Date: Fri,  6 Oct 2023 21:10:12 +0200
Message-ID: <20231006191013.3770695-3-pavel@zhukoff.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231006191013.3770695-2-pavel@zhukoff.net>
References: <20231006191013.3770695-2-pavel@zhukoff.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 19:13:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188778

dpkg and apt seem to handle versioned provides correctly now [1] so this
workaround is not needed anymore.
This fixes [Yocto #14995] for package_deb.

[1]
Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/classes-global/package_deb.bbclass | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta/classes-global/package_deb.bbclass b/meta/classes-global/package_deb.bbclass
index 5aba3837bd..d7bbfae3fb 100644
--- a/meta/classes-global/package_deb.bbclass
+++ b/meta/classes-global/package_deb.bbclass
@@ -184,8 +184,6 @@ def deb_write_pkg(pkg, d):
             #   '<' = less or equal
             #   '>' = greater or equal
             # adjust these to the '<<' and '>>' equivalents
-            # Also, "=" specifiers only work if they have the PR in, so 1.2.3 != 1.2.3-r0
-            # so to avoid issues, map this to ">= 1.2.3 << 1.2.3.0"
             for dep in list(var.keys()):
                 if '(' in dep or '/' in dep:
                     newdep = re.sub(r'[(:)/]', '__', dep)
@@ -200,10 +198,6 @@ def deb_write_pkg(pkg, d):
                         var[dep][i] = var[dep][i].replace("< ", "<< ")
                     elif (v or "").startswith("> "):
                         var[dep][i] = var[dep][i].replace("> ", ">> ")
-                    elif (v or "").startswith("= ") and "-r" not in v:
-                        ver = var[dep][i].replace("= ", "")
-                        var[dep][i] = var[dep][i].replace("= ", ">= ")
-                        var[dep].append("<< " + ver + ".0")
 
         rdepends = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS") or "")
         debian_cmp_remap(rdepends)
@@ -220,8 +214,7 @@ def deb_write_pkg(pkg, d):
                         del rrecommends[dep]
         rsuggests = bb.utils.explode_dep_versions2(localdata.getVar("RSUGGESTS") or "")
         debian_cmp_remap(rsuggests)
-        # Deliberately drop version information here, not wanted/supported by deb
-        rprovides = dict.fromkeys(bb.utils.explode_dep_versions2(localdata.getVar("RPROVIDES") or ""), [])
+        rprovides = bb.utils.explode_dep_versions2(localdata.getVar("RPROVIDES") or "")
         # Remove file paths if any from rprovides, debian does not support custom providers
         for key in list(rprovides.keys()):
             if key.startswith('/'):
-- 
2.41.0


