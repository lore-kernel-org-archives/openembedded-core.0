Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A32EC43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 07:54:32 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39992.1782892464468722238
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 00:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QB/q70Bq;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9204711e831so28138885a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 00:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782892463; x=1783497263; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=59cZcbO/PWTRbqTAzgcn7rD7lcatOE2sPDAYm336I7o=;
        b=QB/q70BqyUT6fGqcn24y2mWhouuwvDRHC3fnxAt3NrY/W8610NpVRbRWd0wvUnFQNU
         8QGCzk3z8DLD/oITL90n3yhZBAsHdlPJ40MvvaVAKzb6KoKzgti7+yM6Y22KpPwWYac9
         uPfU7DECwvxDHAw18EtV172I5owJ8u8twczEv+KK6x0INZgTSEfu5umURHMonRkZzLZe
         6oi9CVaFCJzhf3uILERbU72Au1nPS/8sDm2zYmTiQIqSTOHndDdgi0egEGY3ji42Iu4j
         UbowXnjZ31CWrTsDilJaOYq/kG0r5hezrOe/kzJEj0uWinBk+NrTUUdLvTHo7mcw0vhq
         R6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782892463; x=1783497263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59cZcbO/PWTRbqTAzgcn7rD7lcatOE2sPDAYm336I7o=;
        b=pEHoZ3i982i1DRWCoqiZLTrQniCCx+af6xBAqKXM/4b8CfQC4krSnPHrLdHacoeh3V
         +DGtfzp2I7ypnjkAEHEjotIZKhg7V7V8ar5/W+KKFvZh0PXC+10roxwCmZgmug1GWTES
         I8gEa03qUsf2WfYebpJB/+yz9aekMO3q2sODKF3aKl2QaXHbce86WW4va6IbW/s2B4Yd
         3tqXygSYGnQaRetK3U8AZN3fe1E7FXh76f/XI4CftZHzsrD44Irv+6mRxw0JzqB8ROou
         cudssMX9sPmvUpduXBa/ej9OpZzsOU30BnMiDTaLWN5UObICdE8QLMTuQFTR0JW6j7tg
         JzQQ==
X-Gm-Message-State: AOJu0YyUBxoVQCuk6SEgr3c/PLczFwbWf6yAUT4OpOtANgm2gqt+M2H9
	uBlCkN54etXMzXtHETJYEDlbOKMBZLFzvsCCmFz7PQOwvDj7Q5T3idamB1o1Sg==
X-Gm-Gg: AfdE7ck1otWi0dxMdQEOMkkeiaVpyj/kiGiSvtHtr7K74/9gEe2OYB+mZPkUKP9h+ZW
	tSs3rKKrCrnCHqL7vN4MKQMLk8bRIXzqNvtEJvT2ASMh3XVWdcUMCkVArdIP7DHs2ls8zTUlVOa
	N1IUg59LM2LspaZmUWvq/ew8ztFKe1D5eUYXZwTGxctKDSY25MvdQi7s6/ra3XhT726MYAb9ort
	9l5c95jYG4uC1n+IP3j51yD5tT4yIUwoXs+3xcPBPUTD9OXBY4Obun6mxXvRVQOOA58+E/Y7jNE
	o+WQ/p82cFL7A5QtOXz7QRB2pnayztqRhXkjGSzpcr+oGfchWsscPZit/UAv5lM+3BWI/B0qXlj
	S14AFmpLnbvDQE4AwNYdAnYEve2Gs60BWdCelXaMmDJdlVWgJgHhxxvECHtcYjsRoQlDIOCGM+x
	crGHQaZ2wbsNxawzq8AA4rRo7LAWdgNFj2lL2Jm96O4OLQoLO9i+rRvIGjeQhwsZHvyA==
X-Received: by 2002:a05:620a:390f:b0:92e:5d19:bf84 with SMTP id af79cd13be357-92e78539318mr64541385a.69.1782892463233;
        Wed, 01 Jul 2026 00:54:23 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e62371ba1sm502294485a.42.2026.07.01.00.54.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 00:54:22 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] wic: ship the tools it needs where it is packaged
Date: Wed,  1 Jul 2026 03:54:07 -0400
Message-ID: <20260701075411.1092848-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 07:54:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239948

wic shells out to a number of host-side tools (parted, mkdosfs, mcopy,
the mkfs.* family, mdir, sfdisk, e2fsck, resize2fs, ...) but does not
declare them as dependencies. For the bitbake do_image_wic task this is
covered by the wic-tools recipe. Wherever else wic is installed as a
package it gets none of them, and its offline lookup (wic ls/cp/write)
falls back to the host PATH, so wic works only by chance depending on
what the host has installed:

  wic.WicError: Can't find executable 'mcopy'

This series makes wic carry its own tool dependencies wherever it is
packaged, and then takes advantage of that to offer it in the SDK:

  1. move the helper-tool list shared with wic-tools into wic-tools.inc
  2. have nativesdk-wic RDEPEND that list, so wic is complete wherever it
     is packaged
  3. simplify buildtools-extended-tarball to just nativesdk-wic
  4. add nativesdk-wic to the standard SDK host packagegroup

The native and target wic variants are unaffected; the tools are added
to the nativesdk variant only. cdrtools (mkisofs) is native-only with
no nativesdk variant and so is not included.

Trevor Woerner (4):
  wic-tools.inc: add
  wic: add runtime dependencies on the tools it invokes
  buildtools-extended-tarball: use nativesdk-wic
  nativesdk-packagegroup-sdk-host: add wic

 .../meta/buildtools-extended-tarball.bb       |  4 +---
 meta/recipes-core/meta/wic-tools.bb           | 15 ++++++------
 meta/recipes-core/meta/wic-tools.inc          | 24 +++++++++++++++++++
 .../nativesdk-packagegroup-sdk-host.bb        |  1 +
 meta/recipes-support/wic/wic_0.3.0.bb         | 18 ++++++++++++++
 5 files changed, 52 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-core/meta/wic-tools.inc

-- 
2.50.0.173.g8b6f19ccfc3a

