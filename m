Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F74FCCA481
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 00:32:08 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.21807.1658104326789382426
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=mF5kBt7O;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 cp18-20020a17090afb9200b001ef79e8484aso11430011pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TvV7oFUoAaTTFHJs+cBr+XzFq5HFWtkJx78pMidctVU=;
        b=mF5kBt7OoX9b/BGJnrEfBZZS1bmTzI/9tKXtrkjnTT6UpLud+bxqKr1SNFuEg7gjzA
         X8lqdpIKFVaOK469PwZKSSespxc7+i6T+1GrAVQBzokFB8yZlZK7NxiFVLKjBWuldS0K
         N8E9dIL5+945pR3fIOfP6v2JJ7RXUBpz0OWmCo38uQ4GW3V8a+HoUKfG1focix1/Z4QJ
         HPirZTBafoIs40UV11vSIOcyB6IgEAkYtykrAYrhDrBT+COFRnSYMHKfmihwDP4s51Xo
         bcMnmW05IoHYChKc3loP0tUkaDcOIqIxbhH+jUhjWpPyxWmvTHe5dYiJWRgrzLENKadm
         MHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TvV7oFUoAaTTFHJs+cBr+XzFq5HFWtkJx78pMidctVU=;
        b=m+COD9R2DBvJYPwJwyd1sF8tO18Jl02Q5vWcQC7ioipUBEFFv4f5/PSHWaO0p14vr8
         0c4aMsKr0XruLge9cWSfyeIwvhx9YU7PE4h/Or3/OpmI0dxu/WjjRV/Hc6G8tqigK3xF
         5j0BZMbkh7OxA4fUN0LtcHbSCMqDdngUjg5Pwsw6svEKjngo4v0Yy6hoOtpsCC7qvD08
         3YAWTTgwA4en7PcZIjMFLm/FQjTc2gEyqvxAYYLzrqcTuKR3+7Gm9TtsN1tkfgpilGUq
         17DlG4VyXpPymsUCtUIaqDiiwv6lmdAbYZPE4ak9tJ+j85HVjJnIV4HfdqdbR/yhefmU
         nOxg==
X-Gm-Message-State: AJIora8c29VRKvCvQLpIH+6P4P8E4xnulZ83pvMTGCUj6fx6eCRiRT5m
	aRvg+THiC+g2jLVemm3XshDIZZGBlWUrLfYu
X-Google-Smtp-Source: 
 AGRyM1sVTwKckEFClByS6G63QkCeCmo7Cq3/7eQz4WLjlFRsW5xmr7vTAjT+jni/KBSSo9Kyfqsm8Q==
X-Received: by 2002:a17:902:e153:b0:16b:dccf:5a89 with SMTP id
 d19-20020a170902e15300b0016bdccf5a89mr25860920pla.69.1658104325745;
        Sun, 17 Jul 2022 17:32:05 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s30-20020a17090a2f2100b001ef831a2015sm9958183pjd.22.2022.07.17.17.32.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 17:32:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/23] kernel-devsrc: ppc32: fix reproducibility
Date: Sun, 17 Jul 2022 14:30:21 -1000
Message-Id: 
 <3480149a102737a198ba1929c6cdd4ea5a966739.1658093505.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658093505.git.steve@sakoman.com>
References: <cover.1658093505.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 00:32:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168185

From: Bruce Ashfield <bruce.ashfield@gmail.com>

In a similar manner to the arm/arm32 reprodicibility fixes,
we can also fix ppc32.

The file .vdso32-offsets.h.cmd has captured paths, but we don't
need it on target or SDKs to regenerate a build enviroment.

We add it to our vdso-offsets list of files to delete and we
no longer have files patckaged with buildpaths.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2a142b68b232ff7728f4eb945eea923c64e7ebd5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index ee5d8d9ab0..f8f717199c 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -129,9 +129,11 @@ do_install() {
 	cp -a --parents include/generated/autoconf.h $kerneldir/build 2>/dev/null || :
 
 	if [ -e $kerneldir/include/generated/.vdso-offsets.h.cmd ] ||
-	     [ -e $kerneldir/build/include/generated/.vdso-offsets.h.cmd ]; then
+	     [ -e $kerneldir/build/include/generated/.vdso-offsets.h.cmd ] ||
+	     [ -e $kerneldir/build/include/generated/.vdso32-offsets.h.cmd ] ; then
 	    rm -f $kerneldir/include/generated/.vdso-offsets.h.cmd
 	    rm -f $kerneldir/build/include/generated/.vdso-offsets.h.cmd
+	    rm -f $kerneldir/build/include/generated/.vdso32-offsets.h.cmd
 	fi
     )
 
-- 
2.25.1


