Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web10.5889.1591152851114839954
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 19:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QCxFP6BC;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id a13so1015589ilh.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 19:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ci2ArnvuMKbGfPTv0mUZQ25DENEbgfyR5XukfwVoMTQ=;
        b=QCxFP6BCuTDbWF9ENPev0ZDKSeMUp2yt06ThdUIYEbQqRGWPk8XjyR3BnbyKaswQr9
         FQs81zafnjxNj5nDVIYmoLG1k4NpcbR8O0oyNXWIy9FTuVC6ANZbE0JjUCMDeMuRnxHn
         4Yj+VOHN5tzF4q1WMIhLMVoBZsg17dmviS7zQllMcPkFq9y9PRmKDFboJIP+wR29wzFt
         taURm6uOiqSgB06UYRKgAkhQXuVQr84Xf1lUE9/m1Ukkk/wTtXnlyQ0fnE0UNx2x/A6V
         y7gclnREDwCkOz9fb7iJbxI7x9Ov8QbASikVEoT34Vu5579fiHArU8Y6ktIk82CcAWjm
         pgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ci2ArnvuMKbGfPTv0mUZQ25DENEbgfyR5XukfwVoMTQ=;
        b=rc4zC6C03r3Y0hy6P5TnWff5osmWIxzAGofNwfi7V7SgdlcIO57oynrUU8TR0+td17
         a1mE2iWlyvUEwURnES+SxDerXMK8LB32nVQ4i3zeHG4g8oB9/vnJW2ikXSecT9SBe8jM
         oWoXMbkyCfAmIzFKdK0YC123NzXsjnazjQIPr9cu2bTDoce5uAT65kZaH8SbRCTpWYio
         SPmeC3DNt0AWoYIZ7UVjzptb6J5WwVaPwPD7itmnTizCAetDQufmOfK66ZtDkPx5fsyy
         Ksz3Or07mk5Fdj1x8yWLhm3i0KcQDbZTZ0n78kHErI59C6vHOuecdKf03VZcIPvEcgRj
         xnzg==
X-Gm-Message-State: AOAM530E/kLX67zxJMCNHxLVq42Kxg/AwTzYuhxa1OVm90dzWPTTtM5G
	sT4Q9Hf5Vdp47/MpFCdd3POyr7It1H4=
X-Google-Smtp-Source: ABdhPJzDim+IKOry8HjS7T1z/5V1XuLsf9bldBejnXbeV1wNk5O4ymxXyrUIqSBP5t4h3G4jlOpuwQ==
X-Received: by 2002:a92:6b10:: with SMTP id g16mr2031084ilc.29.1591152849817;
        Tue, 02 Jun 2020 19:54:09 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:b01b:daad:c850:7bb9])
        by smtp.gmail.com with ESMTPSA id x15sm355643ilj.78.2020.06.02.19.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 19:54:09 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 0/8] Add support for per-multiconfig BBMASK
Date: Tue,  2 Jun 2020 21:53:57 -0500
Message-Id: <20200603025405.26885-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200601202807.26357-1-JPEWhacker@gmail.com>
References: <20200601202807.26357-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Splits apart the bitbake configuration data and caches so that each
defined multiconfig can specify as separate BBMASK independently of the
other multiconfigs. This can take multiple forms, such as a `BBMASK` in
a multiconfig .conf file, or BBMASK assignment based on an override (see
linked bugzilla for an example).

The most noticeable change is that bitbake now keeps a parsing cache
file for each multiconfig instead of a single parsing cache file that
caches all multiconfigs.

V2: Fixes some syntax errors in tinfoil

V3: Optimizes caches so that each one only caches the files for it's own
multiconfig

Joshua Watt (8):
  bitbake: cooker: Split file collections per multiconfig
  bitbake: cache: Use multiconfig aware caches
  bitbake: lib: Add support for Logging Adapters
  bitbake: lib: Add PrefixLoggerAdapter helper
  bitbake: cache: Improve logging
  bitbake: cache: Cache size optimization
  bitbake: tests: Add tests for BBMASK in multiconfig
  bitbake: command: Move split_mc_pn to runqueue

 bitbake/lib/bb/__init__.py                    |  30 ++-
 bitbake/lib/bb/cache.py                       | 228 ++++++++++++------
 bitbake/lib/bb/command.py                     |  39 +--
 bitbake/lib/bb/cooker.py                      | 159 +++++++-----
 bitbake/lib/bb/runqueue.py                    |  17 +-
 .../bb/tests/runqueue-tests/conf/bitbake.conf |   3 +-
 .../runqueue-tests/conf/multiconfig/mc1.conf  |   1 +
 .../runqueue-tests/conf/multiconfig/mc2.conf  |   1 +
 .../recipes/fails-mc/fails-mc1.bb             |   5 +
 .../recipes/fails-mc/fails-mc2.bb             |   4 +
 bitbake/lib/bb/tests/runqueue.py              |  15 ++
 bitbake/lib/bb/tinfoil.py                     |  26 +-
 bitbake/lib/bblayers/query.py                 |   4 +-
 13 files changed, 360 insertions(+), 172 deletions(-)
 create mode 100644 bitbake/lib/bb/tests/runqueue-tests/recipes/fails-mc/fails-mc1.bb
 create mode 100644 bitbake/lib/bb/tests/runqueue-tests/recipes/fails-mc/fails-mc2.bb

-- 
2.26.2

