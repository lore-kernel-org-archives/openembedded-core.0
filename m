Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B3BC6FA82
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:18:32 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.20184.1664133488088202726
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=qqLynJqL;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id a29so4756746pfk.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=xjDynIRkXJ4vnYc8iSRs2yrnoNNg0sUmO7741PRn1FE=;
        b=qqLynJqL9qChjX+gYWP3WFZIalVzTXwYKl1QfnJphHk3mfLJOWZeGIFDJTY8tWz4lL
         RLKmOFNuiF2+XjNQ7c25ho1o9B1uOsGhTLx9IXxkifzY6u/ybUYJtFpunG3iggDa1Z27
         WoJeYp3INUtW2jUxv1eYRP/t4neYefoIyWyMI62M0Jw0a+N5nApRSls10mtvxmEVYGxi
         uTIX+Grn9w+ZUjlO9/PpSlGxtap30h6oL/Mf7ka9DoYDNIZoK8EZXwIJoCf3J4nu0L5Q
         KFY6TXa+N7tOKGBAPfuQUerzZ+mRnRkWiW3vj6T45h+IC6xjUNJxN+FnqfxaAt28wJX4
         l0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xjDynIRkXJ4vnYc8iSRs2yrnoNNg0sUmO7741PRn1FE=;
        b=zFD8Bb+Md3xo1hUQYhwcmype49lAAXcJUQX7gBWUxxmtUjFABRD4uT+y20/Sf1M+Pz
         BFELeL8L+8DZRjabnoRv6q9Z6W1LfXXmog3cN7q/11UcPO1JOh20T/+wQIwW1u0XU/gp
         VpRzVtTnR5vt2t/7DxKK73C2aWRmY8X3SvqXbNlo2UCWz9wMUxFpoizCHIsjU0ZpK6zr
         MBAMe2Steq6/j7fXwDcVR5pcFWFmIfhbvik1Ar/xjcjvP67LOWdGOZ/qmMoqFm6maoBX
         Ozvb0dkqPJosmXbsV/MRi+rHY6T95pauBEwbBNskCKAUEqvzlAdDXI1C6tZJ4aZxrk28
         hnVA==
X-Gm-Message-State: ACrzQf1gxiVTAk7MmewMUWpB0BYXIXQqLvdzxQRayUsnAO4H9WBvx3ZE
	tpHCGqMSBrj59mkgMM3swX7wWYusnB0fpp75
X-Google-Smtp-Source: 
 AMsMyM6ySQkE4vhYy26YstEjbK8isVYy/drQh4/AzxHWBsOF0Go1n61skcoFj1HxbIDkxz2ftlluQQ==
X-Received: by 2002:a63:e709:0:b0:438:98e8:d1c with SMTP id
 b9-20020a63e709000000b0043898e80d1cmr17102405pgi.403.1664133509617;
        Sun, 25 Sep 2022 12:18:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.18.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:18:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/33] kern-tools: fix queue processing in
 relative TOPDIR configurations
Date: Sun, 25 Sep 2022 09:17:27 -1000
Message-Id: 
 <8f76f9f04bf50d9c80ed23bd8297c5c9236b90bb.1664133309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:18:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171030

From: Bruce Ashfield <bruce.ashfield@gmail.com>

As reported by Peter Hoyes, in some very specific configurations
the processing done by the kern-tools results in errors. This is
due to the bad creation of relative paths to patches and configuration.

This is fixed by the following kern-tools commit (based on a similar
suggestion by Peter):

    spp: ensure that relocations and patch paths are absolute

    If include directories (locations of layers) have relative
    components, and the path to a patch doesn't share that relative
    location, the detection of a common prefix can fail.

    When the common prefix is incorrectly specified, it can be the
    entire path to a patch. This results in everything being removed
    and subtle errors (as this shouldn't happen).

    By ensuring that both the relocation directories and patch path
    are absolute, we can avoid this issue.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b9681ad7c5c72aa1e68b3cdc93788a03b3781d63)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 11613ab3b6..e065c3e74f 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS = "git-native"
 
-SRCREV = "f70b1d52f4706a263ae22e2c61039ccd875e97b6"
+SRCREV = "9320c2a1aaa085e94abd15ede0d93ffdab578e9d"
 PV = "0.3+git${SRCPV}"
 
 inherit native
-- 
2.25.1


