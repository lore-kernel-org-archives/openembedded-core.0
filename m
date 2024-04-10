Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB02CD1296
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 09:29:57 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.161554.1712741392966144536
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 02:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iHJGkvbG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-516d3a470d5so6249885e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 02:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1712741391; x=1713346191; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0RdsSRE03fLBJbvroJWwoI3VHnNRd8Pv31msWNW7Fs=;
        b=iHJGkvbGqFDPyIK3n4ed4ODjSlKOYVoSptmGTOUYPicg/dImj5e+L4IGo/6dHum5N7
         kp3yYe/ahov52eZc1hf51AYSpibOIz2xq9RlqMWtagmTzonFyT/L1Eb62wgzmQk8ZSE4
         Yf4GZEH9wyVMOuB/j9Xx6BkSASiah6sLugL/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712741391; x=1713346191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0RdsSRE03fLBJbvroJWwoI3VHnNRd8Pv31msWNW7Fs=;
        b=VmebaDqaXApFuodrClue1P7JSqcUa/Gau3MZ86yvT2WNk/nvdbJaYLMydIHODlrJXP
         qzEFm/7yKvyVwb2T7ZIRTUQkofbcY2st/YzUBwNDU1asS1guJh9HSasP6hGWX2OlYIV5
         c4hoil69l4jWZHDrAK8Zg9Z/2dai4xbMpluRR9g1kJB1GWXkNsvJBlrlzXgXv67v/7GY
         89ssHLO3B2eBJPMnPmafXvAnI3mUvyb0elrz61mcLw55MQhlUNjlDroRv5OvcEwHPmnJ
         +f/+DNOLCtqvFwuy4Q4SudAxxvzFY/QrFhjWjLFjr3chRhxyY5Od+WKQhCDC0r+cDVsF
         ZJyA==
X-Gm-Message-State: AOJu0Yx9D2St7aR5w9aB5V9En/rWjQf43ZfYliztLduM1ivsZkawOtAp
	hrr2yAS2Hq4zi+QUFCOwbF9TPAR1MyOI9DXdrzYTxAAbyJjpM+44HIGNjhkq0Os=
X-Google-Smtp-Source: AGHT+IHkQZ7erR1kWuYV9vKUpAe6JSikVm/9pJTmepYd/XvumqPhflnaJexGtOYP7nyrIdKv6cmnfA==
X-Received: by 2002:a2e:b002:0:b0:2d6:dba1:6d37 with SMTP id y2-20020a2eb002000000b002d6dba16d37mr1722227ljk.11.1712741390764;
        Wed, 10 Apr 2024 02:29:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:502:f603:97df:1110])
        by smtp.gmail.com with ESMTPSA id n12-20020a05600c3b8c00b004165315d885sm1703165wms.11.2024.04.10.02.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 02:29:50 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yocto-patches@lists.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org,
	seebs@seebs.net,
	mark.hatle@kernel.crashing.org
Subject: [PATCH 2/2] fchmodat: Ignore symlinks, don't return an error
Date: Wed, 10 Apr 2024 10:29:48 +0100
Message-Id: <20240410092948.1989389-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240410092948.1989389-1-richard.purdie@linuxfoundation.org>
References: <20240410092948.1989389-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 09:29:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198088

Ugrading to coreutils 9.5 pulls in:
https://git.savannah.gnu.org/cgit/coreutils.git/commit/src/chmod.c?id=07a69fc3ba717b879218592db685a1c79869cb28
which calls fchmodat with AT_SYMLINK_NOFOLLOW.

All the docs I can find say that symlinks don't have modes and are
always readable. With the error in place, we see things like:

chmod: changing permissions of 'XXX/build-appliance-image/15.0.0/rootfs/home/builder/poky/scripts/esdk-tools/runqemu-gen-tapdevs': Function not implemented

when building build-appliance-image, which uses tools from coreutils-native.
It is only a matter of time before distros start shipping those newer tools.

I believe the correct thing to do is just return success here rather
than failure. This does fix the build failure.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ports/unix/guts/fchmodat.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/ports/unix/guts/fchmodat.c b/ports/unix/guts/fchmodat.c
index d1ac7bb..5a31151 100644
--- a/ports/unix/guts/fchmodat.c
+++ b/ports/unix/guts/fchmodat.c
@@ -28,9 +28,8 @@
 		return rc;
 	}
 	if (S_ISLNK(buf.st_mode)) {
-		/* we don't really support chmod of a symlink */
-		errno = ENOSYS;
-		return -1;
+		/* according to docs, "chmod on a symbolic link always succeeds and has no effect" */
+		return 0;
 	}
 	save_errno = errno;
 
-- 
2.40.1


