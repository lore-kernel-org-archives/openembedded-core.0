Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.40553.1600690327817756679
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 05:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HY+ZVl7h;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id c18so12489658wrm.9
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 05:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vyz2SW17TkmxnX9foNr6XiRP0mPTW2fzT0PchdA4BQE=;
        b=HY+ZVl7hu1rwmvKT0NaWK9eByV8A/dQpAs+WbjuUS/+hUBrutNTcj+zdNfOMWsVjG8
         LoR55n3wBgdS2+PWIMd9SdQTnnCcp0rMQ4pngWyqOKoHjvFKpD/LlcIl6/YwQJLl0EPk
         k8dijMHECACK5LzT2To6SYwq1EkM6D3UGPKDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vyz2SW17TkmxnX9foNr6XiRP0mPTW2fzT0PchdA4BQE=;
        b=ouMpJ/49E2038FZv1XF8wH+y9ldQpgk2eNkNhvmcfaazIAH5k59trMbse3oAb861ey
         tX+fchACA1fkC4l1dnMisVjUO3hmQer0gouYjsq02JbL7FCYJeafl3YcM5c9l5uRBx91
         pPbLjEp9dFGtUuJrKnIl1loU9wMmnzgK4t3o9M4k2Y3SfGeqzaOs5sv1dOXvATmE3klT
         5Ud4Bnq2Kh2s12CSgIZc//f0U3CdJ5fogWS5TZmQ1MIvGomSCQlyead04YOHDrzHysHc
         iNobi1HUgEOU67iYwfigkkgomwAkXOfbSFHEk+77H7JnCVPi2OOoNQqpmS4MIspWgEPA
         n93w==
X-Gm-Message-State: AOAM5315mMrYtXC5o0R25vEnHxgmNlGUrjG5f83VVv7OIcTGddjrYswq
	hG6aUVIOzUgdja4OjNr9AeBv7vzEmoPneQ==
X-Google-Smtp-Source: ABdhPJxDlSnw0m4YMFUac3UvlZ8WgRP7LdLm+hY06G4j1zseZjmS3CEM1QePHuSIlOHHJMNv71MiZQ==
X-Received: by 2002:adf:dd44:: with SMTP id u4mr50054569wrm.22.1600690325540;
        Mon, 21 Sep 2020 05:12:05 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (4.0.c.9.a.6.a.b.7.4.d.7.f.b.8.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:38bf:7d47:ba6a:9c04])
        by smtp.gmail.com with ESMTPSA id y6sm19492609wrs.7.2020.09.21.05.12.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 05:12:05 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] Import two python recipes from meta-oe/meta-python
Date: Mon, 21 Sep 2020 13:12:01 +0100
Message-Id: <20200921121204.2443466-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have a slightly pressing situation where the performance test builds
are failing after we cleaned up the system installs on those machines
and tried to switch over to buildtools entirely.

The issue is the need for jinja2, complicated by the recipe's ptest
dependencies. This series imports them with ptest not inherited, the
idea being meta-python can bbappend and add the inherit.

The alternatives are either to try and solve this on the performace
test machines using horrible hacks and revert my earlier attempted fix
(which is correct but makes the situation worse), or import pytest 
over too which we may ultimately end up doing but probably should 
do right now?

Richard Purdie (3):
  python3-markupsafe: Import from meta-oe/meta-python
  python3-jinja2: Import from meta-oe/meta-python
  buildtools-tarball: Add python3-jinja2

 meta/conf/distro/include/maintainers.inc      |  2 +
 meta/recipes-core/meta/buildtools-tarball.bb  |  1 +
 .../python/python3-jinja2/run-ptest           |  3 ++
 .../python/python3-jinja2_2.11.2.bb           | 45 +++++++++++++++++++
 .../python/python3-markupsafe/run-ptest       |  3 ++
 .../python/python3-markupsafe_1.1.1.bb        | 28 ++++++++++++
 6 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-jinja2/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-markupsafe/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb

-- 
2.25.1

