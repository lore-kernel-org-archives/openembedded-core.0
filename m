Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9260BFC72A4
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 05:42:55 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11371.1776750171556566951
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 22:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=M/sIfE3y;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so3519233f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 22:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776750170; x=1777354970; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSKRONQ1ZFPvDeLodXZucLUwWnA9LuB5PJyIIZmfppE=;
        b=M/sIfE3yN7sOz3jEDF2wf8Qic1DxBqqgxwUYr90RiaJIZjNOJMEvTKrhjBLwBBQtIJ
         pPKnWnkNfzD740hfi6QQE4OlDljHNSrFLIO9c8W35YiQqdALUzb3iEjn51lJEbwZjM1e
         lVNa9u0y2nN6+zffIS7YzCHVdkax0Vx/0FXJYfbK15gYQaXjNBMaFpzVn5qExwi3qPsL
         yG8IWqIUHXvVCgPVBTupnCXSPa4MkX8/vVlHrWl8M9dDTKFB7f8yLZSdO0GONNV/c4Y3
         V29DxgkuZXxrGT0IcuubYYSAnhIlIm+EBPRkXLGrrxRGEPaa9H2Zj+aXpr4mrf+drrZu
         v5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776750170; x=1777354970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JSKRONQ1ZFPvDeLodXZucLUwWnA9LuB5PJyIIZmfppE=;
        b=K7Gl1RISZZnyuc47g+QCEu27uaPUDgSa+lRelH+/Z3cdigr+hKoVOiwiaLDK0HZCWo
         ZQM6EF07RvItl5PyhaAray9WldYExk3OgCCLoB2jzTlroGWNI2Y/TY5NSyQFfkvzjKgz
         tAOmUtrcYODxpadDCrup3nWugW+lmR03riZ3KaG3DC/mX/VQS6HrtjiQRxL0X66z2qZK
         tMzCY0lZDyJx7J5vu9BCQPxji66OKpYBhYpJI2vAo+oALip60FD2UmzhIPv6aBTpPFyn
         +CrXQUutTWiYbuRCs45V45smdwVaAM5DFyCYWOF2bKx0fLV48zIqhpNPfODwQY/i08BU
         dwrg==
X-Gm-Message-State: AOJu0YynkRykJGp2YadJ9bgHLlBxwercXcgTcdv4y8i1vBvOu0DXTk1E
	EPD7JR7p0wGtHtEu7ZKmOK07f7nhVq96+pLYu/Ex6TbO8S05nZO6642wUa/WTA==
X-Gm-Gg: AeBDiestU0Hz5KI7ErzHsYkxNRIDllKZkverj1/X43WguToE312Ha1cQNEM8I9DGRC3
	AwYDvmeoVLAEg3cSeWlTfRhSxzpXgOTxX/p4SYHZG6jMSiT04PZQr5lz3UCyqWCRbUJkPfS2cQj
	bbOpW8Byv+jBXPT9Vu8MAJ50X9Y0EPxx+1oclD94VjGD3Du91WgUo3qEMnK9UHVGfLN2SEi17yr
	u/tWITLLkqqr3pWBQK0nWwMFbCWdmdBqKmsK1s7kfbgCyXk9YGNNdtLDAvKtM2sETqMLMqcPirH
	WMNzpznZZ2hymMu7bK2uQFs7s030Dx9xWVSX26wiXkv4fSa2wzeEYDtKUXa/bVW75Jqr5UJo7AA
	cbCeM5dBKRrQOzh47QNQWf5qsQ3w8ZCSiIfuXehkV6KFqNi0ghuV32f3oIqRnRZ/6I9YvH/vbdS
	2uRbl+xbSDVpgtHHvWTevnNiV1aIi4/wppbnubUOYS9xezU0IU7lzAMuwSndwLz1IN09cm1X19N
	nbXJrG/gCH8QtO739gg
X-Received: by 2002:a05:6000:2481:b0:43d:77a8:3bb6 with SMTP id ffacd0b85a97d-43fe3e239d9mr26023250f8f.47.1776750169468;
        Mon, 20 Apr 2026 22:42:49 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4633bsm34334578f8f.26.2026.04.20.22.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 22:42:49 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Halstead <mhalstead@linuxfoundation.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 3/6] meta/conf/distro/include/yocto-uninative.inc
Date: Tue, 21 Apr 2026 07:42:37 +0200
Message-ID: <20260421054240.3264-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421054240.3264-1-martin.jansa@gmail.com>
References: <20260421054240.3264-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 05:42:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235593

From: Michael Halstead <mhalstead@linuxfoundation.org>

yocto-uninative: Update to 5.0 for needed patchelf updates

Solves some segfaults on relocated qemu-img binaries.

[YOCTO #16003]

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 3ced03d477..e9dc6c8640 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.42"
-UNINATIVE_VERSION = "4.9"
+UNINATIVE_VERSION = "5.0"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "812045d826b7fda88944055e8526b95a5a9440bfef608d5b53fd52faab49bf85"
-UNINATIVE_CHECKSUM[i686] ?= "5cc28efd0c15a75de4bcb147c6cce65f1c1c9d442173a220f08427f40a3ffa09"
-UNINATIVE_CHECKSUM[x86_64] ?= "4c03d1ed2b7b4e823aca4a1a23d8f2e322f1770fc10e859adcede5777aff4f3a"
+UNINATIVE_CHECKSUM[aarch64] ?= "a25f2174d0cefcb22af005e9bc72ac01ae83b011c5b6d6d5bf00dac979877f76"
+UNINATIVE_CHECKSUM[i686] ?= "959cc2539b692f9b9862825c7324a0fe4d061fca742f6c259f67f581c59af956"
+UNINATIVE_CHECKSUM[x86_64] ?= "96045e8b1e242c8a849426a8506c7043f354b39f2bc0035192780e8205e23e9d"

