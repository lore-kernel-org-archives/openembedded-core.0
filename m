Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.9888.1622618732083991859
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 00:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PQd1kcfV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id h12-20020a05600c350cb029019fae7a26cdso1023142wmq.5
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jun 2021 00:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fXDuvRLOUoP/5cg2QsYQi3qK4zKplhG9Bf1J8wG6e0c=;
        b=PQd1kcfVlRxxCxsO1ntS0mPseZZcAqkUWdmEuOCiMKcd5YPN+k20kJ/t3CoLlViPWm
         mdEQcCsnLUlNuf42I5JnjwnyZxkKlB7L++dIcdn0SnXucXL99S5UgrW5GBQBhUbEl7yh
         psYpEwl0aOlmHdtcgv3yFIz0KYz06MFCTTcKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fXDuvRLOUoP/5cg2QsYQi3qK4zKplhG9Bf1J8wG6e0c=;
        b=Sak7C46rEf1VaFts/a6ryinRB2Z1SW33w16NOO2uWs5Cv5jEBsjl63y6Wy2AX7OyTH
         ex7i0EdBdZSk5DRIFaL9zH4WIsQhk/fa+ruirKQmiUwFT8M53GYrjYM5mqvTgNorsynC
         mp2jVpU92JQkcKKl7yc0xrc/c7aDXWHLDWae00NbugcuofORqFKCvdrXX6pNjn6YlpXZ
         YF6ipS2majRPd0I3tWPVJCFW+COx/00Mal9N/U7xREKxeXszhA5dCG7MhaGzzb7ecOT7
         4mlbTtsDLDCpWCfQqI+D4Ia55vUg7ybW2XIVOkhrW/wkLFii+/8Zn71MSGu4rwL1qtfb
         DDDg==
X-Gm-Message-State: AOAM531L+vUWjQa0tRzk6OnVqbCqTRAnfeUNfC/7B2qhXpt1juBjm8sq
	aeikak5ItyB83dtqxqy9jy+kTfc4Ot/apg==
X-Google-Smtp-Source: ABdhPJzWRYZeMl/MhMsXXGAAIX0r5e04uAT2RHSnx97PP2vYiXWBuSIO942iq6dG68BXL7SLSU/aUQ==
X-Received: by 2002:a1c:b783:: with SMTP id h125mr3704319wmf.182.1622618730352;
        Wed, 02 Jun 2021 00:25:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:743:408f:2993:133e])
        by smtp.gmail.com with ESMTPSA id q11sm1052916wmq.1.2021.06.02.00.25.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 00:25:30 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott] [PATCH 1/7] xinetd: Exclude CVE-2013-4342 from cve-check
Date: Wed,  2 Jun 2021 08:25:23 +0100
Message-Id: <20210602072529.2896899-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We use the SUSE mirror of xinetd. The CVE fix was added to the main repo
after the latest release but is included in the version from the SUSE repo.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
index 2787b270fac..69d5b2f83b7 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
@@ -19,6 +19,9 @@ SRCREV = "6a4af7786630ce48747d9687e2f18f45ea6684c4"
 
 S = "${WORKDIR}/git"
 
+# https://github.com/xinetd-org/xinetd/pull/10 is merged into this git tree revision
+CVE_CHECK_WHITELIST += "CVE-2013-4342"
+
 inherit autotools update-rc.d systemd pkgconfig
 
 SYSTEMD_SERVICE_${PN} = "xinetd.service"
-- 
2.30.2

