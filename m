Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20791CA1015
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 15:22:55 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.926.1756999373524283423
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 08:22:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fL/5TqiT;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b52051a2f48so164713a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 08:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756999373; x=1757604173; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alikxGrWMtVQVIuqeYrk30GmUgFp33qPWxWOgYpE1vo=;
        b=fL/5TqiTfkfvwjXJ4yV36MYU/J28fnovF65unB1tFQmuizrTWyfDyPn2V+2AfAUYwp
         bGJYwm4/T2Mt1Lzv5iymeeKK64p55RlMWKg8pChRfG/wKqxmvXJR5RoTAv/3Zksr+rGC
         AMXgCU9wm6+aZjS70BUB7a3BiiNUJ3ZRGieRiiBIRfGKEEHKq/fx8eyRfs62o3lRf1I1
         34g9wbheHqj4BpEfONAepKNTSFh7Y9jY81+UNn0J+/y78HvoCKddRAkVhj5drjjDcg9X
         XiRQMPUAoTT9sCjde+poaVcbYux067ZmYJlja97uVNoyja/tEdxaxWyTOMxBX5gvdsHJ
         KLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756999373; x=1757604173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=alikxGrWMtVQVIuqeYrk30GmUgFp33qPWxWOgYpE1vo=;
        b=b9UYfTGeNU/wJRKCuGZpH9/Vn1i57hN4O/KpSB4OVc9584X/6k7GgcOjU0uyNFmrvS
         sFDiJplDonA9G1HNEC0pxqXIobM4zEkEFAAHEQ9Iv+p908DRxiQPF2huBL84lieTujvw
         lUrvOr7lpjETGBp/ULLp+gK6ZjhN/pLScs23nSiWyak1T6QDFrEFlJuE4MpSij4z45hB
         cN2U+AsjWNcdyxD9vNV+4sMrJEv8u1M4gs16NmoEFYDt2UETrmaf5ke97cdf0KkYbs2o
         oANVBkstT7Wbcbfhxy4xVaBf591KroqWzOj49Z7puGxJQMP3BlcJJCjrg+x3kIRweLC1
         m1dQ==
X-Gm-Message-State: AOJu0Yw0Eb9fVE24Fs0QWyTWWBUkCpLuHZmcpnEJR8e7xFh1nW/fQ094
	PQiohkiopeZpP2/5pkBY1TMViMWx2Y/fX4wkrim4HkMIqMhdbJIEfgSPoH6NK6MAFJ+KAZyNa3x
	lO/Os
X-Gm-Gg: ASbGnctN8j69tfbQ0o2gmEdDk3NoNRFwg8pF74vNgSZLy2GHskdjqkKqnsIO1nw19XU
	4jdazgFPu/ezQDiUzOdhSl8ZMHgkvFeqXvpwbyECtxku8ZEiPpCpIv8ubitrvYIiavt16dA6zDe
	FM6Tm3xqQaSfBSfbM/gOHqtGeXqsuWm9NUvvzvEuIeLMVn2zMiPqih9Wq5/8ofcKuj0xbs0tW6H
	PdcTra/y68LaMhd+vtcZsRdnWe6iyZekUM8RTiNaKYLs1W3Xr9HOcPyepfWk50wn1mbPJGMSidv
	wD7CLtMsPbUC5+mmxObaprcF0dSstQVKsjIp2sHYR2brUuiW58kKI8tLF7aGZ6ug/OIn86yDRLY
	b2yCo9aY2KXosUNJYNUUIYAER
X-Google-Smtp-Source: AGHT+IE0fFN7Oz4yynCG8JRFvdYF4KiBz8kcektI9e/smh1lIn2YrwLvM+8es3xaknuG7h0Wg//3gg==
X-Received: by 2002:a17:902:ce89:b0:249:1128:582f with SMTP id d9443c01a7336-24cef527929mr66765ad.17.1756999372662;
        Thu, 04 Sep 2025 08:22:52 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:89a7:8cc5:2043:ebe6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b11448a5asm82528085ad.54.2025.09.04.08.22.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 08:22:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/5] default-distrovars.inc: Fix CONNECTIVITY_CHECK_URIS redirect issue
Date: Thu,  4 Sep 2025 08:22:36 -0700
Message-ID: <bd624ebbcf4e6d7a24c4ab232ca2e138b1ac3433.1756999195.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756999195.git.steve@sakoman.com>
References: <cover.1756999195.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 15:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222959

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
index 7554081e8b..42e6de216e 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -61,4 +61,4 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
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


