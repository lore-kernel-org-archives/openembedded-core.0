Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40630C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 07:01:53 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34899.1785913303457415962
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 00:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ktgJS6ee;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-527e352a167so3782921cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 00:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785913302; x=1786518102; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bA/BlmkNeMdDj1p4aaJK2s1yq5uxq1wIVX2X0QUp33Q=;
        b=ktgJS6eeIqHrIBRr8pIA8TZLuy5tSXOaffKZM2GZwPbYXhOHGK1NnBkhb8zb9jCgdv
         31PR40E6sb5PO5EThNHn0mkRFZWhGtDgtwaaz5qsYBpjV2stWuxENe0I0dK2X9KYyJ/a
         OJ/1uRHS9nUXIB2foMP7PaAxRhDBB1jJx1vHsPZkpp/3fnrv1hBYkgBidxHKgJrfZiO5
         Vr2X3Jyr+1peFeCda2uAU3mWtuvqfupnC2SKW0icQ83Xh6BUPJF0wDou4ZWxFDXZgiYs
         x/ct/BirtctDNcZvtHsRfhfYpCGNJWvVnrnNs0tuucDkapNWRQcjh3VyM3Lf8f0LjyIQ
         MbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785913302; x=1786518102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bA/BlmkNeMdDj1p4aaJK2s1yq5uxq1wIVX2X0QUp33Q=;
        b=HvZ6BgbxA4z37E4UtVyrPifYCyMAwl/9dJfFNiFyW3ndAfTdVTcZ7oVjGFXBQVxVSV
         cOiSAfgNOimjbL52h6hU2jC6SMK0iSygkwjVa9OcVYa2OtYRuTl5Lhy0JNHxO1e+b1oc
         v0eRjffEtpjMw1KEMEdbCe73WPL0L/nXIgoR9eOfyzRrEkVZun+xKbNIn709v3iabUcc
         owhzBlzW+EdfazCvmwvovWsZSvo++Z8zNnQiXiRvIeFZGcRCrZuX9jGAh3wW5izErJwR
         2zxVpthSxkyZm9tErrS+AuN0Z5gc3EkmCk1xOav0P/c4QHuh+e29880uh78cBcLZpe86
         dGTA==
X-Gm-Message-State: AOJu0Yyi5Wc9n+3UZkeqa/lF+b76r2f3Sq5OR4fe7emB5NKndjdKOy/x
	5QHWcV/OS4f1ZmXscJICG8H2bBee3G/yV0MZDj+Gs+lNLHqb97TyFSzReIU13Q==
X-Gm-Gg: AR+sD13rELwasNbHqnsLmy6fR8I2GmnF5cd1ks3dL9TmOpbrxU7S4Wd9EhWSCZpcjUb
	3KNTRuNo+Ei0SWTj0RtbfTYeJ7LDgLTO9e9YTMcHtKwExreBce+8kcZ2EHD+Wr062kBUNAS9CDy
	0Aq5uoqNDi3RecFauSYmE51D4dqnU82fZ6mjN7NQAWW/Rp3QDxlxfpmlK3H0cex7HcLPX2tBylm
	3u2I+pgPiBSX8F4nKm6EgjBXWH3QiN1UeS6v30GD2wDlWdPCZy/T+GOO1hjcdUb5sKlPVmT66yy
	OKzKJlux61Ye5xRkgOfVOmwAu8K6DrfA2vqgEbu7Llx3Ma09+xBoSjhJ2hbK5WeAsn3nnenbXUT
	4K5zekz0MR/p+1D+dBjkgIFc6vx5CL6VvYFNQouBU2JzLwgjvOLvex9Emc2bZAfasAVjlbhjv+k
	HclJr9Qip5yMCS+BSdlr47MJYfVcD/XqBVkDJrqSOjuAW6pBW9/2odqXVaRwCd8ENA5AyaBZFyK
	3E/wy6rDAYiFhONP/3xbdfmUoqXyJEIXxsifTaOMw==
X-Received: by 2002:a05:622a:13c9:b0:51b:ecca:f2e0 with SMTP id d75a77b69052e-52ce5f44c7dmr46880151cf.5.1785913302399;
        Wed, 05 Aug 2026 00:01:42 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52ce8975b3dsm13211661cf.30.2026.08.05.00.01.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 00:01:41 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] bitbake.conf: add an SDK_FEATURES lever
Date: Wed,  5 Aug 2026 03:01:35 -0400
Message-ID: <20260805070136.3499233-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260805070136.3499233-1-twoerner@gmail.com>
References: <20260805070136.3499233-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 07:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242831

Add SDK_FEATURES, a list for optionally adding features to a standalone
SDK in the same spirit as DISTRO_FEATURES and IMAGE_FEATURES. It only
introduces the variable and its documentation, defaulting to empty, so
nothing consumes it yet.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/conf/bitbake.conf       | 1 +
 meta/conf/documentation.conf | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1830cab753e6..c402f9f0b7c8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -898,6 +898,7 @@ OES_BITBAKE_CONF = "1"
 
 MACHINE_FEATURES:append = " ${@oe.utils.filter_default_features('MACHINE_FEATURES', d)}"
 SDK_MACHINE_FEATURES ?= ""
+SDK_FEATURES ?= ""
 
 DISTRO_FEATURES:append = " ${@oe.utils.filter_default_features('DISTRO_FEATURES', d)}"
 
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 1a6ec8fdd5bc..4c5a5ee8c233 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -362,6 +362,7 @@ SANITY_TESTED_DISTROS[doc] = "A list of the host distribution identifiers that t
 SDK_ARCH[doc] = "The target architecture for the SDK."
 SDK_DEPLOY[doc] = "The directory set up and used by the populate_sdk_base to which the SDK is deployed."
 SDK_DIR[doc] = "The parent directory used by the OpenEmbedded build system when creating SDK output."
+SDK_FEATURES[doc] = "The list of features to include in a standalone SDK, resolved at populate_sdk time. Analogous to IMAGE_FEATURES but for the SDK."
 SDK_NAME[doc] = "The base name for SDK output files."
 SDK_OUTPUT[doc] = "The location used by the OpenEmbedded build system when creating SDK output."
 SDKIMAGE_FEATURES[doc] = "Equivalent to IMAGE_FEATURES. However, this variable applies to the SDK generated from an image using the command 'bitbake -c populate_sdk imagename'."
-- 
2.50.0.173.g8b6f19ccfc3a


