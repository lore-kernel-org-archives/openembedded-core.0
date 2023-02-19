Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F499C6FA99
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:30 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.3852.1676835079540292228
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eToTkwvi;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id bk4so884421wrb.9
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkT7gMD/YNMLseoMg8nrF5aNIHrdtSAB4ZJVnwDxvrs=;
        b=eToTkwviROsqFRw/uNMvJ8dYJJTzvi4ZrOZ8SH03A1z7Fl6xyfymgUgvKUM0H/msKr
         AtfyHiKYgXeyDBvrskg5yCXgGZaoplJkIp5DTn/twSJRUI30fPNn4HUonjNuIha+JrhA
         fQNJMPmGINGhwP7hlC6yl5uxPsaxi4LG1kgIH5nRLgF2la2gv60my62zxG5n6eTohdT1
         c3VIBIdRJMxVQqRTf9hIMTSkx9tu0vUlw5r4pXcfre9S0Q13tA/MhP/fLjG+ubegSRuV
         B3/JGCWM0OBK7Fd2l383b/VQ6ObjMYyIgpFSypgD2Lo4GXW+rT+mJHQ/rGuai7ylZHX5
         tjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EkT7gMD/YNMLseoMg8nrF5aNIHrdtSAB4ZJVnwDxvrs=;
        b=1ADztpbkZ5L4+Vkew2wCiVv1irkaM9uxLnpDqIW5ubacrFF1n8mMPmYpWV7ZsmVoZ3
         BRmn7C5ziFXeF8E8lc16giDKCfvs6lpHwehMw4LI/frxautugEdNjhdl+RpZ0G4lUOjZ
         5xkvKrXbwK6+WI26+pSxhb1VR6exUEihPvDHL8JD8j273qEcFiOO8jkLfxcMNrS5ReAL
         iLLqU7+CBCo01SFLFq0eeTJxKIg1VJKSrxBYB74ijXtmHEeHqFlUR8uNRzMco87IJUUn
         LNrER5odYF2GTXKtkgXdpXjXfJbDcu1UDB58lfedNXpOXwd1TCijE9JSANHGvHgM3zOo
         0Kwg==
X-Gm-Message-State: AO0yUKX/0Oj67ETohL7Jy7oEnvumejscgSOOR1oVOKjIsWHaV78GeT/F
	libMNj/tm7X/0HlD82Sr8VfqhNe7xoQ=
X-Google-Smtp-Source: AK7set/40trTWBoARpmr1l4EKvRYYiCFDYlu3XIJJ47c1OVX/s5dZWY/5X/ZSzqhczdyFzirRhoYdA==
X-Received: by 2002:adf:e98c:0:b0:2c5:9733:1b3d with SMTP id h12-20020adfe98c000000b002c597331b3dmr925466wrm.29.1676835082804;
        Sun, 19 Feb 2023 11:31:22 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 27/39] linux-firmware: upgrade 20230117 -> 20230210
Date: Sun, 19 Feb 2023 20:30:49 +0100
Message-Id: <20230219193101.338397-27-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177370

License-Update: additional firmwares

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{linux-firmware_20230117.bb => linux-firmware_20230210.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230117.bb => linux-firmware_20230210.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230210.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230210.bb
index fa9e6f604b..bf5d4f54e6 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230210.bb
@@ -134,7 +134,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "05f1d941972cedadbf667c05f6010378"
+WHENCE_CHKSUM  = "aadb3cccbde1e53fc244a409e9bd5a22"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -212,7 +212,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "df11e25ba2fb4d5343473757e17a3b4cef599250a26b1f7e0f038850f0cb3d64"
+SRC_URI[sha256sum] = "6e3d9e8d52cffc4ec0dbe8533a8445328e0524a20f159a5b61c2706f983ce38a"
 
 inherit allarch
 
-- 
2.30.2


