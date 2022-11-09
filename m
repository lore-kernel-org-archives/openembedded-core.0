Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E842BC4167B
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 14:21:10 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.3764.1668003665722890588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 06:21:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=S2YlGpqO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id y4so17234910plb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 06:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2OFUs93tZFL8i47kbqLmFb8URWay7Lvb+qkDd7Zi1M=;
        b=S2YlGpqO7Ow1SyBlzUSQ8tqYVKppk2AF9Wcrkg3T6ry7RUrzYSMW6tVo3t/bFLrQzk
         KU2b5hGiyECymhmkTAyVhbLdQubGnYBIRBB3KEDOmesnidi8RYVHdJmKsHurdKHXuQrC
         H3brVA4sJ4Ehn/3+b1sd1cfDDxVnZz8XChEOeAOLUNH3gAAuVvYUo+dy3isVAMl5cEQ5
         KL1iWhEeb5+bf1pIXxOPIGnPUkelYi4VXjp79wtz851xOVPcUROUm145VTJZPGtlIVZr
         ncqqc73fNeekYjoMoWdO86cLlt6FIVLBZNPMRvjcN1zqSGIS/vLMkczehV/aNSn/+caK
         L5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2OFUs93tZFL8i47kbqLmFb8URWay7Lvb+qkDd7Zi1M=;
        b=hJcfHaAV8Oy+LhFXyZAPcqSCGRrF/9jNJTfxSuAfSpguMnWNioIfJ0xD2lU0oEzgNr
         e3BJ5JbJhXypTqdj6bsHZ5eV+3k4VLk9xyQ1kzIptiU94PY40tdYYx0earMdTg4n+uZP
         Bbf7lrA0vtOhxC2DiKLDisVMm/lymslOIIlTB+nynYYVAEdA5naFRAaAxvurniVQ0hVR
         Db6Hz2lQlwGhHOZOLmGResfnNKbQ6l91Eigg5NeosfSOWKmWyn1TlIKWmoK5YXkBtIvc
         2szaGGD5Ero4HFJJoyoGSNTM9zniuc3oKyuJMaCWUREx7HUynO8btIm5r1rVt47Ms6TH
         1MYQ==
X-Gm-Message-State: ACrzQf3zwFVRt+htpNvMzVMOMyzOjSwRZfK2nw2jQ8Ep9CCG2We/zO91
	R4rmlmGJ1eWH8qaFvVsAlbVDrdz6abM92Hwj
X-Google-Smtp-Source: AMsMyM5822zBHhdScy/a7ZZD/VI2RouIPylR5/36Mel6FrHcYiKjuBfkE1PzSAvPDScaQwbYeU2/4g==
X-Received: by 2002:a17:903:2343:b0:188:5f62:8e15 with SMTP id c3-20020a170903234300b001885f628e15mr30017697plh.5.1668003664749;
        Wed, 09 Nov 2022 06:21:04 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s17-20020a170902a51100b001822121c45asm9059337plq.28.2022.11.09.06.21.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 06:21:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 08/10] sanity: check for GNU tar specifically
Date: Wed,  9 Nov 2022 04:20:38 -1000
Message-Id: <fd92cdc6d2b9b3b808503b3274860a7c301587cb.1668003427.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668003427.git.steve@sakoman.com>
References: <cover.1668003427.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 14:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173027

From: Ross Burton <ross.burton@arm.com>

We need the system tar to be GNU tar, as we reply on --xattrs.  Some
distributions may be using libarchive's tar binary, which is definitely
not as featureful, so check for this and abort early with a clear
message instead of later with mysterious errors.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7dd2b1cd1bb10e67485dab8600c0787df6c2eee7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/sanity.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 8394213b63..a52f2016cc 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -504,6 +504,14 @@ def check_tar_version(sanity_data):
     version = result.split()[3]
     if bb.utils.vercmp_string_op(version, "1.28", "<"):
         return "Your version of tar is older than 1.28 and does not have the support needed to enable reproducible builds. Please install a newer version of tar (you could use the project's buildtools-tarball from our last release or use scripts/install-buildtools).\n"
+
+    try:
+        result = subprocess.check_output(["tar", "--help"], stderr=subprocess.STDOUT).decode('utf-8')
+        if "--xattrs" not in result:
+            return "Your tar doesn't support --xattrs, please use GNU tar.\n"
+    except subprocess.CalledProcessError as e:
+        return "Unable to execute tar --help, exit code %d\n%s\n" % (e.returncode, e.output)
+
     return None
 
 # We use git parameters and functionality only found in 1.7.8 or later
-- 
2.25.1


