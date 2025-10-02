Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5778CCAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 19:40:39 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.2906.1759434032126159179
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 12:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NNo78Urp;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3635bd94dadso12267561fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 12:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759434030; x=1760038830; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e256ojdplFU/Eixfy3mLrfL9N8FLsEK8CpJVnHqU+yk=;
        b=NNo78UrpcpYHv9nN83x7k59oi83gwpjOL5E3lNgNb+Fgawy8y6nFXxfWZqXKL/AgDr
         X6d7rvlvpWGDkzj98swAbcvwjlyKDDU9+e7bwuTGujVaMOI/DYr4BUdBzK6ZlzFYfdZ6
         kEB4KPJQ2Xu8iOQQj+/3Dtny1QWQAnviZ6b5020CPYl3RbJQBujuoUo2dI9QTCqGKjuZ
         ug+8/PIN/tZ1mWINY4Dmjywq6oIz6doWmoSh1hrB0eyBh2PsxGu34phKUHuGtqCd7SqN
         X2UACCoyPPPD+QfB2V81sdaPYqDn+ckWQU/z0iDz1ZysuSrDEuHvYhxiK5sO46GbcnSL
         BUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759434030; x=1760038830;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e256ojdplFU/Eixfy3mLrfL9N8FLsEK8CpJVnHqU+yk=;
        b=q5Mfk/ToXk9GSke24KbY9ld75IosFPPt/yriip3NjJOe6et2g6FPx/lvIMEcrcI3oy
         pMCKS/QL1oeNJHIBNTzOKjBgdNZKRXuyCbEpOs7+KIrhcoSo/3Hb4mTJckKUiOly0rtP
         wKW0LcTpH8Tozy/PeaEnIg6tJ5JO+gCLWNx8OAtCClhRV597/Kj6drHvf6bOe7MHZ3hT
         aYx8spk5v9Ju+BrMZHP968xAPMfjaDsrHi9fCZjhXAaYqxCuJta4zfmZ00b0r3m3fS2T
         I5QMHd0TomFEtlLMclYmye2vCLCrm0Kozia+opT6OnxlJ4AU1nJTyhBo+ODM/hV6eyhJ
         l7oQ==
X-Gm-Message-State: AOJu0YxPWpAa/u6a1Xle+ave0L9/kb7XNeKqn5776Y3H98cU5zKyR5Ly
	ObsRn/QnLW2e6PnGo9jxh4Ei54VqGIr4XObbMWEvEsrw8b5QuHov+C2tyo+624etZyUALKVOMUh
	aQFoTUUQGIJVV6rTrKV2Ot/h4S5Gmq5oGSGrd
X-Gm-Gg: ASbGncvij87F2+LlCy366N9GDsZ55bAd/sp4COxWfYXIDNlfQUo8ury700v/hq/5kj+
	l8VsCdfjsfh/pmrKKehfvr+AiqAzIKs1PeQpFQ53B37IXuk9bMqBevu2mMyKEcxqA9SDpVQU/xq
	x9dt63LBAOFwLGjuYCO7DoliEZlCEEG9ZOScPsXg3IK2hXoVZ+kNLwx8vwWJaeGCMkU2RHb3nEQ
	yG+NzIIe2Y5vWzJ95VSklcXpQc7WoVGFjsvIbm4pzH1d8MVr5Ej4FP6bD2PRw==
X-Google-Smtp-Source: AGHT+IHJBSt1U5tStRZtzcm/hgVb4hOOx2Wpwiez4Xs6TLn9CDYWkZpWMmS2vHNokPy2OXRsOyUtx85mA7Xw0suZDzA=
X-Received: by 2002:a05:651c:b13:b0:35f:d228:2a5f with SMTP id
 38308e7fff4ca-374c36a70f2mr946751fa.2.1759434029633; Thu, 02 Oct 2025
 12:40:29 -0700 (PDT)
MIME-Version: 1.0
From: Tom Geelen <t.f.g.geelen@gmail.com>
Date: Thu, 2 Oct 2025 21:40:25 +0200
X-Gm-Features: AS18NWDCF1R_lYGTIBZ6f4JIsEwBel5ERyi53mAwcCLKTSy6HEoHIAY6QIqON3Q
Message-ID: <CAJo0Az632gtPBnWcszxzodqHTnagfqCDW5_d33WnbL_m_Hoezw@mail.gmail.com>
Subject: How to have multiple rust cargo vendors
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 19:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224379

I'm trying to create a recipe for uv (https://docs.astral.sh/uv/) to
be added to meta-python.
Problem I currently cannot seem to resolve is that I need multiple
cargo vendor support.

I have created the draft recipe and added the inc file with the crates
using the update-crates command.
However it missed several crates as they are not from crates.io but
via git (see below).

How would I add this to the recipe below?

SUMMARY = "An extremely fast Python package and project manager,
written in Rust."
HOMEPAGE = "https://pypi.org/project/uv/"
LICENSE = "Apache-2.0 & BSD-2-Clause & MIT"
LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                    file://LICENSE-MIT;md5=45674e482567aa99fe883d3270b11184"
RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"

SRC_URI[sha256sum] =
"e6e1289c411d43e0ca245f46e76457f3807de646d90b656591b6cf46348bed5c"

inherit pypi python_maturin cargo-update-recipe-crates

require ${BPN}-crates.inc

SRCREV = "d8efd77673c9a90792da9da31b6c0da7ea8a324b"

PYPI_PACKAGE = "uv"


[[package]]
name = "version-ranges"
version = "0.1.1"
source = "git+https://github.com/astral-sh/pubgrub?rev=d8efd77673c9a90792da9da31b6c0da7ea8a324b#d8efd77673c9a90792da9da31b6c0da7ea8a324b"
dependencies = [
 "smallvec",
]

Regards,

Tom

