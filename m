Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12627EB64DA
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 14:28:17 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.15184.1689776886050502111
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 07:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=5IvCZxWk;
 spf=pass (domain: baylibre.com, ip: 209.85.128.51, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742bso69840325e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 07:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689776884; x=1690381684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eqFNeJwzJmvqpmiSJuuYdqrfO3FYtSdAAXabUfDk+Gc=;
        b=5IvCZxWkUjqn/44w0xtj9YmqXWAu2PGEuEn5OSUW9/GPk6Z5puYpGeIwXa6w/ZVuJq
         09LzC/6zg2b6FybweBym2hk3FL9TheNQoQQ55qifIHuDW6HIpMfHmSqZ0PDpVErbCP2w
         r79cdw7iAaEQL/K9bpx1qY1RUg/ZJKQS4jmpZpPQjW5i1oxYOPv/TDca95OJnBkprsM8
         KpCq1SY6x4x1baqH5LXHG5/mWYum9gwSM7rA8c1YFc0MpB7CqZjt5kbhAslMHQn+cD0h
         VZ+uWsAMdHirbvFm1nQbEpMWHoIU1D+CqteSAiwYn5PoQsN3XCqohIj9CwY4hgHGjaMs
         PDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689776884; x=1690381684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eqFNeJwzJmvqpmiSJuuYdqrfO3FYtSdAAXabUfDk+Gc=;
        b=Tz9U+Gj4RH8GHC3PC95GgYts81DtZj3qs5mJcpHJ2BAc0ois++GslwJzeJIH+3qw3Z
         D38hLHENCl5bIFqtxLctBAxIxs0Tm/PG2tHOCytTevxiCO7BxnL5JxsRulJ0Vv+P/tdR
         7mYV2brEfMcAwI60DOfWnCc2jl/+msjmKCRnAhhIogDSfKetZOvIIfWpLUFizD0fNDKI
         vH3+VWMJFuHhwasO7EwlZ/CYwff8IQ4N87hqRG3KHuohqO72/2l6ttthDwjQ1DyeWo2K
         1WWO8iVrwhSWgXAtaLXaP9FT957c3zwaSD+/KVnecK5IykrEl2Lj4q1wyTHbuSMgk3+k
         DDiA==
X-Gm-Message-State: ABy/qLZUNBnAF9KH2Eg93tVhH84kblY0cesP1sU1QdXgW816sohi/nE9
	OSjfeLrcPzBV7ESJz2CzVCWkVoJil5qHf7i09NHBVA==
X-Google-Smtp-Source: APBJJlHjolyBScJDsHeZqN9BfvzjUDXEDm2x30ZN3PhN22LmoydH0AcwFTvKKjyukdX5dqjbQWT68g==
X-Received: by 2002:a1c:7319:0:b0:3fb:d194:8332 with SMTP id d25-20020a1c7319000000b003fbd1948332mr2260362wmb.30.1689776883651;
        Wed, 19 Jul 2023 07:28:03 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:fd3b:9fed:e621:cc8f])
        by smtp.gmail.com with ESMTPSA id m21-20020a7bcb95000000b003fc00789d5bsm1872544wmi.1.2023.07.19.07.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 07:28:03 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [RFC 0/1] Add bblock helper script
Date: Wed, 19 Jul 2023 16:27:57 +0200
Message-ID: <20230719142758.84540-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 14:28:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184584

Hi all,

I am currently working on bug #13425 and I would like to post my wip
script as an RFC to get feedback on it, before going further in the
development.

The script `script/bblock` can be used with the following command:

bblock [list of recipes to lock]

Here is a summary of what is currently implemented:
* can lock several recipes at once
* on first execution bblock will append `require bblock.inc` in
  `build/conf/auto.conf` (creates `auto.conf` if it doesn't exist)
* on first execution creates the file `build/conf/bblock.inc` with a
  dedicated header and:
	 - adds SIGGEN_LOCKEDSIGS_TYPES += "t-bblock"
	 - adds SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "warn" to display warning but
	   do not stop the build
* loops over all recipes to lock and adds entry with latest "do_compile"
  signature in `conf/bblock.inc`, such as: SIGGEN_LOCKEDSIGS_t-bblock += "bc:do_compile:e233cd793137a92dd575a417a2877e324ce526c4dc4a7db652abb9512f406f1f"

Limitations:
* only gets do_compile signature for now as a POC
* `bblock reset [list of recipes]` not yet implemented
* no check if a recipe is already locked

Steps to test the script:
bitbake bc --> generate a signature for bc's tasks
bblock bc
# modify do_compile in bc recipe to force signature change
bitbake bc --> throws the following warning: `WARNING: The bc:do_compile sig is computed to be 680bd6c291bf88e379e0c405a773cf5f81851e1a52570398cefd0196000ac1ef, but the sig is locked to e233cd793137a92dd575a417a2877e324ce526c4dc4a7db652abb9512f406f1f in SIGGEN_LOCKEDSIGS_t-bblock`

I also have a point I would like to discuss: I only get signature for
do_compile for the POC but wondering what should I do here:
* have a set of predefined task to lock, in that case how to choose the
  tasks?
* compute the list of all available tasks for a given recipe and get
  signature for all? Is there a way to get such list without using
  `infoil.build_targets(pn, "listtasks", handle_events=True)` as this
  will start bitbake, takes some time and requires some processing of
  the output
* add an option for the user to specify the task he wants to lock? (this
  may be useful to add anyway)

My branch is available here [1]

Am I going into the right direction?

Cheers
Julien

[1]: https://git.yoctoproject.org/poky-contrib/commit/?h=jstephan/bblock

Julien Stephan (1):
  scripts/bblock: add a script to lock/unlock recipes

 scripts/bblock | 92 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100755 scripts/bblock

--
2.41.0

