Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4572CCE9D74
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 16:03:51 +0000 (UTC)
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93190.1767715421575610174
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 08:03:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=cBkxKGzp;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=apWEHQSe;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DA2497A0069;
	Tue,  6 Jan 2026 11:03:40 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 06 Jan 2026 11:03:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1767715420;
	 x=1767801820; bh=y5Y4FRN+GGOpjIGcsRj05rhunXQVCVDWxzm4CqATLbg=; b=
	cBkxKGzpUChfZla1ZRraEnyVZxDEYhjwQOk7L6qpJBiE+subkBdoyQ1FHRpJL42L
	skuRHJWmkXUrj3UyhJ7FEXTAjYJTw8vzaiSUEi3fiusbold2rZv4ZmaSDsL5OpKS
	9PuM249TLayamzmUfvrk78LhI5ry/p6Z2nwvtzgcvOjuvz+OJU0gOAUekpB9qxwo
	lJl+Qk1EPaDt23FH3G82sVXdWTILd/HuBvOLDf0LYGCZTinA3/zXvBbea2EpSSe+
	zSe9A8F9FNKhH7XbfnHq8nXQf5daCCPTtU0FkaQrZpB6WM+7qB28C7POU5gsVTh/
	IadxHIoYqzmCqe2eitN6pA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767715420; x=
	1767801820; bh=y5Y4FRN+GGOpjIGcsRj05rhunXQVCVDWxzm4CqATLbg=; b=a
	pWEHQSe/uTIK9NGFJuokIY5Gf3IpEppyc7w+Sw67Z9XPxc/BXYmhFI6e5acfFyNM
	5i/B/FCma3zBVD6t7pRL+fOlARUBVb4rGsmUyBv8jBJAEoW0NSgVCvZz4HHAvihK
	r0T9x4WjTXus9Dk/vSjrw9vj7Mkm9XW/EPq59OyEZlwQT3qMluUP8epWiEhngjyB
	48KsdnzszA0li2dcrKCRuuzt9HkB1J5D0zdTq77h2XPFpXzS8nMqE1N2iHI+SomD
	37XMnwAKqhODYdKivRXs3PJKLG9G2OD4OaqDyPfAF71co4J0qZn+qg6UylD04q36
	dqe6YCM37WGi/FGi/YOFA==
X-ME-Sender: <xms:XDJdabYBOhb7bFKP68tFTENtHPtdzcBIUzI4cvdL0r2LsxOk90UxDg>
    <xme:XDJdaQbel9SgVWEkncdVHdTv3k7urt8ASWxbrjlBoJJCA0JdkHzAHHvvtoIizG-wG
    G2Cd7Vr-lqCNzNPT4bykuE8QyuW1K_ukq4n2B7ypd51TbMSwO7kQ_w>
X-ME-Received: <xmr:XDJdabni8wtPgbyeAyExF27MkRjYftWjbLuBxRgeGsvJXaU-H-HRPbs1EiuEl76PE6N3Tt1AoqRSd8bEm13z16pjC8Yt07I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutddtieduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejre
    dtredtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgv
    rhdruggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefue
    efffelvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtph
    htthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvggu
    uggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtph
    htthhopehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:XDJdacwH8MypOBd_OhZgXGu7902xfYVdNP8F52yVC5ROEJGNnH3f8g>
    <xmx:XDJdaZMXC-sY0PCwrisqTyp6JP368kAVRaxP1S-BQvO4HXRMh6scjg>
    <xmx:XDJdaQQHA94FQo5GyZMJGnLhIJmkF9htaKENdtXL7yEc4eZe7xwDrA>
    <xmx:XDJdaXZH3Ar_ibzxksyWD8-L0SOrNL6HHV11FEqcYj2KJXWvYRe_0Q>
    <xmx:XDJdaV-lm0CE28mxFX3wx4RwatAHMbJK6WBerL08IAtyakhTrYTeZ9yX>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jan 2026 11:03:40 -0500 (EST)
From: Paul Barker <paul@pbarker.dev>
Date: Tue, 06 Jan 2026 16:03:33 +0000
Subject: [PATCH 2/2] devtool: deploy: Reset PATH after strip_execs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-devtool-path-v1-2-23fd7a493fe8@pbarker.dev>
References: <20260106-devtool-path-v1-0-23fd7a493fe8@pbarker.dev>
In-Reply-To: <20260106-devtool-path-v1-0-23fd7a493fe8@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1214; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=kiCqmdy9kWgosMOd3EBm8e3CA/6kVoZJuTvjNpKoA/w=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTGGkX+me+WeY6z9D8fH0PBsYdsrwKVVkeePqysUy239
 LGdeGhoRykLgxgXg6yYIsvmnq/3n/Y68maE3FKAmcPKBDKEgYtTACbCF8rI8FfOe/l9VrGTVh+/
 8Fqy22TqaVlPSudec+hF+Y9gzn1HFzMy7Lt6bP6vx0uvn33/oqwkp8FowkbZNwm6a6QmW7aa6Rd
 78wEA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 16:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228907

We need to modify os.environ so that strip_execs() finds the correct
binaries to run. We shouldn't leave this modification in place for the
rest of the program execution though.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 scripts/lib/devtool/deploy.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 2bf693d165a0..270e9104b25b 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -188,8 +188,11 @@ def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_proce
         if os.path.isdir(recipe_outdir):
             exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, "rm -rf %s" % recipe_outdir, shell=True)
         exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, "cp -af %s %s" % (os.path.join(srcdir, '.'), recipe_outdir), shell=True)
+
+        oldpath = os.environ['PATH']
         os.environ['PATH'] = ':'.join([os.environ['PATH'], path or ''])
         oe.package.strip_execs(args.recipename, recipe_outdir, strip_cmd, libdir, base_libdir, max_process)
+        os.environ['PATH'] = oldpath
 
     filelist = []
     inodes = set({})

-- 
2.43.0


