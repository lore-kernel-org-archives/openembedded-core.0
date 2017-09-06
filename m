Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9DC9477CE0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 16:07:03 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id b9so3289096wra.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Sep 2017 09:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=i91HYVipQozZ/YU+QLt7HRTjbXRBe3Cz1O3AWw1IDw0=;
	b=Nxl4J2W61kb1abGLCiSNRw80weAAefK7nQzzhdLxKGLd1W5eIa1JImqbynvMc1LERG
	pkpm/bCxYkSPi3dRkS4e3rV2OHjFRnphwtkBzYR47JoiX/XlFXjB6t5f1HJ2pC5D+s/4
	fIXgDq1lpB/9kQBlasT+IO7omso+pHsefIAg6aLbglGXbmcfSGkW2MWyt9O2V1Z9Kw09
	EwwzIytHMzpc+0DZo6nNS0ejMIXM1kItxExw6vYRePAKqasikUMlPTyby8y3ZgniDaZw
	jLa1eYVW2Fz0IHlWmylKWbhO2dePUCasCR4wL7+bmpcGN0LJswCc/ZfOZrNSCC3SvjPP
	l6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=i91HYVipQozZ/YU+QLt7HRTjbXRBe3Cz1O3AWw1IDw0=;
	b=VUWlDV33YEH0YQouDN8OlherMHQxf7PpIOhq2FdC+MOSMdjMB19G9dyN2ggQfYkpbz
	FJuG4fGYdmqJhMkOoXppzi5hGXChQHP5sKMhVBrBGoxSg83zT/BHZ/F6MDzIhgSqCirn
	O9UaK1pGEQeidOQkxUv04YaAMmr3tbHGF6xgYUIDubZijgmYCUBYboboqskKaBjF8dkt
	otU4au5iuSI/LfAAsjkdyam3FJDNkn4ZYA2HtqZ1wIWUkUw802KJLxlAJQqVuHO15Yje
	TlgvSmnm+btzS7ZBKKatTIjakzD+kRGuNgPcgr5VvlhJ/pcSb8FhxjXGL3PFbtK5AQln
	dEJA==
X-Gm-Message-State: AHPjjUj0L2VCkzNsfRCd6WF8GjBYD8hSR8nIsHS19Vio6HRpaXLJ0FDI
	Fu+kzh4W8iKs9A4i
X-Google-Smtp-Source: ADKCNb7GmJoMSO2nFsyeJ2xLKhbdk1F0nIUt8yNh5N6pwtShON6AZlHBhc+3Rm3yrEHKpKVNW+wEkQ==
X-Received: by 10.223.159.77 with SMTP id f13mr1869250wrg.154.1504714023681;
	Wed, 06 Sep 2017 09:07:03 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 137sm2479939wmp.7.2017.09.06.09.07.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Sep 2017 09:07:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Sep 2017 18:09:04 +0200
Message-Id: <cover.1504713837.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [pyro][PATCH 0/3] Backports for pyro
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Sep 2017 16:07:03 -0000

All 3 are backports from master.

qemu and nspr change needed small tweak to apply for older version.

qemu change is already backported to morty, which seems wrong that
it's missing in pyro. (the morty patch also looks a bit differently than
the version from master, see:
"qemu: Backport a patch for recent glibc versions" commit in morty)

The build with pyro still doesn't work on hosts with glibc-2.26.

cross-localedef-native/2.25-r0 on host system with glibc-2.26
is choking on it's own locale_t https://pastebin.com/udCzFA9L
but more difficult to resolve here when it mixes host's headers
from glibc-2.26 with glibc-2.25 code.

I'll probably use LOCALE_GENERATION_WITH_CROSS-LOCALEDEF to bypass
this, but it there is a plan to support Pyro on more recent hosts than
this should be resolved as well

The following changes since commit 1009498f23ad319825c00ba60a4693d15aada553:

  package.bbclass: Restore functionality to detect RPM dependencies (2017-08-30 23:59:53 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/pyro-backports
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=jansa/pyro-backports

Khem Raj (3):
  icu: Fix build with glibc 2.26
  qemu: Replace use of struct ucontext with ucontext_t
  nspr: Fix build error due to missing stdint.h> include

 ...lace-struct-ucontext-with-ucontext_t-type.patch | 265 +++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.8.0.bb           |   1 +
 .../icu/icu/0001-i18n-Drop-include-xlocale.h.patch |  31 +++
 meta/recipes-support/icu/icu_58.2.bb               |   3 +-
 ...int.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch |  30 +++
 meta/recipes-support/nspr/nspr_4.13.1.bb           |   1 +
 6 files changed, 330 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-replace-struct-ucontext-with-ucontext_t-type.patch
 create mode 100644 meta/recipes-support/icu/icu/0001-i18n-Drop-include-xlocale.h.patch
 create mode 100644 meta/recipes-support/nspr/nspr/0001-include-stdint.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch

-- 
2.14.1


