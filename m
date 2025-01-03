Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FA7E77188
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 14:17:16 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.31294.1735913832235158872
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 06:17:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y7MzRNbB;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-467918c360aso142964491cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 06:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735913831; x=1736518631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8CHrnikkexWP70Mbj+dz6fTRZXb2CJ41i5jjQyUjY7E=;
        b=Y7MzRNbB4VQHB69ZDPgls65Opmrz0A78iZHW0iGzym3TsR2ERVlU+JGSsFdAvczCcW
         f0XdP4zbXAcR/WQULLhfPH6UXgOnaHyyv7EwFXG5xQFOJH3ihm7LUuBzWPJN7aiBLreS
         zwTj8tYcptKCrFTuKThgEpZUzncvpHe0Nh+OhGqIgAmQrJXLu6grDLl1kbucpG8MB71h
         vRzasm3Yygqfwf9zV7Jz2JY7q9S2m+JNyD6anWhPkpscVgs24vUiEcMgnl67OpSRzfAr
         R8vKoHlGRWqNBLcvx6V8si05paSQOX/EKi650k1EDZqtm0ot3wvmbVlXDukUfbbI+0t1
         Sn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735913831; x=1736518631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8CHrnikkexWP70Mbj+dz6fTRZXb2CJ41i5jjQyUjY7E=;
        b=bqAWpFEMEadUZe0sS/xLwcmPtPJMX7oMl/AKejxkjHhWAYR4eoD4v42Et0mpwpwBy4
         gBvPkxGMcOPNYEVIDI3Ff497y/isLozOXHW6CCpaBr0SL1icaWE2q9bJFfTY3BnszT3p
         BXYQsdnhS1AJOHirH+NRbBLvHUIum0/4DQOVym7//DfIGY6Eu0ODTl6KfcO+cvk1eoe4
         t0/qUUqANacZ4PWfBzxwRbVh05DKIOqKKqnj2whXqxt2x8/Gasvw22zPkK7shteA/9+6
         AaUXkBLOy/CikIYzMl0yfXB0FhksQKLor+VbvEBXIN3Ly0fOzkGVy7COWFLfDeqKgT7w
         vz+g==
X-Gm-Message-State: AOJu0YxQsyK2uqzV3t+YYJJ2WcuRBO0Ht1vkURpOiiipgpXMYQLlMzR3
	qqMIBTdDAyfanwoyXsRGiNb1webdTiBP0qTwAuIo4ksw1LshWm2Vq2PzsaMiBEA=
X-Gm-Gg: ASbGncvK6zm9rQu4okteBqu44GgEVsU1mgvV7UhEhUsJlzt/xgeNRdyMYmZGf/qiFNA
	C07EMEQUpQSiCdP80lRNMe/JQwJ4fI/4YabYqXwsMTTSW/Dn4NAon+RezTSfTzy+dmM8BENYWiH
	ap+eplt/rguJXNz4JAWwVpCK6Qq28wlA0vF50rjcsl56Zf04tXinmGJwoWJ9w2KBqG8nmeNmLdg
	785WVf1uwxaZAkJzD6HLrGB1+6rZyZ5e2a1cPvOl5ZFcP0zKOlJObfPfGYgeXH9n0zvs4PEBoTZ
	Xj5URAehQMMB2qoAfXbCxmiVMrckPmzJkoCtW27w/ORm3Y3digE6Gzkk8Q==
X-Google-Smtp-Source: AGHT+IGbDvFfcgbjjUK4cBTbFx19xS0oxBidmG36+TqrLqIHxQaTtbks9jQscr0GIx6jTMi5rqyPfA==
X-Received: by 2002:a05:622a:1a8e:b0:466:9f89:3d72 with SMTP id d75a77b69052e-46a4a976c1dmr876933791cf.36.1735913831198;
        Fri, 03 Jan 2025 06:17:11 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac4ef0f6sm1275015485a.123.2025.01.03.06.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:17:10 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/10] linux-yocto: stable updates
Date: Fri,  3 Jan 2025 09:16:59 -0500
Message-Id: <20250103141709.2848730-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 14:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209354

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Steve,

Sorry for the delay in sending these, with the release, I
was merging these, but not sending the SRCREV updates.

My 2025 resolution is to send them more often :)

Cheers,

Bruce

Bruce Ashfield (10):
  linux-yocto/5.15: update to v5.15.167
  linux-yocto/5.10: update to v5.10.226
  linux-yocto/5.10: update to v5.10.227
  linux-yocto/5.15: update to v5.15.168
  linux-yocto/5.15: update to v5.15.169
  linux-yocto/5.15: update to v5.15.170
  linux-yocto/5.15: update to v5.15.171
  linux-yocto/5.15: update to v5.15.173
  linux-yocto/5.15: update to v5.15.174
  linux-yocto/5.15: update to v5.15.175

 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 6 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.39.2


