Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED04DC43334
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:36:55 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.64582.1656876999617003520
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ixihpwob;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id a15so7163582pfv.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Rqrfc/tnPvqrNTv8YEQ/B4SN1hE2JL8TtutGWtksydM=;
        b=ixihpwobmMHDOOdyLczvqxMhzYkXXi1e3uhyjdZLP21DAws9EUYEC65qURD3jZQusA
         n7gH2gokuYBDw8da/6V33MJICvnXSKuYQP9Z+LbX62FqtxC7Chdl4aSMiDyEfbkidqS5
         E94GWZ6VKwGtAmUtRBqgluswoZwa5ZImGSY+uAzGDBHRM+qAnI6P0/vDq1nvOKEArNpV
         BTkgfdXDKAffg63nkVdadbieVw4HzloCWV4gkQ8zQhF3saytXpIU7P+bXp9yB79Oqxmv
         hNxtwXXurzuK+X97eOfYvUGRwS2HEJmh1ggyXzB1ce3EWthyEZa/1YViZAs2Jp+0GFy4
         T9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rqrfc/tnPvqrNTv8YEQ/B4SN1hE2JL8TtutGWtksydM=;
        b=eQ2GJ/B5ZgGLP7I843jcdlhP54ko4fYJc6Zlq/3zSjdFQxd01NpXf+WWhYnmTDQTT5
         QzIsTwCQjrlkxAw11drjoVGv1d1M8OwRIJ5TbnMSlirVp3eqyfIw1ONCxlA4q8iCVY67
         oLv/kfL3p6MnIdzZAbohDbUidrkKsAo/1ccPsVDR8ut06K6A7uaBB9hLW2ImcvDXK2WQ
         AlRFY+XAzIkiuTj/9XCTlQkRLikhvaS6/Vu3i4NVWi9NIs2BQVJVfULR3R1z4UPGvqjv
         mei/ZWw/ZQO3UxgRgqZpkFy0i9k/8RnkPNtGIq8W2+mFM+2TpLvcH1ygMqvOvDzHVRXz
         TP/Q==
X-Gm-Message-State: AJIora8uh/ZLozD4mfuXENp0Sy5G5Ab/Sf9Ob7wUCvUbqWeoOSN5cIvf
	Dl0Gdc1V10siuASN3xZp7t0S6AdNIwzvKY/d
X-Google-Smtp-Source: 
 AGRyM1tb2eTtj4QLOQY1fIYCZBfhB50mTkFW3O+B+QA8YY/k9YDjsa3mL6CMCnGIqsmvF1YOrlPllg==
X-Received: by 2002:aa7:9823:0:b0:525:15b1:3297 with SMTP id
 q3-20020aa79823000000b0052515b13297mr31916630pfl.13.1656877006614;
        Sun, 03 Jul 2022 12:36:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.36.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:36:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/30] cve-check: hook cleanup to the
 BuildCompleted event, not CookerExit
Date: Sun,  3 Jul 2022 09:35:42 -1000
Message-Id: 
 <6f9c806dd1580a80856a687a2ad3a0b32d74dd17.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:36:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167567

From: Ross Burton <ross.burton@arm.com>

The cve-check class writes temporary files to preserve state across the
build, and cleans them up in a CookerExit handler.

However, in memory-resident builds the cooker won't exit in between
builds, so the state isn't cleared and the CVE report generation fails:

NOTE: Generating JSON CVE summary
ERROR: Error adding the same package twice

Easily solved by hooking to BuildCompleted, instead of CookerExit.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fccdcfd301de281a427bfee48d8ff47fa07b7259)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 50b9247f46..da7f93371c 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -166,7 +166,7 @@ python cve_check_cleanup () {
 }
 
 addhandler cve_check_cleanup
-cve_check_cleanup[eventmask] = "bb.cooker.CookerExit"
+cve_check_cleanup[eventmask] = "bb.event.BuildCompleted"
 
 python cve_check_write_rootfs_manifest () {
     """
-- 
2.25.1


