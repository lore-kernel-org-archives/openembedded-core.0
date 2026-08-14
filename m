Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52668C5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 06:48:48 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7673.1786690125870404330
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 23:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=U398uhCF;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so663619e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 23:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786690124; x=1787294924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cAlVoW4HgZyW+i3Rji6FyNO0q3hUC+vITxcoPgo32gU=;
        b=U398uhCFXqHQOb3emr6GNPc7fRe7E9FtEQF5gaDEtuZ39leKAo4rUxE+032wvnAI8v
         1S0yF36AfP9mY2yj7zHZ+d+oQPsM5E18z5wZaz1tGCkrW0dVzE4KY7AwBTjc4N4vYh81
         MJGQK0BL8Ib5z4Rx2HZY4FE8dSzSJbcrAjy4pXd0m0UpEG5gvJnJzgRdfE3j3KQpUWCh
         ZrhSaI+GTj6Wci5+Os6VWx02x/iKtyD3ievqWsln6j+h/BJB4lufVPXxpCxD4RElr7b0
         c5QKned3cRcLyXALRkbuw2IRiEJS1MmrGRD5kjbyrOiHsFTW8MSxn4jGKs+VGEcLTAIX
         jfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786690124; x=1787294924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cAlVoW4HgZyW+i3Rji6FyNO0q3hUC+vITxcoPgo32gU=;
        b=kurVVjplQgo4MkYdiD6Bj8jW3DS3pWrNlKnjPuUg5PQGJBF4JptL402m6qFfrFR0xs
         xoMjBVvDefnx7RBwtRbCZmB7xh3a+YFHyJlQ3vpZJXgK5ijg11/dECqpFBCWY/cK+mWp
         keud/mZR+iyZ3fL3dcBIovVIOKe1PFPLmtVwMatxoAMVKLgE6s5JBIs0H72rtY6t2M2c
         v5rFzmikyeMTgbzIpO19ZIFt2QqBhBWR1m95a0+imrqzQRm0mj73NjEHgXQkIsqBrsOA
         BiOtIEY8DG0BT1oJMRgo3RVonlcxEJmPoOF/MJYtukxhX46brX4pD0Sxu3Wx15Z3X6/W
         WEeg==
X-Gm-Message-State: AOJu0YxagsxBedbcihkP1Xcn5BmqiUbL9O4O/b2bwPGd4Y4QPcKJ6QUw
	Bu0VsuB83K22FreFY3XVBFi2Csh9mDRorIX3m2MFR/YXLjs102ansmzUc2zsgWPgqYHRCK4iIXG
	Gz/JC
X-Gm-Gg: AR+sD11yEs5GPPQHmqW1Y9sCPyQ0atQ6utiF6VmG5w+jon4VfR+qEY0I0WeoU258Up8
	p3/vu2j8QwCnVI8iKNoGOGq+WyQyyo18IuvQy+e17dzvw4MdiH6Hvu07g76Tokv2/1O2NkSoHt7
	KYDh003PHvGDUVCE8RC6RVqwmjK/35XIl6coPYsADQ9Oavvh+/Kr9YXuMfSFVYYlQ84ngtXZCRs
	j+6n2TAm90n1wL0hFNp1UI1/eDLjGftMS5nDHr7WF3/40x40sEsm5St472UAw/AF9BtEx0jjxgM
	e5GlAWKrtsxHOnNEW1OZUeXX/bR5G8EpzYATgRBvu3gjkXZyhzTW3e0nu1bWHMFTUrqZ4frwgOj
	/62zO8+HWbAOKrfbZ9BDWFCc9+vk4WSNYMapBoTrDoNCwdS/xXRMauUymHjSV0q5xLAoKHymZ6B
	ccTd1zEbX+tjjFNihDh5ISYFHZuy0EDSiQizOMfXeZeW6e3kWYkgnTDi9DaNg2A5qJl2x3AbMSS
	1njBRBLjOYpYOk=
X-Received: by 2002:ac2:51d3:0:b0:5b0:1eed:f700 with SMTP id 2adb3069b0e04-5b4591171fdmr483500e87.13.1786690123825;
        Thu, 13 Aug 2026 23:48:43 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458c0e9dasm349285e87.78.2026.08.13.23.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 23:48:43 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH 0/4] Fixes for kernel 7.2
Date: Fri, 14 Aug 2026 09:48:08 +0300
Message-ID: <20260814064812.1071873-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 06:48:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243418

These fixes are needed for Linux kernel 7.2-rc7 currently in linux-yocto-dev.
Tested with genericarm64 machine and core-image-sato-sdk image and oeqa
runtime tests on AMD KV260:

https://ledge.validation.linaro.org/scheduler/job/165052

2026-08-13 16:08:25,555 - runtime - INFO - SUMMARY:
2026-08-13 16:08:25,556 - runtime - INFO - runtime () - Ran 76 tests in 841.196s
2026-08-13 16:08:25,556 - runtime - INFO - runtime - OK - All required tests passed (successes=39, skipped=37, failures=0, errors=0)

Mikko Rapeli (4):
  lttng-modules: update from 2.15.2 to 2.16.0-rc2
  testexport.bbclass: capture meta/lib/oe
  kernel-devsrc: copy gen-kernel-hwcaps.sh on arm64
  kernel-devsrc: copy kernel/sched/ext directory

 meta/classes-recipe/testexport.bbclass                      | 5 +++--
 meta/recipes-kernel/linux/kernel-devsrc.bb                  | 6 ++++++
 ...{lttng-modules_2.15.2.bb => lttng-modules_2.16.0-rc2.bb} | 5 +++--
 3 files changed, 12 insertions(+), 4 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.15.2.bb => lttng-modules_2.16.0-rc2.bb} (94%)

-- 
2.55.0


