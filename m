Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4820C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:20:48 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93246.1782742843669119627
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 07:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mpBYINl/;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-472a14c9965so1284338f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782742842; x=1783347642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mW+e/7DJFOaAiyIv8ftnsvWn4Bd08U2+LY+NJyoNksM=;
        b=mpBYINl/r8DiqDIqQyeOOmxd1Fu6NKLqAVC4l+iSWMzrijp8BQr4p5TAUCZ2EpSzpA
         JgscswnwuN+YCR6jLsgQ1tujszHT1k+P87hHiMkt1isgkHDrM6zGqrpnlRw5EAU9u+fC
         WLn5anEoApWUogpeYCOZaKVK796KcC2aQg/s0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742842; x=1783347642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mW+e/7DJFOaAiyIv8ftnsvWn4Bd08U2+LY+NJyoNksM=;
        b=ftvTDEDqTT5kHguc2a3AqBRfIZD3r+5VhWNx0hZan++nIgDo+LmwSA20IphX7CvU0b
         hKX9nBr5uT49mhAeUNNoBacfDgI+P78dGu+oqKgV88vcz47M1KTQyAbq9dWGHODktn6N
         HAJDhblKI//qiA454BfvLEKKhSEi30ziJNcwdpnOZ446pf6UjmzmZVPKT8MLwQVFhf/i
         JGXNjfWBR+b1Z5I/LpymOnVD++KbB06hmqX9xWHuMxQpGS6BeFQTBzo28JcVhfwFS1ug
         fqAPyWXFo6YUW9Wx9SDN/NpOErZNZtMKMiuiR588kTsq5sIe9T4tgN1g3SY0pZz48QNZ
         x8ww==
X-Gm-Message-State: AOJu0YzmP18WqIYKIFFcIjeV+9gsYiVbyYGuu0oaw0Rk/qj0ywW68qKY
	jTihGOwwVZTpqlqZzG+C2rSw8CXbGD1SfPwjPYULcbIAmnJwO1zymiKlBcZ+/kIB5epLz5fLdJy
	E11dlxXI=
X-Gm-Gg: AfdE7cn7WVtGaSVRCAIJCPdLi9tgU4AMv+hcjr9ff/F6AlpWHTThrmDFOcUlIFEDQWp
	UXGzONhm+5Wo+YUBfjWJZTCKVC2OhAVfY5pwIK14SXw9DcT8ZcFZYCH75fPs+KguDl7J8M3/dVN
	4OxfyHUCtahzalTvsGaN+Y5mxdtmM2uEmP2zknK/hMKM9ilP4AJ8KqvBET31t/49X5DgLoaDfiI
	kMzIpBZmxtDbcp5t8UAzVm42Iac7q38BoXnSg+Ht8YVS/gdbcAMV3+DLaWAKQdQ4J8j0gAhj2sa
	OaZQfoQXEoKDHOeINI2ID1/Qtzqa5wAkjChNr8BZCjF8zh7h6gZfjMavVdk/vLsPwY7EKTlSrzX
	jCm9rol7nFg+A2NCWZmPDftoUYhgmpyO3a6R8LyjNaoSrRtwagMTqUlWL06oBa5RPynqqpQt5oI
	h6wXvUHoRf43kLdUBQMR40ddj1P2K8xCpbTJWgNPZuiA9mlx2QMrL834qtyDDigR8kGmtjXMcVT
	iTy6IdNT7alTy6nnH1L0rM=
X-Received: by 2002:a05:6000:2287:b0:472:aaba:faed with SMTP id ffacd0b85a97d-47500d5e48bmr1190805f8f.31.1782742841822;
        Mon, 29 Jun 2026 07:20:41 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f8d6f10absm44958410f8f.5.2026.06.29.07.20.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:20:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/19] recipetool: Recognise https://git. as git urls
Date: Mon, 29 Jun 2026 16:20:04 +0200
Message-ID: <54ce24005721f5c82d42242524eaed93c8cbeafa.1782742373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782742373.git.yoann.congal@smile.fr>
References: <cover.1782742373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 14:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239807

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If a url has git. in it, assume it is likely to be a git cloneable url
and should be treated as such.

This allows us to switch from https://git.yoctoproject.org/git/XXX urls to
the preferred https://git.yoctoproject.org/XXX form.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cedc9209e3bae0da8d61423b16c74c49a132aa63)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 8e9ff38db6c..b6005b64766 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -366,7 +366,7 @@ def supports_srcrev(uri):
 def reformat_git_uri(uri):
     '''Convert any http[s]://....git URI into git://...;protocol=http[s]'''
     checkuri = uri.split(';', 1)[0]
-    if checkuri.endswith('.git') or '/git/' in checkuri or re.match('https?://git(hub|lab).com/[^/]+/[^/]+/?$', checkuri):
+    if checkuri.endswith('.git') or '/git/' in checkuri or re.match('https?://git(hub|lab).com/[^/]+/[^/]+/?$', checkuri) or re.match(r'https?://git\..*', checkuri):
         # Appends scheme if the scheme is missing
         if not '://' in uri:
             uri = 'git://' + uri

