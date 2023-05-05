Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D01C77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 13:21:04 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web10.27086.1683292859153062363
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 06:20:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@aj.id.au header.s=fm2 header.b=NFuyKTkn;
 spf=pass (domain: aj.id.au, ip: 66.111.4.25, mailfrom: andrew@aj.id.au)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 315D95C0348;
	Fri,  5 May 2023 09:20:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 05 May 2023 09:20:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1683292856; x=1683379256; bh=Y/uVtWUsb3
	rRPkjCTF/mlGGHWpdYgL1GtrBwU+XeTe8=; b=NFuyKTkngHd+s2J6pdofv4gqc/
	8uE6bLi4f4FbL90nszrV3nF3ETWzDVSaf41D2cxLFuHn+TVuwJm/2QqBOuNDicYZ
	2VNu655PoAj7GTiJZ96gxNNoEtcRely+QmTKqqsn/m4dJhS9gIAgb4Fyua5YQkTp
	pTNmTdWDZ5bjGhkRjwFWANezYNwKzkoMk+WAYAjeZC8QNMm1RiXUSgB3nxCPvACY
	JsCLq13fP6VcCY8369r0KmdEE6/aEAyr/0QBGm2NcpI1huOzr0BiORO6lWs85JwX
	M9FAqcFym6iWRtp+7YBWD8B8ROBgknzpA+XcJhLNi6pgDhy5tiu0KCwl1LkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683292856; x=1683379256; bh=Y/uVtWUsb3rRP
	kjCTF/mlGGHWpdYgL1GtrBwU+XeTe8=; b=WLgEg7jOrXwuTs1n48Nyx1BUpjKBU
	UhwvkZQEKpvZpu7geb8h76bys+1DlGrpvp4SQhlBZ90GRHvAOI66saQ8KPYWsefr
	opdNov7JokJKMoZ0PPYWDXtpFJBtQbIEfsUreiapFD1j4z+ZhjuMb5cfSFZbZZ4N
	Mf+H7xrRRMLxv/T/2xkADv4YDtnCnThRbL/7Gi8/uhSucXAPPtag7K6lmZ56jdkn
	LXMrACSaAUUfdxIDE4nmA2/TXNUI8o68QR4A8ALGbzGoU9zqxrnTXcKL53oD49WY
	bD/RmclKOSwJlyDOVcWsj9Tqsv+L3pLZmi8/amhH19gvyAo/6e4aNIeBQ==
X-ME-Sender: <xms:twJVZHeWF09d0N-_DhftYcQ84Z43HSqUDN8aiSlJKEOevIrf8Lubbg>
    <xme:twJVZNMW5A0_sYkWLAv_oGdJjxFic-Po7OH39I5L7FPJIQZC27FyJASjLH_X6r2aC
    rWMwa5n2o6Ei7ex1Q>
X-ME-Received: <xmr:twJVZAiig9IZd1p6xOfpo-VqHRppIvoD5iP8odvtNxgh03qLUtc70G9EQxahTr19NhQKv6M2esdXyATtTQieagcjwHC5Iza0sGBjARYMyARLYVpF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptehnughrvgif
    ucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrfgrthhtvg
    hrnhephfefgffhtdethedvudefgfdtleefheegkedvtdfhheegvdekvedvuddtheegfeei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnug
    hrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:twJVZI-Z4nmi-wOrcJiqtOZmlpm6nnlyJt-_tuNzgHMKlWLQxxNgfg>
    <xmx:twJVZDugiUkLh1rlSe8YFIqWuNVNUEffJwY9fGF994XOPcifOHG1qg>
    <xmx:twJVZHHX2Fam1jQNZWD1N9Y8hXxNN8gKQeduc0No5xMZGlkJLCCVWw>
    <xmx:uAJVZMWnl5F8mADsGXvBVf5jRmhHxC5CXTk5n2kRx41hmNSTSam7XA>
Feedback-ID: idfb84289:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 09:20:53 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-core@lists.openembedded.org
Cc: Curtis Meier <cmeier@us.ibm.com>,
	Pam Eggler <eggler@us.ibm.com>
Subject: [PATCH] Revert "ipk: Decode byte data to string in manifest handling"
Date: Fri,  5 May 2023 22:49:54 +0930
Message-Id: <20230505131954.2082020-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 13:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180916

cf9df9e8d89f ("ipk: Decode byte data to string in manifest handling")
did a bit of least-effort fix to a string vs byte sequence issue in the
manifest handling. The approach was chosen as it localised the fix,
rather than having to analyse further call sites.

However since then f2167ae80258 ("package_manager/ipk: do not pipe
stderr to stdout") was applied, reworking the output handling from the
subcommand. dummy_bytes() now returns a string, so stop trying to decode
it.

Fixes: f2167ae80258 ("package_manager/ipk: do not pipe stderr to stdout")
Cc: Curtis Meier <cmeier@us.ibm.com>
Cc: Pam Eggler <eggler@us.ibm.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta/lib/oe/package_manager/ipk/manifest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/ipk/manifest.py b/meta/lib/oe/package_manager/ipk/manifest.py
index 469e14c3c6b8..3549d7428d72 100644
--- a/meta/lib/oe/package_manager/ipk/manifest.py
+++ b/meta/lib/oe/package_manager/ipk/manifest.py
@@ -64,7 +64,7 @@ class PkgManifest(Manifest):
         if len(pkgs_to_install) == 0:
             return
 
-        output = pm.dummy_install(pkgs_to_install).decode('utf-8')
+        output = pm.dummy_install(pkgs_to_install)
 
         with open(self.full_manifest, 'w+') as manifest:
             pkg_re = re.compile('^Installing ([^ ]+) [^ ].*')
-- 
2.40.1


