Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D13C7EE2A
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 06:30:34 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.7316.1751005829976384052
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 23:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pTUwylie;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32b50f357ecso14436781fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 23:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751005828; x=1751610628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CU0Lo3AnxyPPQVGnkO3H1wUDTR89ba2Nud8RN2C4dos=;
        b=pTUwylieEb5aTGovcN9Oz91PIIkzR28mCaTo7+6js3R2BnxzdfLx3+eQKD6uB3NhhV
         R0coCo21nAFx31of7CVNbmq8vFpz2lyqpiWHjnNWd3kzYtbMvRI62fIcpw2XMeV2S08n
         BmUz48iQwlA3OxURpT2hxTX9g+hq7Tq75cyVbTKz5YA3ldkNSGcCfqvHDmWEqNbrKpK0
         jZYC8kod+h4+pU/Tb2OOojwERPqzWUSXXlVQyC4+r0U+r+hogvZgVkB7I9VOR9fK69/E
         I81pS/U3dBGhC9Zre7OR2TPgiPWEBPCxGNN3wLO/Og8O2U/CexMAPATjwvljdek/mT3T
         H7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751005828; x=1751610628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CU0Lo3AnxyPPQVGnkO3H1wUDTR89ba2Nud8RN2C4dos=;
        b=NGGqlUPZnF0oHn/zAo88yqJ6x/uZ7PLnieOIrrkDVVPIk/RnRppKQe2QzVmBPYY7S4
         LDClqxmRCgfxX6cPfhmIvrlCOQhcUGBWJNkyclZiRGL3F6UHNHwVm9SLNlvvSMbEjCEs
         rPOyRhQ6omxHa4X0kUyYiOecmPz6q8HFM0bXa/+TqE5dk/guQD7n2eKtW5raJsEesmWt
         B0LImReHb9ZQZm5MQX8ARmz0kQ2qQthEHHdEybq0VV3NJXofSCPi1STdMovns+zoqO57
         USefDxkjsQEUrF7f1BnMrDprmqX8qkyRoeq2IFt0wb8DcgbL9FVDkxoX9cWsJt96MR9A
         RnTA==
X-Gm-Message-State: AOJu0YySbGpzOz2ItNhTuVTaIE65Pvfm2jKP/rlR2BrL02xv+m776rkP
	JqU8Sba9nX5dDA4a6c28dVTFA0ETuFeiWT4PCGUOatTWQd8t/prg+/3krlqLMLvK6brFpjjVrs7
	6Gyvtnug=
X-Gm-Gg: ASbGnct/2PPeMd7joxeBcw5P61lVvqKJF6riyZINwYz5JmquKVUlGsv46yxE6ihyLhR
	uZLIMYjOXiJ74x7ic2pRiMGA+4fVvAYc040f5sX3Tmh/Cmo3cceF5kNZHigjN7KkS9hB1TxX/+r
	qZ/BNuocUtKAdLt8/jzP5RJrd4tajojpzGTmhv4lIptRJ62Yi2BikNyMREPkNstxGNyxDfNPWpM
	HAp297RbX1fSO1HlDeeKyhzMS9Y9TCKE4ZkZqQO7IzDk0y6xSDJyTfVu2oT3g0YR7+TYoxP27fw
	qdDNvPgKc4yFMw59f0SSBcRvl7l52l/caAhcaezLIJgX8BpcfNv6bbf3/hVxyM9Fwr+R6MFTXVY
	M+Y0frrYL//TdFSWHyHszxZYpz9g7wz0lecHwMY8lU8oXKk8tdg==
X-Google-Smtp-Source: AGHT+IF+CkwzSIdqT/2bkLgGigrOPhYIjmRmABADNYnp1BOiDnl/q5VL4jQdgiFgAoJLjpI0f/UDow==
X-Received: by 2002:a05:6512:b19:b0:553:2190:fef8 with SMTP id 2adb3069b0e04-5550b7ecb24mr658946e87.7.1751005827888;
        Thu, 26 Jun 2025 23:30:27 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2a740csm318916e87.89.2025.06.26.23.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 23:30:27 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 6/6] oeqa parselogs: add parselogs-ignores-genericarm64.txt
Date: Fri, 27 Jun 2025 09:30:04 +0300
Message-ID: <20250627063004.781560-6-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627063004.781560-1-mikko.rapeli@linaro.org>
References: <20250627063004.781560-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 06:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219382

With safe to ignore pinctl and initrd warnings from
AMD kv260 boot.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../lib/oeqa/runtime/cases/parselogs-ignores-genericarm64.txt | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta-yocto-bsp/lib/oeqa/runtime/cases/parselogs-ignores-genericarm64.txt

diff --git a/meta-yocto-bsp/lib/oeqa/runtime/cases/parselogs-ignores-genericarm64.txt b/meta-yocto-bsp/lib/oeqa/runtime/cases/parselogs-ignores-genericarm64.txt
new file mode 100644
index 000000000000..1e8b1f4b7d1b
--- /dev/null
+++ b/meta-yocto-bsp/lib/oeqa/runtime/cases/parselogs-ignores-genericarm64.txt
@@ -0,0 +1,4 @@
+# safe to ignore minor firmware issue
+zynqmp-pinctrl firmware:zynqmp-firmware:pinctrl: failed to set: pin
+# safe to ignore initrd warning
+Can't lookup blockdev
-- 
2.43.0


