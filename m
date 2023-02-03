Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4BDC6379F
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 17:50:51 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.17886.1675446645464898998
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 09:50:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fKqatjWI;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id m13so5975060plx.13
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 09:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EmsWe+FrMbEiwox8sCgprTHAizXdQFOFnFDaL+ib5Qo=;
        b=fKqatjWI8wSpBpHG5vavtTW877ccqeBGKFl+2ELvkepGSYbghNJ3Am+fW8KoGhM2d/
         fCKYpUn0cZRLpNTwU4/GSk/z6uaYn4NzbpA1cjM8s0vCsSaVPDTM7bbYUKXXKNYGrkkZ
         3kQ7gMRSwdFwtNqNV6cvvz26eMrqma6063n1vGmErLuJ8xAFgCd0i4YfbZgPiurRy26W
         gZnR+yqxQlWPh6sExaNpZdzFolI8/glEnMoutRmzeY3Kq/BsYu7L+mVai3K1rJk2GCGi
         +BVoAM34Qqs8OmS2g/pzQr9d1MyItrId/+VnOMRGkKUMG7o1SzRhdr0aJDjz3F8WK0W6
         GJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EmsWe+FrMbEiwox8sCgprTHAizXdQFOFnFDaL+ib5Qo=;
        b=gnX96S0M3UsSV5O83RVKgcfebBGto5a8zk3bxxS9rFJuTj0H/Si3JnT+vmUm2hum/9
         cmJ3X+l0xSWi2UdU8fQiOXGilO9XxQBmszyKuWuwOT1Uw43B2G00BhRvkwY7zjSBfOud
         XROo9iqjPCU5YCatNaGm2MwnG7bZfp2R8id2Rn7GoRcyLL1+pMHKNwIVRP6ZPLb+wrP6
         wCepFZ7tRNV0n5hKZXs8aEfPLjDcHMtzw5e3O1edIeRpVmaeggKV7psDUA0z1xChJRKP
         4PKJiBjoNZhQkuAhbf9PXXmH6040CXVGr1n3iVREjq8EOZMaCB04MtengKhIrqYHfN74
         pBjw==
X-Gm-Message-State: AO0yUKW/1XDxDEOQaNbtzcR9wwk1OqpC7yPBbkCgiD+mPkbK/jpUQsPY
	0CZXnc9Cec3Bu8H1ngllWsZkEe3cPaw=
X-Google-Smtp-Source: AK7set/VNT5xQ3XdTwA0zhcMk+h8wlnuMLqK/XONnvRTFS/vgr8GGbJirxzTT34lha/rRdY8xyEbaQ==
X-Received: by 2002:a05:6a21:3942:b0:b8:9922:dd2a with SMTP id ac2-20020a056a21394200b000b89922dd2amr12119609pzc.57.1675446644390;
        Fri, 03 Feb 2023 09:50:44 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:46a4:f9f7:31dc:7e2c])
        by smtp.gmail.com with ESMTPSA id o11-20020a637e4b000000b0046ff3634a78sm1712880pgn.71.2023.02.03.09.50.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 09:50:43 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/14] Recipe upgrades from 02/01/2023 AUH
Date: Fri,  3 Feb 2023 09:50:21 -0800
Message-Id: <cover.1675446372.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 17:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176734

Fixed some upgrades that failed on AUH.
* python3-poetry-core
* python3-iniconfig
* python3-sphinxcontrib-applehelp
* python3-sphinxcontrib-htmlhelp

The following changes since commit 063bdffc04714c7ed4bdba2aa93a19dd94f256a9:

  perf: Fix 6.1 kernel reproducibility issue (2023-02-03 16:52:15 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib timo/recipe-upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=timo/recipe-upgrades

Tim Orling (14):
  libtest-needs-perl: upgrade 0.002009 -> 0.002010
  python3-pytest: upgrade 7.2.0 -> 7.2.1
  python3-hypothesis: upgrade 6.62.0 -> 6.66.0
  python3-poetry-core: upgrade 1.4.0 -> 1.5.0
  python3-iniconfig: upgrade 1.1.1 -> 2.0.0
  python3-pytz: upgrade 2022.7 -> 2022.7.1
  python3-zipp: upgrade 3.11.0 -> 3.12.0
  python3-requests: upgrade 2.28.1 -> 2.28.2
  python3-sphinxcontrib-applehelp: 1.0.3 -> 1.0.4
  python3-sphinxcontrib-htmlhelp: 2.0.0 -> 2.0.1
  python3-pyopenssl: upgrade 22.1.0 -> 23.0.0
  python3-wcwidth: upgrade 0.2.5 -> 0.2.6
  python3-urllib3: upgrade 1.26.13 -> 1.26.14
  python3-sphinx: upgrade 6.0.0 -> 6.1.3

 ...2009.bb => libtest-needs-perl_0.002010.bb} |  3 +--
 ...6.62.0.bb => python3-hypothesis_6.66.0.bb} |  2 +-
 ...ig_1.1.1.bb => python3-iniconfig_2.0.0.bb} |  7 +++--
 .../python3-poetry-core/deterministic.patch   | 23 ----------------
 ..._1.4.0.bb => python3-poetry-core_1.5.0.bb} |  5 +---
 ..._22.1.0.bb => python3-pyopenssl_23.0.0.bb} |  2 +-
 ...ytest_7.2.0.bb => python3-pytest_7.2.1.bb} |  2 +-
 ...ytz_2022.7.bb => python3-pytz_2022.7.1.bb} |  2 +-
 ...s_2.28.1.bb => python3-requests_2.28.2.bb} |  2 +-
 ...phinx_6.0.0.bb => python3-sphinx_6.1.3.bb} | 26 +++++++++++++++++--
 ... python3-sphinxcontrib-applehelp_1.0.4.bb} |  6 ++---
 ...> python3-sphinxcontrib-htmlhelp_2.0.1.bb} |  4 +--
 ..._1.26.13.bb => python3-urllib3_1.26.14.bb} |  2 +-
 ...idth_0.2.5.bb => python3-wcwidth_0.2.6.bb} |  3 +--
 ...-zipp_3.11.0.bb => python3-zipp_3.12.0.bb} |  2 +-
 15 files changed, 41 insertions(+), 50 deletions(-)
 rename meta/recipes-devtools/perl/{libtest-needs-perl_0.002009.bb => libtest-needs-perl_0.002010.bb} (86%)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.62.0.bb => python3-hypothesis_6.66.0.bb} (91%)
 rename meta/recipes-devtools/python/{python3-iniconfig_1.1.1.bb => python3-iniconfig_2.0.0.bb} (46%)
 delete mode 100644 meta/recipes-devtools/python/python3-poetry-core/deterministic.patch
 rename meta/recipes-devtools/python/{python3-poetry-core_1.4.0.bb => python3-poetry-core_1.5.0.bb} (89%)
 rename meta/recipes-devtools/python/{python3-pyopenssl_22.1.0.bb => python3-pyopenssl_23.0.0.bb} (86%)
 rename meta/recipes-devtools/python/{python3-pytest_7.2.0.bb => python3-pytest_7.2.1.bb} (93%)
 rename meta/recipes-devtools/python/{python3-pytz_2022.7.bb => python3-pytz_2022.7.1.bb} (89%)
 rename meta/recipes-devtools/python/{python3-requests_2.28.1.bb => python3-requests_2.28.2.bb} (87%)
 rename meta/recipes-devtools/python/{python3-sphinx_6.0.0.bb => python3-sphinx_6.1.3.bb} (49%)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-applehelp_1.0.3.bb => python3-sphinxcontrib-applehelp_1.0.4.bb} (62%)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-htmlhelp_2.0.0.bb => python3-sphinxcontrib-htmlhelp_2.0.1.bb} (70%)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.13.bb => python3-urllib3_1.26.14.bb} (86%)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.2.5.bb => python3-wcwidth_0.2.6.bb} (80%)
 rename meta/recipes-devtools/python/{python3-zipp_3.11.0.bb => python3-zipp_3.12.0.bb} (85%)

-- 
2.30.2


