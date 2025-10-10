Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FE3CCD187
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 23:11:30 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.1085.1760137889273958358
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 16:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=t+1pnZEr;
 spf=pass (domain: smile.fr, ip: 209.85.208.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-639df8d869fso4872833a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 16:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1760137887; x=1760742687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1kgyV51WcLPfzlK2kOJdHk8iEjPG5daaONQq3oQ9pX4=;
        b=t+1pnZEru3HKiV9OsxM0Ptf+ofxBe2RLFYxFW3RJf8ub+VTLjXoOHAFUGLUxERa3IB
         qqOFSDrjG/BYVuYbT6bZg2UPaAf40FO7R8g0I1VYXbLMXaacsdx2XErTKVFUT+lOx340
         Z0DqPT5RPWHezFKSOyReW1kVNoUSeyesWtkYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760137887; x=1760742687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1kgyV51WcLPfzlK2kOJdHk8iEjPG5daaONQq3oQ9pX4=;
        b=hqBiu75TtJCrjentJCpmvKzp/qYqL4a+s4iEnUVQMS+0zOmj02iISyV2Ms/MGvhiAM
         99E88F9Z+hC/Zp0tCXl0m9wyN+Vz+pe3X0ueKBtZMQnsUUycq+3g5HDtqOkmcmYJKwsz
         ZOOxfU7sfhRNMtGJ3MDQaZ5u2Wmxu6vrAX0eEqeeyhAQjKSeX23WibacdT7ZLVuR+SsO
         7SgfUwmxvtBdltVoJnYRxh8GnpSEYkKY3iib4xbJRwbesPtoS78WRfw9BTlQDNaTFJiO
         G5907dHge+2UXF1c6FZdwW+KtFjs4sFx7WbsxpDIy4Nu14Imi+jc+PYAgdgLuPGw2m5g
         EPSw==
X-Gm-Message-State: AOJu0Yxlc18v+ePPeRSfPo5WV5mtzJ5ENiylfZq4g1m7OSReJXcd+n5T
	J7+i0NZwu/1LcenzIHnPbvN07Qw9Q8BV/1bhUjaLM1EjzMrHbdmPwr1NE3uBVPHKH3VgaAjFWQh
	yGdDBqp0=
X-Gm-Gg: ASbGncss+jtIoq6OmtfmavplaJRaos5MYnUhpkPsaCPqt/y3x8YqfKuvMbAtF9QmKFm
	Qb7pjnB2aJyZHtH3HQCAnsP7IJyL3KlDjXj8YNYzjFHK/Cne08nT6afs+NlOimts7qmU5ZWAHHY
	BxJL6pa4myj7nRqkYsM1DqqMUVcukmBNb136V39Pl9wUDZK/XKzr/O3429Al9c6kCKYnHMAdKJW
	KlRGaaG9gjIilTqhlDvx5GtnsuT4LMqf4Lz7XBp+PrXbsoO/AlllMOKb5bOjPW4usqLXEoOvoz0
	gcCu/ul5XxV7rJELN2xBH1fy4JLkHaCdbaEQ2lML00LTF6odSdYPlAfPDhRi+wqu0pwS4ZSyyN5
	KBVJcMb33BNsDwJCVVVoHwqv9sNEBKiFRoV2F/8fCjFcU1ElD6VjOcS5f65ozxFfVNqdysIysoc
	5vFplbG4MtIR9gGEGES7e2kFTyiuruHdVfwQI+57zOn4WhBDWu8Hsk9fOYdm4u
X-Google-Smtp-Source: AGHT+IFNimrIe77rLt4OheKhh1xv1XfyQ8Zory3AsP0imMHVb7N1slWeXpHBBZki6/70QjCgkcIhuw==
X-Received: by 2002:a05:6402:50d1:b0:631:b058:bef0 with SMTP id 4fb4d7f45d1cf-639d5c52eddmr12402773a12.32.1760137887169;
        Fri, 10 Oct 2025 16:11:27 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b71443sm3241569a12.26.2025.10.10.16.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 16:11:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] oeqa/selftest/buildoptions: Fix test_yocto_source_mirror MIRRORS & PREMIRRORS definitions
Date: Sat, 11 Oct 2025 01:11:10 +0200
Message-Id: <20251010231110.326806-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 23:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224709

From: Yoann Congal <yoann.congal@smile.fr>

Currently, the definitions of MIRRORS and PREMIRRORS made by
test_yocto_source_mirror() are overwritten when run on the autobuilder:
* MIRRORS = "" is extended by mirrors.bbclass to its usual value.
* PREMIRRORS = "* dl.yp.org" is overwritten by the autobuilder.conf
  config fragment to ""

Simplified variable history:
  # $MIRRORS [4 operations]
  #   set .../contribution-yocto/builds/build-qemux86-64-st/conf/selftest.inc:3
  #     ""
  #   append .../contribution-yocto/builds/build-qemux86-64-st/../../layers/poky/meta/classes-global/mirrors.bbclass:57
  #     "${DEBIAN_MIRROR}	..."
  MIRRORS=" http://deb.debian.org/debian/pool ..."

  # $PREMIRRORS [4 operations]
  #   set .../contribution-yocto/builds/build-qemux86-64-st/conf/selftest.inc:18
  #     "    bzr://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \n ..."
  #   set .../contribution-yocto/builds/build-qemux86-64-st/../../layers/poky/meta/conf/fragments/yocto-autobuilder/autobuilder.conf:6
  #     ""
  #   append .../contribution-yocto/builds/build-qemux86-64-st/../../layers/poky/meta/classes-global/mirrors.bbclass:84
  #     "git://sourceware.org/git/glibc.git https://downloads.yoctoproject.org/mirror/sources/  ..."
  PREMIRRORS=" git://sourceware.org/git/glibc.git https://downloads.yoctoproject.org/mirror/sources/  ..."

Despite this unexpected configuration, the test passes because after
failing to find a PREMIRROR (empty), failing to download the normal
SRC_URI (because of BB_ALLOWED_NETWORKS), the fetcher tries the MIRRORS
which have by default download.yoctoproject.org. For example, on a
failed meta-oe-mirror test[0], we can see a lot of warnings:
"stdio: WARNING: ... do_fetch: Failed to fetch URL https://... attempting MIRRORS if available"

By using the ":forcevariable" override, test_yocto_source_mirror() makes
sure the correct value is set for MIRRORS and PREMIRRORS (whatever is
the configuration).

Simplified variable history (after the fix):
  # $MIRRORS [4 operations]
  #   append .../contribution-yocto/builds/build-qemux86-64-st/../../layers/poky/meta/classes-global/mirrors.bbclass:57
  #     "${DEBIAN_MIRROR}	..."
  #   append .../contribution-yocto/builds/build-qemux86-64-st/../../layers/poky/meta/classes-global/mirrors.bbclass:68
  #     "git://salsa.debian.org/.* ..."
  #   override[forcevariable]:set .../contribution-yocto/builds/build-qemux86-64-st/conf/selftest.inc:3
  #     ""
  MIRRORS=""

  # $PREMIRRORS [4 operations]
  #   set .../contribution-yocto/builds/build-qemux86-64-st/../../layers/poky/meta/conf/fragments/yocto-autobuilder/autobuilder.conf:6
  #     ""
  #   append .../contribution-yocto/builds/build-qemux86-64-st/../../layers/poky/meta/classes-global/mirrors.bbclass:84
  #     "git://sourceware.org/git/glibc.git ..."
  #   override[forcevariable]:set .../contribution-yocto/builds/build-qemux86-64-st/conf/selftest.inc:18
  #     "    bzr://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ ..."
  # pre-expansion value:
  #   "    bzr://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ ..."
  PREMIRRORS="    bzr://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ ..."

[0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/470/steps/17/logs/warnings

Fixes [YOCTO #15993]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 767e19bd88..b46f55e256 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -173,11 +173,11 @@ class SourceMirroring(OESelftestTestCase):
     def test_yocto_source_mirror(self):
         self.write_config("""
 BB_ALLOWED_NETWORKS = "downloads.yoctoproject.org"
-MIRRORS = ""
+MIRRORS:forcevariable = ""
 DL_DIR = "${TMPDIR}/test_downloads"
 STAMPS_DIR = "${TMPDIR}/test_stamps"
 SSTATE_DIR = "${TMPDIR}/test_sstate-cache"
-PREMIRRORS = "\\
+PREMIRRORS:forcevariable = "\\
     bzr://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \\n \\
     cvs://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \\n \\
     git://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \\n \\

