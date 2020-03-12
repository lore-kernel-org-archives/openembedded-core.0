Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 13E29605BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 22:50:07 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id m3so8317083wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 15:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lyLfAfRqahqNraEG/qhrQzSEVNwKoVHg0UaOWA2AyNg=;
	b=h/HU45400O0ru10hPC1VyYBySnRpokrc91I8USdDYIjiUxKEAFAI1RNLB1yJ/OJmuC
	SycKC5yATg/B8kR8ZIPN2UpmpibSlOPbS5hWbnuSdYBUPXpFvQZtoulKFaQDB8rKG3JY
	Xk6h68PklpwONKYoBxFjtu9LyC1at5EjJ8dTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lyLfAfRqahqNraEG/qhrQzSEVNwKoVHg0UaOWA2AyNg=;
	b=BFORm07J5UHz9t1q/KNa9QbEB8KHpIygEI3qOul4InKwwVCpdnoeyy6e/tpOd8S17i
	m5VzK7tD+7wgXXexWLJL/CZLhRHzoqlE0XCQvHYe3D1StCPXXYncZQff/rjU93q2RsVH
	Q7cf0DrTI0/NcTmBBHSN7a3AUk9YebqJuIQk9EEWkg/NL2Svwu5xe3TEPXI4WC40jVzx
	caceWtkiFitXJV1UmGS0jWIAhv62TH8wEN9VRO1EF3si5LKNBhsk0qGZb+omETAA2E6H
	qkZ/5MXfRsS9Jvs0PhnZFbVXdP2V94Msr7LENgH4CLBX+8bEU58/U0E3CfDURjvMqwwm
	cQjA==
X-Gm-Message-State: ANhLgQ1Irdw5JZlMMQm0ejqodtk1SPB0FOQrNDJypCWGEIPdL9dOxUOd
	12peO7BgEdbUCJbgR5MtxvdLhTacLrc=
X-Google-Smtp-Source: ADFU+vsh6hwTT/864biWpgk1w2QKstvFuBRhSIBzSbbfaG2Pa+NhlmBRRRNhQft0+aeEuR8tdrhe3Q==
X-Received: by 2002:a1c:f009:: with SMTP id a9mr7032990wmb.73.1584053408141;
	Thu, 12 Mar 2020 15:50:08 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p10sm76151316wrx.81.2020.03.12.15.50.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Mar 2020 15:50:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Mar 2020 22:50:06 +0000
Message-Id: <20200312225006.127745-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] scripts/oe-buildenv-internal: Add BB_LOGCONFIG
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Mar 2020 22:50:08 -0000
Content-Transfer-Encoding: 8bit

We should allow the logging configurations to be specificed from the
environment, for example for autobuilder setups.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/oe-buildenv-internal | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index c17cf4da711..8cbe34669da 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -106,7 +106,8 @@ BB_ENV_EXTRAWHITE_OE="MACHINE DISTRO TCMODE TCLIBC HTTP_PROXY http_proxy \
 HTTPS_PROXY https_proxy FTP_PROXY ftp_proxy FTPS_PROXY ftps_proxy ALL_PROXY \
 all_proxy NO_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY \
 SDKMACHINE BB_NUMBER_THREADS BB_NO_NETWORK PARALLEL_MAKE GIT_PROXY_COMMAND \
-SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR BBPATH_EXTRA BB_SETSCENE_ENFORCE"
+SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR BBPATH_EXTRA BB_SETSCENE_ENFORCE \
+BB_LOGCONFIG"
 
 BB_ENV_EXTRAWHITE="$(echo $BB_ENV_EXTRAWHITE $BB_ENV_EXTRAWHITE_OE | tr ' ' '\n' | LC_ALL=C sort --unique | tr '\n' ' ')"
 
-- 
2.25.0


