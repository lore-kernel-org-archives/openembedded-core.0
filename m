Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EBFDC021B3
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 21:10:28 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.7398.1739913027518794028
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 13:10:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0y2O0WGc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22114b800f7so56784925ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739913027; x=1740517827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w44JGsgOXvkxJgl+IZDIDww51IEG5+2l9e3dBp3MNdw=;
        b=0y2O0WGcIa/dxuecpWbBg74GTY3AVPvd7801H8bQmpdxXEP4wSvZQiv7pF7rjg8mN2
         1poYUip0No6SjesTETZilBpL2+n+4VI9g+4jRQu9xJqAZhyJwpzu6VOzk9yhXiQXg/t0
         PQ4spUbwgqj0LahzFxFRZfK32P+uzxtDs4DJyJEunCXJtaEtvef3hkjfs7wZQ7mxKq+/
         yCl5ARLDLAp17Uy78pFyvuRyhJzTpIdeuWwDiZsoCGNSRYMWANiWysGjVdfiN3wrcv0x
         sk5Ey4HJLBJ46EAW4kmLeRH09UfEd58rEXGfDIre5/BVj0evBkXkXJLeKkIIR6+5heXi
         A1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739913027; x=1740517827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w44JGsgOXvkxJgl+IZDIDww51IEG5+2l9e3dBp3MNdw=;
        b=kC9tR7oZZKVdR6lbuO0jnxmn/qkmzTSsXZxmWhowRvntqPZ5ZrnvCTBhqE4FXwjusv
         SKMV2ojwkgMnJ6CG/T4Xh+nn9NW45e+flUGvp1NEyOYtfg+Opjo5p3Tc+4/o6FBJtHPi
         rDbzE0AwhBkRRUqNj9VkNY03X/dcCzlsAPKn8uhoSQuvL6nx7OY4A9wukKcEBDMWvIAL
         wmgBgGBgB90x/oxfWr8ypCxKdjuyVCQwq9y8wRog5JgfQtFIfAip2850knhBPUqnwyI8
         8NqdWi2XMcEJbWOWRoiCbACC/H/fBApWDeH93tcNCopYa4m8DXgPE8bXR4RQo1BwJa5r
         4B8Q==
X-Gm-Message-State: AOJu0Yw9WMpHC+zmp89bjFxmTJXzlZJ8TLyDFAhsadHdXeF5dTJ/vGNU
	Uh/k53J47tMsjB4+BpJ57vsMCxXpq4XrGBo3TauvPBvzGLZp61vjyLFuapV93Nc+Q7Hfyrl4LaF
	g
X-Gm-Gg: ASbGncvvGWzkUs8ULdxQ22YP1jR0fn8RzNAr3GIo9aZVLUOoN5DVdfyJqLPERLOlNDd
	TBhsNrImrxgBVH4yH+oV6/BE3V+PFFco/90yzjekOKTXwnycF7dWljiDKSJzp4HXfM+qZQnKisp
	iZK1R+PYbSOgbMUtitPnHQ9hCohcyAJpRPnrkeZjqj8xxgH61mTm37v5z2I58Ne5OTIVaB1hl8c
	2kYK2DL/KY7eIOJUTOEXRlPfsnumtV3IJ7VVTdAN5eKWTIp/UGWOLCjV7z/1p/htGxU1KgRwSuN
	pUVOkNs=
X-Google-Smtp-Source: AGHT+IFrks1CYr9AJhjcydIGyEHUida/Suh5zSN0pS4yXp7ig7kqKoZfn1mRXbIGbjoYT+Ms3Ejf0Q==
X-Received: by 2002:a17:90b:3d0f:b0:2ee:c918:cd60 with SMTP id 98e67ed59e1d1-2fcb5a39f7dmr1492439a91.20.1739913026737;
        Tue, 18 Feb 2025 13:10:26 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:83c7:94a9:a555:bf05])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b326bsm12820720a91.1.2025.02.18.13.10.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 13:10:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/12] scritps/runqemu: Ensure we only have two serial ports
Date: Tue, 18 Feb 2025 13:10:04 -0800
Message-ID: <d356f9f6ee6a3b94af303dc0e160957f9e85a06f.1739912869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739912869.git.steve@sakoman.com>
References: <cover.1739912869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 21:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211650

From: Richard Purdie <richard.purdie@linuxfoundation.org>

I have a theory that some of the console boot issues we're seeing are due to
starting images with three serial ports yet only starting gettys on two of them.

This means that occasionally, depending on the port numbering we may not get
a login prompt on the console we expect it on.

To fix this, change the runqemu code so that if serial ports are passed in on
the commandline (as is the case in automated testing), we don't add any other
GUI serial consoles.

We do need to make sure we do have at least two serial ports since we don't want
getty timeout warnings.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1b0348535dce3b776efbcf26406b94730a51eb85)
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 8a417a7c24..9f7827565e 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1408,6 +1408,19 @@ to your build configuration.
             for entry in self.get('SERIAL_CONSOLES').split(' '):
                 self.kernel_cmdline_script += ' console=%s' %entry.split(';')[1]
 
+        # We always wants ttyS0 and ttyS1 in qemu machines (see SERIAL_CONSOLES).
+        # If no serial or serialtcp options were specified, only ttyS0 is created
+        # and sysvinit shows an error trying to enable ttyS1:
+        #     INIT: Id "S1" respawning too fast: disabled for 5 minutes
+        serial_num = len(re.findall("-serial", self.qemu_opt))
+
+        # Assume if the user passed serial options, they know what they want
+        # and pad to two devices
+        if serial_num == 1:
+            self.qemu_opt += " -serial null"
+        elif serial_num >= 2:
+            return
+
         if self.serialstdio == True or self.nographic == True:
             self.qemu_opt += " -serial mon:stdio"
         else:
@@ -1419,10 +1432,6 @@ to your build configuration.
 
                 self.qemu_opt += " %s" % self.get("QB_SERIAL_OPT")
 
-        # We always wants ttyS0 and ttyS1 in qemu machines (see SERIAL_CONSOLES).
-        # If no serial or serialtcp options were specified, only ttyS0 is created
-        # and sysvinit shows an error trying to enable ttyS1:
-        #     INIT: Id "S1" respawning too fast: disabled for 5 minutes
         serial_num = len(re.findall("-serial", self.qemu_opt))
         if serial_num < 2:
             self.qemu_opt += " -serial null"
-- 
2.43.0


