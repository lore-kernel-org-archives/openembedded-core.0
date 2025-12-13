Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577C6D5AE5B
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:00:59 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2887.1765620056298807647
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:00:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jw3szErW;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-297dd95ffe4so19479585ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620055; x=1766224855; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnyq+w1u7IWASyKOdZKhQ6M/7AvkW5AKHAiXB2omocc=;
        b=Jw3szErWjSg9bn2IZuZ31Ejdx9Z2v7KQqc8dN6Dw5mi8lQlEjI7Ow6TNKPR2THjG1q
         dEVfVidBzRMOAaneZT3ZNzUmPa7Q8KdyT7NNu/r46tU5lA/060W7Ro/HAVdD97EVaXnK
         rQiM1ZTj98d8rhDVZFhtH5GQoP2DZXsbq0FRMQVVaKAt8dDUYjOJDFhqAyPRSTXGpIqZ
         43SJDpNc6oS02VyDZzQZiQxU/ZyIQ9reha+v3BNn8/OGD0HehXR9zJlI6H67BcDI212g
         gOJfzMS/+lnONwcdaGrEc9p4rTs1SFaUHH+ZwJfYWfLM0DbsEPyJ9jpXlnyO0LCCwLGN
         +q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620055; x=1766224855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rnyq+w1u7IWASyKOdZKhQ6M/7AvkW5AKHAiXB2omocc=;
        b=ZEF7FtMR8C/dv3MD+BBiLHY5sUiZ2r3xWfJj+35QCuy0Z49UaXopJzPDiIErfe+E8d
         MTHTrYu1a7eZop+DeRxpJCvAhHiDHKuVGoSfo8r7ObNLW+kNOQqYzv+KNgbGCr+EFlIo
         GK8bzgz1UOsdVH2kgvN/ilkM/YO33pM/ucezNZV6pGTazG4PSb8wdiELJbWhBDn7/hG2
         gR+xEBERanlSdcuShipynHmhFghzY+5Bt+PDqZSiSW6rHvR0rs2EznBusqah7RwYyu88
         iupdfEPVSMDmzVjzlWODVb0/vowiyCg9RzPhSpSPY0D3N38rz24Ot6s72y14uRckTocv
         TdnA==
X-Gm-Message-State: AOJu0YzcaK9mL10bb5t65bv4I/e9WbCfbYmSeZUAxSQaPL+bdLw3Sk8i
	rjrC7q7ixc7E1dKKVeliWmFFrxSig7HcA9avnVWj0ysZBN0Xv3lQeZWTu9rkYm9b
X-Gm-Gg: AY/fxX77AtCEkhDZlBvKIF+SCGtMwE/4KVC00ad9ruYk6u3xqTZ6EzDA2fatBDtWPZ7
	GGqjeZe/8NI64w8BcJzZ7ttWLSF1ixwWNL1o1vynDeUmXnBW3wWGICnAdIdH/UA2/OiZj8DDIOC
	V3MtvTRSVEz74psts7Y6Rr/Eg3/oQdohSJKgzyLZKY7BP4TVkr4NCxLrtPk/AVIEf78rGjlXw9g
	lvmcE+uHuPfv0kxHnNVY5N1mWiYYI6WrcscBR/DxnKSZm4J2LkC5TewpaZWNGLyfcK9NtUNwWro
	sw4YHvw5bmU//gm9R8gTicjCzSdCunc5lh3Z1UUA431HAEbIfW0AvrsA7llSdQszJwVko4MhrmX
	XV41XoAaREmckH5ycV8NXKPl3CWG6kQTJXFcjmMrqxZCesFRXLcViUEIRnWCifLS8tcTYUk6i8w
	vG5bFJ3hahA4Nbi96jimfSaKif
X-Google-Smtp-Source: AGHT+IEphkE0D7gIK9Uj5HlMaGiNnoSLHtiTFSxXMVMLeApwj/qiiCnFCK+2I5769p2HhPquxHZ6Jw==
X-Received: by 2002:a17:903:1986:b0:297:f8d9:aad7 with SMTP id d9443c01a7336-29f24375c0bmr40974485ad.50.1765620055374;
        Sat, 13 Dec 2025 02:00:55 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:00:55 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 28/67] gstreamer1.0-plugins-bad: upgrade 1.26.5 -> 1.26.7
Date: Sat, 13 Dec 2025 15:28:52 +0530
Message-ID: <20251213095931.2571498-28-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:00:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227646

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit aa9909912ad4734a2a2f6e4fb4e49baebfe7b099)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...plugins-bad_1.26.5.bb => gstreamer1.0-plugins-bad_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.26.5.bb => gstreamer1.0-plugins-bad_1.26.7.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb
index c1d416c2bc..f19979c4b4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "9890f262f3b2a9564dcb629e9eb697d77b93d1f71897eda1a8170b7dcfe73294"
+SRC_URI[sha256sum] = "a0ab17dddd4c029ecd7a423c30badd5a3c7599ea42707016d1d57545f5723ccf"
 
 S = "${UNPACKDIR}/gst-plugins-bad-${PV}"
 

