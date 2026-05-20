Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C9FCD5BAE
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:23 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7288.1779265278216757831
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YCi1Qw9Q;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43fe608cb92so2801214f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265276; x=1779870076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=anIYBu1zkZjK1cbWlFzdT2gKSQQvZGvTcy0l8NTP14M=;
        b=YCi1Qw9QGazeZYA9VhwY6GVi4G4x2lQE3r467daZjvYfxZ0F71owh6nUu23+qsSLbg
         fpBHWHz7jmHHjVBuy3/Y7GGB++TJFJirQRAkeYP340bfrHNKLuTOMx2k3+s1YL0KYjeU
         0Rb0v2ONI9mpR0xkVfWeVUv3itF8IL8H/VraM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265276; x=1779870076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=anIYBu1zkZjK1cbWlFzdT2gKSQQvZGvTcy0l8NTP14M=;
        b=mM6Ddo89Fc3jF5PwmLzOoEhSoriGzn3XqXi3pK0mmNCikGy+OiZzWP8qUutZm1lijT
         2ngCsHA2Y8AfkuK7IMerheaGY7DIRxC8MHmeGMZVE3lg/ORq0YSlAC7BEuULvBBQlbd5
         BNFOee5IZfVGmOkso8d8iumjHD7bRg6sQTo8FWb/0kt5eAevfTzJf4HTg9s05hfwDSwY
         VS8FLq7eN5YYcD/g02R98OnvTxiWfWrQTPX3yCLN6CVPNBvYppTqDrqvJWn2wSzZJ8Xy
         FilO06YylbcZQsNri+bvxLT77cTPI4OD4d9fKNc5mDpqa8KPfXioqlZxwXA5ijRRk2hD
         u2Ug==
X-Gm-Message-State: AOJu0YxFdZ3BSu/3YeNKtfKHhf5x6vI+iloMr9CyK0EqKb5pO/gIRgr7
	LUk7ctGwXrY9fm5pBjth+R2p49ixyI9rSXllNN41LrgM2gbJoiVRSkDi+JG+HqwuO9AUn4kXlWg
	cIGSr
X-Gm-Gg: Acq92OHevW44SE17cr2RfeRUUVu0f4n2XmBT4jLCjZRE7TAIqPl8KE/rpfr7rgerKMp
	CrURuqQCicgflPyfBe5SmfvCl294aAQkyfEZX7guz3dM6rKpI0tnAc6F7X5cyp06SgDbMjyTroY
	ZWfHkGTM9ZVnH0vR1hCQJD63oyVPXJIZJGK3dM9/YZsflxSR1Xbi5F3aG3NXYdt5j85zvXFg8wm
	7/YP2+e/MFNSL+226pRmQFSDtrt2fgJzsZUJ161iShqq3Ro89erNE5O/30ootO7BUgKqferdXYC
	e+K+UDLQAtqSeEi0wXkO/Hk1Z+5MREriZ0kF0TdQlfPRWZX6gFxzWQKx25KgBao+fVo5ulcDcRA
	IlRM7mplb0fqluQ1gBdCNamuLOknntu+HetSE1Xro/hwb1ZHgtd5ixPb7zxQEzs9gPo7h1tyuBX
	6BqTeCDfhW1Pq6NOBmSBaiEg0jfc8HaAfjdmNq5RtOdPPdkI71ZiOOcfAPD+axJERj27e1Laq+F
	dobXAdGhxX29IH1FeTsrui6b4YW
X-Received: by 2002:a05:6000:4205:b0:44f:9b70:2996 with SMTP id ffacd0b85a97d-45e5c5bfba8mr36151726f8f.21.1779265276397;
        Wed, 20 May 2026 01:21:16 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.21.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 22/28] scripts/makefile-getvar: quote MAKEFILE variable
Date: Wed, 20 May 2026 10:20:23 +0200
Message-ID: <0582dfa5c472dc646e629a5b9a54c8505cf1c463.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237421

From: Thomas Perrot <thomas.perrot@bootlin.com>

$MAKEFILE was unquoted in the -f test and the error echo, causing
word-splitting on paths that contain spaces.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c98243b8e2a5f1e538024131ca94991c5befc59f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/makefile-getvar | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/makefile-getvar b/scripts/makefile-getvar
index e8a98327667..238d9567adc 100755
--- a/scripts/makefile-getvar
+++ b/scripts/makefile-getvar
@@ -20,8 +20,8 @@ fi
 MAKEFILE=$1
 shift
 
-if [ ! -f $MAKEFILE ]; then
-	echo $MAKEFILE is not a file
+if [ ! -f "$MAKEFILE" ]; then
+	echo "$MAKEFILE is not a file"
 	exit 1
 fi
 

