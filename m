Return-Path: <sebastien.raillet@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE046D15DA5
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 14:39:38 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.47532.1729521570887059335
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 07:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VHI3AP9/;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: sebastien.raillet@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43169902057so21275195e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 07:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729521569; x=1730126369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:subject:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ul6kCgTwPsxyc7XPna0cFntGE+mJzGRHRizY4u1rhFU=;
        b=VHI3AP9/FXrZ/kr5YZJRsI47mA9lmfIgt/2X7y8QdNLLAVCyYgw2KT5MGic6dQo176
         JYFL3oE1eSfVfc/b95GxAfQfWNMpJ5dJe12dZm1YKcycoTj8uiIssR1AAnyPhAUFEvlO
         SEkyUw/OueD2G6lJp+HzaG1CIOu560FGj/kTO2CO5l2N6C94sRGAJ44aZ2+YPP127zXC
         v/RQlBFnkYYHWNQ+tVLBsc1wb5dPvuT6mZs9IA8ObB2zq1U/w55vG3wIj290pYh8dKF6
         Vepk/alyn22F9LSf1MqaMy/KwyDzRqK60stYZpjFlPhuHbGLroBD81pLDjpETJdTvBEk
         97kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729521569; x=1730126369;
        h=content-transfer-encoding:mime-version:subject:to:from:message-id
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ul6kCgTwPsxyc7XPna0cFntGE+mJzGRHRizY4u1rhFU=;
        b=OCWtqxG5gfaDyMyMKhc5O3HqAfejdAz9+1qWYsi5brTXh0JGMXszIciIx5JrgD18Qn
         GvpB1VeEFjOYO5Jpa37tjEFdwFSNkPFMj14VBE5GsOBeHKt0HglPbT6sZ9Na25IHkCic
         rUQrVFcLPooJmMMuJDvW+WVpzaaCxjkxdEZ4tV1XzQX74ojgBP3kO5c6jNu/Ro76wvxf
         +eIIV6o0H+cY+kpZK7FfSPBUGqO2vip7wG4e9vOEZxHy6OcYDZZfbpEAGaG+9tAboiv8
         nGI7I+PRn8SoO+32enpWYYiKDRx80XXng7MGVYO/4vwhtlZ+QjQqgVxA6+/XXZD03XlD
         Y5dg==
X-Forwarded-Encrypted: i=1; AJvYcCVYP3p1NeZsrH+wlAhkEzYFqPh8CG3pd2zKrDAlsWHnK/NQYy8CR8QETu8+SMeSifk1PP1Ma37ynWq5kbFObMWH6g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx3P60mWQkhKG6BMSgguzK7ZLroHCHb4yoxdukMnKKPQEoRYX3s
	qznQgzvmvy9Ny2lch+fLdvRJnxc/h+EQFeNu4yUu/eN1NmF8qQ/s
X-Google-Smtp-Source: AGHT+IGjPknM3Ndz3q6/h2MeSTaeGAaFfbXqZxWCh5SngebuaU5g6yLvM1ym7EKJ3/ugj8UDJNSrZw==
X-Received: by 2002:a05:600c:3ba2:b0:431:2b66:44f7 with SMTP id 5b1f17b1804b1-4317b915ce2mr1683455e9.31.1729521568969;
        Mon, 21 Oct 2024 07:39:28 -0700 (PDT)
Received: from localhost ([2a01:cb18:8c9:4700:302d:654a:a822:90a6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5c2ca6sm60140735e9.35.2024.10.21.07.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 07:39:28 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Oct 2024 16:39:28 +0200
Message-Id: <D51K87UE3UQ8.W74RI71RDRD@gmail.com>
From: =?utf-8?q?S=C3=A9bastien_RAILLET?= <sebastien.raillet@gmail.com>
To: "Steve Sakoman" <steve@sakoman.com>, "openembedded-core"
 <openembedded-core@lists.openembedded.org>
Subject: [kirkstone] "overlayfs-etc: add option to skip creation of mount
 dirs" backport
Received: from localhost ([2a01:cb18:8c9:4700:2c81:cfb5:5407:5acc]) by
 smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0b93f92sm4426408f8f.76.2024.10.21.07.28.18 (version=TLS1_3
 cipher=TLS_AES_128_GCM_SHA256 bits=128/128); Mon, 21 Oct 2024 07:28:18 -0700
 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.18.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 14:39:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206123

Hello,

I would like to discuss the possibility of backporting commit
3d433d8559467d255bd19af2d0999c65ea24a48d [1] into the kirkstone
branch.

Currently, on the kirkstone branch, combining overlayfs-etc and
read-only-rootfs in IMAGE_FEATURES results in the root filesystem
being mounted as read-write during the startup phase. This behavior
may not be what users expect when enabling read-only-rootfs in
IMAGE_FEATURES. By backporting this commit, users would have the
option to disable this behavior if needed.

The commit I mentioned is conservative, as it preserves the current
behavior by default.

For your information, I have followed the Yocto contribution guide on
how to request a backport in a stable branch. However, if a patch is
preferred, I would be happy to propose one.

Thanks,
S=C3=A9bastien

[1]: https://git.openembedded.org/openembedded-core/commit/?id=3D3d433d8559=
467d255bd19af2d0999c65ea24a48d

