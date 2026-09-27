Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D3FC9833F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:44:08 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32863.1790495037833386012
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KbaLxNW4;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48434392b02so1726115f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495036; x=1791099836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UqKdY8iHVNnOoZTFk2FApeLrK3avLKCFad/W5NgvZtM=;
        b=KbaLxNW4VgesPDUxvK8KJsD79D4OuAxORBDzNeYD8rCI9pQCG9rG4GFNSsY88H27EC
         uFrRuY1mB2Ar6pWaaDPxHV5DvZuB9xgzXfn4SfRHWLAnK8AfzWLhJoT0Zxr2LhO+fZGe
         NsUCmiA9t9cgcyztINCaRIAw2HvTHBH71FFDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495036; x=1791099836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UqKdY8iHVNnOoZTFk2FApeLrK3avLKCFad/W5NgvZtM=;
        b=Ymw1bL71XDoYwIv4dPQbdNnTSQnoalEabVlPiNUrFELg1amYP3M7tJlN0cBrOiqjBG
         yW0mhC415en0AMovgrcnxNUK3Rq6kex2+Mylz38gGg4EM+Fu4WR5FTwLwzBSmcURjJwG
         mGL4RghUi//FBoAWbK0FG5ZuyN14pKOzuRs1IwPGlB85xgbs7duTnjLslv9kWaudlzuI
         1U8XoJ+8ljDenwvXCHI201laWkPhTV7VcxPp1ukT7uXU4Ofq6+51v7RCUoxz2QOm2twS
         X8u2+Nr1UOEYD3ahkMDlZeZ4dveM0CECsTqbmWnKeLRZ5BQ7cHZ+JG6vm+5lND362E85
         88uQ==
X-Gm-Message-State: AFq9FYIMXImGcTs/y8Nt/eVarLc6dTEPRYTdNWx43rCjWVKRWJAxDxGd
	gDnczVy1fVqUTZn91arTXxHuVCzap6i+tT+PjRftxP/pxp2VOW+TLPyxhnRERluTXjGDT9B2G8k
	b/q8Pmb4=
X-Gm-Gg: AYBFou2qqx5h6Iabk6qe6a+89dmdW3tf40QVMO6Xoi7NtwRlurl/WaUOc/qhJ5DGsIX
	tjNNFHM2YDufH1lWny8CDt5O/aarHLEwb8d/ccnG7+d8Fx5wBnCwX1A9J5P6suHOWNK/XaU41LT
	+XETt6fFjwPr5v9wkNHWulRZAtI3ZYe4u82HZ4MRby+nNjX/M7rOOvJaLd5CCnBJ/cVCWDlj7i2
	7jVV6ga6D5hU86ceCNgWILIisIol5TWRxfJm6VNOUvebezRxoiZUDKBN5HdKzbKoKyKpclsZCLf
	tbUf1DeFtjblJ/DhZ8Qhz1V8WMEqnVdueDQ1CLHgL1zr10x/IF49tc+IO9g5CpBWwKsdag+zE69
	oz89aPsCMqv91jOu5oBLLo54Hs4yPwaBH2h2Yk7Ov6ou/VOvKLXA475QNBfoWTw1qkv/cvP1RAr
	75lB/yM/PeDPmlhXm3yFV87KAhC+sBR/2mPLhau9SYk0vBMGGpOtOpGxjZI3a7UTiXU7n2DCt48
	5P7lUHZik9QRd7tSAsokakuVbdQs71eoiiAc+zPbMh7AagLdRldM1Kj81viNoNNthS69GN6ew==
X-Received: by 2002:a05:6000:4013:b0:488:84b0:3abb with SMTP id ffacd0b85a97d-48884b03b19mr8745918f8f.27.1790495036048;
        Sun, 27 Sep 2026 00:43:56 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:55 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 24/28] sstate: Update unpack touch code to be consistent
Date: Sun, 27 Sep 2026 09:43:15 +0200
Message-ID: <cceec3584f3196df099566599618844998f63777.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246674

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When we unpack sstate files, we want to update the mtime+atime of the sstate
object and any sig/siginfo files, both for the files themselves and symlinks.

The logic was getting a bit hard to follow and wasn't entirely consistent with
only a time in some cases.

Clean it up and be consistent for all the files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5213ca88cbec4e86b50d8da1fe4c300ca8f5de17)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: for [YOCTO #15289] ]
---
 meta/classes-global/sstate.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 5beeded1e88..a9f139acd7d 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -931,12 +931,13 @@ sstate_unpack_package () {
 	fi
 
 	tar -I "$ZSTD" -xvpf ${SSTATE_PKG}
-	# update .siginfo atime on local/NFS mirror if it is a symbolic link
-	[ ! -h ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo 2>/dev/null || true
-	# update each symbolic link instead of any referenced file
-	touch --no-dereference ${SSTATE_PKG} 2>/dev/null || true
-	[ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig 2>/dev/null || true
-	[ ! -e ${SSTATE_PKG}.siginfo ] || touch --no-dereference ${SSTATE_PKG}.siginfo 2>/dev/null || true
+
+	# Update both any file and any symlink pointing to the file for sigs as well as the file
+	for file in ${SSTATE_PKG} ${SSTATE_PKG}.sig ${SSTATE_PKG}.siginfo
+	do
+		[ ! -e $file ] || touch $file 2>/dev/null || true
+		[ ! -e $file ] || touch --no-dereference $file 2>/dev/null || true
+	done
 }
 
 BB_HASHCHECK_FUNCTION = "sstate_checkhashes"

