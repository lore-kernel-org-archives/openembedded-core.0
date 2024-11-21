Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CAB0E64025
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:54:51 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.10488.1732226090734348566
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:54:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OFBbPJp5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-724d23df764so861519b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226090; x=1732830890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QIJxgV/5p9GcdzEVlE33eqafzL6l5SEnMn9lwQcjIbw=;
        b=OFBbPJp5WTsgdKGlMswWWqlFewQHI8mvh3evFJ8KOEF/iNLP5rxmzNtrTOcA5KTiLv
         2/hFMHJ7ardF1q59D/n8Sug5ecBmiJsb0u+APkg9DTAfYWnKYAt9aIjuf0RlX4KCRI50
         l8k8GA6345vdehfAkN/lDv1RX4ZIpkLMnSU+Uy6J81sjaoJyeGZWn2xPhCGrD9nkgFh9
         9gmLN/5MtwxI1C3KU7bAg7xhWwGFJIf0qEMpoQ4xQ7N8OQ/CArGR2fijW0nlG0Htn6c5
         zYHFZegHuYO39kjCnEp1x7/48HcwPm9jKudHdqtwG4QemEFtK64AcwQ8Vd+G2tS4WUH0
         ZbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226090; x=1732830890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIJxgV/5p9GcdzEVlE33eqafzL6l5SEnMn9lwQcjIbw=;
        b=lWza4wx/4Wy8DPDa4gazK94qzDKDM3F1l4xIcF0wz27gWEMR/gnNusLS1sgXt2hT0j
         neIDqXqEAdU+Yso5hAkUoFX0zMES6SV2cmYq9KQjxOWMyYQobdxCu7W+uaDuhUd1VCKW
         mYsG6xr1xP9acFiUuaRtNB2pWxhVmO94YtrCWzZpa/eflLD1zDXwin3ylO+tlAV0xDiW
         Bu/TFp6ZY7+1sFJPEuX8Be1IpPM9Pr/e9wNWMrwGmRaYc7QbhDrgF6OstxsSeP+7NJhi
         N2+bNY1azN5NlFwbauzT3vnMTVjBvhrhAyVa51mtBBpdYCOcgNoyuxZaFTUr1WEKkZHF
         VN6w==
X-Gm-Message-State: AOJu0Yx5p61GN+qvXMLWwdPryg/ajVFICjVNskSbRRKkJt/MsYnGpDrr
	puZSuVxbB8LaP5+xbdMN4UEqhc+ZcNvuvqXcoqna/iYp9Y43sBwnRyy4n++111Au0a326XGx12v
	d
X-Gm-Gg: ASbGnctIiskgmoTZUUd/xtk0psP2peBgqi12u9uP+2kEFEnw4K24FbkERnR2RJ8WtOd
	SUPDyGLc0SSLc0YX6wmrY6tnOf4/Zk6bzKXa5EAnzYCr1KJGkh+7KNcIR7s3CvuZ3CnIj9jE5ZY
	XgvPYjXnktmebDuAv5Jopsq4vaSv+U96pAcxI3c7Ps3knLKr8R8Rja3343vS1UGUoRQoXrJBGI4
	X2ClwwuDcejWP2C0eEjL4HXpTG5XSsJEfHbLN0=
X-Google-Smtp-Source: AGHT+IFBr1WOOTLFekW2MQ35HC81RXs8vLQo5E+SaIiILQgYsrDDdJ+1FrtUPRVHSymmUT0XD5itjQ==
X-Received: by 2002:a05:6a00:21d0:b0:71e:7ab6:8ea6 with SMTP id d2e1a72fcca58-724df6a9129mr645445b3a.25.1732226089957;
        Thu, 21 Nov 2024 13:54:49 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.54.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:54:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/27] cml1.bbclass: do_diffconfig: Don't override .config with .config.orig
Date: Thu, 21 Nov 2024 13:54:09 -0800
Message-Id: <f8f6a9fa6ff65a11c48d2e35ad0c0b6f94c3cb89.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:54:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207574

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
1) $ bitbake virtual/kernel -cmenuconfig
Do some changes and save the new config to default .config.
2) $ bitbake virtual/kernel -cdiffconfig
The config fragment is dumped into ${WORKDIR}/fragment.cfg.

But the .config which was saved by step #1 is overridden by .config.orig, so
the changes will be lost if run 'bitbake virtual/kernel'

And the following comment is for subprocess.call(), not for shutil.copy(),
so move subprocess.call() to the correct location.
    # No need to check the exit code as we know it's going to be
    # non-zero, but that's what we expect.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6cccf6b02f92dad514e65fd779ff659b19eb6be7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/cml1.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-recipe/cml1.bbclass b/meta/classes-recipe/cml1.bbclass
index 03e5fe6f47..456305a315 100644
--- a/meta/classes-recipe/cml1.bbclass
+++ b/meta/classes-recipe/cml1.bbclass
@@ -93,10 +93,9 @@ python do_diffconfig() {
 
     if isdiff:
         statement = 'diff --unchanged-line-format= --old-line-format= --new-line-format="%L" ' + configorig + ' ' + config + '>' + fragment
-        subprocess.call(statement, shell=True)
         # No need to check the exit code as we know it's going to be
         # non-zero, but that's what we expect.
-        shutil.copy(configorig, config)
+        subprocess.call(statement, shell=True)
 
         bb.plain("Config fragment has been dumped into:\n %s" % fragment)
     else:
-- 
2.34.1


