Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9E5C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 13:22:02 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web09.7079.1646227321212931630
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 05:22:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=hgFNJqHo;
 spf=pass (domain: aj.id.au, ip: 64.147.123.20, mailfrom: andrew@aj.id.au)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 30F0D3200A64
	for <openembedded-core@lists.openembedded.org>;
 Wed,  2 Mar 2022 08:22:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 02 Mar 2022 08:22:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; bh=hiVG7KFfZ5otpnBvs6uxY3cNx/09qn
	n0eAajn+E5xiw=; b=hgFNJqHorBRsGhgA4MrmNdmh4HmkMLZj9LVZcMJK/lXBX/
	DTo8pZC1ruw+Gk2Ri5O8NzeF6/W7rvgBwebx7d8s+nAs9MepBmcaaoPp2Sul6xCH
	u+JnL9vJQSKxAdexztMQyivlhJYLh48zEsFH++Gahe5oBRAdMmPsTaTHi9sTjdiE
	Rz9D8BvZvAEjxAyMvzdsy++ZgAq8lFgANZnkZki6qkVWLmCo+Lrk1soQmfdRLzqz
	n7rn7sAvvlMGTU5XFbAEmg90KbwkNH9ouYU04XpS4+0WeVAHGr2dQi5Vi80jnUS+
	zyR9RXvHTFVA8z5AigEF0bxUeukFGT62cT/x68TA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=hiVG7K
	FfZ5otpnBvs6uxY3cNx/09qnn0eAajn+E5xiw=; b=J+rDv8yfxN6JUCVyNQlcKr
	Z4oI/54nWvPDTqGobKaCDPFjHoVcw3HUyBCsKJJyTZjVmC0F/IeNGCw6+Q7MPkLj
	3XJ6O3cclYOt/OIWRaRefnhR8Ad5AyW2TIoVdxAqquG37O+UPwUteC1zClDlQyji
	vWQVEeFMOu5hW2QrMMdW3wXPTJmi+HrL79pSwYrozfN7qb2eAlfyM1IyieVpP0en
	QV/zaWyip5we0qi4c5kjGyD1kwM0yeAXe+IPYRFhMDqnz9aHDD8LjeRQxNeoSfa2
	dRLirEOxwbH8IEZAcp/CgT6L0uMK0l6o0gdrlk9FUyA+Z5F/fmv2hl5fojZwmNkA
	==
X-ME-Sender: <xms:d28fYiJH33Ebr9Z6JzHmXaQnatVSDl_3SRzzLceX5By4d4omDxMPog>
    <xme:d28fYqLxR23YV25RrMtZJoXfEsHmztosnNGgbAfUoPPVtX0MKuVAuGtFjfgC5Qmxl
    AsspdfTZrJy_uNK0w>
X-ME-Received: 
 <xmr:d28fYivGcV9unjeNLNnk3Io7OqDcJsNtzBmZR6LtdI_rKZbuUKcC6wkGHt52fuZuKGtbhWIvp8yeHGHfAARIqOIkWrqWaizk3mB0_0vP76oIr5hYB4gO_HwHFcEscw2P>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddtgedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
    etjeffleffvdduudevieffgeetleevhfetnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:d28fYnZuAxpAvuRBPd7qslrqph80gEC6HQASzfq6VTnduCYFsx3hUw>
    <xmx:d28fYpbQv42wAA5c7v5myP7IbyxSS_mB8KRqzLGT_vLfrYK4S8mfUg>
    <xmx:d28fYjAwQY--0ZQ-bidDe0wz_7P_jwPhi2hBZ_VsZYIayDTXmHemJg>
    <xmx:d28fYr32h7_nPV4pFvhUffJ1eLs4ZJakyDQRqajfLVSlsY5KIaxfbA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Wed,
 2 Mar 2022 08:21:58 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] ipk: Decode byte data to string in manifest handling
Date: Wed,  2 Mar 2022 23:51:43 +1030
Message-Id: <20220302132143.3619841-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220302132143.3619841-1-andrew@aj.id.au>
References: <20220302132143.3619841-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 13:22:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162609

```
File: '/home/andrew/src/openbmc/openbmc/meta/lib/oe/package_manager/ipk/manifest.py', lineno: 69, function: create_full
     0065:        output = pm.dummy_install(pkgs_to_install)
     0066:
     0067:        with open(self.full_manifest, 'w+') as manifest:
     0068:            pkg_re = re.compile('^Installing ([^ ]+) [^ ].*')
 *** 0069:            for line in set(output.split('\n')):
     0070:                m = pkg_re.match(line)
     0071:                if m:
     0072:                    manifest.write(m.group(1) + '\n')
     0073:
Exception: TypeError: a bytes-like object is required, not 'str'
```

Change-Id: Ifefb13bfa22c766d20ab9f73f7abe5163b3df86f
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta/lib/oe/package_manager/ipk/manifest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/ipk/manifest.py b/meta/lib/oe/package_manager/ipk/manifest.py
index 22669f97c082..ae451c5c70d3 100644
--- a/meta/lib/oe/package_manager/ipk/manifest.py
+++ b/meta/lib/oe/package_manager/ipk/manifest.py
@@ -62,7 +62,7 @@ class PkgManifest(Manifest):
         if len(pkgs_to_install) == 0:
             return
 
-        output = pm.dummy_install(pkgs_to_install)
+        output = pm.dummy_install(pkgs_to_install).decode('utf-8')
 
         with open(self.full_manifest, 'w+') as manifest:
             pkg_re = re.compile('^Installing ([^ ]+) [^ ].*')
-- 
2.32.0


