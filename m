Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3228ECCA479
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 22:00:31 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.737.1657231221971061748
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 15:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=0v6ljN1k;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id y9so7715601pff.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 15:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=L1NvikUtJuCARM5vxQ4VmWralHkHh7KqYXNwyDR4Htg=;
        b=0v6ljN1kjuSdGGZoQmpvlXshA2qDLBvhOvn+A+8F2WkyTqigJEUUqUFoFzhwo932B+
         Pc1nuvL6gbO+N0yDjyEOee8xbFP0ymkYLJJRVq9dx44alzUBHIUrHYwEBnUhY1BV2WJE
         t+SKIgBNO7+t8umpODerRsdkS5QosDmoN/2znq1iePxEG0mq3fzPRqBxKY0N5E9utvQ1
         lRFw0b807+vXoneM62pKn+N9bhnpOxjKHZ7L7272IlMKbx7pPaRh5+liBMrinMjsf8yV
         eFX092ilmaRpAm8lERPx6+hEAtBtLrcfkYkHxpKW8dG+W4Y4OpMKucz/bX01R2lZczs+
         5a3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L1NvikUtJuCARM5vxQ4VmWralHkHh7KqYXNwyDR4Htg=;
        b=0cWYRH3LEPMFNkfjvxIGhuW4nBq3nJyFkx8dZnVANe5H+Y27/KAIfWDkIu18jyaXwj
         mydfkMmnwnaUj2TQuzUVjgT6uGLPvdJn26j5Iv9H8F0BeMN1Tk7QaxZeWVpZ+6AmpT3I
         S43nTw23Y3gW56QT43tNwG+gPNiZGXTUo+unW2VjU4tiKIoNTifGeKtX1miNV9lTagCF
         Tj817ILDgXpxaGofSAm9+LVdBHOP9WYKQ1SgBLHIp7Pas8SiuxQNRtLTqjSEa6wnQk7l
         1WjNrLD4O5Fnv0yhTOK0WFp6NWJNGsl9QCvfY0VheuGII6NvXkgQB6hDtOvaeWrVSFAj
         bjjQ==
X-Gm-Message-State: AJIora+AtW2WpW2KJ3kiWul9d6wLyAvpdwf/4kiUzWz4drMWwENhQ4r5
	wl7TwRR706fgDoDWOIgwUW1x6ZXLMMiAvppM
X-Google-Smtp-Source: 
 AGRyM1vVd6EZfsps37Br2eWwTb7N0FKZ8nf2suV9e0VECvoMAn8e0ziCfkcbxvvJOsLUsIXD+rLYOQ==
X-Received: by 2002:a63:1d15:0:b0:412:8c83:a366 with SMTP id
 d21-20020a631d15000000b004128c83a366mr246949pgd.32.1657231220925;
        Thu, 07 Jul 2022 15:00:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 j1-20020a17090a31c100b001ef79eb5033sm56840pjf.11.2022.07.07.15.00.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 15:00:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/14] oe-selftest-image: Ensure the image has sftp
 as well as dropbear
Date: Thu,  7 Jul 2022 11:59:32 -1000
Message-Id: 
 <70b3c7004e8f14a99adf6119f153a08ec4a4bc6b.1657231055.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657231055.git.steve@sakoman.com>
References: <cover.1657231055.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 22:00:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167808

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We need sftp so that scp works with recent openssh. Use the packagegroup
instead of a direct dependency to ensure this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2b76c8e5fc8802bbe54371119e6bf6312bf2a8ec)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta-selftest/recipes-test/images/oe-selftest-image.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-test/images/oe-selftest-image.bb b/meta-selftest/recipes-test/images/oe-selftest-image.bb
index 5d4d10eef6..6246aae910 100644
--- a/meta-selftest/recipes-test/images/oe-selftest-image.bb
+++ b/meta-selftest/recipes-test/images/oe-selftest-image.bb
@@ -1,6 +1,6 @@
 SUMMARY = "An image used during oe-selftest tests"
 
-IMAGE_INSTALL = "packagegroup-core-boot dropbear"
+IMAGE_INSTALL = "packagegroup-core-boot packagegroup-core-ssh-dropbear"
 IMAGE_FEATURES = "debug-tweaks"
 
 IMAGE_LINGUAS = " "
-- 
2.25.1


