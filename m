Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04487CF11FF
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 15:54:51 +0000 (UTC)
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by mx.groups.io with SMTP id smtpd.web11.47269.1728575682645624930
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 08:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm2 header.b=pU6ZVj17;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=K6M81Jcx;
 spf=pass (domain: zhukoff.net, ip: 103.168.172.145, mailfrom: pavel@zhukoff.net)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id C8F7A1380218;
	Thu, 10 Oct 2024 11:54:41 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Thu, 10 Oct 2024 11:54:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1728575681; x=1728662081; bh=noXIraH0rJd3JV/6nJGCY
	eokp//ND8ENfz/6R6ZWVDw=; b=pU6ZVj17TwOi4olxtnYKlXqHQ+rkRicuQC0qI
	OgiTX3sd3ZvxrPsn/yBT8Em1PDcS6uzTGjefj3EZbJGfqj2tBJKGMASfLOB58oaQ
	YxmF5jFAyrs1VvhNAZEtz2NgZvyyBnqNwGlDpkp9EUSTEeNPtLbNNN4s32LEJDWD
	ph82np/7XP4e0jtJ1MX/2VyctzX9gMoKmKVCaDnU7YWy87xKX9MDswK1KgAIEM2f
	t0vWJ3zAe66sDshpVPGF2HfYkcui6HjVM0mFEA7gNpdDg7O2i9572nvWS7A8bg6n
	cvbDEh+eP30peiJtglqSpsxwDIjtXSahccZiq2aj6j91S7FqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1728575681; x=1728662081; bh=noXIraH0rJd3JV/6nJGCYeokp//N
	D8ENfz/6R6ZWVDw=; b=K6M81JcxQseWmxxjoL4yNeworh3z4tgECT6V24QmiaGo
	PseFR95lszJTxjXDTpz+kZfozRRrmG5cJGQH6wixmByu+U+oFQxtn8iv/LlOL2Ou
	Ws+RGgOLg41vxZjq9rjYg7z+G/BO3PlaEqZszAXqmP+7gYdE6GSkMYDMGqdsuwiZ
	lCDSUVJCstMtzZOO9aZzmtcTyX5wMtVmHdMY58m3v5PJVEr050i821UPI8cIRc3e
	TO9zpfRnPPCcB8KgveUBYoFoeR4KQOq5f6ovvrzTfzUwi6o4if0lmmhk/FHhulfG
	Dt1z5FyLUhMqYkm98Ulgbia4FPoWFrmIYmivP47jDA==
X-ME-Sender: <xms:wfgHZ9be3k711fyFIu5MGGqQI3RB9hkr3Kabko9EZKFjHwf1-cbKkA>
    <xme:wfgHZ0ZBVxpVuKRBLiZS-5AucQ5MgK3N1N9hrZD8G8qggL4JXinwDaqoenlpHdDPT
    rI3345H771mrf3fuR8>
X-ME-Received: <xmr:wfgHZ_8GtHObjF_azwsfhButd13ZYHdXR6U1D50IjJoluBsz8caMreZQZrmQJI7tqQGqJ8GCOI125BNRApwOio7MvzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefhedgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehp
    rghvvghlseiihhhukhhofhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeekieehvedvje
    fhveeileetfeektedvkeetleduteehudevhfeuffelgfefieegveenucffohhmrghinhep
    shhtpghuihgurdhpfidpshhtpghgihgurdhgrhenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukhhofhhfrdhnvghtpdhn
    sggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnh
    gvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhr
    ghdprhgtphhtthhopehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:wfgHZ7qA59uMPTeEoYRmGgapA4iUMk62DLVxAMRS9duVn999ueWjcQ>
    <xmx:wfgHZ4qv9NIGUAiz91ddgUzun9YgtA-G75VMhgbqLjrv6d7fKuu1Yw>
    <xmx:wfgHZxRWA6jOA1ibB0DLj6TrLBlAFnELX5scF3Rt_0xUnw2v3d9QbQ>
    <xmx:wfgHZwowz619xWOsmCy_MQnk2cuGzuzZaytLMUw8X5GrSFCb-GwcCw>
    <xmx:wfgHZ_1jTvwssJKhpSVm5Yr_S-L5Mz3FJ4eI0SoVmkTGdPozKsVMmMJA>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Oct 2024 11:54:40 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH] package_rpm: Check if file exists before open()
Date: Thu, 10 Oct 2024 17:54:23 +0200
Message-ID: <20241010155422.21058-2-pavel@zhukoff.net>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 15:54:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205408

Exception handler tries to read() /etc/passwd file in sysroot
and if file doesn't exist for any reason then it raises FileNotFoundError
exception which mask the original source of the problem and makes
debugging of the issue more difficult.

Fixes:
Exception: FileNotFoundError: [Errno 2] No such file or directory:
'/codebuild/output/src1899304708/src/build/tmp-container/work/core2-64-oe-linux/emqx-bin/4.3.12/recipe-sysroot/etc/passwd'

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/classes-global/package_rpm.bbclass | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 2e3e4e8c79..3d6ae71751 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -205,14 +205,22 @@ python write_specfile () {
                 try:
                     owner = pwd.getpwuid(stat_f.st_uid).pw_name
                 except Exception as e:
-                    bb.error("Content of /etc/passwd in sysroot:\n{}".format(
-                        open(d.getVar("RECIPE_SYSROOT") +"/etc/passwd").read()))
+                    filename = d.getVar('RECIPE_SYSROOT') + '/etc/passwd'
+                    if os.path.exists(passwrd_filename):
+                        bb.error("Content of /etc/passwd in sysroot:\n{}".format(
+                            open(filename).read()))
+                    else:
+                        bb.error("File {} doesn't exist in sysroot!").format(filename)
                     raise e
                 try:
                     group = grp.getgrgid(stat_f.st_gid).gr_name
                 except Exception as e:
-                    bb.error("Content of /etc/group in sysroot:\n{}".format(
-                        open(d.getVar("RECIPE_SYSROOT") +"/etc/group").read()))
+                    filename = d.getVar("RECIPE_SYSROOT") +"/etc/group"
+                    if os.path.exists(filename):
+                        bb.error("Content of /etc/group in sysroot:\n{}".format(
+                            open(filename).read()))
+                    else:
+                        bb.error("File {} doesn't exists in sysroot!".format(filename))
                     raise e
                 return "%attr({:o},{},{}) ".format(mode, owner, group)
 
-- 
2.44.2


