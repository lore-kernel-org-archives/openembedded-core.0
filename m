Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5D0C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 12:02:30 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.96294.1723636949813483621
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Aug 2024 05:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=f0hhdV9W;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7bb75419123so4461653a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 05:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723636949; x=1724241749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ou49xhD4sD8kVdAnMfknOzxlWbK+44Oud1YA0NKu+3I=;
        b=f0hhdV9WB+Yi4FkPAjUV2xr5XHqqaMvZrOFsYPNUux52KblWO89vkAjWQR0JeIhFa0
         0PCVwb9Nf2lv5oFzPF7tz4+25DTl822Tr3MGaihgiY1P6CdeQFtOoRtW6XnGEnoGVoXH
         CntJmJKjgoZ0wPSpz7PmNhLTIgKJGh3w8Lr4RGIBOsuCL8pVeOqdTbjY90DRyV2w2T0C
         feRFm6W10rM0nUv04Ebu9LKWxKTdk0wgCtwJojSrP8xa4+rVq7e52OJVj9DHH1+4yAG3
         aw0PMe3TiHC6pGPy9o6m/hNrBXg7UwyAEWdjuRsMH1nsBQTCpw+gP1N6KX/IhzZRcp/g
         ZsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723636949; x=1724241749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ou49xhD4sD8kVdAnMfknOzxlWbK+44Oud1YA0NKu+3I=;
        b=f9+LJ7co3LxWhdTv6CvTYfwDP6N6WOrS2eKs5Z28eBUl8vMlag7JixA8j83hgKt7oQ
         /t5lzK6jVLzNh7jGCuH+Q0Lz6WSDrCV5VyreeDw3uKnbTlh3Hom70JRne3j0MxudWpIe
         riEW5iNXtvVU5Jvf6H/dT8peka+0SYx6zjYL7iPuzlZdh7f+lC1uqdXOf+XpkILErUKN
         HvVzJmW5Irv98mMQqJ/wsT5o8dWjLwMJL/lKo63uHxyF2ftLX3X7CgJ/pUv6QbvkqXu/
         FsbWAm3WFK6iMXPQQ0Yhh1372Q+0HviS4p+bPEQuOB8D+RoBe3gTWnpkylZbcYD7Z5Bq
         XKAA==
X-Gm-Message-State: AOJu0Yx9PwfE5BY2qaD2U68btRQWyWpjW1Oxe7ADC6t8FrGlecgiqlij
	wvI3BxTRXGiQR5pPR0x0OkyK0lEIYjmO2UrxvV4FzAE9KgudbRTXwVukuSrTCiyBwCUSxy2gvYz
	Mgd4=
X-Google-Smtp-Source: AGHT+IGgldUGsZ3+MbUA3L64JNC1jmcxxOWutzbSsBq/CjeoTW3D2O2CRkl+hy7kR+smEq3tggdDgg==
X-Received: by 2002:a17:90a:bd92:b0:2c9:7e6e:3578 with SMTP id 98e67ed59e1d1-2d3aaa71889mr2659564a91.7.1723636949005;
        Wed, 14 Aug 2024 05:02:29 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3ac80e0d1sm1512214a91.43.2024.08.14.05.02.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 05:02:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 7/9] systemd: Mitigate /var/tmp type mismatch issue
Date: Wed, 14 Aug 2024 05:02:07 -0700
Message-Id: <1238b7e2889ba654964ca0a437aebc74ef7a54fc.1723636705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723636705.git.steve@sakoman.com>
References: <cover.1723636705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 12:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203318

From: Niko Mauno <niko.mauno@vaisala.com>

The base-files recipe provides /var/tmp -> /var/volatile/tmp symlink
which is in conflict with systemd upstream tmpfiles.d/tmp.conf which
defines it as a directory (or subvolume on btrfs).

This generates following error in journal:

  Jul 03 15:37:21 qemux86-64 systemd-tmpfiles[158]: "/var/tmp" already exists and is not a directory.

Mitigate the issue by defining /var/tmp as symlink corresponding to
the one created by base-files.

(From OE-Core rev: 1f1f6f45e3cfe24dfee8a09d01a5d32f3080e381)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd/00-create-volatile.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd/00-create-volatile.conf b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
index c4277221a2..043b2ef1d8 100644
--- a/meta/recipes-core/systemd/systemd/00-create-volatile.conf
+++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
@@ -6,3 +6,4 @@
 d		/run/lock		1777	-	-	-
 d		/var/volatile/log		-	-	-	-
 d		/var/volatile/tmp		1777	-	-
+L		/var/tmp		-	-	-	-	/var/volatile/tmp
-- 
2.34.1


