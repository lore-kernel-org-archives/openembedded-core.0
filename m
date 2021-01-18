Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.3385.1611009433061217421
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 14:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fJvNHfx2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id f63so3215645pfa.13
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Jan 2021 14:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=BWkpwhUQZejktBlK+/g4Hkr2B+q7w4rHWurNBI34f3U=;
        b=fJvNHfx23/Wn5ALikAgnQU5IMm0HGPxdX81w0vD462tebyfcE/YV4FS/Fz9WfEd6M8
         g4jCqNvbEb4Pa+9HPoL1ULr41R3Tn1o5TQTJbq7gszvFmcRPIpzGRLMxxGaHGFQUemI3
         sDa7PbUQpSx5TOJUffoZ1K2r81I0irEEORPhkGtfjNZbkxIWKNytuoaoKc8NMYohrBzq
         UNaliTMkPciw1Vqrll5qPQDDWfh+0B2Xue5/tXjrl8mxAjNOr9957qKcrqXsJzYs29WV
         6M6uAU1QEXJPTA7p2eUlKAZmAPISGTX8NkbY3zgbgW1XZXRWBgDRfyHmdbsgzKNGDSSa
         nQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=BWkpwhUQZejktBlK+/g4Hkr2B+q7w4rHWurNBI34f3U=;
        b=ebOjvRu3VTqceJuxW/SsO1Yt/WZRgL10ogUAgahqWewhIvGaeo3FkXVutNlX8Sn8fn
         5k8Q7UD7MfqUBK7hw3hBEALlTRv7qtx73s6c08n8lUnMQGA50JK9IwdpO6DlMRkM1/Z2
         /YBpQLcf2GMaU5feTQN2V3tGFuWcfRyb/awXhiHlbBOLZSO4hdztqWzZOh7TksYrYBWc
         qDBHFSnRoj7TkuLjvIG73OY36A37FWRyiG7OsRv+wo0YKDOI6vmaUkV+a6WWJI/tE1dM
         NogR+9HTR5E1sGP5OUWvOnUYgx3NHAh6Bt0Z0tHgZNJTF8W6yhVv/z6l1P5D6SSJfIKu
         AYVg==
X-Gm-Message-State: AOAM533YAqlXL/Hemq2z+puug0mIvgSDXK5XuPradMCJRnm/8vPNsRDG
	x63JS7fcJcqHXHDrlHHGU3VM+LQ0Fg/wi6Q665c=
X-Google-Smtp-Source: ABdhPJwgqtn/79imw03q6KbHYRtXf3aj0ae/Ljc9c/mayWJH6ff6kcDkgx/M3MFX5HhicCWJaPOk0A==
X-Received: by 2002:a62:8c89:0:b029:1b6:5ce9:7084 with SMTP id m131-20020a628c890000b02901b65ce97084mr1375428pfd.45.1611009432062;
        Mon, 18 Jan 2021 14:37:12 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.150])
        by smtp.gmail.com with ESMTPSA id a12sm16835556pgq.5.2021.01.18.14.37.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 14:37:10 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/19] meta: toolchain-shar-relocate.sh: Filter out post-relocate-setup script
Date: Mon, 18 Jan 2021 12:36:11 -1000
Message-Id: <6c3c6d9c3addaaf942e8f029b44dc17fb3aa19fd.1611009050.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1611009050.git.steve@sakoman.com>
References: <cover.1611009050.git.steve@sakoman.com>

From: Marek Vasut <marex@denx.de>

The toolchain-shar-extract.sh script updates the SDK relocation paths in
post-relocate-setup.sh, so avoid doing this twice. This is generally not
a problem, unless the SDK path is a subset of the SDK relocation path, in
which case the resulting path is substituted twice. To trigger the issue,
  $ ./tmp/deploy/sdk/poky-glibc-x86_64-core-image-base-core2-64-qemux86-64-toolchain-3.2+snapshot.sh -y -d /home/oe/.local/opt/poky/3.2+snapshot
which generates relocation path
  /home/oe/.local/home/oe/.local/opt/poky/3.2+snapshot
instead of
  /home/oe/.local/opt/poky/3.2+snapshot

Fixes: 93ec145f42 ("toolchain-shar-extract: Add post-relocate scripts")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Joshua Watt <JPEWhacker@gmail.com>
Cc: Krzysztof Zawadzki <krzysztof.zawadzki@nokia.com>
Cc: Randy Witt <randy.e.witt@linux.intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5000aabe6ac336e7b424dafa1bf76271dee6a6f1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/files/toolchain-shar-relocate.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index 9c358a53e2..94d288ce05 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -58,6 +58,7 @@ done | xargs -n100 file | grep ":.*\(ASCII\|script\|source\).*text" | \
     awk -F':' '{printf "\"%s\"\n", $1}' | \
     grep -Fv -e "$target_sdk_dir/environment-setup-" \
              -e "$target_sdk_dir/relocate_sdk" \
+             -e "$target_sdk_dir/post-relocate-setup" \
              -e "$target_sdk_dir/${0##*/}" | \
     xargs -n100 $SUDO_EXEC sed -i \
         -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" \
-- 
2.17.1

