Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8896C6FD19
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:30 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.3921.1676835067675857978
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hDoVg2Wl;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id b11so1581324wrw.5
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGX6Auf+jjd8hoVksIdvudBvIo5ZaECuq9jT+qlPdsw=;
        b=hDoVg2Wl0CFvA5rUKuIZxFUJDtw5q/LXzjZXvGAQE1nhsvj9ntzEt19YvSJwT/Se2W
         c5tupfT6lCG8s64yqzWWwVbAgKLivBjH083odGwUk9ETEiJmHFlyhpTZ26nyvXHnVEhJ
         H5K2+AoYdrT4K65WQwT/tZSP/TNhgNISayDKySxywSkrjyV/qH327Hc31vWQ0/nqe/dj
         Abismbs0CFlSPG9PkbsLuzlMU73F0R7OXAtFEL1SsEvUukXSkXMdvsJixdZSlt/IemWH
         fONVAdm89EfESanPS1/1pNuDWEyLLAJIEeD/EUGjByLfx6kLDYinrL65zszEltP3bcYl
         2BZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGX6Auf+jjd8hoVksIdvudBvIo5ZaECuq9jT+qlPdsw=;
        b=aUP19AGvb3/p00OxZmNjuxZ9uLpfiwpQzskCFvlyYRN/gUbAf/yjmRufSSppUAwJvq
         wc2cJal6oUp8vkFiqmhkwaBL3gZYOQtvJdKCQway0fhLKAn3XB4tdLoIZXItrPLwZItk
         O2QLtaqT3/hpqTXUGcnkCgiARniFjuI5XlDlDF5X/nRAe/aO4aiEbUdBJi5t/etJ3vDs
         KJGk7kCxnWsYZi9FlBCNXhbX7wzOF3s0efGkDlM9UUHyodAYtPgWBp5P/SmrsF3NpzrI
         r2HNp4gBKW0cfoyZ8fwbkI9MqeqVvHQvUwyZU4gtnoOU2ohofMXVYnHtKqLjEyoRG/Xp
         u/0A==
X-Gm-Message-State: AO0yUKU9MsJ0CB7ueL+jJJ8akCPglxKQg9Zr7js2Vs2xOC/8W+5GDQxn
	PSPkDIPMzxrvholkaFlSA4E9Bo3BpZA=
X-Google-Smtp-Source: AK7set+R/I+SOpO1SzYbRvT5qfRaRqoO0PGhriax7WdHukPxz793d+2/VRVbiQ+d19OqbMLZ/9KqVw==
X-Received: by 2002:a05:6000:2ce:b0:2c5:518a:f6e0 with SMTP id o14-20020a05600002ce00b002c5518af6e0mr1324830wry.6.1676835080143;
        Sun, 19 Feb 2023 11:31:20 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/39] libwpe: upgrade 1.14.0 -> 1.14.1
Date: Sun, 19 Feb 2023 20:30:45 +0100
Message-Id: <20230219193101.338397-23-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177365

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-sato/webkit/{libwpe_1.14.0.bb => libwpe_1.14.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{libwpe_1.14.0.bb => libwpe_1.14.1.bb} (88%)

diff --git a/meta/recipes-sato/webkit/libwpe_1.14.0.bb b/meta/recipes-sato/webkit/libwpe_1.14.1.bb
similarity index 88%
rename from meta/recipes-sato/webkit/libwpe_1.14.0.bb
rename to meta/recipes-sato/webkit/libwpe_1.14.1.bb
index a08304d280..e63e1c8367 100644
--- a/meta/recipes-sato/webkit/libwpe_1.14.0.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.14.1.bb
@@ -11,7 +11,7 @@ inherit cmake features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "c073305bbac5f4402cc1c8a4753bfa3d63a408901f86182051eaa5a75dd89c00"
+SRC_URI[sha256sum] = "b1d0cdcf0f8dbb494e65b0f7913e357106da9a0d57f4fbb7b9d1238a6dbe9ade"
 
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.
-- 
2.30.2


