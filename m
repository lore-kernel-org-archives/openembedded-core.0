Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053E4C369A8
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 13:04:01 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.24695.1744374577953483992
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 05:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adriaan.schmidt@siemens.com header.s=fm2 header.b=AEEG1WUL;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-526363-2025041112293410f39ccc54b0c3912f-ay6kei@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2025041112293410f39ccc54b0c3912f
        for <openembedded-core@lists.openembedded.org>;
        Fri, 11 Apr 2025 14:29:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adriaan.schmidt@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=MSixNQc82s4HkhmPz0Bwo5yJHI07iMSkRc2Jjidplmo=;
 b=AEEG1WULKmGn0PUA1GafloQ9FjHoAgVT9J797vjJdVEU5morOdeFUERAxwlY2Vu59RUrQi
 sHFIfSInH+PiwtyNCLDmMgpPDRruiFNzsi+ORmB0IHRH8RDIxpB2FwY6vi4fTU+EaOena8np
 NbXUMCANcDFSobvyKxEsbMuTgA5wpRU9HlnNYGLI78tpuRIxkevCqzVHtYQZM2joIIG4n+Ph
 lYsS04GSwwqM0BnNxC/9FSv5c+0OT3RuAgIfoeajSict6Ixx1CX62/ociXhENQYGkxlz+pmX
 dUtMYw+TbUgclTYoyCq36cIwriYy6M4PHNGdBvTxTXqhW+zFwyPF/yBg==;
From: "Adriaan Schmidt" <adriaan.schmidt@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: adriaan.schmidt@siemens.com,
	ross.burton@arm.com,
	richard.purdie@linuxfoundation.org,
	raj.khem@gmail.com
Subject: [PATCH v3 0/1] libunwind: update 1.6.2 -> 1.8.1
Date: Fri, 11 Apr 2025 14:29:25 +0200
Message-Id: <20250411122926.706371-1-adriaan.schmidt@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-526363:519-21489:flowmailer
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 13:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214739

Changes since v2:
* better handling of the "problematic" ppc32/musl case
* remove --disable-tests from EXTRA_OECONF
* brought back COMPATIBLE_HOST:riscv32 = "null"

Ross Burton (1):
  libunwind: 1.8.1

 ...-Gtrace-remove-unguarded-print-calls.patch |  52 ----
 ...t-sve-signal-check-that-SVE-is-prese.patch |  73 ++++++
 ...c-or-musl-register-names-as-appropr.patch} |  23 +-
 ...compilation-of-unw_getcontext-on-ARM.patch |  27 ++
 ...ork-inline-aarch64-as-for-setcontext.patch | 163 ++++++++++++
 .../libunwind/0005-Handle-musl-on-PPC32.patch |  88 +++++++
 ...context-mismatches-between-glibc-and.patch | 247 ------------------
 .../libunwind/libunwind/mips-byte-order.patch |   2 +-
 ...{libunwind_1.6.2.bb => libunwind_1.8.1.bb} |  25 +-
 9 files changed, 377 insertions(+), 323 deletions(-)
 delete mode 100644 meta/recipes-support/libunwind/libunwind/0001-src-Gtrace-remove-unguarded-print-calls.patch
 create mode 100644 meta/recipes-support/libunwind/libunwind/0001-tests-Garm64-test-sve-signal-check-that-SVE-is-prese.patch
 rename meta/recipes-support/libunwind/libunwind/{mips-coredump-register.patch => 0002-coredump-use-glibc-or-musl-register-names-as-appropr.patch} (86%)
 create mode 100644 meta/recipes-support/libunwind/libunwind/0003-Fixed-miscompilation-of-unw_getcontext-on-ARM.patch
 create mode 100644 meta/recipes-support/libunwind/libunwind/0004-Rework-inline-aarch64-as-for-setcontext.patch
 create mode 100644 meta/recipes-support/libunwind/libunwind/0005-Handle-musl-on-PPC32.patch
 delete mode 100644 meta/recipes-support/libunwind/libunwind/0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch
 rename meta/recipes-support/libunwind/{libunwind_1.6.2.bb => libunwind_1.8.1.bb} (45%)

-- 
2.39.2


