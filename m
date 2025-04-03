Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9125BC3601A
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 12:57:51 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.8256.1743668386438686824
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 01:19:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adriaan.schmidt@siemens.com header.s=fm2 header.b=UTRy45Ya;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-526363-20250403081942681b53516427fb6041-gmjqdu@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20250403081942681b53516427fb6041
        for <openembedded-core@lists.openembedded.org>;
        Thu, 03 Apr 2025 10:19:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adriaan.schmidt@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=F9vCf/3nSrHC9JfLzbBceO12uv63PnzePMoMPuixhwE=;
 b=UTRy45YajJBLvfeM4uZXqh2m/7EN3F405tm5uK7x2+UgjcTSCLdRMDStkH3gbseMOBaDbk
 g7TuccEo5mils6dJsr+IZanJ6MaQfJoXdG6aWkNN3gg1jsz002Wim9SL7CiYac5OvT3B565G
 nYb71D2X7w0ZWR/oMZLLIJouiHehL9OKqvl349UxPP/No0J4M77G+A/P7hgzbJf9cpWVtWel
 BQWgTbY9+3JzlL/AKLTxPTgZT0ctajarxVpFjA3zqdEhVYkGVR/anPinFBvLEifz5ewfEU5D
 U0IECnfYnm8qhdX/SJmz/Ra3JUzfYkgl6JKs+Z+cRXF2rOmtobxPbxmw==;
From: "Adriaan Schmidt" <adriaan.schmidt@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	Adriaan Schmidt <adriaan.schmidt@siemens.com>
Subject: [PATCH v2 0/1] libunwind: update 1.6.2 -> 1.8.1
Date: Thu,  3 Apr 2025 10:19:06 +0200
Message-Id: <20250403081907.3422293-1-adriaan.schmidt@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-526363:519-21489:flowmailer
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 12:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214326

Hi,

After a failed first try (sorry again for the confusion),
here is what actually works for me. The patch was taken from
https://git.yoctoproject.org/poky-contrib/log/?h=ross/libunwind,
but I removed the "apply=0" form the mips-byte-order.patch.

In summary: we have 5 backported patches, and one submitted but not yet merged.

Adriaan

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
 rename meta/recipes-support/libunwind/{libunwind_1.6.2.bb => libunwind_1.8.1.bb} (57%)

-- 
2.39.2


