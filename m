Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253E8C282DE
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:13:23 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.31830.1742141596600972521
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gM+J/Frm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so14960015e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141594; x=1742746394; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tuYs5wjmgSfHb8L0ZdE/YllJxyj+ubU4ikG1aktnt1I=;
        b=gM+J/FrmJnpktHCOAhcuo3k9cD3e2bwOdvbalfj9wChzcCmMv3vfOycg+DCbmRAW5J
         8CLg20/gDACh3SsWpCdFCl1m1YIOWL6iVG4hGXutZhn7+B+dzah366U49uhFzwMmRM32
         et9eHkAGQn2IHtIdxyc1WXHhZDncOQW6lUqcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141594; x=1742746394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tuYs5wjmgSfHb8L0ZdE/YllJxyj+ubU4ikG1aktnt1I=;
        b=ZVDfigGnI6B5sqMrE1jOsTfN9JNcPFqKGvCp3Bs3fnRq/M8/zNbCQT5Lhia+wn3h3S
         moHsMWp6HVlSJos6ZIzQVjd0YIkYWQDtvT5PxWb59TVGR98Q+JQMx8lEh0cWFdaZvibW
         dJpdwxaqoQFhdRSnETM8cz3THhCNDQaIienCNwMDTKyB6ofXO6Cvv9+E0He3bgPKZWWo
         OnWLSDRJSfbfJ6ASP7SUTWiiOMdATuJmbgAQ/XOGdx+Ep+jLVJInitOPMaOJcjDGwtKO
         KhTmhgepVP+I3SlHtsBpmZS0/2RoBLEGvMpSnOqkrdIhatFqBwb4KD+6kgKKV2vDbiQn
         PcZg==
X-Gm-Message-State: AOJu0YwPrYnnS+l0gpfMXuz2kI3Kv+WDKH63tzMC06qgmIg3VwJStBNW
	jn77orMyugamCUmNn0bWhlUvxpKOFIOrS9zSByd0ccrMFrrsvTRMszcEjp9rDJiFBZVClunS7tH
	J
X-Gm-Gg: ASbGncuKPcO/jgMfCYFRubpJ+3iwqVK6HIkAexna/qB+jlcwkWpYyux4mZTzVktUMrY
	rK83yKmNaQN3yEWrE1cqXnlbRIzfvx0cmEAHxoZqZTQu1iS3S9L/FEdCV3oDYjBl/X98gDpKg0J
	Qd43pRXY4ViPVX/72YBg1fmUlgF3bhrQYO8gOiG4WlP9EkNv2EBEurn9u1gAD9+LDURseUZ88Nz
	a/Pn3H9GCwLmef+yQwTQAdWnnVVwoc5SAJcisHKqLoDJft3D+O3AyAMPSQkUmkfSdOCwp+tBLjB
	QKO7JUxd8aruyH+KB/VmQvhntswSHuDC4XoTYfbpIiReY3kJabMPOgLVyPV7S/zlyeM9aIRKAQ=
	=
X-Google-Smtp-Source: AGHT+IH0e3tKuVTo1BwQwIVAKO5cXui5pn47UbhIJHZH4yh4Wt+hnGCNAPgZmeKf0pYgRL6VVZA3fg==
X-Received: by 2002:a05:600d:8:b0:43c:ec97:75db with SMTP id 5b1f17b1804b1-43d1ef4b23emr121191075e9.11.1742141594468;
        Sun, 16 Mar 2025 09:13:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.13.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:13:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 43/43] libxkbcommon: upgrade 1.8.0 -> 1.8.1
Date: Sun, 16 Mar 2025 16:12:09 +0000
Message-ID: <20250316161209.3629986-43-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213046

License-Update: Upstream made a large license header cleanup and summarised in
the main LICENSE file. Pull the resulting identifiers into our LICENSE
field where several different variants were clarified, complicating the license.

https://gitlab.com/libidn/libidn2/-/commit/61ee87ee229c811bd9bf945084645058249b52cc

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{libxkbcommon_1.8.0.bb => libxkbcommon_1.8.1.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.8.0.bb => libxkbcommon_1.8.1.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb
index a7dad3f4a2a..76a622e157c 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb
@@ -2,14 +2,14 @@ SUMMARY = "Generic XKB keymap library"
 DESCRIPTION = "libxkbcommon is a keymap compiler and support library which \
 processes a reduced subset of keymaps as defined by the XKB specification."
 HOMEPAGE = "http://www.xkbcommon.org"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e525ed9809e1f8a07cf4bce8b09e8b87"
-LICENSE = "MIT & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=70eff33050c59f900f5b83275dcf1211"
+LICENSE = "MIT & MIT-open-group & HPND & HPND-sell-variant & X11"
 
 DEPENDS = "flex-native bison-native"
 
 SRC_URI = "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=master"
 
-SRCREV = "76740e0c4583ae49675e7ba8213d31ee09aa00d2"
+SRCREV = "b3465081878e80ca6c11fe35c81787ec374ec15a"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig bash-completion

