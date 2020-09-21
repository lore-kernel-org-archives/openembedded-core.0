Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.43053.1600697789612705207
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 07:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=YF/RFnZv;
 spf=pass (domain: blade-group.com, ip: 209.85.221.68, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f68.google.com with SMTP id w5so12949107wrp.8
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 07:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EEeGNcYyEtkKMUHCudW1WINf4T+kwIjUIZqz7GMwCCk=;
        b=YF/RFnZv1Z0vj8GxOC9WMOjGeQA/goygT1jwH8EVuLKkfbe90a1uyyFTwZBUXq5QA6
         qjexwC+hwHhC6MZgGk3+kFkRi5nWyvc589bug6iCxQK2A9hBP8Zd+fFus2GO5waISyhm
         PGJnwxWNDaWWSm4pSs63Jp7QlIwGXupXNjZ5lBjCKu/wjP1n4rBJMnhjLowBy3ETLcUj
         S9UF0pPfg2DWRwz/uLEqqbIxOYkvXLAUmwlt0DPcSG1EfkPumG0e1P1VQFRxaEOfxuVA
         mJ8Nrg4MwOOOgoLLCHGNL7FwKh4hS2ZZHco6fKKuJtTrr47RhlLnlfxMe4HaBaKUdkJx
         mwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EEeGNcYyEtkKMUHCudW1WINf4T+kwIjUIZqz7GMwCCk=;
        b=g7kch9tf6RbNExKYcEgupTR9ApGAUS+xNmB8semvMWiiv5BJY1HjYbJnRuMfJPiy9W
         thAlkN6IT1VYKedjGDAD6PpZb6tU8GfQXUD6qofWLmAxZjr8/6PchB6hN00KjRXvQxyl
         QuQb0rC+KnXs86OUkvFm6P8RnGbdqQT+qEYcFH2L4eqVGrhCYWZCPl5+90mehFJqdf6C
         RkR+MfNb1BTeTKduP09yNoUIqYrtfYEUmARC9ivPMbE1Ys3Odb/ihbbKOGeLBIN08I8Q
         ozAWbYJ8KmRHoq/rr/cEXjIYEBtXmrEmYFr9X+brSJQ1BLTp1Am0B6Se86Sc4zHfz3Ul
         G6Uw==
X-Gm-Message-State: AOAM532KsADSTZn0CSaeeVaVp4FCnql7ZcVXBcBNKmo5FxQrYrhJd2sg
	5yv9N6YkhXwd6LwS1wM3Oa2PBCvWFiX881qU
X-Google-Smtp-Source: ABdhPJx4kdOgR7xvAwrhamdtc04W25NbJA+N17bOKUYJ/50qx0r4E3EWMhUWXCTK8DPAk06gdO0EOQ==
X-Received: by 2002:adf:fd90:: with SMTP id d16mr22269wrr.52.1600697787260;
        Mon, 21 Sep 2020 07:16:27 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id f14sm22524804wrt.53.2020.09.21.07.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 07:16:26 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH 0/8] systemtap improvements
Date: Mon, 21 Sep 2020 16:15:36 +0200
Message-Id: <20200921141544.3145189-1-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

The goal of this series is to allow for packages to provide systemtap
probes and get them cross-compiled on the host, shipping only the
minimal runtime in the filesystem.

People willing to build the probes on target can continue to do so
with no changes for some many users, but usage of python probes now
requires systemtap-python.

This series also includes unrelated fixes to the systemtap packaging,
on which I stumbled while on the main subject.

Of note is the "fix finding proper System.map" patch, for which I
wonder if the real fix would not be to keep an unversionned System.map
file in kernel_build_tree, so stay compatible with upstream kernel.


Yann Dirson (8):
  systemtap: split examples and python scripts out of main package
  systemtap: remove extra dependencies
  systemtap: clarify the relation between exporter and python3-probes
    feature
  systemtap: fix install when python3-probes is disabled in
    PACKAGECONFIG
  systemtap: split runtime material in its own package
  systemtap-native: fix finding proper System.map
  kernel: consider vmlinux a build artifact, so systemtap can use it
  New systemtap.bb class, and systemtap-demo.bb to illustrate it.

 meta/classes/kernel.bbclass                   |  4 +
 meta/classes/systemtap.bbclass                | 74 +++++++++++++++++++
 .../systemtap/systemtap-demo_git.bb           | 71 ++++++++++++++++++
 .../systemtap/systemtap-native_git.bb         |  6 ++
 .../systemtap/system-map-location.patch       | 26 +++++++
 .../recipes-kernel/systemtap/systemtap_git.bb | 38 ++++++++--
 6 files changed, 213 insertions(+), 6 deletions(-)
 create mode 100644 meta/classes/systemtap.bbclass
 create mode 100644 meta/recipes-kernel/systemtap/systemtap-demo_git.bb
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/system-map-location.patch

-- 
2.28.0

