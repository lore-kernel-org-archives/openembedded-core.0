Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92869C7EE30
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 15:27:03 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.11045.1750951618181617873
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 08:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=AeaXmUR/;
 spf=pass (domain: konsulko.com, ip: 209.85.210.182, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-748da522e79so718857b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 08:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1750951617; x=1751556417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MV4pQVEgHXuy+tvXG0RrENvaz2Ep1Se8DeMGAc2KTFM=;
        b=AeaXmUR/uidr82IEFyyxeXmLfWwC79dOQ023lxd4L8EM7H3YD/3EqPRWBYOewDsUKs
         Trj7dG8vlfN7zcktPXiCjgmXFduyczKfTRpi3tOmCLNbq1Tv+xwKEbiZmzTy4+9oJ1HP
         fkkB6stiDUkiafYCgybb4nPA/fgegpGOPBEmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951617; x=1751556417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MV4pQVEgHXuy+tvXG0RrENvaz2Ep1Se8DeMGAc2KTFM=;
        b=G9WJlAnDU+vN/+VImFJ7avNQYg6UCB3iInDSsr3+g8fRP3U0ajsyYX2BKWhJFGQTSx
         zNJ1P8Z9TnzN5CAcKfSL0LX8u+gy5NxzBCkjdUhHbfCUU374hwpQZvNuA70a5rT+yPbf
         yVo3byMm1itUeJT/FAOOT+yppPdJIxZuoD025okVje+3GxpHrMrvjrGezg7wE8K61v0u
         utqyQNvBGKcoUBplrdcQSCOVRRTvyrowaELLshL+EKASmfgVSJthfmSHirZ+q/ZP8WXm
         6W1a+DoxCkx+flXNeE/ym+V7K2yZvxIPr3gBP44HoS/yI5yzHSA4/tnIZyawtffVyh/r
         H5BA==
X-Gm-Message-State: AOJu0YylgBPYbnmFg2Z+3J/EeXD4NIvG1eNL0mCPrIDySE1YEdAOrKLn
	9RL8vhHXFQr2ZBHyErVTNclUTGfZE7bEa1kt2JfiKxndMYsLy55FxLaXlgVirAtFfyor83/G5HK
	ACvN/QNY=
X-Gm-Gg: ASbGncs+kJl8WnozKzcAeyTndqjezou09P753Ls95toSlqbIufnhrCMmYn8GjDBUHId
	mNZKzek//AQ6AFPsfbTsWc0ktF+GuSZLHUJyAHUnifZ/2M8Yw0T/NG1DhuVrTYjlep2pp9+Dyd7
	0EqNiG4BgIIotY2vGMSm0G8pWl/jOYwCgA3FLD6l77ed2LJ2zhm73gEYegWZjtx9ICo+Ux0gejM
	gMeDD/dVkDt14CN2g7NgzFgsN2jIPRNgmJnF3jnefku0ZGT+rz+dWlyHYh7aMuYI3Wh3HYc57lw
	GEAPvTaItZ71CeXnbw2wrV5037IfNV6hjTNqr5BKxZ8TxjDekxT9WejkBxwuQzeZFogkGZpmxoI
	0Y063/3tMfu74m5d9xiSHuuMV3HqkeLao22LD
X-Google-Smtp-Source: AGHT+IEsHZPSP4G2A6y8auEJwXBIu0bIePEW25B0Ej6e8DQk223CrBUk2iDdt7tw7AgGIJ6AfGJ9Kw==
X-Received: by 2002:a05:6a00:1393:b0:740:596b:4a7f with SMTP id d2e1a72fcca58-74ad458fe52mr9526510b3a.16.1750951616990;
        Thu, 26 Jun 2025 08:26:56 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c8872d68sm7319581b3a.170.2025.06.26.08.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:26:56 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/6 v2] python3-wheel: upgrade 0.45.1 -> 0.46.1; add ptest
Date: Thu, 26 Jun 2025 08:25:12 -0700
Message-ID: <20250626152649.3103465-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8028bc471f02bc3d688ab422120db7504a38a121.1750806216.git.tim.orling@konsulko.com>
References: <8028bc471f02bc3d688ab422120db7504a38a121.1750806216.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 15:27:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219363

From: Tim Orling <tim.orling@konsulko.com>

* Add python3-packaging to RDEPENDS
* Enable ptest:
  - Add to ptest-packagelists.inc PTESTS_FAST
  - inherit ptest-python-pytest
  - Add python3-setuptools to ptest RDEPENDS
  - One test is skipped, but it requires the "full" python3-flit,
    not just python3-flit-core.

Comparing changes since 0.45.1:
https://github.com/pypa/wheel/compare/0.45.1...0.46.1

Release notes [1]:

0.46.1 (2025-04-08)
* Temporarily restored the wheel.macosx_libfile module (#659)

0.46.0 (2025-04-03)
* Dropped support for Python 3.8
* Removed the bdist_wheel setuptools command implementation and entry
  point. The wheel.bdist_wheel module is now just an alias to
  setuptools.command.bdist_wheel, emitting a deprecation warning on import.
* Removed vendored packaging in favor of a run-time dependency on it
* Made the wheel.metadata module private (with a deprecation warning if
  it’s imported
* Made the wheel.cli package private (no deprecation warning)
* Fixed an exception when calling the convert command with an empty
  description field

[1] https://wheel.readthedocs.io/en/stable/news.html

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
  * Add missing RDEPENDS
  * Enable ptest
  * 52 tests pass, 1 skip. Seems to take less than 1 second with kvm
    for core-image-ptest-python3-wheel on qemux86_64.

 meta/conf/distro/include/ptest-packagelists.inc          | 1 +
 .../{python3-wheel_0.45.1.bb => python3-wheel_0.46.1.bb} | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.45.1.bb => python3-wheel_0.46.1.bb} (61%)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index e06731ece73..42672e9780c 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -78,6 +78,7 @@ PTESTS_FAST = "\
     python3-uritools \
     python3-wcwidth \
     python3-webcolors \
+	python3-wheel \
     qemu \
     quilt \
     rpm-sequoia \
diff --git a/meta/recipes-devtools/python/python3-wheel_0.45.1.bb b/meta/recipes-devtools/python/python3-wheel_0.46.1.bb
similarity index 61%
rename from meta/recipes-devtools/python/python3-wheel_0.45.1.bb
rename to meta/recipes-devtools/python/python3-wheel_0.46.1.bb
index 8274e83747e..058af2f0e75 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.45.1.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.46.1.bb
@@ -4,9 +4,14 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
 
-SRC_URI[sha256sum] = "661e1abd9198507b1409a20c02106d9670b2576e916d58f520316666abca6729"
+SRC_URI[sha256sum] = "fd477efb5da0f7df1d3c76c73c14394002c844451bd63229d8570f376f5e6a38"
 
-inherit python_flit_core pypi
+inherit python_flit_core pypi ptest-python-pytest
+
+RDEPENDS:${PN} += "python3-packaging"
+
+# One test is skipped but requires the "full" python3-flit, not just python3-flit-core
+RDEPENDS:${PN}-ptest += "python3-setuptools"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


