Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85926EE49AC
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 14:38:11 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.1003.1692628688372858342
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 07:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=z+9tMnR6;
 spf=pass (domain: baylibre.com, ip: 209.85.221.44, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3110ab7110aso3119901f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 07:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692628686; x=1693233486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7nY15HJG/F/YTMjdtsun71e1bDYrSOMM1ZgvUUD3TOQ=;
        b=z+9tMnR6T29bl3D0Gunohcw5H12zCZw5rAdd3YpR+BON7Wp5cdmPlf3N0RG9pCEzgL
         dojiq0qLE4IAbBHRVVIC4WvYbGyNg9byKXAfmLdAwSFA4Nkkw1s6BDYsKyTcqYJp6ZrM
         Dcz7GVdpIAR0PqTQkr4MzsV0Z4T7CPgrcHcOwmrx7qn+qNO/FxsjigFiVv1gczfIc0Go
         6Q9pKyhynLXRLRFJvj6N6HBH03p0Es+jCjKbIpT6uBkxGsuvWFrbfrE1f59mb34bUvcv
         MDa3kLY2Ze3Lya8XMd408+n+ZKF9CMHZIuoRMoXTASgLlxDcNYK3HlKEAccPSaCz06NO
         Um9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692628686; x=1693233486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7nY15HJG/F/YTMjdtsun71e1bDYrSOMM1ZgvUUD3TOQ=;
        b=jPoeOjMtvVCd4WFoD2wAhlMH5FITcEr/6U7JdymtwDlQNyEskLVolj4qpbBDvrnhD0
         JcJ0veuqTc0rNNJ+rzJru1XoUhFYNPYW7yIASSAXXClz4IXgAUy7JAZ3KmGciSR2AMXu
         h4O3hQs3fqVeFicwH6GdtDWhdRdI6PVA7Zc9nePP7SIvjwiUliruyzLUMuY8xK15d/cq
         LDVTVPXhtFif+OJmO+An5wMj/LlwWVsV9jlLWrmpLCxBbmQn64uR5nTk8EGaa3ZSq1hC
         BMtZo3l/Mr/1nF/tqb4756aRdifNT0xvs/ksHP1GIxT/hr189nDfbBGU9MvVxRAGnnk1
         OULA==
X-Gm-Message-State: AOJu0Yy5hAJ0Mvx4q6mweNszmuoMvHG2u3mr/rYdXlT7B2CufEIwLfGq
	3NvB1eb3uXkKNMtF1pCf1kdJv4xun9IcFXvEowoV4w==
X-Google-Smtp-Source: AGHT+IF+kGzZV5lICwx7vHHBefAKW26avr/SJqfbFF1aXwfHFXiXLndiNrwTEvN2f1Aesoz8oY4Xfw==
X-Received: by 2002:a5d:62ce:0:b0:31a:ed75:75df with SMTP id o14-20020a5d62ce000000b0031aed7575dfmr4152295wrv.15.1692628686294;
        Mon, 21 Aug 2023 07:38:06 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:fd3b:9fed:e621:cc8f])
        by smtp.gmail.com with ESMTPSA id i14-20020a5d630e000000b0031980783d78sm12667558wru.54.2023.08.21.07.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 07:38:06 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v5 0/2]  Upgrade less and add ptest 
Date: Mon, 21 Aug 2023 16:37:59 +0200
Message-ID: <20230821143801.2797029-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 14:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186446

Hi all,

Release tarballs now include lesstest so upgrade less to latest version and add ptest support for it.

My branch is available on poky-contrib repository [1]

v1 can be found here: https://lists.openembedded.org/g/openembedded-core/message/183894 
v2 can be found here: https://lists.openembedded.org/g/openembedded-core/message/183919 
v3 can be found here: https://lists.openembedded.org/g/openembedded-core/message/183931 
v4 can be found here: https://lists.openembedded.org/g/openembedded-core/message/183943 

Changes in v5:
- do not switch anymore to github URI
- upgrade less to v643
- remove patches that were merged upstream

Changes in v4:
- add verbose output on failure

Changes in v3:
- add locale-base-en-us in RDEPENDS:${PN}-ptest to fix the failing test

Changes in v2:
- split commit in two: one for switching to github and one to add the ptest support

[YOCTO #15073]

Best
Julien

[1]: https://git.yoctoproject.org/poky-contrib/log/?h=jstephan/add-ptest-for-less



Julien Stephan (2):
  less: upgrade 633 -> 643
  less: add ptest support

 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-extended/less/files/run-ptest    |  3 +++
 .../less/{less_633.bb => less_643.bb}         | 24 +++++++++++++++++--
 3 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/less/files/run-ptest
 rename meta/recipes-extended/less/{less_633.bb => less_643.bb} (66%)

-- 
2.41.0


