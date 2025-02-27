Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447F5C021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 09:13:18 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.7008.1740647592581364319
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 01:13:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=sn2BPKGP;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30761be8fa8so8504071fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 01:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740647591; x=1741252391; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gt3TBpVsPnTzwdou0QqiyVjowIXDv3oAK8aiCCzAZbE=;
        b=sn2BPKGPAnCvod8F7bgb1cwVB5k3Q/YCSe2vT7XE3U1S4DpxscLrpVpLbeLyW0bVxc
         lOY4st7NOE/57MabAvUoO732fAaAK8iL+upisBPLdBsYGX2UWe5OB3f+yyNNklgWRnGr
         X10zJkDw6759MAYtYFDHe6VrhOZTTF2YW4U4jPLzSSSf9ktePY35QKKaHJeh2xNroOeG
         D6j7Q0Bvycp3oCubAXqE/nc3hDM6pd09VM/GQV7lQxIj1ckNTr04pJIpV6pak6QyNdny
         ka+bqkKEDe71h0jGVrBHUD8vquBtbdif4SgN+IQVQhHgYq9H7azfew3C0HUKEFiA0DaO
         nC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740647591; x=1741252391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gt3TBpVsPnTzwdou0QqiyVjowIXDv3oAK8aiCCzAZbE=;
        b=CvOlOGU2J0wFEdKb4PZk/ZN9/V3aq/CIat/GNG3t1fUvs668MU6T0I1WgzHZJO8QFw
         LRKBwcFfSI9UF59VlB5WHGO4UJswLt5qtLZoeJ/nffkusJccDnu9JvrzKDFZ512RBsca
         9JjXDmu5Ev9taA78D749zH9WIgBu8W2RT21r1/HuFzluGEU+uFD5ap2UcO73l0q7IDdQ
         X5wW8UBIQWbwS/c1kBU6Gf+7v17cD7x/fb6tcAX3cBJVOCbpAHichfuocQZnFTHUNrXg
         6Cem8rFQg8ANJCFiwRIY1VgCRtGh6dUliM52LsHrZN8LJbxqOkcM5aO8xRB+bAsVCWa+
         oDgg==
X-Gm-Message-State: AOJu0YxVTSoIFJKa+Aw2//6cClC/4YAqSyOnDB2/lJJroOp8MPbiMWQi
	RVptrFZ2xq+UGc42PRSQNp8yff5fHVVH6fpC/bY7/qfga1a1F4f7UIcrKY24j06hiAI+VlphQQk
	k
X-Gm-Gg: ASbGncsOA5JYvVbh0HDMhy9YukPpPdoP4WBrBjb+d1iFsMP8qI2PjrFb2nCdYw7YkqX
	KakwUbpeDuJDJ/69Ay9YedUNOWX6Hh1QNyajtylSY9vVCJNc8IMuOxmv/LJOoVRUMj3SGXU1PsS
	z7gJRmRx7wdAsHKl0W3kpKmsl3nbKRu5jiewtfUOwaNnXGyb0mMHC8JzCO36bKEg/tMOAh72M1A
	EOsMtQ/N3215nItrjtWBnEvNr8xasnFeDGOTPwDf4uq6bYRpUELsUBAmFR3Doys/4lyEAy18iyk
	4XTOU8+2mL8fPvfAaC9niDHEUZhWgeoaXXjf9y/NyuzH5oHn0JOnN11c8x5dMW6pks7OMFh2c8s
	=
X-Google-Smtp-Source: AGHT+IGVB5rpJ8AHLwlFmcJncH/DWsJFGqXEun5lftUbpagNRZjLuaFHt2e4FQYRBycddaARBEkoAw==
X-Received: by 2002:a2e:9c93:0:b0:306:10d6:28b3 with SMTP id 38308e7fff4ca-30a80be1ea7mr54081481fa.1.1740647590683;
        Thu, 27 Feb 2025 01:13:10 -0800 (PST)
Received: from localhost.localdomain (2001-14ba-466-1f00--133.rev.dnainternet.fi. [2001:14ba:466:1f00::133])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b867c8f88sm1128131fa.49.2025.02.27.01.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 01:13:09 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] psplash: ignore startup errors in psplash-systemd.service
Date: Thu, 27 Feb 2025 11:12:32 +0200
Message-ID: <20250227091232.2494179-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <1828058FF03C35ED.767@lists.openembedded.org>
References: <1828058FF03C35ED.767@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 09:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211984

psplash-systemd.service depends on FIFO created by psplash-start@fb0.service.
This FIFO can be removed due to signals or /dev/fb0 related errors
when psplash-start@fb0.service exits. This exit can happen
when psplash-systemd.service is being started. Thus ignore
all errors in psplash-systemd.service startup.
There are too many ways things can go wrong and all of them
leave open race conditions unless a single process handles
all of the psplash usecases including progress bar updates.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/psplash/files/psplash-systemd.service | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/psplash/files/psplash-systemd.service b/meta/recipes-core/psplash/files/psplash-systemd.service
index b618be1ba6..15a894d577 100644
--- a/meta/recipes-core/psplash/files/psplash-systemd.service
+++ b/meta/recipes-core/psplash/files/psplash-systemd.service
@@ -5,8 +5,9 @@ After=psplash-start@fb0.service
 Requires=psplash-start@fb0.service
 RequiresMountsFor=/run
 ConditionFileIsExecutable=/usr/bin/psplash
+ConditionFileIsExecutable=/usr/bin/psplash-systemd
 ConditionPathExists=/run/psplash_fifo
 
 [Service]
-ExecStart=/usr/bin/psplash-systemd
+ExecStart=-/usr/bin/psplash-systemd
 RemainAfterExit=yes
-- 
2.43.0


