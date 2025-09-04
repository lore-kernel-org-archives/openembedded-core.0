Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB6FCA1013
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 15:18:04 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.850.1756999079248255763
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 08:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pUV2fXSq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-24b1622788dso9394695ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 08:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756999078; x=1757603878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgHLzrq1myrWk5awnwRgALwZKqLfGNLtLuGNbQPgH5E=;
        b=pUV2fXSq50VtKiTRsvRYREiKVmgq9r3cjH95kLVIVmNub4WtaEz+impx3LWPLCG4kS
         8xuOgDo1Rgfr5VRKK2XyODdvxuXsK3hgnPd5Ql6/uo+Zs2IAhA8nW/y2hIo8gGiKDUXZ
         yg1XKtgs1yBPzXWUrGODPQN8tYxJPW3uwPP1Tj74dNCiQVR6MCW6/1eNpcQRJJ2ZM5i5
         CgWBrJWC/IntcppvEX4lhSJqDBZo7pN13+IGbxHibiPkyuN1CPhLkqxGz6d3n2zqj3Xo
         MPueknkH1A462RV3SPqnjlpibsXF38a3/latK/nLF9owb3rWruj94WTARHgwLF5skkOz
         /tBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756999078; x=1757603878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgHLzrq1myrWk5awnwRgALwZKqLfGNLtLuGNbQPgH5E=;
        b=O2U/PAz2WmF2RHLtx8xMk6JapartGPubiQcvfy/sJ9INyhL4Ho16UtuTLi1X3RfwrN
         woqspxOk/eLBtdghNjZSbww6lMm1oHg4iiEzya5a/gxwQo1bXTD2YlbeKpypCCHjjha5
         QmMpQ+0gBU6qwJdpb+05dPDBMuudfw3nJF0SOEYVaRDKw8SJvjVpq7HCRL1yi+/H6BJ7
         Jr7SqrhQBMF4VnTgBib5OS+S0M4Ia9nOIt7PeyPrEUosk6KZ4zLUWQDx4Q55qlmAb4Er
         K7Rs6bjIHyaIVJYEq1WlK1cxw1S/Zbi9p6EhRWIFn3aBiShNhXr5a3E9vgLrIoQ2rjnx
         uBBQ==
X-Gm-Message-State: AOJu0YyEhSNaiKOJeyq8b739AkXpiuzo3cdz70KV4qJ4dwjiljpqHEu0
	ppa6xlDaeDsdfvzbTW5lftOApslu/62KhwzAYnUJHCNgj7C3NAizsxs5CrdKaT2vyFwDBUJCod9
	u8npZ
X-Gm-Gg: ASbGncu/I4O57KW6kQIdLylOipQzAbdz1XFDe5lRL71FcY+tzkVPTHUSwO3+0wPz+Tr
	sUawcVFWz3EU/yBmbMJR6p7E6FDt7fcxtEVNNGEskFs8e/vOTqdiu9LYF0Qn59B6eeLgXA92vZ+
	2nCJhwfmPQaxYTbX3yX/4e0BBODtOXOstn4ETqUoVU8a3Ign78m08qiadHCZUAH+q5yS0Nb1l3e
	fiqLx8hNcwL3jE5JTCQMLDzU9yNRVND+ofnkJ4kA+EijqBzhlewd4fTeOXl+OLSN+79jKcAvUhj
	UbmcXTE4P62aMMEjpFKD4MKMYj41IirlEAOKmts20HN+DIUItHBKRIdHtXYykDoJ0fXjnLEVJRl
	JzVHSiBIzabRupBaKsz46p0FR
X-Google-Smtp-Source: AGHT+IGgCIUD7M6ECZQJRdzu2jqNZHngkV78W33cvOWUPJjm0QDRw5slIx6w/NP4QNxQsAM3hrQnYQ==
X-Received: by 2002:a17:903:2286:b0:24c:cb22:820f with SMTP id d9443c01a7336-24ccb22858emr36280255ad.24.1756999078376;
        Thu, 04 Sep 2025 08:17:58 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:89a7:8cc5:2043:ebe6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b0637d948sm84720845ad.30.2025.09.04.08.17.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 08:17:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 4/6] default-distrovars.inc: Fix CONNECTIVITY_CHECK_URIS redirect issue
Date: Thu,  4 Sep 2025 08:17:42 -0700
Message-ID: <894648f4173a8a0e489e720e2b543cd22e39a878.1756998900.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756998900.git.steve@sakoman.com>
References: <cover.1756998900.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 15:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222952

From: Deepak Rathore <deeratho@cisco.com>

The default CONNECTIVITY_CHECK_URIS uses "https://yoctoproject.org/connectivity.html"
which redirect to "https://www.yoctoproject.org/connectivity.html".

Some network configurations with proxies or restricted internet access
don't handle HTTP redirects properly during the sanity check phase,
causing build failures with:

ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
Following is the list of potential problems / advisories:

Fetcher failure for URL: 'https://yoctoproject.org/connectivity.html'. URL doesn't work.

Updated the default URL to use the final destination directly to avoid
redirect-related connectivity check failures.

Also updated SDK test cases in https.py to use the corrected URL for
consistency.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 60cdf960a3560f391babd559737f1afb31fb2c5c)
Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 meta/lib/oeqa/sdk/buildtools-cases/https.py     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 85835c4c61..1eb39316cc 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -62,4 +62,4 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
 # fetch from the network (and warn you if not). To disable the test set
 # the variable to be empty.
 # Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=master;branch=master
-CONNECTIVITY_CHECK_URIS ?= "https://yoctoproject.org/connectivity.html"
+CONNECTIVITY_CHECK_URIS ?= "https://www.yoctoproject.org/connectivity.html"
diff --git a/meta/lib/oeqa/sdk/buildtools-cases/https.py b/meta/lib/oeqa/sdk/buildtools-cases/https.py
index 4525e3d758..98f27e5994 100644
--- a/meta/lib/oeqa/sdk/buildtools-cases/https.py
+++ b/meta/lib/oeqa/sdk/buildtools-cases/https.py
@@ -15,8 +15,8 @@ class HTTPTests(OESDKTestCase):
     """
 
     def test_wget(self):
-        self._run('env -i wget --debug --output-document /dev/null https://yoctoproject.org/connectivity.html')
+        self._run('env -i wget --debug --output-document /dev/null https://www.yoctoproject.org/connectivity.html')
 
     def test_python(self):
         # urlopen() returns a file-like object on success and throws an exception otherwise
-        self._run('python3 -c \'import urllib.request; urllib.request.urlopen("https://yoctoproject.org/connectivity.html")\'')
+        self._run('python3 -c \'import urllib.request; urllib.request.urlopen("https://www.yoctoproject.org/connectivity.html")\'')
-- 
2.43.0


