Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A1A0C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 22:29:27 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.2405.1647901765955800825
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 15:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=nnaEsWML;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id s42so16781332pfg.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 15:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Qah3hQyFaKCWeGIcittuPXBT9xnV4mU/oPu6RFFMxs=;
        b=nnaEsWMLG/rKpPCRdAF2kPBwkpFAJrcTFjln+GmusQjKc6nkTDl/X95BZQ344I0cRR
         AL7CTaAQTqMYKG1gtSdL+FKJWRi8cG71jQ8aZ6vInoqgXosVuKbgCdmHofeCwJY9DUo2
         qRJ5xw9LJWLhNOoCKNvXO63VT8rUojshDY6RWJm/z7l2+iPL+CmviXSgpP1LzZc4iID4
         fKJc4+rxXg9JyT+bI8Jkvh6cvcoqkedmAXPuLpigstq46WjBGm1xlEi66eD5qoX4uByI
         UisIkm6vysdSq8hk69TddGKy11cTQUk8gxFjraHN5KbauZXBixT1VkZQoaB0rr0XgKuE
         nqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Qah3hQyFaKCWeGIcittuPXBT9xnV4mU/oPu6RFFMxs=;
        b=Wb6ZpIw9FrwdwMmE6vv+vcxUnvmJhzOJT5kkxZZYxU0VgSqmCBNoYt21t8QztWtx/A
         sCX2ynuSFbRKCEh3EaTqjuMo5BUpk5Am/8s3ha07/LmKsxmpM5Yh/pmsKOSRtGQu837Q
         Nb4xI0wGp9M0LGlhxJb/iEESKG/LlkgPTCv3c2RnPIVWtQdjEj8NqPpwF+u+HZObtS1c
         cFxTHyXLhPIIT5ge2e7nlf6M72XGL4esDmHKfocjL1oWrrjx9DqNjwnVkpiR2vdNfC1H
         uDtC32SfFDHQKpPGPHCVUHYMO6LfNqF6R64VpQ5A5iE+r+iNdKXbnyr346kfgHHi7yWU
         qmxA==
X-Gm-Message-State: AOAM53394PpFMga/boF7JhrfohWGNug0L1IUes+6yqFMYN/KRVsfUd2K
	BsPsEguywXK7aZ5r5c91OorbCY9W3kMcpNYir0Y=
X-Google-Smtp-Source: 
 ABdhPJw6YEbvDgU5228SIkq707PUscOI8TZpiaiy+N9mQ8iaRwnuJ9iUPlPMCv3StU4gMuLNvmutgw==
X-Received: by 2002:a05:6a00:338e:b0:4fa:9015:af50 with SMTP id
 cm14-20020a056a00338e00b004fa9015af50mr10681797pfb.57.1647901764710;
        Mon, 21 Mar 2022 15:29:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 k13-20020aa7820d000000b004fa72a52040sm12352649pfi.172.2022.03.21.15.29.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 15:29:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/13] Patch review
Date: Mon, 21 Mar 2022 12:29:00 -1000
Message-Id: <cover.1647901591.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 22:29:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163513

Please review this set of patches for dunfell and have comments back by end of
day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3397

The following changes since commit ff90d0e91aec252d3f5986df9ce02293cddadbca:

  build-appliance-image: Update to dunfell head revision (2022-03-14 14:45:29 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (1):
  mobile-broadband-provider-info: upgrade 20201225 -> 20210805

Changhyeok Bae (1):
  mobile-broadband-provider-info: upgrade 20210805 -> 20220315

Davide Gardenal (2):
  re2c: backport fix for CVE-2018-21232
  qemu: backport fix for CVE-2020-13253

Minjae Kim (1):
  bluez5: fix CVE-2021-3658

Ovidiu Panait (1):
  openssl: upgrade 1.1.1l -> 1.1.1n

Ralph Siemsen (2):
  libxml2: backport fix for CVE-2022-23308
  libxml2: move to gitlab.gnome.org

Richard Purdie (3):
  python3targetconfig: Use for nativesdk too
  oeqa/runtime/ping: Improve failure message to include more detail
  oeqa/selftest/tinfoil: Improve tinfoil event test debugging

Tim Orling (1):
  python3: upgrade 3.8.12 -> 3.8.13

wangmy (1):
  linux-firmware: upgrade 20220209 -> 20220310

 meta/classes/python3targetconfig.bbclass      |  12 +
 meta/lib/oeqa/runtime/cases/ping.py           |  20 +-
 meta/lib/oeqa/selftest/cases/tinfoil.py       |   4 +-
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 .../bluez5/bluez5/CVE-2021-3658.patch         |  95 +++++
 .../mobile-broadband-provider-info_git.bb     |   7 +-
 .../openssl/openssl/CVE-2021-4160.patch       | 145 --------
 .../{openssl_1.1.1l.bb => openssl_1.1.1n.bb}  |   4 +-
 .../libxml/libxml2/CVE-2022-23308.patch       | 204 ++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  11 +-
 ...-detection-of-mips-architecture-for-.patch |  42 ++-
 .../{python3_3.8.12.bb => python3_3.8.13.bb}  |   6 +-
 meta/recipes-devtools/qemu/qemu.inc           |   5 +
 .../qemu/qemu/CVE-2020-13253_1.patch          |  50 +++
 .../qemu/qemu/CVE-2020-13253_2.patch          | 112 ++++++
 .../qemu/qemu/CVE-2020-13253_3.patch          |  86 +++++
 .../qemu/qemu/CVE-2020-13253_4.patch          | 139 +++++++
 .../qemu/qemu/CVE-2020-13253_5.patch          |  54 +++
 ...20220209.bb => linux-firmware_20220310.bb} |   6 +-
 .../re2c/re2c/CVE-2018-21232-1.patch          | 347 ++++++++++++++++++
 .../re2c/re2c/CVE-2018-21232-2.patch          | 243 ++++++++++++
 .../re2c/re2c/CVE-2018-21232-3.patch          | 156 ++++++++
 .../re2c/re2c/CVE-2018-21232-4.patch          | 166 +++++++++
 meta/recipes-support/re2c/re2c_1.0.1.bb       |   6 +-
 24 files changed, 1730 insertions(+), 191 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2021-3658.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2021-4160.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1l.bb => openssl_1.1.1n.bb} (97%)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-23308.patch
 rename meta/recipes-devtools/python/{python3_3.8.12.bb => python3_3.8.13.bb} (98%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13253_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13253_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13253_3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13253_4.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13253_5.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220209.bb => linux-firmware_20220310.bb} (99%)
 create mode 100644 meta/recipes-support/re2c/re2c/CVE-2018-21232-1.patch
 create mode 100644 meta/recipes-support/re2c/re2c/CVE-2018-21232-2.patch
 create mode 100644 meta/recipes-support/re2c/re2c/CVE-2018-21232-3.patch
 create mode 100644 meta/recipes-support/re2c/re2c/CVE-2018-21232-4.patch

-- 
2.25.1


