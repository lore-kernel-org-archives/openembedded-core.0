Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9042EB105C
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 14:26:48 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41253.1773152804143123695
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 07:26:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XT9BU08D;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439c6fc2910so4870023f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 07:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773152802; x=1773757602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l8vwxgvZq5hOSE4x7X/Rw7Auo0NT2Ug1C6WHA1Mk+0E=;
        b=XT9BU08DLe/UVf8O/ElEuShOu6DV72Puml0tpBD2QboMzBgG0/ylfeSxELpuLvw86P
         9BNKF5kU1iL9p0Xb3FwhaPOWfWKuHb+Xt2FzwFieBlEcQ9//wFadCtB3IiJOpyhlPBw2
         OF2L4Sz+727ida6ujDVg93feWwkhcwW6GXgbKwPPTixkXTDTg3ADzFB3wjN03RulCVXb
         tz3pVc3BNh8sXMyOyTbvhyXBVJ4vCwlQdOaZZ0cSt4lp4nzjivv/C/gt2k1kP26pjEY6
         nhGSZXY7WrayPe7f7Ejt+HHhemIDRVaDiqbvh5vDipIbi2CsRgS0kYeIg1TpYeBbV9oQ
         Lk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773152802; x=1773757602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8vwxgvZq5hOSE4x7X/Rw7Auo0NT2Ug1C6WHA1Mk+0E=;
        b=AmtAslbk+DQY2djSCRlyY+PpWDCbvj1xTRlRUhYdJix1ypzoEsTixWYpoZODonAvEs
         hwdoksAIN2hnwYuhIvqZbKBS7vb2W8EQ8svfF2Vns/RUdW8/X8x71kju7g3Z04Ge4DzJ
         Czky7Q4NWD3XjYNL+SJzI7gNcOrFTCt+1GMNuPEzrtcvLWZA6Wa89m1fO+HSgluEMh/m
         JojqJbwIvJyBNO2vobTPecQrFIM8Gj2+PgAlVkRe7w1LPPU8szy1E9qdRdTaiGpQ3oLx
         Al0qftOkRYjGVwviB40JJyYQ5E/4tpRyQ1/dBSGNa1D8ijVv36iwqdP7nZoS2+beJjxh
         szJg==
X-Gm-Message-State: AOJu0YxRN1H2SVNFFJP9ZCAhNEsGLc7JNNIoi8FWDe48V0dIqmRtzYvL
	n1oOKOauQNFDhetMMNw9D5VC28epDJxQIXuCSFprPi7NmiIDupPd6+TieSdxlyAM
X-Gm-Gg: ATEYQzzIfnHHE3SDLvSdQwGCZnovsVh+BMBELnTRZGt1/6x4orIlIllrJqGtFHHWRMx
	Y+el3nclFvmj2+sUIJpYiWu3jxu/c0YzXVjLh04ZM0WjylGQeKW8CV1Lr/Z32xJIsUIFfnz/JE8
	Elfbj+/AGYWgXDHDkeJ95i4+UCELPSQketTBT2eWfwvMGaBaFvxW4v1JximTGdlK0K9dQF8Drg/
	aa/2yK0PApR+C9BicxFQ7pMPq3T4vXsZAK1iHsmOmIc45B+j8axpJXKvqF6kUlt5Ycrqeb1OMBM
	pINl5N/LQKm00HzqRXkho07n8+SRHc4db0HG32/0A/TeSwGTMxVK8cGbdRUdDSIClpCMyprXr39
	Sr+rt4QRBzxHcsb5jjWgl1J5PHiElMdig6jejzzMNR0RSpHk2xuMYn7+VN3pjXMw0VkflwsEjdF
	dO42XgNO0584Dzf3Qr7Tc960wQkQ==
X-Received: by 2002:a05:6000:4014:b0:439:b858:1d44 with SMTP id ffacd0b85a97d-439da351ebamr27186259f8f.20.1773152802374;
        Tue, 10 Mar 2026 07:26:42 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2ba5bsm34825863f8f.22.2026.03.10.07.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 07:26:41 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [whinlatter][PATCH] lsb.py: strip ' from os-release file
Date: Tue, 10 Mar 2026 15:26:37 +0100
Message-ID: <20260310142637.199580-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 14:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232789

From: Martin Jansa <martin.jansa@gmail.com>

In gentoo the file looks like this:

NAME='Gentoo'
ID='gentoo'
PRETTY_NAME='Gentoo Linux'
VERSION='2.18'
VERSION_ID='2.18'
HOME_URL='https://www.gentoo.org/'
SUPPORT_URL='https://www.gentoo.org/support/'
BUG_REPORT_URL='https://bugs.gentoo.org/'
ANSI_COLOR='1;32'

' were added with:
https://github.com/gentoo/gentoo/commit/2f590e35c9d3d13d5673163527120b2de97fdc80

before that the os-release file looked like this:

NAME=Gentoo
ID=gentoo
PRETTY_NAME="Gentoo Linux"
ANSI_COLOR="1;32"
HOME_URL="https://www.gentoo.org/"
SUPPORT_URL="https://www.gentoo.org/support/"
BUG_REPORT_URL="https://bugs.gentoo.org/"
VERSION_ID="2.18"

The ' is stripped from the ID later in distro_identifier with:
    # Filter out any non-alphanumerics and convert to lowercase
    distro_id = re.sub(r'\W', '', distro_id).lower()
but not from version which results in a weird NATIVELSBSTRING like:
    NATIVELSBSTRING      = "gentoo-'2.18'"

And similarly the directory name in sstate-cache:

oe-core $ ls -d sstate-cache/gentoo-*
"sstate-cache/gentoo-'2.18'"   sstate-cache/gentoo-2.18

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/lib/oe/lsb.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index 3ec03e5042..1fc3b968a0 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -16,7 +16,7 @@ def get_os_release():
                     key, val = line.rstrip().split('=', 1)
                 except ValueError:
                     continue
-                data[key.strip()] = val.strip('"')
+                data[key.strip()] = val.strip('"\'')
     return data
 
 def release_dict_osr():

