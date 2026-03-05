Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F1EEEF32B
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 08:55:50 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40178.1772700947972230140
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 00:55:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qscZ8oQI;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48378136adcso46368405e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 00:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772700946; x=1773305746; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KEaXMSKqIWMTXV8fSD+1u2Kq+z4R3s/EW0i82peSnok=;
        b=qscZ8oQIyl7MQlyuniUE/UAqfao9+A+CLJ44Pu4834+ofWnvPqa8o4IYFlGq4KpckU
         JHrCEcEnRaEb9B/QXHcBcsp6/uh++93oHEimUk7l1aA5w85ELkpOh23utVTSFfOAs8CA
         3b0u6FjegLnXXUoaEbx/ywwaNoVAIzg21tWMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772700946; x=1773305746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KEaXMSKqIWMTXV8fSD+1u2Kq+z4R3s/EW0i82peSnok=;
        b=eSq01LpsFgVvpwFJAIC6Ms5HkBzzO7F1uTEIQBvOZkVKeRR+sL3TxwBOpjwFSVTRtG
         Ut2S4adaGXiVNKKOOo92w3yRTM8BPyZMKewX//zSfZKCN0uTKVbqQg96mcvcPzf0v63L
         i4hdJ+BgyL/GHaoeNjSyqvEQXobZol91hI7nl096wv/r/OXHSUH8o0cnmWV8wbHVQNzC
         r0LMrMha7h1qUrOQ4u5hO5N0rurdGSYVFnagLfj7A08XOf92EUIQo3kFBhX0UWe2VcO7
         OxiuvK5watahMi3DJPNlptFmScpuV8G8eujb8cT8p/L19AnnUsacAsPQgN6tcO9VfCAf
         cWsA==
X-Gm-Message-State: AOJu0Yzo3+ydT3tXSjw+EY0zLrUODVGzrnmxECWMDueXytmYhtD94pmW
	6LsL7SqMHwVJk9AoIWympawQTa6q5e5lAvX0QI+xkA37VhtrVqPGmZnveuhksl40arFPnL7Drbc
	ZY4kK
X-Gm-Gg: ATEYQzzPzjTdg456IIHUpz6AtYbOjGMnKJh8h77ahiqW8hwmFQ2gG5tk85jAi3cxNDa
	dw6o7oXpFBaXAWRmkGCN/140ZNas8hHLo1tx3iktusL6V7d3jc6NmYR+7TIk3wVK9QM++5awXN6
	0K84e3Y3SJng1ouJ1uqSK1u+DgOG5I5Qyw3JVP1IJRBnF6iTyUQ43RKoUK/aqfoe/+cmKame7e4
	bvZVfFyRctgwscKtFKWK1A1nAP95BKm0aJxlUkgBecU3SLCZM1SB6fQTO9kKLxzI1VonAAHRkVI
	EJLhRrBpXN7lq631CTrRD21PFygQXGdlHddjcoMgpZRhVIrjtLXGNdXn0Z43c+UV9vw9PWfvv0v
	EmtvQALZFa1OfY8j+EIjR5+kInxyR09+E+HR/CCbsh8SNscd5ysZ7eBOFFQLGmh8uRRBS7HZJa6
	wg4fpnYotqxr2c9XCwXM4JDQdXlLgo0ZCEQjGspV//4Dy+0sMp6kDSLHCb6etJzz2/PliJFc6Du
	glU5G0YtEVAQh4QvCVbJBYOX3Pd
X-Received: by 2002:a05:600c:1c22:b0:483:b2a8:33ff with SMTP id 5b1f17b1804b1-48519837facmr88701055e9.4.1772700945613;
        Thu, 05 Mar 2026 00:55:45 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00675b4cbd8c1678f5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:675b:4cbd:8c16:78f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb27a20sm59405175e9.9.2026.03.05.00.55.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 00:55:45 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 00/12] Patch review
Date: Thu,  5 Mar 2026 09:54:49 +0100
Message-ID: <cover.1772700454.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 08:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232452

Please review this set of changes for whinlatter and have comments back
by end of day Monday, March 9.

Passed a-full on autobuilder with warnings:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3334
The sub-build qemux86-64-ptest had a ptest failure
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3207 
It is a known AB-INT bug: 15718 – AB-INT: gstreamer ptest never ending (Bitbake still alive)
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15718
This is not related to this series.

The following changes since commit 45cba1329d541fdc5857d6df2624b34c91133f7a:

  build-appliance-image: Update to whinlatter head revisions (2026-02-27 17:46:44 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/whinlatter-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/whinlatter-nut

Adarsh Jagadish Kamini (1):
  python3-pip: Backport fix CVE-2026-1703

Ankur Tyagi (1):
  wireless-regdb: upgrade 2025.10.07 -> 2026.02.04

Antonin Godard (1):
  python3: skip flaky test_default_timeout test

Hugo SIMELIERE (2):
  zlib: Fix CVE-2026-27171
  harfbuzz: Fix CVE-2026-22693

Peter Marko (3):
  linux-yocto: apply cve-exclusions also to rt and tiny recipe variants
  cve-exclusions: set status for 5 CVEs
  ffmpeg: set status for CVE-2025-12343

Shaik Moin (1):
  gdk-pixbuf: Fix CVE-2025-6199

Vijay Anusuri (1):
  gnutls: Fix CVE-2025-14831

Yoann Congal (2):
  README: Add whinlatter subject-prefix to git-send-email suggestion
  b4-config: add send-prefixes for whinlatter

 .b4-config                                    |   1 +
 README.OE-Core.md                             |   2 +-
 .../zlib/zlib/CVE-2026-27171.patch            |  63 +++
 meta/recipes-core/zlib/zlib_1.3.1.bb          |   1 +
 .../python/python3-pip/CVE-2026-1703.patch    |  41 ++
 .../python/python3-pip_25.2.bb                |   4 +-
 ...kip-flaky-test_default_timeout-tests.patch |  49 ++
 .../python/python3_3.13.11.bb                 |   1 +
 .../gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch |  36 ++
 .../gdk-pixbuf/gdk-pixbuf_2.42.12.bb          |   1 +
 .../harfbuzz/files/CVE-2026-22693.patch       |  33 ++
 .../harfbuzz/harfbuzz_11.4.5.bb               |   4 +-
 meta/recipes-kernel/linux/cve-exclusion.inc   |  16 +
 .../linux/linux-yocto-rt_6.12.bb              |   1 +
 .../linux/linux-yocto-rt_6.16.bb              |   1 +
 .../linux/linux-yocto-tiny_6.12.bb            |   1 +
 .../linux/linux-yocto-tiny_6.16.bb            |   1 +
 ....10.07.bb => wireless-regdb_2026.02.04.bb} |   2 +-
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb  |   1 +
 .../gnutls/gnutls/CVE-2025-14831-1.patch      | 119 +++++
 .../gnutls/gnutls/CVE-2025-14831-10.patch     | 424 +++++++++++++++
 .../gnutls/gnutls/CVE-2025-14831-2.patch      |  66 +++
 .../gnutls/gnutls/CVE-2025-14831-3.patch      |  30 ++
 .../gnutls/gnutls/CVE-2025-14831-4.patch      |  45 ++
 .../gnutls/gnutls/CVE-2025-14831-5.patch      | 205 +++++++
 .../gnutls/gnutls/CVE-2025-14831-6.patch      | 505 ++++++++++++++++++
 .../gnutls/gnutls/CVE-2025-14831-7.patch      | 124 +++++
 .../gnutls/gnutls/CVE-2025-14831-8.patch      | 155 ++++++
 .../gnutls/gnutls/CVE-2025-14831-9.patch      | 110 ++++
 meta/recipes-support/gnutls/gnutls_3.8.10.bb  |  10 +
 30 files changed, 2048 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-Skip-flaky-test_default_timeout-tests.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch
 create mode 100644 meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2025.10.07.bb => wireless-regdb_2026.02.04.bb} (94%)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-10.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-2.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-3.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-4.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-5.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-6.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-7.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-8.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch


