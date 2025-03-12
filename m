Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A37C2BA1B
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:07 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.4547.1741809361988076946
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=H7txTJjo;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so483931a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809361; x=1742414161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VhVflaFJupykAbr5GMulgMwO4fH5FSAL+vOMgQ8g/Q=;
        b=H7txTJjoln89QlXvqw7Qupx1bnVaMWGD1WOb2sv+7FuWDITF1UvPUw2IMF7y32ECED
         2u7tGKQEtgzlouNJ7QM9EUbL27KnrTFb0FNWP5JlZry5i3W2IwZQm37lhvrzXU2zYHwK
         4KHeq7G04wOGOlX+P4xqmPM+qA4Mpd1Cpub0B3s/c76xeb7/6ci5Ou8eytvQqRZ91/9P
         gVnXC3MHg9pMHZMgaGD50fcHg3BztdAUqKusz2YB4IpCmB8syMu9SPvWCAgO0tpSJeWG
         yrjUOHNBrua83qFjSScBkfWL8QGUXPYR4TetgYosMrOir0ASabvXsFfDegMQb80OyIc6
         69Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809361; x=1742414161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VhVflaFJupykAbr5GMulgMwO4fH5FSAL+vOMgQ8g/Q=;
        b=Rfotyot8hGwUjLpDgQrOBf3tcNLNzSX2N+gElbhQl+8zv6ciWoNGsUvX3yhe+kTIWS
         mSq7dVVUtDpvV+Wprlfrmw1EKsD/ZS2ltFe0ByTIr1+am52AiQ030BRQoNeypCX4sVTc
         ki1JFaZHj8x9/4MKWZnwmth4T/HCsR7B0fClxAw6MVzIGSRiCY3g/W+23obMwKgk4BEA
         Bvd0fV7Ml4u+i338DkTO+JC7yyxXEK1K00rrVqqiv9mYdw3TLG6rrsF3wYAdiNb/BD7r
         ebasmUNWH7gIXmXbNl3xyL5hrxngYuthSAr0Sd+wtZbaif8N9T1nzvVPxIWFXT83jiwa
         ecBA==
X-Gm-Message-State: AOJu0Yw0fL0qia65hiG/rgDxKrQxooVVXxgGA34OGWmqOU5mRMNGU8mc
	otDF9pf53MsSO03rQOTozY3zhpISySbFWGTeTVYPW+zK6q9xf03tHojPFGqMblovoFp2UfLp/SZ
	d
X-Gm-Gg: ASbGncsgvrTWsjxO9Sta3xLcICzIG0AVj5HXe6Bv/FYTn9efA4qbtBG4MWOADSvtSoZ
	/buS5oTZdqDa6SiCUyLqEgrZnacLvcwoZYL+cYacl2U6Xp5zEbGDRQySsfJW88GeB+k9BmK+q4d
	oxM07JWjA+X2Lb5QZFHJaWnNPPbghv1KCH9WFSCG/ZOich9GueEiPZ55nRXDv+6yqJYz31S+Qxc
	JkhV9o/Whp3sVaamaqJJkEvE00R8mZyZx70BIO5eLkfszwBXko7VGyctyzxEy/fTN0VVCWtaVFp
	6NSE6YORViKkZe7dTsgr+zhPyyoM+UYkWTE=
X-Google-Smtp-Source: AGHT+IEHEesg/Ha6AtTs6K4GeP4brbda21i1LVf9uYQ90kO1PWYt9e9Uh6IUGvM5MWqjxfMPcirSnA==
X-Received: by 2002:a05:6a21:700d:b0:1ee:d8c8:4b82 with SMTP id adf61e73a8af0-1f58cbb5ba7mr14992992637.31.1741809361251;
        Wed, 12 Mar 2025 12:56:01 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.56.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:56:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/28] puzzles: ignore three new CVEs for a different puzzles
Date: Wed, 12 Mar 2025 12:55:24 -0700
Message-ID: <9543945bb935e9a3e2bfbf731412188fc52ad2c9.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212697

From: Ross Burton <ross.burton@arm.com>

As we just match on product by default, ignore three CVEs which are
for the "Puzzles" WordPress theme by ThemeREX (CPE themerex:puzzles).

(From OE-Core rev: 87326573c82ac1e8dc335319442236ef2341501e)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index e9403ee130..48886b3039 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -47,3 +47,6 @@ STOP
     done
 }
 
+CVE_STATUS[CVE-2024-13769] = "cpe-incorrect: issue in ThemeREX's Wordpress theme Puzzles"
+CVE_STATUS[CVE-2024-13770] = "cpe-incorrect: issue in ThemeREX's Wordpress theme Puzzles"
+CVE_STATUS[CVE-2025-0837] = "cpe-incorrect: issue in ThemeREX's Wordpress theme Puzzles"
-- 
2.43.0


