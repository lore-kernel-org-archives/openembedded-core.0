Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E05C3DA61
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 18:23:08 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.1255.1721326981409249581
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 11:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EkQUyIma;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-36868fcb919so80618f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 11:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721326979; x=1721931779; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lYeCAc5CpOUpaZbmGZeEuC5UX8+doVfgTJsCw3KaZkQ=;
        b=EkQUyIma87FI63pwdGkSZoVr1EOFifmJ+65Ftr6HlxXeio43rrIJn/oHPKKcfKpW2o
         +kOG944vu8NfrIEL300BDAJRoSe05LgQe+h0C4zjsv2ulskfLBThryeYGjti6Cdos3GC
         AoGllbJ7gnPku/E15IBK3lidL1kafe8qWNwGp3n5fiesXrSUz4WwV04ZxPAjMkQxpm10
         1IB8pdVpgmppJPvoYzyJW7ftkK77iEpKBqrrCagur11kxLZhui3sBdPkXnlixsNgYtoM
         QaKrNxE2tl+4wY1f2vYnszuanQd6roZafd6jRTjMVdl5jERTrVOB4YIF/QbbCr1BZG75
         klNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721326979; x=1721931779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lYeCAc5CpOUpaZbmGZeEuC5UX8+doVfgTJsCw3KaZkQ=;
        b=fh9XhhfKvTqtbDnUY7d9evLwRdJS//tlqMc6hSJrsANpbXZp7qMZskwGUo1WKXaY9v
         Lx2+ym5e5+TnCoP19mGyQ/D7qirfE25D79jBnyfQKw/usXVohlw1OPcRJ6rc26hDrpNA
         dFSMZm7O/hZ9O8wKYuvqA5rxQK36jsc+H5mcrHgQNJOi0NOoKJHyGW37Oz3zfVqm2Gox
         EaqzFEEt5KKSmzBx/DkurgE1cpoG3lV6EmSFj7uz+SCDHfynJyFt2E9B/lA9ACd+Uy5X
         IT/qDaPAXkSlwNK3hkyEs7mQNsYMSKrQ+Fx3pYEBjJM5nTravXkTBv2ZbNUCLSz+lLh1
         Kd3g==
X-Gm-Message-State: AOJu0YwPinDt1SSRgfR1q+4I1vJLp7sxoUTdCFgSH7DjcB5RFtc7Ny0n
	J18nqs6/7K2UBu8NZqzAQd2Xe8dOOYFyIip6E8VLlXB7lPJ9i7eJq67zlA==
X-Google-Smtp-Source: AGHT+IGJI5HwrLtINPE28/GM7rYvwaKkxetja+Fp8nWIO+nF6gid6W1r6/+I7uPi/FkSCNwdL8/Waw==
X-Received: by 2002:a5d:4f04:0:b0:360:744e:4f23 with SMTP id ffacd0b85a97d-36831732f50mr4137969f8f.63.1721326979250;
        Thu, 18 Jul 2024 11:22:59 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368728551c7sm281410f8f.79.2024.07.18.11.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 11:22:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] gstreamer1.0-plugins-bad: add PACKAGECONFIG for gtk3
Date: Thu, 18 Jul 2024 20:22:51 +0200
Message-ID: <20240718182251.1164328-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 18:23:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202235

* gtkwaylandsink was added in 1.21.1 version:
  https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1515

* gtk3+ could be autodetected (e.g. as transitive dependency from opencv)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb                 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb
index e549728c20..6766a8c19a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb
@@ -46,6 +46,7 @@ PACKAGECONFIG[dtls]            = "-Ddtls=enabled,-Ddtls=disabled,openssl"
 PACKAGECONFIG[faac]            = "-Dfaac=enabled,-Dfaac=disabled,faac"
 PACKAGECONFIG[faad]            = "-Dfaad=enabled,-Dfaad=disabled,faad2"
 PACKAGECONFIG[fluidsynth]      = "-Dfluidsynth=enabled,-Dfluidsynth=disabled,fluidsynth"
+PACKAGECONFIG[gtk3]            = "-Dgtk3=enabled,-Dgtk3=disabled,gtk3+"
 PACKAGECONFIG[hls]             = "-Dhls=enabled,-Dhls=disabled,"
 # Pick atleast one crypto backend below when enabling hls
 PACKAGECONFIG[nettle]          = "-Dhls-crypto=nettle,,nettle"
-- 
2.45.2


