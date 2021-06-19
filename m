Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.15820.1624060820090270336
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jun 2021 17:00:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nk3MlXIB;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id h16so6655219pjv.2
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Jun 2021 17:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=le+nkkwUvwMdGuvPSwh2ysJXJoEwjlPEfgod6zD8h+E=;
        b=nk3MlXIBmkQRw0g+KckYBU0Lg1CncVjqPSok+yJ4E4WQVRIvzeQcNOkxw1NJxbh/5I
         361yeajM0yzeq34XfBRe17qRXYbJ0Z8nMPbCzHuzguGHrmFoOoE4xtphNoLrfL/+HHZY
         3rjD4blVdr1zMjXKomFdCzZH+8elQz6qaXSJ0cQO1HNEwUjQcrwgfGs5lRYPMwfLZk8R
         1RhefOl7kbdCg72zkjATXcFHdZFWMzb7vfrjXmnRBTZCqbDGHr9Iu8zCpm7WtLWpaHm8
         50psvBrry/QEBdF9i69ioi2DYB0eV7HSaB4cNP2x+81baDpljH+NF+KNNBgPsfUZi1gh
         JYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=le+nkkwUvwMdGuvPSwh2ysJXJoEwjlPEfgod6zD8h+E=;
        b=QJysRUhdIzJdYvEPA/Ref9FxzJZk7oEg4lr2dLLGUfLvyQje0WCew91yy+m4SFVM7F
         UQqFU2Zms9Edd3VMnSIt+r8kCv1o3w5HjBmnO9rBqUeEYk85aaMnZDTmP9f07Rjv7Qyc
         w2kZ9r0kgadON0YPhIMBz8hcfduvK0WCmD5p+cWi80ouYG9Ud+81BDhl01ziubF+5bZv
         IBoMAIZiFnS1cYwAhxW2TC3Fshw98C2gLgw8dt7UPtgBWHjU4vGQSGdQ9Vcnf76+TZAe
         n++Cp3VP6+2IGKPInFPbJVevkWgehKyLgDvV1jDdDBWh/po31BI5N3+ALs2i3YnH8Ajm
         NrRg==
X-Gm-Message-State: AOAM533CZOccGA3hRQmyq512t8oIFwVA6LpN1C2s0L82EQqLLle3XGSj
	B9I8iyHLdbKwOTEKvdebtSbHE3RJCOTx0A==
X-Google-Smtp-Source: ABdhPJzMhvqiB4DOr5cUQd8QWs5964mUW/Rsc7vqtBRYrX6IZPtqk7H7O4A80HK1ea9cd5hc+7Ug7A==
X-Received: by 2002:a17:90a:ff98:: with SMTP id hf24mr25333203pjb.89.1624060819047;
        Fri, 18 Jun 2021 17:00:19 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:892d:1e9b:5562:7e0d])
        by smtp.gmail.com with ESMTPSA id z9sm9155334pfa.2.2021.06.18.17.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 17:00:18 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 0/1] python3: skip tests requiring tools-sdk
Date: Fri, 18 Jun 2021 17:00:10 -0700
Message-Id: <cover.1624060313.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running python3-ptest for any release since Python 3.8.8 with a minimal
target (e.g. python3-ptest), two test cases will fail:

https://github.com/python/cpython/blob/main/Lib/ctypes/test/test_find.py#L116
https://github.com/python/cpython/blob/main/Lib/ctypes/test/test_find.py#L120

For the autobuilder, these tests have always been running on an image
which set IMAGE_FEATURES to include 'tools-sdk', which includes the
required packagegroup-core-buildessential. Here we add a patch to test
for 'tools-sdk' and skip the tests if it is not present.

The following changes since commit b8723c114b3d9b58d2da1a86d728d176dcbeb4b1:

  nfs-utils: upgrade 2.5.3 -> 2.5.4 (2021-06-17 22:18:41 +0100)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib timo/python3-skip-test-find

Tim Orling (1):
  python3: skip tests requiring tools-sdk

 ...pes.test_find-skip-without-tools-sdk.patch | 33 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.9.5.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch

-- 
2.30.2

