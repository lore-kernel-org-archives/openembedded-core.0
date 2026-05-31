Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC58CD4F54
	for <webhook@archiver.kernel.org>; Sun, 31 May 2026 00:18:24 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16961.1780186704505724918
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 May 2026 17:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hrUtQ6Cn;
 spf=pass (domain: konsulko.com, ip: 209.85.214.173, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0c3184c71so1442305ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 30 May 2026 17:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780186704; x=1780791504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUTtKGAxSERrOJoy1mRRMlDHa9Akkb7zvAhwg9NejA4=;
        b=hrUtQ6Cn6NHhg3uhtSaTreQ/xgT7V/o16ABWJrWrGkKeVCrg91C1omU5z7J48Vwxap
         gYXgus8T0JvBjphO/yI10+nlhnrZx0NxP4A5TQ4XWa96EC3W9ooO4dAYRwEiNAXYnyyC
         9XU9cWzOO32og/2WvO/WXAp50u7TIMkVn+GMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780186704; x=1780791504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DUTtKGAxSERrOJoy1mRRMlDHa9Akkb7zvAhwg9NejA4=;
        b=MQDRccstLyd5kO3RI3IhAxG7QTt1yZpy0i4MMzp351fCZ13Enxz/qbXzZCRBqpnSnD
         a6hABqWbqpuTNNpYIFTMGrzwuj7UsnPfgQPu2WIS6RkyYKD4Xv3as9kDBhDlatIj2xK4
         WLtbp1u0D/272l8BVUGE6ngw9gVjtqDVdj58CFbo5ZnvLNXoCbJ+fuytVMxC/CPjS4HZ
         ef/HKLnZGfwdLU7X+GQys4h6NpgbgboJI9ffh26wzJspSIsU2CoFonB5gOKklYINIO4G
         2TPTWnGZAwSwulJnULIvrlI7gG7rTzTNT7j535lOv+n7zJC+C5ItoO25p/Yuv5vnwzYw
         XjYg==
X-Gm-Message-State: AOJu0YwdF/UigZ7cRbCR1CRWbwkEjZuGZBs3JpITwf5DntZEX+ucgWg8
	C7ViRypNo2nsWK9wqAEbbXWtlyY6f2e6czv37JOO0XhgJLhuVY5aImZOEzNgvQWMqmQr9JdQQY7
	8zLoH
X-Gm-Gg: Acq92OFzG35Q6+E9t229IKKlereJKOuuG7wunaDupbbCXXvsaTK2HNpPQUo/J/mZiVt
	zFXw5BB9QUdjgCtMvlhaOWkDVcHd+FXEGaglFgrALYn0DfvfSQB8cW54clUo5IMhV2uX8Z0b8aH
	bK6xiUmp8S++Li0HuVm4SmVM0OsLcr4RPkcoMmtCkmpymZXQZ2/mwDwrWjmNYw+ZJqdasgz3G6n
	tKQ9MJIxTn7zIdkrrh8NUavE8yLN9ft3YXsNeQMMwunONhzojmtAF965+IyZd5VP49j1i4l+3k8
	x6W6gj9nDySqEEuYZPFDYa3GoNWWBnz6tRD7D/e4QY8CZ72JoTXOETC4IZh6CrSk1j7vx+3YoZd
	tMHr8Ms+TlYBKFU4HEiA2+X1gs1DTe8DcC5XBt/AlWYT7V95gNrtU14sJqRDtdNcxDkiTn+xjg7
	KXnVAJBSGiUOGY+CHWvIHsXT2Et9ILayzQz9jyLsfMaeCBxUgwbKLgZVgFIVHsdmyd3x7BWf4bw
	g==
X-Received: by 2002:a17:903:b84:b0:2bd:d4dc:a4f9 with SMTP id d9443c01a7336-2bf368287c9mr57659875ad.26.1780186703969;
        Sat, 30 May 2026 17:18:23 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c31862sm74930035ad.70.2026.05.30.17.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 17:18:23 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 9/9] python3-zipp: upgrade 3.23.1 -> 4.1.0
Date: Sat, 30 May 2026 17:17:56 -0700
Message-ID: <20260531001756.1582306-9-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531001756.1582306-1-tim.orling@konsulko.com>
References: <20260531001756.1582306-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 00:18:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237788

From: Tim Orling <tim.orling@konsulko.com>

v4.1.0 [1]
Features:
* Path.iterdir now raises NotADirectoryError (formerly ValueError) when
  call on something that's not a directory. (#154)

v4.0.0 [2]
Deprecations and Removals:
* Drop workaround for stacklevel bug on older PyPy releases. (#149)

For a full comparison of changes, see [3].

[1] https://github.com/jaraco/zipp/blob/v4.1.0/NEWS.rst#v410
[2] https://github.com/jaraco/zipp/blob/v4.1.0/NEWS.rst#v400
[3] https://github.com/jaraco/zipp/compare/v3.23.1...v4.1.0

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-zipp_3.23.1.bb => python3-zipp_4.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.23.1.bb => python3-zipp_4.1.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.23.1.bb b/meta/recipes-devtools/python/python3-zipp_4.1.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-zipp_3.23.1.bb
rename to meta/recipes-devtools/python/python3-zipp_4.1.0.bb
index 45b83bf347..ca3f1250c3 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.23.1.bb
+++ b/meta/recipes-devtools/python/python3-zipp_4.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2e21c3f75eb8d9427c8a611a8e83e9d6"
 
-SRC_URI[sha256sum] = "32120e378d32cd9714ad503c1d024619063ec28aad2248dc6672ad13edfa5110"
+SRC_URI[sha256sum] = "4cb57381f544315db7688e976e922a2b18cdb513d21cc194eb42232ba2a3e602"
 
 DEPENDS += "python3-setuptools-scm-native python3-coherent-licensed-native"
 
-- 
2.43.0


