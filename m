Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A328EB8FD8
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 11:38:19 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.10716.1694086690062940299
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 04:38:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=2jRFYSlL;
 spf=pass (domain: baylibre.com, ip: 209.85.208.178, mailfrom: pidge@baylibre.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2bcbfb3705dso15196081fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 04:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694086688; x=1694691488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=h/1JkrVQekPWMjje3bd/X0ifx+mU8fCC+De/ohBl9IA=;
        b=2jRFYSlLzFw0c3VlVuLc/AzMo5Y9WrjWmu3JBnqrly/MD9FNLClX/LFfenwWvf6WCQ
         Ch/sTY0FB578g2EPkaUe6Gw2a/czbvZeoBZlQ0k8o5p2yqHZyd0Luu0w7IG/K60sPxT7
         ejHLLwViX92PJfmcXVccA3TQYUFMpkSv/g0220hzx1sM5744fnco2IoN02Qds/2yqymk
         ZhwNHMkUMUDsknqu6Telx7e7ufg4i8WD22D/C9gj74qao/42lfAOh2gsx92jcMyqTJc4
         nT289b/Vlygf/6hnbECNikdeNy4hHT9Yk1rdNx3ilun1DUnDUd6Nz6/Etkjw27Z9Le6s
         gcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694086688; x=1694691488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h/1JkrVQekPWMjje3bd/X0ifx+mU8fCC+De/ohBl9IA=;
        b=FNDAWXyy3NaMd1/10J46GB41e5CeP1aF6mtfnLFkc4iKPBl6cCCRu2QJJOChuQiiJ9
         z0+SdblZuhzZTD7q4cHRCM0Vky8rZIzdJgVk0MCdNKnGgmnF1w2wCYvVxrxrImknmRld
         sHuQ6nCvPy9afpk9oDmxJ+DPS9lH6V7DVAGBXIp0HYAYWmiqAJE7mweWsPSKv3jAZyKh
         S286i8scE9SKCN3KR/0VBwXYSnDQo9jMPBpYI3JPlNIvGfgG/KyAZNcS1Mj1sAY1OSnd
         Vh1PgYRdJ0DJn/VhwW102UA9eXLaskvsOeALf9O0ZsKfcwyMFY1OjLdZYhD3xIhfGLL1
         Usag==
X-Gm-Message-State: AOJu0YzahyPizcVOoLQtLBhSrBxmSzw55Y9Sm14W5/mpOJc8Go9yuJAu
	QNAWpFob5Kxb7Y6jWlLvdTA9591wbMP7LA4kPYg=
X-Google-Smtp-Source: AGHT+IFZvSCd6Ot/GcoxswbJK8j5yXFXEjmEJ2Y6LCaeMQzgT3ACU7rqmsvDoE521MJmBSvNiAzBOQ==
X-Received: by 2002:a2e:995a:0:b0:2b6:c886:681 with SMTP id r26-20020a2e995a000000b002b6c8860681mr4540009ljj.6.1694086687992;
        Thu, 07 Sep 2023 04:38:07 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id l10-20020a7bc44a000000b003fedcd02e2asm2277293wmi.35.2023.09.07.04.38.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 04:38:07 -0700 (PDT)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] Fix nativesdk-intercepts for chown/chgrp
Date: Thu,  7 Sep 2023 11:38:01 +0000
Message-Id: <cover.1694086051.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 11:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187379

This set of patches started out with fixing #15023 where building the sdk with
api-documentation set would fail out. This patch series fixes both of the main
underlying issues.

First, populate_sdk did not the nativesdk chown/chgrp intercepts in $PATH. 

The second issue was within the chown/chgrp intercepts which were causing them
to fail badly. I'm not entirely sure these ever worked as prior to my fix the 
args for os.execv were:

./scripts/nativesdk-intercept/chown -R pidge:pidge README.md 
['root:root', '-R', 'pidge:pidge', 'README.md']

after (which is correct):

./scripts/nativesdk-intercept/chown -R pidge:pidge README.md 
['/usr/bin/chown', '-R', 'root:root', 'README.md']


Eilís 'pidge' Ní Fhlannagáin (2):
  populate_sdk_base.bbclass: PATH to nativesdk-intercept chown/chgrp
  nativesdk-intercept: Fix bad intercept chgrp/chown logic

 meta/classes-recipe/populate_sdk_base.bbclass | 1 +
 scripts/nativesdk-intercept/chgrp             | 5 ++++-
 scripts/nativesdk-intercept/chown             | 5 ++++-
 3 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.34.1


