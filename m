Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30661D2ECF7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 14:41:17 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7889.1768920076065204451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 06:41:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TfKqJTLZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b86f69bbe60so850604666b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 06:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768920074; x=1769524874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vfuTM8V9GyHfEc5rkq9zBlc1ZYM47BPug8uIKyIFUk8=;
        b=TfKqJTLZtjMaeQDJwTNrAfvxF7on+Xon/46rwGS9M/1iUo1PtnRP/eBF8eUZHYsUCk
         SpdbmbPaJ1MOi5Aiu0ZqvS/QRj/jfjX+YfBFzLQmChY4vviKZ8fkPh/A0qdaUYuw5KRs
         nSN+TUaqZ8gAhnKAeFdLtwaXpey75F3GKV86LWLd9Nd57CxG7wMAf/KwsqyIxxcMnKhB
         K5ST4qtlDC7sOLMEiDc9SNwznltuSF7iursMKHVLgRl6oQKCsdYiFOLFp4dc0UERdyRe
         Dl15B6NC62WHFvF9c8bG9eodPnXf/hp0cA08GZXg/8GzGtKRO8ihYJ4T6vY81MeiID1C
         t/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768920074; x=1769524874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfuTM8V9GyHfEc5rkq9zBlc1ZYM47BPug8uIKyIFUk8=;
        b=OPDYPmPM3FSTf0gi8aKNoTRjM025tGJNisNrVfHU8rAhWV4EeWg7khVE961y6hvpX5
         UWJ3c/YUhaxj69EQ6UDgmP8ucBDl3qCmRvb6NZ3tCVx0yOdDt0u6paEOWltn+PwK+9vv
         f7m8RskycKE1chPVdb9PLDkFYGuHfRW022aPvdKm6HcNjHOOk/zJPPITaet8Hqts9x4+
         NVpYhZKp+Gud5XvaqGYXZbfSEZfiBg4dIdA9HbSlwvDhE/Rdc2VM7PnmfihghyZEQGu3
         nWrSBcIkYezcYYH+pwBeo1yrTZC9aRa0/rYVDhtR0XfW/6G2kJKmmGQMmuwe6IvYgZ0i
         VqXQ==
X-Gm-Message-State: AOJu0YzQkdlftaNvgrhI4tLqbdUR0ZYo6Mp5mEyg9ka3sGGLvHFo0lJ9
	tcpMWklg3wYaVkyh3ror7YJwPkhaQrZB5/PnYZmx4z8Ib/9VHT2DPX5BZhVbxA==
X-Gm-Gg: AZuq6aJiDIHfKq97KX6yHcAZB9FiMnNqQnBCP3Qg5bBvqNVVJRaMs5MfbSyPfUn/6pv
	VCTMzHlanTI7q8afl4C8zBTbuakqlvWg/5MMSTpgrKSa9agbuQQ2x3bNrGEJP2SaJyi4vmK3Zun
	NcX/V8vnLQWBnpAMHnJ4XOSRa99+Z/ar7ym2qGRji8+SG1dWD5Ajs6M0iUgRnFuODRwiYFSV+47
	lGWaFMw3961IdPgmPbyR8MSEwW3opMJLuPCyWcaj9SNRehRxWDhb5FWfttqD6aLJmlcM5DkPSrw
	J8HH5fR7e7X6pdC7dJ8h5YImkuH1NDbVaGjrVPDvMsmcMT06DhVNKe+VKZPqbJh16fGGmqfaR82
	Bi8i1Gg4D8CWtfeqO9HhBjQ6kGcwukcUHi5eKDRSBop7As1kuXvjKt04wUloER8Q6iptIsoDoGq
	80tsILV75uZSf7Kw==
X-Received: by 2002:a17:906:2090:b0:b88:dc6:395d with SMTP id a640c23a62f3a-b880dc63bb5mr152324266b.48.1768920073959;
        Tue, 20 Jan 2026 06:41:13 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c96f4sm1414905666b.40.2026.01.20.06.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 06:41:13 -0800 (PST)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] lsb.py: strip ' from os-release file
Date: Tue, 20 Jan 2026 15:41:09 +0100
Message-ID: <20260120144109.2973092-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 14:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229738

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
index 915fde4f11..60edf7cd89 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -16,7 +16,7 @@ def get_os_release():
                     key, val = line.rstrip().split('=', 1)
                 except ValueError:
                     continue
-                data[key.strip()] = val.strip('"')
+                data[key.strip()] = val.strip('"\'')
     print(data)
     return data
 

