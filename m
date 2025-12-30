Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351E1EE49A1
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:35 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71737.1767125554241664017
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2N9yJmmk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0d6f647e2so166144715ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125553; x=1767730353; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDyQ8zUNvyTCXwJh0qDS7GP3AR09MwvjC29WakUci7M=;
        b=2N9yJmmkFto5ni3r/8ayE6mEBzDASI09CzurEYh4+EDJgKWmmmBFF8pN0SoE+z+dQW
         r3uTmQIMAnsZwScIlttK8o0tt+bPsnHLsx1IV5jvdj3pACThoGyodrSwUMyGodatgM0e
         awCYBD9B+euvjys6LITkI+BGRVWmKUBTPK1sY8pbEw185HkXAv8t2XtF/Ckvvny7X1eW
         auMvxqOxtOGaUe96lJXKWSrvrbiEWuHsoX/D54LOxtwS0j4MkZgOu5I6CU1y2mCwhh2/
         iGBwUDsm9ptczDS4Ludjc4lVOqBSQYUsLwAi/Uu5iJ/zYRDgCQ/MXcFFSt7vrQwFDGr6
         DZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125553; x=1767730353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rDyQ8zUNvyTCXwJh0qDS7GP3AR09MwvjC29WakUci7M=;
        b=bOt9rxDphkceMrsNYHmt6uu9+R042jDKBmbl1d+xvrbySxV7rYHzzDRXSqRSu/rkYF
         U+xbsspDy3axaiX+qbSq4OD8gepf5AwHcJp25w86i/JIvrFqy+FAB26fwRSBio9k5Vn4
         24krFGAZKRhgNwHRjyUskuUmuefRmHpJ4A842dSwlw0k4WfNyOpVdN9YXCjOzgCVlmUw
         vm1eGcXujA6mut87RzQM12fEsN5tFKRYrGkUcsG8ufKFsg21fE+xBORQ/plsOAeQFYK+
         6aMi/kjpxM2Jh+hG707PB1iKlem6EyrgnkRKnNlsZ4krjsJpDqPjoN5Kmm1rQfSAKDLm
         9rsg==
X-Gm-Message-State: AOJu0Yx8Ylx6Dc6DhlddIhQTkX2EXoDVHsYckxhhJfA2DM/EvDJpJ1UX
	eOLMFA9wKBhzLNkkD/APNdafDBPJrAUuSVgODTW8FnhxfZJ5NGRF3XTeTAWOjXxfxOucd0j9DMs
	40QJ3
X-Gm-Gg: AY/fxX5p0v5GU+/CJ+zwQL1E+DPY/kY8r/CEpB2jcI1RdFL7V9ODG1z2DZWHd2KU+zL
	szpbGwA/D3jAQ2q9XBLj9aS0IRsOo9Pb1CBjboRxUuhbpikMXgEoQEYGtOM65sdOIQWMIQexJhB
	FcyfoGPx259I8iPzIeOg6dZXznk6XhT/6MpnnYzC3ZNUeca3ejnpQ1DD8jo4QmI78N8TTpJSNuW
	6iGDyphFgdqSXGL6jhuN+WdErFtHCBc+Eyf1wwuJKCrJvO66Lrvjg+occVjH5nQC3H/33tq2kEA
	to80h2gv2xF1RJ1vD64ijem3tTo76yLuvzzoj3lznlwmMNXArTzuz3AfZOeUpZ17bXmGukdN6S8
	tfyQmCJRaoKOVYNZkl7ecrY8N8BW+mzPd/MJBXP9e+AWjwPSLBIDRzFjSuvBv76hR5ps5WZdJON
	zErQ==
X-Google-Smtp-Source: AGHT+IHkSzYd17vlEHd8g6csYxIiiun9VosfQOSJtYeHeT8qym1AuzGIGvD01voLCwBmRVwiTPxaeg==
X-Received: by 2002:a17:902:db08:b0:2a1:10f7:9718 with SMTP id d9443c01a7336-2a2f2738286mr403573895ad.30.1767125553495;
        Tue, 30 Dec 2025 12:12:33 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 15/29] gstreamer1.0-plugins-good: upgrade 1.26.5 -> 1.26.7
Date: Tue, 30 Dec 2025 12:11:45 -0800
Message-ID: <d9c7b49d226b30a7d6ebe71f58fca34828d933d2.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228707

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 03b4d82e774796a5b89f435af0d26f532bfbf962)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ugins-good_1.26.5.bb => gstreamer1.0-plugins-good_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26.5.bb => gstreamer1.0-plugins-good_1.26.7.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.7.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.7.bb
index 4adbc982b7..9ba288a410 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.7.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "eb0862e93404b073e98ec50350ece7e6685ea2936cab8118c2b8e938e2cbea8b"
+SRC_URI[sha256sum] = "82af18a1f3e4a060db61d2630fbb975269b80b55bb2fdcfddfab5c6440d30781"
 
 S = "${UNPACKDIR}/gst-plugins-good-${PV}"
 
-- 
2.43.0


