Received: from forward3-smtp.messagingengine.com (forward3-smtp.messagingengine.com [66.111.4.237])
 by mx.groups.io with SMTP id smtpd.web11.39364.1608558676516969691
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Dec 2020 05:51:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=MZey6Q2f;
 spf=neutral (domain: iki.fi, ip: 66.111.4.237, mailfrom: tanuk@iki.fi)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailforward.nyi.internal (Postfix) with ESMTP id ACB90194336C
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Dec 2020 08:51:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 21 Dec 2020 08:51:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=hNmI4gYdN4h+8TYXI
	qAFuDSVsBq1/HVuXjPUh9IICGw=; b=MZey6Q2fAGZS6uLFogjVn6q/H3A1yHWj8
	FlG/vG0kQ8myP/rh2uunAEpYlToYHKUBATMN86N47SGCjqq2ngY//Kqzy47wOaI5
	ErYQuoGXSGlrlrpvACVF3vDZVCccvqQ4EEeCTKUuhPc8A85CUo7j0WsZ95nY3jJw
	jNJ7rGV9UuEQSXji5OcFj8R561LmCDMReau7qqwoqzdHhBVP42JTCE4+m2HEFf/z
	DFFeXMUlG1/0zt4Covs9Kp4kSo/DUf0elzznbJ963lxlWywUz4CpySZot3iEJdpl
	ryoY4OY/jS3F2NlT2Ai1AlqFjtRdSWoM7J57pajzCK97fVgvSStIQ==
X-ME-Sender: <xms:UqjgX0ekkJh_M_cgdUwrNOveJ4JdFPwre90jGhlUb9p5TTW3kE-6bQ>
    <xme:UqjgX2PYlzQmHNr2WvRmLaXayvKUyx76AYwPs5x_2yzQARpvFVSrK0prPI05AIdRs
    v-CocCYRdguS06L>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtvddgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomhepvfgrnhhuucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhf
    iheqnecuggftrfgrthhtvghrnhephffhheehieeiffegueevvdekudeltdegvefflefgle
    efudfffefgjeetieetieeinecukfhppedukeekrdduvdeirdekledrhedvnecuufhprghm
    kfhppfgvthifohhrkhepudekkedruddviedrkeelrdehvdenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtrghnuhhksehikhhirdhfih
X-ME-Proxy: <xmx:UqjgX1hstB11Kqe89HbkW4AjYjMcMN1xQ6jFPuJFcdRnRWd90qxmfw>
    <xmx:UqjgX5-dLDVus41BBlE647Po2wSTE0KFI8akw5EXqIoz-xBc3NIhlg>
    <xmx:UqjgXwu7cya0BpXMmz-t-M7VEh5nTEpekxBXMPXDZ5LahuseN3aV7A>
    <xmx:U6jgX-6wQOTAS_4ev6Oqh5AyIeYDlh01gcyN9YijjADJOv3TrQmXxA>
Received: from localhost.localdomain (unknown [188.126.89.52])
	by mail.messagingengine.com (Postfix) with ESMTPA id 8DC3E240066
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Dec 2020 08:51:14 -0500 (EST)
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pulseaudio: fix client.conf location
Date: Mon, 21 Dec 2020 15:51:08 +0200
Message-Id: <20201221135108.37258-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The location of the generated client.conf changed when switching from
Autotools to Meson.

Fixes this error when enabling autospawn-for-root:

    sed: can't read src/client.conf: No such file or directory

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index cf4be7ed40..e40b8c1c40 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -133,7 +133,7 @@ set_cfg_value () {
 
 do_compile_append () {
 	if ${@bb.utils.contains('PACKAGECONFIG', 'autospawn-for-root', 'true', 'false', d)}; then
-		set_cfg_value src/client.conf allow-autospawn-for-root yes
+		set_cfg_value src/pulse/client.conf allow-autospawn-for-root yes
 	fi
 }
 
-- 
2.20.1

