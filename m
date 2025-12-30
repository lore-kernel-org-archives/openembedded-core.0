Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F5BFEE49B4
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:45 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71914.1767125556787176026
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ILHOneMN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0d67f1877so131719375ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125556; x=1767730356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePX+CkZnSuZtYBeWQUwMtBrdsMjNQu+0rNlJXZCI4z0=;
        b=ILHOneMNiHlPvZNddFXMt+kxx9rfla0bN/Ff4ER8xbZHztyuk1S27+BREKBIiJlH1v
         jMWkaTiC8Zlxlhchv/mkR2qu1NfQMSPpUvoyWneuFAePrTH0FrMtLEFO9wZ4pB3TB/lr
         KQFH6BnNcWOnE1usygfJZuj/ZUBKZ+3XZimDk1sP1fSoDGAEnwnhCbj4cey/1lj4i/ob
         /odFP7VCwBduMtSjfuDWQVxIwRpoUTH1pC4wYJhH92yk2GHgti+yTUY5O8jj23XTCZOk
         M3N+HxaGn3V7rZisj0Ey9acA/QYqXhpzMyGUpccUuX3a3j9lnD5PXflLVuVclZjTu6YT
         GyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125556; x=1767730356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ePX+CkZnSuZtYBeWQUwMtBrdsMjNQu+0rNlJXZCI4z0=;
        b=QYdDF60gl4cETS0gwqRdCHpbKi0mv7NcBbohhUXP1tGdZzEpW1h5T2JbU2tSUmSRgV
         JJDxCyQLNeyo/viYl/CWwG6q1nLJajmcgUtla6/cJrKegUxN6tFpsHthMtGH+zvXbJlw
         Ni3s2wmzqx4BBbNRTyruavNJTuH2tYmhE1MWu9OUI2aA6+Vlg/DHL7pQsP45Uv3VPyln
         Iem4PKGHtjPe5q40W2InKzxXwkb0tvtyQFUrratE1QDX+W3G5j3d6B4g4jzeyJx6U/3n
         oUj0eO4us5Rdb5XE7XrKTLSi9FF+oiY+n4aOXMzWwb3/yxn9n0MWGd4awRTRP1UY6uPT
         HvMg==
X-Gm-Message-State: AOJu0YymVPc1BJH7F5aY9uDDaZG1W9WXoyKiJ0TW892LC9jWWWaWVOX1
	L2HuuJWyQgK91xY/P02BO79+ilXAaa7ggrBq4Gk/RIqswdEw/2HVk396ese28QZgIEjIKO2db0A
	cvzzf
X-Gm-Gg: AY/fxX7+meCc4POfq90k2QCSiDLKlJXKfm6c0GMm37W4qUWm2BSv759oZ4pDjaEwM9y
	RluFEvvCQ6stUqf7s51/O1f0Oghc9ZAWh7R4Y7ijE685tLl/aJM09/xg0uSmazitHEqkT0Jt1Up
	cRSQM/khQ/yjKu1lbivHAjDK2QKJcYQ8e5W/o0kma224ktUdc2sW7yZRDM47Rg0iWdlnAC4wyf3
	OcEc/Kn2dLpPlF1yj0GvZdaBgekYqc//Yi8OMJjI2o22g83TzcdRhrOCOS/b00bgOgZMpuXoj6h
	UHiqzOaQw7xX6KD03d7cA3waGhdm1YLgmspVuB5O/PFzwaGwAELTZ0VCCnQ1CAg73Bl3PwvpmtA
	ygWQUwxma9tH0C88GxMQbZWolqPFfXm7tvVWHZ6lytE5lf5Y61L6vjYlBe1HjLJt06lYjs+7Plp
	08ew==
X-Google-Smtp-Source: AGHT+IGQX9+kiIsuOX6fztBaPqKf3xuotE42j0uUPegZvefPokulxuy6UC12+ZaJmuo5wpBhHQzo6A==
X-Received: by 2002:a17:903:41c5:b0:2a0:d662:7282 with SMTP id d9443c01a7336-2a2f272c829mr381839375ad.37.1767125556034;
        Tue, 30 Dec 2025 12:12:36 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 17/29] gstreamer1.0-python: upgrade 1.26.5 -> 1.26.7
Date: Tue, 30 Dec 2025 12:11:47 -0800
Message-ID: <e3505495b001f5b74571b2e384889fe0b1a39c5e.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228709

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 8a5ea8bc63b33408642600886936c79a96bd898a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...reamer1.0-python_1.26.5.bb => gstreamer1.0-python_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.26.5.bb => gstreamer1.0-python_1.26.7.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.7.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.7.bb
index 12340245e8..9a3a86fcbb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.7.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "86e2fe2b1bba7ffc18b1d4abe1035fe1c33b20fe4e077cce2f90dbfa445b2341"
+SRC_URI[sha256sum] = "7a544b7968b181c2965e979f2ce889db36397790de9a7c312cf468b51d26428c"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.43.0


