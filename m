Return-Path: <andreas.stergiopoulos@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11030CD13DE
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 15:58:00 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.672.1762963077276123242
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Nov 2025 07:57:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ycEOBW2Y;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: andreas.stergiopoulos@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b3b0d76fcso714805f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 07:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1762963075; x=1763567875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oS4RODn0UOU0cY1B4GtTatz/YgjZP6SkDFY5qt21uro=;
        b=ycEOBW2YHLKwqom24yC9dX0zaCGQ813pCIwKJrIq7uIVdigMezu9xuq8pVvxe8LHZL
         FWAY7kgHBd9uxgADYO9B6SzngPKPSRC5eZ0Ig0KSDnDdepr6eTuKPJvLT/Ce2TyIHmr+
         kzTKiu7zX2Cg4WFJHav0zdpCqGEnS5C4mRIqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762963075; x=1763567875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oS4RODn0UOU0cY1B4GtTatz/YgjZP6SkDFY5qt21uro=;
        b=KPUJKBVdBshpGbAOEj2RJdYJukHgccABAkM9U2JKbVjERZt4bz4r3Pb39keaaMc7Id
         DApyXOe8crtVkn4FaELH8mozV1nCrIzEVEBJPQFkqbmmRGM4hDLwikIO+j6SrMMzyASr
         AiWXzr4zrxbnFYJa1fRw/RNmzFInK3a3TsFrgeFs7LRXhylnffHvUmqfGfmjUL0eCC31
         MeKNEqle1o9fCr7j5wmSId2b/22teQW5qxonVMV9lO8lqKFKbvYbReW24lVpQTuS19QP
         2hcKhMmEqAwoMnLmXRBUUry8bDVZArTNzW+orpMHb6aTlD8Wc9li4CESzrsmMWLbi3e6
         L6bQ==
X-Gm-Message-State: AOJu0YyDBM7ZVX+RpUrBNgb67N/tq8kpk74Uyj+Jm5zan5vyG2C3YE0p
	xANHvctFfT9bD9Jwe7PEo/PmMgHI+bmXv6+ndoUtcZ2V1u+znTrTi1qailsqKJimogUmDQ8LNUI
	b5sQM
X-Gm-Gg: ASbGncvYCJyVQAY16IJ3xEhFL/Xh8lHzfsq+kKGJogCAi+vFfc/RXzh85WQNDQu715A
	8RWfjvMxmIhVYDB0I1zW3tlz4fmDc9fJuy8q/V54TvAyJXd9TVvK6AsVPDbSKA88ufxbKskH2z/
	ChquiYSaDIMS86unaNESbBjMQavjyFm0gOLwivvMGGFaRgFzM1wQ8DJxJT5eFtQnQ8/MXKo9DNU
	nzCvrwxvRGpaXDYAcWJ0GN7PvICGdq7Auu6lXXKzJstna+UkvMvL2D8t36ab5hnNWqJ5vwXFHcS
	aKED4aKiVH3OXQvco/wfj23vZ+ArEZSdo7ZT1w289Dg1RNeQotDzxz1OIyHUtnoneBCAXPY/bxc
	XGBPiyEH7qHWtPgBehOgxxCAqVZl8mlX8hCMT7idhTdf2VKq/6huaju9cSD4mB2Uwv5gTw3ldpy
	tMIzPeGD1wda5gxHtN1JYsTM+SsMnq9eHUsUNgbHTz6KO8NInPk5u+aVBpFZZrB03WNhp8fwiol
	4CgEEErhkfaE97avb8qUKPjGkcpsAU=
X-Google-Smtp-Source: AGHT+IGGEcC1AOq63e0+wqjhn9CGhC55hxF5kQkHKSyYFzjoJRWEH09WTqOwF8WJzXL3r7Z51Wf0JQ==
X-Received: by 2002:a5d:5f85:0:b0:42b:2e65:6576 with SMTP id ffacd0b85a97d-42b4bdb3640mr2862436f8f.50.1762963075247;
        Wed, 12 Nov 2025 07:57:55 -0800 (PST)
Received: from FRSMI25-PILS.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe62b23csm33976612f8f.10.2025.11.12.07.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:57:55 -0800 (PST)
From: Andreas Stergiopoulos <andreas.stergiopoulos@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	Andreas Stergiopoulos <andreas.stergiopoulos@smile.fr>
Subject: [PATCH 2/3] cargo.bbclass: Collect installation paths of executable binaries
Date: Wed, 12 Nov 2025 16:57:29 +0100
Message-ID: <20251112155730.646159-3-andreas.stergiopoulos@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112155730.646159-1-andreas.stergiopoulos@smile.fr>
References: <20251112155730.646159-1-andreas.stergiopoulos@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 15:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226208

All the binary executables that are installed in the image are collected along with
their paths and then added to the cargo_bin_exe_paths file. This file is then used
for the CARGO_BIN_EXE_<name> environment variables, used by the integration tests.

Signed-off-by: Andreas Stergiopoulos <andreas.stergiopoulos@smile.fr>
---
 meta/classes-recipe/cargo.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index 2dd28e95d3..167040cb81 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -58,6 +58,7 @@ cargo_do_compile () {
 
 cargo_do_install () {
 	local have_installed=false
+	binary_exe_path_list="${B}/binary_exe_path_list"
 	for tgt in "${B}/target/${CARGO_TARGET_SUBDIR}/"*; do
 		case $tgt in
 		*.so|*.rlib)
@@ -83,6 +84,8 @@ cargo_do_install () {
 				install -d "${D}${bindir}"
 				install -m755 "$tgt" "${D}${bindir}"
 				have_installed=true
+				# Append the install path of the executable to the bin_exe list
+				echo "${bindir}/$(basename ${tgt})" >> ${binary_exe_path_list}
 			fi
 			;;
 		esac

