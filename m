Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978C7C021A3
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 14:05:22 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.9247.1739023515887747423
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Feb 2025 06:05:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EglrgLqj;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2166651f752so67809375ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 06:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739023515; x=1739628315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZFF/KHM4rsJUiOpqAnV5ludirNYO0Brnd5Fvby+IEE=;
        b=EglrgLqjeVOHPNiMHTJEC3ytyWR7mscKjftvalcB/2HnbiQ5PQEhmXrcPgggQrTNfP
         HsmY9iJPaCHFKqflP8taOkLKXBQtfZqGsyyX1htoMBPV9YblBqWpjDXc2NRteffTvxhM
         dFB8HppOTuOuCL8Y8WK7TF9VsdMDmYvNiVIv0UjROelsDJO5z6W74ISCm8UsO9vBFU2U
         y2V+rDEslv57lWNv7qzyWhgaijR5xv95tCq80n0pYnna8hdIzdxsksugil2FYCC8hHI0
         348MkkLhKZcNQzFd2v+pAl3X1SSEALnVoCaDF+J825UIWeEDmtklIr6BfiMQdzIGhYwx
         91yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739023515; x=1739628315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZFF/KHM4rsJUiOpqAnV5ludirNYO0Brnd5Fvby+IEE=;
        b=Yd59DxMzYS5h22ZDLckP5VnbuK0iCk8olNrhYSMXRECAQISZ3oIdaKUMIqYAy6My3V
         lFdMoqPxwlXhd7I3qjkx7bJHQ6l9XFVYvq0lQuk3FJwEaRiRj8TP1IQVCd/fNL+/6/7h
         oGF4D4L9uqOCxdZ6vfr55OsaPt31ZucMrB8ITJE+M8QCZeD6hS4Z5BrkPmUg5J4+kIWA
         g2VYwtf+Hg3CFVZz+NtG6J4h3pttdRui+38gj3ijNulAKtriLHVlsB1P71tZYonRBeXu
         U2N/Uxc7Uh7AGPk6aQa4DvxBhIjdIRVuM6UhOv8qpKdLerPdbMF9W9nMM3gyPcrk5pxL
         oedQ==
X-Gm-Message-State: AOJu0Yx8vHdJGZJWD7WG/Q51hsS4/GTvuhPA/Zokl9Pcpu4tygJTaRyD
	S8025YO+5qcy/BrHnggbxZaxxQMZftAwSdL0Dn1FqH2hKVHqNbGQjYidM8H7FKAGo6wRgSIq3Ik
	B
X-Gm-Gg: ASbGncucuX33+uDpY9DmMSmhYbTHFEOKEabxqJsHX53AHHaYpMyPVXK9lVX2+wyLLwK
	oqStlADhM2jDJMlNSNQrPQPhYzsVV+/4xQNW2nxAPzBKBPAKmlhAMXD7aXCWdlim3Yur5tNIfSn
	ljPl52f/sE62WlVzem+fzuaOEZYX0t24elypt4ScT5ktvtAv4u2VOukAf59048nL9XmGFCEMFNU
	RfqqJYrhdwic2wb9lkPLf63D2cicpt1+F3aaaVPq7n9ikZPIiF6qib++pHtwSyw29FcmDUXAHz8
	8L5C
X-Google-Smtp-Source: AGHT+IE+W1NNIxlhNAV0fv/zH+YhSI+QqxenapPD3yz7sabZuhx/DgH+SBBQTdvX6hbdbSQa8FcIkQ==
X-Received: by 2002:a17:903:2f84:b0:216:31aa:12fc with SMTP id d9443c01a7336-21f4e6e6123mr104503185ad.24.1739023515225;
        Sat, 08 Feb 2025 06:05:15 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c820sm47278345ad.173.2025.02.08.06.05.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 06:05:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/13] rust-common.bbclass: soft assignment for RUSTLIB path
Date: Sat,  8 Feb 2025 06:04:55 -0800
Message-ID: <b71da7dd831d768d829c74f6137152f2ca6141b0.1739023409.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739023409.git.steve@sakoman.com>
References: <cover.1739023409.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 14:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211028

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
 meta/classes-recipe/rust-common.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index 6940093e59..b4b70574a2 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -13,7 +13,7 @@ FILES:${PN} += "${rustlibdir}/*.so"
 FILES:${PN}-dev += "${rustlibdir}/*.rlib ${rustlibdir}/*.rmeta"
 FILES:${PN}-dbg += "${rustlibdir}/.debug"
 
-RUSTLIB = "-L ${STAGING_DIR_HOST}${rustlibdir}"
+RUSTLIB ?= "-L ${STAGING_DIR_HOST}${rustlibdir}"
 RUST_DEBUG_REMAP = "--remap-path-prefix=${WORKDIR}=${TARGET_DBGSRC_DIR}"
 RUSTFLAGS += "${RUSTLIB} ${RUST_DEBUG_REMAP}"
 RUSTLIB_DEP ??= "libstd-rs"
-- 
2.43.0


