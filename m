Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FAF6C021A4
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 14:21:57 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.16901.1739370115765141060
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 06:21:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KMbM6hPG;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2fa2eb7eb45so1447642a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 06:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739370115; x=1739974915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHQWmEnk8ItbS3GvwNNcepmJE3U4xYNANJ6odoVN4UM=;
        b=KMbM6hPGBLJF6RCnOQWpdWG4PHrlIxhl9ld0u+DRrpze9xqRLc+YjxDbJQm3AFyQYu
         9oWhRtzwxcrWYHi0RW/++h3mg4Yi1QL4WcV6LkDj0zZVxQR77SvMZsfUIexQ21hRNIzG
         qlXjM2mrBWDdqucNY1swwJxpjjztB9aXsa8WyBFhFvIq7ViWuI2RLSaFyeKVCJI5hKoB
         TmcOBfiF5whARvwWVrMn2+yQJ15FDGHhuS5CmdI3so5cuwjJNzdXoK8naygZvi0xDvDt
         xMkLhwb56kdPxULkiKMqsMa0IAkQTyofCl/D19f1y+Yw3yeNaJWIiJTP0aRBzzUUmdMq
         mnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739370115; x=1739974915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHQWmEnk8ItbS3GvwNNcepmJE3U4xYNANJ6odoVN4UM=;
        b=mn8pG9hHv3E4Iq93OgPEJJvCAaIr752UDPWqcM5Y6pUSKGral6ppPCw5FHKcM2P67A
         NuqKpy6jy+L7npK2mRdM6gOE0VJpgKwbVu0mh5+IcmeYqeSEY2Z/uT+B9J54hkvtr7tq
         FR0I7yMY/EizG1DCaTIXjibQJHaEPDtYWAnGiVWRSQRKzkrs7mvc7HxSsRlRr2yIgo0F
         ohoYzlfYchPCvMu54RHYEf3jIYIRG6K1NT8QgmqYWtqwZnWhDFkimH1Uft9cnf1Ss/wT
         7xktcGZ/0szNOkrV+7+e3pq3FHQq6L3dELJq+9jPlJjw6l2I2ELHGLtm+rfBMTR/UrZk
         2Vrw==
X-Gm-Message-State: AOJu0YzNL1mIIVZEK/QIfv4mbayLpsP0cQpB+tLGMVaXb7IWZJEAFT3E
	m0hhP3x8IilY1B1IRhohWsT16l36XLGRPt553vmUB2H1cxUxlfZVWtj78hF5IojjJj+sMDA8N5c
	h
X-Gm-Gg: ASbGncvGiOoUrv6lorE+VfrVeTYDir6Lom6fnT8e89TesDpIp0lOF/uEPO+zq7qt1/5
	WH8HzMhcMfKvLwLjNXoN5e9Cy9xr/mop5JmAnb91SAb1nAr9GK9WS5kLTO716WLYlNv4qSxCnSW
	qyYAnc/kgBy0djH534dPV5hZPTAPa+Ws4PFOgdU5LbCDQ43ZvJKT1dVdN73xsX/qAXkAFu49Sqg
	0mklA+X1b6zgdq3qFWqEgesPdkkFSddJTUUXNoT9g5dTvhjRznAb3mizEPTJYXgg6DRaqDEusNx
	IFTv
X-Google-Smtp-Source: AGHT+IFSqgZGkHXE32VPkHSUPhrbAwe2wXu1PHM+WK0B7ADGYQKHKcfL7WnFGm+dDYcLO3p/pmbn7A==
X-Received: by 2002:a05:6a00:af1d:b0:730:89bc:f80d with SMTP id d2e1a72fcca58-73218bdd074mr9342046b3a.6.1739370114631;
        Wed, 12 Feb 2025 06:21:54 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73079facc59sm7445260b3a.123.2025.02.12.06.21.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 06:21:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/7] rust-common.bbclass: soft assignment for RUSTLIB path
Date: Wed, 12 Feb 2025 06:21:35 -0800
Message-ID: <d8ccc3ad338a8020c998566249af2019baaa6e44.1739369945.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739369945.git.steve@sakoman.com>
References: <cover.1739369945.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 14:21:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211239

From: Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>

As a user i want to override `RUSTLIB` path on a bbclass, lets
call it `XYZ.bbclass`.

If a certain recipe inherits `cargo.bbclass` and `XYZ.bbclass` the
value of `RUSTLIB` is dependent on the order of the inherit.

If `cargo.bbclass` is inherit before `XYZ.bbclass` this will reflect
the desired value of `RUSTLIB`, on the oposite, if the `XYZ.bbclass`
is inherit before `cargo.bbclass` then the `RUSTLIB` defined on
`rust-common.bbclass` will prevail.

Changed definition of `RUSTLIB` to soft assignment to make it overridable.

Signed-off-by: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 6eeb832f73ffb48f5f05dc47191f60e4599e640f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/rust-common.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index cb811ac5da..1c34d4c8b9 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -6,7 +6,7 @@ FILES:${PN} += "${rustlibdir}/*.so"
 FILES:${PN}-dev += "${rustlibdir}/*.rlib ${rustlibdir}/*.rmeta"
 FILES:${PN}-dbg += "${rustlibdir}/.debug"
 
-RUSTLIB = "-L ${STAGING_LIBDIR}/rust"
+RUSTLIB ?= "-L ${STAGING_LIBDIR}/rust"
 RUST_DEBUG_REMAP = "--remap-path-prefix=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
 RUSTFLAGS += "${RUSTLIB} ${RUST_DEBUG_REMAP}"
 RUSTLIB_DEP ?= "libstd-rs"
-- 
2.43.0


