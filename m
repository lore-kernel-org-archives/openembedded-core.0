Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27809.1792952682142337554
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 11:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=FLDgPPDa;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-202610251824398d2d603c5900020731-lgygx_@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202610251824398d2d603c5900020731
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Oct 2026 19:24:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=xR6GorirLtpfWfc5edmtjLN8tw3m8lmXbyXOBtEEGUM=;
 b=FLDgPPDaezzhub73kPCQY7JjhaoOy7XcZ9uNhdUeGA1oHEyzglt80eyfzKb1dxsPEAGX2u
 uv9fRoYyOlv9gOEpd8bqfXDfRO91u7eOAryQydFHeePPV2+3zL+FypIMn+cM5emYCihmkJ6f
 TlI5f9ZevgkxElG7JVSWgLBNvLkvR0ab4QZdlKn84lIaznZpsI6/aYs7yo1M4VWNiQg7nZqk
 GiDrcNfqNDxRp+B70bN8f9hXa504bg0sHQKnPvNOtFmrov0BdLUGAZjNVZjxSS9OtAep0PhO
 FV3QkBB8o88NZmIDJMVbQI+Al/l9J28fwEk8Qs9Cpd1ShuIovkDpXtxQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v5 0/6] uboot-sign: sign the SPL FIT configuration
Date: Sun, 25 Oct 2026 19:23:53 +0100
Message-ID: <20261025182436.788918-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 18:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248619
Content-Type: text/plain; charset="utf-8"

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This is v5 of Marta's series:
https://lists.openembedded.org/g/openembedded-core/message/247413

FIT verified boot is currently receiving a lot of public attention,
e.g. CVE-2026-33243 and the talk "FIT Happens: How Secure Boot
Wasn't" at OSS EU 2026:
https://osselceu2026.sched.com/event/2RaWy/fit-happens-how-secure-boot-wasnt-ahmad-fatoum-pengutronix-ek
Signing the configuration is the minimum U-Boot itself recommends,
so I would like to get this merged rather than let it stall further.
Further hardening can be done on top.

Migration notes for users with SPL_SIGN_ENABLE = "1":
- The FIT configuration is signed by default and the public key in
  the SPL DTB becomes required = "conf" instead of "image".
- Custom images added via UBOOT_FIT_USER_SETTINGS which are referenced
  by the configuration need a hash node, otherwise mkimage cannot sign
  the configuration.
- The old behavior is available with SPL_SIGN_CONF = "0" and
  SPL_SIGN_INDIVIDUAL = "1" but triggers a warning.
A patch for yocto-docs documenting the new variables and the migration
is needed as well.

Changes in v5:
- Patch 1: unchanged.
- Patch 2:
  - Drop the hunk in KernelFitImageBase._check_signing which used the
    undefined variable req_values. This raised a NameError in all
    signed kernel FIT tests. With UBOOT_SIGN_ENABLE = "1" all kernel
    FIT configurations are signed, and unsigned kernel FIT images
    return early from _check_signing. So no check is needed.
    Fixes: https://patchwork.yoctoproject.org/project/oe-core/patch/20261008060935.4225-2-rybczynska@gmail.com/
- Patch 3: new, enhances the selftest checks of patch 2:
  - Check the image signature and the image hash nodes independently
    and verify that the nodes of the disabled mode are absent from
    the its file.
  - Use the configuration name instead of a hard-coded "conf".
  - Verify the sign-images property of the configuration signature.
  - Verify the required, algo and key-name-hint properties of the
    public key in the deployed SPL DTB.
- Patch 4: new, test for configuration signing (non-default).
- Patch 5: commit message typo fix only.
- Patch 6: new, the non-default test now covers image signing.

Adrian Freihofer (3):
  oe-selftest: fitimage: check image vs. configuration signing
  oe-selftest: fitimage: test SPL FIT configuration signing
  oe-selftest: fitimage: test SPL FIT individual image signing

Marta Rybczynska (3):
  uboot-sign: add the option to sign SPL FIT configurations
  oe-selftest: fitimage: support new schema for uboot configuration
    signing
  uboot-sign: enable signing SPL FIT configuration

 meta/classes-recipe/uboot-sign.bbclass   |  86 ++++++++++++++-
 meta/lib/oeqa/selftest/cases/fitimage.py | 130 +++++++++++++++++++----
 2 files changed, 191 insertions(+), 25 deletions(-)

-- 
2.56.0

