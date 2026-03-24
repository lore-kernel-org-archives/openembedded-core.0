Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0850CFEC11B
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 21:37:25 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8546.1774388243939513780
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 14:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qIkxmlV8;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43b7ff8fe92so1089266f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 14:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774388242; x=1774993042; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=odcRmi9tg0oELdP2a8PWtGQiPkU7gNoMu1oiU6dtbjA=;
        b=qIkxmlV8nNTAI2FG8ThQNyrpyPqsruD745lvuSgqKsGKmrxoKOxkFMS5vrVd0uwDZs
         ru5rIa6Zln0PjLbdJXyO0NYU4q2pkd9ia6TPB+R4Tcwg3mMVToA3qA0oUlF5d0dAvqcf
         TEWeKL9wjyEC3LSruA+04NDhn81xfq5Qc2FRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774388242; x=1774993042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odcRmi9tg0oELdP2a8PWtGQiPkU7gNoMu1oiU6dtbjA=;
        b=dtxHs2twavqA497+TeXAgZ0fVypFkZF7eRWLfYOH7hhsv/m6fap4M55/R8xEV8e//o
         6gFsEgWJd73mTd7HvymQ+J5Zyu9i0skiJhy4bwmYVHA+EI+hVkT+s9U8yFLh1NemLj9C
         SgCby7MwS72MDcSx6Vwz6N20/6+LYCUD2We0l/mwSsE9r4dQpAw7uKh8JYNkbqqPZ8nq
         Vrcjz24uEV86KJ225vkGt5YN6KMZp+2PTS7TyvYlTvBr0Cf1Fx8GSCr4iHAQVhkwkiz0
         gqGbfeSu+emBl06H02IutTroo6p9KDGnuHnjkRyPSKE0idppf7pu196WjaPcCUJBdt5N
         7o8A==
X-Gm-Message-State: AOJu0Yz9SpvWlzvce72fPO9otgv5YqaFWoo7jT+s8gIgDLV4LWGd8Hsf
	RQkcIUG/sURmIALi+ysdHbKbfxsLnCgposalH6pLKFoX4SiLOAPq3iE1Nm6JQgBeLqyuIlDhe+b
	45PhD
X-Gm-Gg: ATEYQzzN003/hQlFdYU57bACM/PWvR7bXlZs10HqirpqQLnQopTgGSd0T3Hl9iPOQGk
	QayKk/aKnlI7IPvrTiuK20Aw4bBum3tXTuu6+P/opl9F41+OHFDmfaF/Im9/Z4aPj3sXUNhPQNK
	MzMzHDp+TBY+zo+w3Z4jTYAhpEdR78sBSLTfPSK2KzIonGhdSMuX2bRaxtAQyYrz8RbD6TbpKt5
	OXHeQN3Ykc8rKiJogi390CWtuHqndcFBI+n0ZI38lT7ZRELkaR2o+A7iNIHEUKT0Rfk7PII3xAu
	6hHYKp1xCRn/JkgPfPhyZLZD5DHYY7rERarE+mnp33k/lLh6qq1IiHt2GX1gKP/wsi1qulPHLQE
	DbBjNnP5Od/+3jUxKuhPVhQqijOJ6EErgQrvv3m5CCITSNjISMvg8BZvXvlqSV0LO7DWYLT5aJ8
	/qX6gI0umzI5Oo81AUzghG+lQPzQx0C3YvwbF+kbcf1I88ZBL3NEbiQgg16encL0st8oHtgIJ2T
	rqV4IYxgBd/y3BE3vTwIkb+tSM=
X-Received: by 2002:a5d:64e6:0:b0:439:c5c5:4146 with SMTP id ffacd0b85a97d-43b889991bbmr1584400f8f.11.1774388242044;
        Tue, 24 Mar 2026 14:37:22 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470f902sm43552478f8f.28.2026.03.24.14.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:37:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][whinlatter 0/7] Pull request (cover letter only)
Date: Tue, 24 Mar 2026 22:36:54 +0100
Message-ID: <cover.1774362293.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 21:37:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233827

Those are the patches from the last patch review (no change):
https://lore.kernel.org/openembedded-core/cover.1774047909.git.yoann.congal@smile.fr/

Passed a-full on autobuilder with 1 AB-INT failure:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3471
* meta-arm failed (reported to the meta-arm ML:
  * AB-INT failure in whinlatter/edk2-firmware do_compile https://lists.yoctoproject.org/g/meta-arm/message/6967
  * Successfully retried as https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/3303

The following changes since commit ab57471acad7ce2a037480dc7b301104620f1ebf:

  build-appliance-image: Update to whinlatter head revisions (2026-03-16 11:05:22 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/whinlatter-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/whinlatter-next

for you to fetch changes up to 2d6383491f4246a93e1a49a9fe258d873adf8b76:

  curl: patch CVE-2026-3805 (2026-03-19 08:45:38 +0100)

----------------------------------------------------------------

Krupal Ka Patel (2):
  python3-setuptools: drop Windows launcher executables on non-mingw
    builds
  python3-pip: drop unused Windows distlib launcher templates

Peter Marko (4):
  curl: patch CVE-2026-1965
  curl: patch CVE-2026-3783
  curl: patch CVE-2026-3784
  curl: patch CVE-2026-3805

Vijay Anusuri (1):
  inetutils: Fix CVE-2026-32746

 .../inetutils/inetutils/CVE-2026-32746.patch  |  40 +++++
 .../inetutils/inetutils_2.6.bb                |   1 +
 .../python/python3-pip_25.2.bb                |   9 +
 .../python/python3-setuptools_80.9.0.bb       |   9 +
 ...d-macros-warnings-and-related-tidy-u.patch |  44 +++++
 .../curl/curl/CVE-2026-1965-01.patch          | 138 +++++++++++++++
 .../curl/curl/CVE-2026-1965-02.patch          |  29 ++++
 .../curl/curl/CVE-2026-3783.patch             | 148 ++++++++++++++++
 .../curl/curl/CVE-2026-3784-02.patch          | 162 ++++++++++++++++++
 .../curl/curl/CVE-2026-3805.patch             |  67 ++++++++
 meta/recipes-support/curl/curl_8.17.0.bb      |   6 +
 11 files changed, 653 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch
 create mode 100644 meta/recipes-support/curl/curl/0001-build-fix-Wunused-macros-warnings-and-related-tidy-u.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-01.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-02.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3784-02.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3805.patch


