Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 796C2E95A8E
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 14:40:30 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web11.63281.1696862421441987254
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 07:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm2 header.b=ayoHnFW9;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=HkIvZ9e1;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.20, mailfrom: pavel@zhukoff.net)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id C569B32001E9;
	Mon,  9 Oct 2023 10:40:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 09 Oct 2023 10:40:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1696862420; x=
	1696948820; bh=42WpsqBIuw6YdLaOHdAKyVVtJT1anSyRGQwJ3uZjeBU=; b=a
	yoHnFW9rO5quOi1bVypXASmzpShrXYdE2sQ846T6/xl89ohG8iSEBUGfL0pomRv0
	GVQecNSXL1wUY/zuuxR5Y3tqhVqAV2Hu5y++Fo8PPkt6LmJ+xhVbkDsBKB2yxQLO
	S64ht6ygp9Gewvs0uwNYenCi/RwFrn3i7HxqH+uETLUdyBWTUL2Y0rWSlM5u9YXF
	5Z3fI2fOixOv+b3IXmN8a/sJr/4moDN2vx9INmF9MLzquF6aIEpiIRN+lnjkwEiW
	YCfALOjWlbJDqxXXkVl2rlNXdPdAbEzLnF7cshxy4zG+tId81veVT89elWA4/PA8
	tONARav0DVP6Izyw46LCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1696862420; x=
	1696948820; bh=42WpsqBIuw6YdLaOHdAKyVVtJT1anSyRGQwJ3uZjeBU=; b=H
	kIvZ9e18oiJMCqOQD7qosddGBj0J+C9f+8dYwdAUoV0PZoDeapPIvhm1Z1Fv+rnu
	Y/CvC5GG03OpZTqt/Fcj7kLCcROF7cYixpN1U7VR1GXTcTHOChKrymyQKYsRlNEL
	bPAH7obJ6P8HgXZKwjTjuDVILXeIHUbfO9u7u9fGpSqhJrIWw3unF5KNu7blT5fv
	tuCEHnu+wR0E2rwkmd9zx0MmWRKCTbkl8qPVCgLqFmEZLBDqVGudrBrXinTRZIzP
	UWXMAP43PlFLDgAeyHnWCJzaXE7JCbuUekFirVSwgqUWNHxspFEwS5I+L1FW50Ln
	JV4e8rrwHCcyr9KnBv6/w==
X-ME-Sender: <xms:1BAkZZ0BUUB6UEDVgcWHskvF0oz56MgdYhu_pvRBg85Xyh9obeUllw>
    <xme:1BAkZQHaohQx3qTQJJwpfVUmxgk0sojSDK2hh3RCOQGP-BFeHMoYVaq1ydsiFrkLf
    fFMRbyM0OwXcPV53Ok>
X-ME-Received: <xmr:1BAkZZ4QgOf3bSf6kP_9VgW1WTfgY3GDOaRgBtQF5LP1F6tCZawjMDY9zDIbj2f4wvqKt-8k9PFi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrheefgdektdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheprfgrvhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhk
    ohhffhdrnhgvtheqnecuggftrfgrthhtvghrnhepvdetffekteefkeduleefueevveduvd
    ekudffgfdtvdfhuedtudffudeulefhgfeunecuffhomhgrihhnpeguvggsihgrnhdrohhr
    ghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprg
    hvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:1BAkZW1zADsOfkoIX5eY8Fp6c7CzfgfIvA0aO-MkBFypg_2PpCmDEQ>
    <xmx:1BAkZcHXpLFD-FTzZckQQfWNZwsQOx80jHv9OHGwzEA7BRnpXnXPwQ>
    <xmx:1BAkZX_f2YE1D5XqENVOia4j2RCTDCgDQ1af7IstsRe4KpmIK_gRaw>
    <xmx:1BAkZXNj9xLePiR2ZVwB7ypo4_Wr67J_vCA7G5qeUvUs_JLe0y0Mww>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Oct 2023 10:40:19 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH v3 2/4] package_deb: Revert versioned providers workaround
Date: Mon,  9 Oct 2023 16:39:59 +0200
Message-ID: <20231009144001.21150-2-pavel@zhukoff.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009144001.21150-1-pavel@zhukoff.net>
References: <20231009144001.21150-1-pavel@zhukoff.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 14:40:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188838

dpkg and apt seem to handle versioned provides correctly now [1] so this
workaround is not needed anymore.
This fixes [Yocto #14995] for package_deb.

[1] https://www.debian.org/doc/debian-policy/ch-relationships.html#virtual-packages-provides

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


