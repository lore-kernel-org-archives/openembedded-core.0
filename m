Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89F4CD98ED
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 23:16:26 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31996.1781824586208805297
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 16:16:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=s1o6D/9F;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-463b2f6fc9dso1517832f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 16:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781824584; x=1782429384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UbajmSNpiAD/Scacg22CbvuoYJWYTQbfh2zLUbQ3Wrk=;
        b=s1o6D/9FWSXwDsu5Fw2T2vGeLIXQ2CCmflGUdHbljwSSHfXt1xiH+ju0SqqPFCxjh8
         /bY7o/ytS17H510bzcso+I9Vryw3iXUMOqeb2r3LK8j9L8BOtaV3T8TwqCYzTCbFcpWr
         P+VA1TP3105v5h6OukkTeGBepN1UaWhfyHbuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781824584; x=1782429384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbajmSNpiAD/Scacg22CbvuoYJWYTQbfh2zLUbQ3Wrk=;
        b=PHnzYyqFYvnrkOR8Jx1rfrhWF62GUsDOmjxLD8MIWMn9E2bfLkchxvuAMdBuwlq9Dj
         jjrytUd+mFriWR2LSqzmNi13R9Wf1PP8SqZ5rnv/uzYO+tZaHcDLMcsgyqbQJDwsght6
         ykB33f68fUhB8iozUTgLmyQXa/l46For4ez5a+dbb7xP1w8JVZ1wazq+Rwx8MmiFW+n5
         5Pd0AGF0hotjjQ8qO1sLd5UEXr/dvBJCf8QBAcKi3zWvkpW3thq4T5j8ajw3B602NAV4
         TjNqN5nGtpQQiTccf1PtFgNH8Hxkb9KjIpneDGRNACwHXc3vvadDxtAwxc/W+h0jEsaI
         fU8A==
X-Gm-Message-State: AOJu0Yzmr/zIYKiGlq7Zs8XfmzkrTTUcyJrhoxOw86ALX7Q6NjZIG1Vz
	B7++2X2vNO6nbe3nsjPUnuaNk+G7BDe+PQ9nif/USVkATM/7/xArwAEVShCmez7AKLl5gx7E5+y
	KV2ol
X-Gm-Gg: AfdE7cl/+1piIKm13dG/yprBtQcPXb90VjGRZCMVWP0LqfZFZA+Ah55fJpYngj/CSMT
	pDvAssJKFwl66Dp4htiE1Xqo4fLyX9oXIyZg6l+YcE4krlFCqFuh7bJKAoln/TvENna945mRjDr
	BMrt8qI5a/pr9Rlz6a8R18WvcNSagu5TQdLLCdLGlnElx74egBwGdXIYnizmokmD4qrKlSxC1ey
	xb6a2Nt0YT7gUJy0SYKeZiJaMXotc07mmOAHW0Gr0wfFlwZlopRohiYQALvD9F6I7Lp+NQrFQC0
	Ds963fX10Q0udHaQ1oQHy7No9PhpXHRVlTCgVfi/EZvpwaiiMoGtaCnp3Azl7zgVxcbp4aiVys0
	kVYgFuY1SCw9hHFMa5Bf619zm9XMYDNEKmMncMtMdfS1CeJmZwvRrhsT38JmerDk1wPz9ravPu4
	vfRo1iYqb5tgG8V3952mcgq0nPI1vFYWoeiuI8lA3xS15J1Q7uTC9WDNNkJ017jqKrmyTOxIzFh
	yQb6KWd2xj+10M1TQ==
X-Received: by 2002:a05:6000:250d:b0:45d:77f4:1ac2 with SMTP id ffacd0b85a97d-46503d01c86mr2503920f8f.0.1781824584219;
        Thu, 18 Jun 2026 16:16:24 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00e7e9bab757cf3530.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e7e9:bab7:57cf:3530])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-465059e721fsm3038030f8f.0.2026.06.18.16.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 16:16:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][wrynose 0/8] Pull request (cover letter only)
Date: Fri, 19 Jun 2026 01:16:11 +0200
Message-ID: <cover.1781824423.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 23:16:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239114

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1781682367.git.yoann.congal@smile.fr/

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4013

The following changes since commit cd635307ab8460d05d13dbfb3f28efdbde6609cd:

  python3: sanitize userbase in _sysconfig_vars JSON to avoid host path leak (2026-06-15 10:50:53 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-next

for you to fetch changes up to 530fb9ea9ba6ffe212566d3b95d17b519c52c769:

  openssl: upgrade 3.5.6 -> 3.5.7 (2026-06-16 23:18:27 +0200)

----------------------------------------------------------------

Adarsh Jagadish Kamini (1):
  curl: fix CVE-2026-6276

Anil Dongare (1):
  libusb1: fix CVE-2026-23679 and CVE-2026-47104

Ankur Tyagi (2):
  wireless-regdb: upgrade 2026.03.18 -> 2026.05.30
  ca-certificates: upgrade 20260223 -> 20260601

Deepak Rathore (1):
  qemu: Fix CVE-2024-6519

Peter Marko (1):
  openssl: upgrade 3.5.6 -> 3.5.7

Prabhudasu Vatala (1):
  conf/machine: fix typos in ARM and x86 README files

Ross Burton (1):
  curl: fix mbedtls detection

 meta/conf/machine/include/arm/README          |   6 +-
 meta/conf/machine/include/x86/README          |   4 +-
 ...1-Configure-do-not-tweak-mips-cflags.patch |   2 +-
 .../{openssl_3.5.6.bb => openssl_3.5.7.bb}    |   4 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2024-6519.patch             |  53 +++
 ....03.18.bb => wireless-regdb_2026.05.30.bb} |   2 +-
 ...0260223.bb => ca-certificates_20260601.bb} |   4 +-
 .../curl/curl/CVE-2026-6276.patch             | 315 ++++++++++++++++++
 meta/recipes-support/curl/curl/mbedtls.patch  |  41 +++
 meta/recipes-support/curl/curl_8.19.0.bb      |   4 +-
 .../CVE-2026-23679_CVE-2026-47104.patch       |  89 +++++
 meta/recipes-support/libusb/libusb1_1.0.29.bb |   1 +
 13 files changed, 514 insertions(+), 12 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.6.bb => openssl_3.5.7.bb} (98%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-6519.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.03.18.bb => wireless-regdb_2026.05.30.bb} (94%)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20260223.bb => ca-certificates_20260601.bb} (94%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6276.patch
 create mode 100644 meta/recipes-support/curl/curl/mbedtls.patch
 create mode 100644 meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104.patch


