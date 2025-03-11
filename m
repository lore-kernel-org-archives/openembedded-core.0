Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 087CDC28B2E
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 10:42:10 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.5834.1741689728470367840
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 03:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=END9f4kv;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso2720735e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 03:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741689727; x=1742294527; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7RZuAgqryPgfR2+3suPbYftZYOYzI0CrvzEMaB9FBw=;
        b=END9f4kv4bF4fCgnTWw2FsmLwXUlQip0r08XkwTtPqsk2/zFlKXZk6unklBy1ZTBe1
         hIbWgVr0y9Hgux4i/qN5uolrnXOkZqCBBEQPcehx2v0nbQ2cCkDd8y78dmp0T+Iur69D
         p150n8dQVVy9+xXIAxCX+JAnBT8/f5C6pu4Ti/uhoBYso7UPbwDQT2dheaizqChvEk+m
         x4QQbUxaeHAzbG30OiDt0AMgv9D33MOD716Nz0JvkGBdTDqNFl4Pbg6zrxZ4hisJ1lS6
         wLV4paf+qEzwBviggqygrJHlmUrvxjPTmkv9517UqYn6qD1mVWpbbZExF1CHfgE9XOVM
         a1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741689727; x=1742294527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7RZuAgqryPgfR2+3suPbYftZYOYzI0CrvzEMaB9FBw=;
        b=azK3wi3pDCGSTm02J2F96hKK6pjvGgWc2ZElgWiv/qjSU1kqJ1ikle8OEwWCbkdRdf
         jMCrqMRNpgnMscykIb14FqbBJCryVXVHyIESJM1mPkSKCAOZU16DzAdTqYYGbHd+5gJZ
         WF0r2w+wgwVE1s9EKuU1UkExP7fzqfvcSsy3TEZgfUde6diBiyVJ9Weuc37FntxO9mg9
         TK4EwmiIuSxkN5R3ql+c2SsM9f3P3kr7txYUUI0C2r16jY2HcpgCrG4t9Nvrt/6fWErv
         lnPXzAZTAzwjdn4yJGLjtD11exGn4lUD+btPYrGb+6lfamulmX01spD3zN68PBRQ+ST4
         +Bgg==
X-Gm-Message-State: AOJu0YwxPZGW+OTuMrJo075xxYGHP2OpwnLDL2Do/eAtXOI/CS1hFjJW
	AHKAZ74YMpR0vHjk52UyOcqJ/PUD6OEpp3+qWIoo4b46kB2Bkn/ckQdrjg==
X-Gm-Gg: ASbGncvzPKlLrpveyBkbiI0mHwbmCmMB8RQxtOMnxJUNidECkO0UjBT2SDnzPtve/dC
	uuyZzmf3zdcyZOum2lCfEu9xjhLbkD1EhhQYOepS6FerlR5TXGHWj+JUMzszFADoZtquJyefTo7
	t808KOcReuXG6svWcJeRMJ0h92Y/Ac6n0Gzkafg7eyXZ4TlpaYcv5CLu8ChixSUnr5u249Cosyc
	DWMIqNB3H1quNQTL8AqPiIcdIIsOtIiC77JJTh+TZJIqYVk7GHMIKODlNMkrMaKbTixwFWSh8Qa
	Jst+21r4gwJvZUJqAtZxIUP8/J4V/xUlf8/So7+nRDhhnLZEU95UBo9l1RiAjjAEVDoc6pt/JN2
	soYwW3A==
X-Google-Smtp-Source: AGHT+IEpKDGD2ZHtcUt1cgHzrRBdq4RMH5A4GTfAhkvM4sGJCOTVnX4+czKTPFRyT8aWZPWNbaqlzA==
X-Received: by 2002:a05:600c:4e8b:b0:43c:eea9:f45d with SMTP id 5b1f17b1804b1-43ceea9f8b7mr88072495e9.18.1741689726789;
        Tue, 11 Mar 2025 03:42:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cee67ae5esm96201095e9.33.2025.03.11.03.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 03:42:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] scripts/install-buildtools: write download URLs to files for traceability
Date: Tue, 11 Mar 2025 11:41:52 +0100
Message-Id: <20250311104152.393470-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311104152.393470-1-alex.kanavin@gmail.com>
References: <20250311104152.393470-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 10:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212555

From: Alexander Kanavin <alex@linutronix.de>

This extends the previous commit, so that download URLs are preserved
in addition to actual artefacts. By default it's all written to a temporary
directory and erased together with artefacts, but users can choose
to preserve both:

$ install-buildtools -D --keep-downloads-directory=.
...

$ ls -1
buildtools_url
check_url
x86_64-buildtools-extended-nativesdk-standalone-5.1.2.sh
x86_64-buildtools-extended-nativesdk-standalone-5.1.2.sh.sha256sum

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/install-buildtools | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 1a68aad53e7..7bd6556edf6 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -243,6 +243,8 @@ def main():
         # Fetch installer
         logger.info("Fetching buildtools installer")
         tmpbuildtools = os.path.join(sdk_dir, filename)
+        with open(os.path.join(sdk_dir, 'buildtools_url'), 'w') as f:
+            f.write(buildtools_url)
         ret = subprocess.call("wget -q -O %s %s" %
                               (tmpbuildtools, buildtools_url), shell=True)
         if ret != 0:
@@ -256,6 +258,8 @@ def main():
             check_url = "{}.{}".format(buildtools_url, checksum_type)
             checksum_filename = "{}.{}".format(filename, checksum_type)
             tmpbuildtools_checksum = os.path.join(sdk_dir, checksum_filename)
+            with open(os.path.join(sdk_dir, 'check_url'), 'w') as f:
+                f.write(check_url)
             ret = subprocess.call("wget -q -O %s %s" %
                                     (tmpbuildtools_checksum, check_url), shell=True)
             if ret != 0:
-- 
2.39.5


