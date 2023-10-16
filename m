Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B37CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 19:45:02 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.177899.1697485500753438032
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 12:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=qYs25ehr;
 spf=pass (domain: baylibre.com, ip: 209.85.167.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3af603da0f0so3206339b6e.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 12:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697485500; x=1698090300; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kdo7VXp0WaYWwydMlhzn4k8b29n+asIQGmS/vsXpxoI=;
        b=qYs25ehr42TH7LpKKxJmpL3yghM21wNBE1w22ooTh7NDC8DMg4QV5v2FQvrOwH7Oq2
         ygh7iVYxj/ed6fAq7ChIix0Pd4Dsmll3MtbVPY9CPUilpK+gbE1EHxmw9DtrRUcfUXZO
         +pyXeAEKUOXyZugkS0L9mvGaAgpBFrpOP2lhrK8YJTCPXtvTiEKn89AFY9pVlX9dAUJS
         AX+8zIrgnHRroeD4IVYYND0cfAsQnrJFh3pSttYKsLSbgtBYPqTvAaBEaS/DmjWw3JrP
         QQWO4UnwhbNTvLdVqZzucQ7cj+O4Bmmqm6coiNXzWRjE8cSLqFCVScjy3YV+hrnQXTfc
         PmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697485500; x=1698090300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kdo7VXp0WaYWwydMlhzn4k8b29n+asIQGmS/vsXpxoI=;
        b=bSqkidEHz9kYl7bXvLffqBuxbGV7AwMWzxZ9WErf+7/0BW7wFVfUayS7iTaHTFGd65
         UWkmJiQcx0Q8G2R7O7p0YfGLA6/P6VWunZ6lvMg8x5W6AHWvqNpgb8bDY6/nbR9G2SAJ
         60Ob7OQ+xgkg4+h4ubPAzVdOFQv7R2V3J5HY3EGAigZEF65wPC0EwF6PUeTEcBM+4WlF
         ud35yHwTV5UcKpqw1sespMwCmJw0He+pC6AeE6zyCO3Gm03DaSW2Fy+kUrbFEF0ZjMzi
         znUp+jTpbVPshJtA8e2GK3HOiSx0yIiy0b1VA+k1NKVV5yopRrkUOpdo1BH+oGruRRjc
         NsvQ==
X-Gm-Message-State: AOJu0YxbpovpQ8UFQ8T5CtwU2zfv3gbtz+DbMeIhzNUZJaQyZyL+15yK
	mn4PvxN/37tM7kMMukZHxqohebVUiEXA9mwHwQtHAQ==
X-Google-Smtp-Source: AGHT+IEdPrMVaZzrBbVL6gOrE07W0NAb9QlbYI1inUMBMsLE6R+Ty3U0HrPldOrx71aUcx9pShgEHg==
X-Received: by 2002:a05:6808:1522:b0:3ae:1031:594 with SMTP id u34-20020a056808152200b003ae10310594mr394441oiw.34.1697485499944;
        Mon, 16 Oct 2023 12:44:59 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id l22-20020ac87256000000b004033c3948f9sm6733qtp.42.2023.10.16.12.44.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 12:44:59 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 0/4] patchtest: add to oe-core
Date: Mon, 16 Oct 2023 15:44:54 -0400
Message-ID: <20231016194458.2243201-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 19:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189309

Add the patchtest core tools and supporting scripts to
openembedded-core. This will enable users to validate their changes
locally against the repository before submission to the mailing list,
reducing maintainer overhead and encouraging more consistent use of
important patch tags and information. Note that there are a few elements
of the tooling that are still under development, namely the
patchtest-send-results script, which is currently hard-coded to mail
test results to test-list@lists.yoctoproject.org (and only that list),
while in the future it may be adjusted to directly reply to user
submissions.

A scripts/patchtest.README file is included for basic instructions on
how to use patchtest, as well as for submitting fixes should any bugs be
identified. The Yocto Project Contributor Guide will receive a single,
corresponding patch to provide similar details on why and how to use
patchtest. Finally, the patchtest layer itself will be reduced to only
those pieces that are required for building the core-image-patchtest
image, which makes special adjustments to kernel configurations and
initscripts that are only suitable for automation, and therefore outside
the scope of most contributors' usage.

Trevor Gamblin (4):
  patchtest/requirements.txt: update
  patchtest: add supporting modules
  patchtest: add scripts to oe-core
  patchtest: set default repo and testdir targets

 meta/lib/patchtest/data.py          | 100 ++++++++++++
 meta/lib/patchtest/patch.py         |  73 +++++++++
 meta/lib/patchtest/repo.py          | 185 ++++++++++++++++++++++
 meta/lib/patchtest/requirements.txt |   2 +
 meta/lib/patchtest/utils.py         | 179 +++++++++++++++++++++
 scripts/patchtest                   | 233 ++++++++++++++++++++++++++++
 scripts/patchtest-get-branch        |  92 +++++++++++
 scripts/patchtest-get-series        | 125 +++++++++++++++
 scripts/patchtest-send-results      |  93 +++++++++++
 scripts/patchtest-setup-sharedir    |  95 ++++++++++++
 scripts/patchtest.README            | 156 +++++++++++++++++++
 11 files changed, 1333 insertions(+)
 create mode 100644 meta/lib/patchtest/data.py
 create mode 100644 meta/lib/patchtest/patch.py
 create mode 100644 meta/lib/patchtest/repo.py
 create mode 100644 meta/lib/patchtest/utils.py
 create mode 100755 scripts/patchtest
 create mode 100755 scripts/patchtest-get-branch
 create mode 100755 scripts/patchtest-get-series
 create mode 100755 scripts/patchtest-send-results
 create mode 100755 scripts/patchtest-setup-sharedir
 create mode 100644 scripts/patchtest.README

-- 
2.41.0


