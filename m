Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.9891.1622618733454315442
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 00:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UjtKFWkw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id m18so598136wmq.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jun 2021 00:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+B9I+TECOtqlUESBigddyxJiEUnOT4V2QmhBQAia9cw=;
        b=UjtKFWkw0e2YB0cAUSXje1JaKTqM1EQEilhr4sWfHMCHbtVoFDPA3Su3eeYmEw5I2p
         aF5fYUR797K0wJGB0H4BohgHPSWcwXWhd2cPnHuAAUds2gpX8jn0vc4Ue6CDtgZc0BwI
         Urb9eMcJEqhdmt7f+3sYVPXB92rJvPNL3Wdmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+B9I+TECOtqlUESBigddyxJiEUnOT4V2QmhBQAia9cw=;
        b=oXbL+uh2X/s//NMbAVAh3L9JqyoprOwYFZkZpL89MuwJMYW//YblLu5HgX1hpTX2at
         etsaqBGwnilg2m+7QDYh1rn4z7/1Y4A7xUqFngvy8cXe2Gk8Wfg2oAuHVbzGahwyZ6MF
         SMJuKYSU/Gnzydr6YE25y+I0obxQIJgjOvdyZEVbj9CFWiGFZUo5uao8+otbpJt6Mskm
         ioQCXQ0Bi5cHEWmmePpqwzYC5utNZpKiPdSBtcxLFAZyCmCU7f1/77t2emIvERXZ3fTq
         8IODQcLgklmqexnbctB1OlHqDasii/sUTJYZzYbYJYxNo0KZIoIaJE1hJZKUy6P/NryD
         MpQg==
X-Gm-Message-State: AOAM533k0hsbc6lAhETtYrs0LPrMA4GBPNeoJ1QaBRStTB88N5DlRpdW
	e8mRLtrHMQ7SRv/9e/95qAugyDJhUC55kA==
X-Google-Smtp-Source: ABdhPJyvziv2pvEdH37tG3lo5vkjG6Ulq0sgCabMJHizeqqGXnKDrnQ4+uvt4S6++5dHTOTgz7b3Ow==
X-Received: by 2002:a7b:c761:: with SMTP id x1mr3743792wmk.118.1622618732015;
        Wed, 02 Jun 2021 00:25:32 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:743:408f:2993:133e])
        by smtp.gmail.com with ESMTPSA id q11sm1052916wmq.1.2021.06.02.00.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 00:25:31 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Sakib Sajal <sakib.sajal@windriver.com>
Subject: [hardknott] [PATCH 5/7] qemu: Exclude CVE-2020-3550[4/5/6] from cve-check
Date: Wed,  2 Jun 2021 08:25:27 +0100
Message-Id: <20210602072529.2896899-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602072529.2896899-1-richard.purdie@linuxfoundation.org>
References: <20210602072529.2896899-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sakib Sajal <sakib.sajal@windriver.com>

CVE's affect ESP (NCR53C90) part of chip STP2000 (Master I/O).
On Sparc32 it is the NCR89C100 part of the chip.
On Macintosh Quadra it is NCR53C96.
Both are not supported by yocto.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index fbda0c91741..3921546df75 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -76,6 +76,15 @@ CVE_CHECK_WHITELIST += "CVE-2007-0998"
 # https://bugzilla.redhat.com/show_bug.cgi?id=1609015#c11
 CVE_CHECK_WHITELIST += "CVE-2018-18438"
 
+# Following CVE's affect ESP (NCR53C90) part of chip STP2000 (Master I/O).
+# On Sparc32 it is the NCR89C100 part of the chip.
+# On Macintosh Quadra it is NCR53C96.
+# Both are not supported by yocto.
+# Reference: https://www.openwall.com/lists/oss-security/2021/04/16/3
+CVE_CHECK_WHITELIST += "CVE-2020-35504"
+CVE_CHECK_WHITELIST += "CVE-2020-35505"
+CVE_CHECK_WHITELIST += "CVE-2020-35506"
+
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
 
-- 
2.30.2

