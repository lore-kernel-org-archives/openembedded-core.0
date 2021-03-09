Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web09.14440.1615317824818072707
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 11:23:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hGcUvSh0;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id 130so14235348qkh.11
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 11:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gXWysJFTBzyumPSwVqFlKn0yrQRzBHy8/iygG9L/TVA=;
        b=hGcUvSh0w44CcGBM2PJLJPcXMUaurBZlnNxo8Z885ldBk1/pZZ33p1wNOYSLmOK8oe
         akjuNTMIiI5GsQ1bMA3uBf3CygwfMfSXn0ThAtOlPrw6zy1qypJYJsDC+EkpGVOWAoQk
         rDJnabo5ntoOpjNUCxVlV9R97pTwUuQ+ksntvE3M3PXeJzzObH81raHMWH8tAQE5a+ii
         s0vJDEhmJxygnj3c985KiMTvisBVnuOD6/D4dG4QZuqSSA4V6jeftKLcim31MW3ua5B8
         dGSd/5ozTvT36JshE6qBcxIlW+7XT3OS5i8Q3hhFg6P8XutjKMf5Xg43Eavtc2yNSVj9
         T+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gXWysJFTBzyumPSwVqFlKn0yrQRzBHy8/iygG9L/TVA=;
        b=oDm1rso4Ypgc2YvOloRyk1mBDS5D8u47LVrpPxUAF6uaD4iuLkwss+mKGbyfOha5bu
         WXCkqO1rBynGh5lA7Iz4yzn7fy/tu2rxVOo4ayML9wK+QOY3e/kcoTFZWS34vL3gokRd
         K2mLwXbgf+ho00TZn9rNUrnZp3cD4OP/O6N4m6JCo+4C85Aayj1o73rpaTCGl1wAuMcO
         9mnKJtkfl4B8RUOjeowQZhoxYhFbPRFoiXPihjS3JiDq7+wgpRFxDXj3HGcT00ye0TTk
         1IoMrF8ZhCOjrhY0fse9hPOUTCAzMa28qSTAbxp6vwqYRpfEFYfc+LPTnKFCK9mTRoa8
         DdSg==
X-Gm-Message-State: AOAM5314iWr34pdTWIzMfoIcxvQ43dJRV6FGHelg2bla28FsGuJYRoig
	JYzPmqXpXRuPRn9BYjJuxOo=
X-Google-Smtp-Source: ABdhPJwp/UCIelHhZD/fZiWpee7pLzba5NLOygNxnct4TyQURnUm93a18UzWnoP11Raaqjx47ugvnQ==
X-Received: by 2002:a05:620a:152c:: with SMTP id n12mr2487618qkk.334.1615317823792;
        Tue, 09 Mar 2021 11:23:43 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id f13sm5713377qtf.57.2021.03.09.11.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 11:23:43 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] kernel: consolidated pull request
Date: Tue,  9 Mar 2021 14:23:35 -0500
Message-Id: <cover.1615317549.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's my latest set of kernel changes. They are a bit more varied than
at times:

  - stable updates. These shouldn't be an issue
  - kern-tools: minor fixes from the list

The more time consuming change is the perf reproducibility changes. They
are passing locally for me, so could use some time on the AB to see if
that is truely the case. As usual, we don't patch perf, so these take the
form of various sed changes to the source. They shouldn't cause issues on
older versions of perf, but I haven't tested that extensively.

The changes are specific to our builds, and I need to re-consider them
in the context of upstream (since quite honestly, I don't know why some
of the paths that were being captured were being captured at all). I've
marked them as such in commit header and in the recipe.

Cheers,

Bruce

The following changes since commit 281eba70c2c3beef556949980d7f81e7461ba5dd:

  bitbake: __init__.py: Fix bitbake debug log handling (2021-03-09 00:02:41 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  perf: fix reproducibility issues
  reproducibile: remove perf from exclusions
  linux-yocto/5.10: update to v5.10.21
  linux-yocto/5.4: update to v5.4.103
  linux-yocto/qemuarmv5: fix configuration warning
  kern-tools: symbol-why fix and README update

 meta/lib/oeqa/selftest/cases/reproducible.py  |  1 -
 .../kern-tools/kern-tools-native_git.bb       |  2 +-
 .../linux/linux-yocto-rt_5.10.bb              |  6 +--
 .../linux/linux-yocto-rt_5.4.bb               |  6 +--
 .../linux/linux-yocto-tiny_5.10.bb            |  8 ++--
 .../linux/linux-yocto-tiny_5.4.bb             |  8 ++--
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++------
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++------
 meta/recipes-kernel/perf/perf.bb              | 38 +++++++++++++++++++
 9 files changed, 75 insertions(+), 38 deletions(-)

-- 
2.19.1

