Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.23505.1593615532670936193
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 07:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HGRjJmsl;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: andrey.z@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id dr13so25096032ejc.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2020 07:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=UZRO/H6wxuZ8UiD9T2qQAxZdVezjTQ38ju8rwQ/RrBc=;
        b=HGRjJmslLrsaB6nZhlTwlZpY091NPClR3LnOK7FgpL7/5B3iel92B1MP3XRdTZz4kh
         +6WMlI1OX8LcoCmaAhtH0LqpvM0F9Hxnb7mIZ7/49ydGk1KW/CMUJGpSkq/y26P7ELpV
         OpydZBnYr8pnCrcPFiACP/Wc2iyOKSSlmohtYEoO5G198NFm+LPWWGYS9Mmd8yceQm4U
         LdMkdVhmYJ8qcE7yTk2ms/9gHCeAA6F/ihD2SRdQXaw58QyF9MC58ICv/YKXxEKm05AK
         lKFssM9SeQC/+3oc2upYkewaJmY3qtP/tGdqEqJCIAQIa52cOoRQb2J9tmpM4LOLUS9z
         VFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=UZRO/H6wxuZ8UiD9T2qQAxZdVezjTQ38ju8rwQ/RrBc=;
        b=RJLDkMjVXfez0LuDtS9G0QdGiDlnhCbHm6YcO0knZqMGB5uWUFkMaXwNjQ8DZR6mOw
         3nj6O5L7inYuubDHnT/Wm5xSRtTApnVSJL4V4kouGv9P7aFQRbtUr3BK29CFwhw7z12d
         FAdJMULDr9wecx4k2q/HltXmhh4VIgpDE3+9e0RAmu2ANaioBt7eCBTUR2tYU9ODR3qu
         rqV2r7F49Ro6l45px9mbUcCJPBxysCyrAH0lqYVieDzFdMwwNIqyE7gr//Et9gi1r5ZX
         ny2wy/jkhteI52BmX0omVEjlfT9/DJvZFK+50Ag4bYn6aN6LBSrLnv6Cr3u7+y3Rgi9j
         mhvg==
X-Gm-Message-State: AOAM533M+p2bpyzZ2YPVYzHyF4XOwUgoAZwH0hRV0N6WoUhvyCXfqJVr
	7PSkhTuG8eKAkcS1lAHEaJlt5nhg
X-Google-Smtp-Source: ABdhPJzpdkYiiEBbtGjMmWA5Lhw50XL35pmzMG2kNBjSWLeqatiYYzyhheqF5N2mZ7R2Ct+TN3bqZg==
X-Received: by 2002:a17:906:94c4:: with SMTP id d4mr22767349ejy.232.1593615530525;
        Wed, 01 Jul 2020 07:58:50 -0700 (PDT)
Return-Path: <andrey.z@gmail.com>
Received: from aherlnxbspsrv01.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id sd15sm4861769ejb.66.2020.07.01.07.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 07:58:49 -0700 (PDT)
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrey Zhizhikin <andrey.z@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH v2] kernel/yocto: fix search for defconfig from src_uri
Date: Wed,  1 Jul 2020 14:58:25 +0000
Message-Id: <20200701145825.3743-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.17.1

Fetcher provides full paths to defconfig and scc files, which awk
comparison operator does not catch during construction of
src_uri_defconfig and sccs_from_src_uri lists. This causes the
src_uri_defconfig variable to come out empty, and fails further
validation if defconfig is only supplied via SRC_URI.

Replace comparison operator with awk match function which searches for
sub-string during filtering, effectively placing defconfig from SRC_URI
into src_uri_defconfig and scc files in sccs_from_src_uri respectively.

Fixes: 23dcff0d396c (kernel/yocto: ensure that defconfigs are processed first)
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 41d8620e67..54a1a1627a 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -156,9 +156,10 @@ do_kernel_metadata() {
 	# a quick check to make sure we don't have duplicate defconfigs If
 	# there's a defconfig in the SRC_URI, did we also have one from the
 	# KBUILD_DEFCONFIG processing above ?
-	src_uri_defconfig=$(echo $sccs_from_src_uri | awk '{ if ($0=="defconfig") { print $0 } }' RS=' ')
+	src_uri_defconfig=$(echo $sccs_from_src_uri | awk '(match($0, "defconfig") != 0) { print $0 }' RS=' ')
 	# drop and defconfig's from the src_uri variable, we captured it just above here if it existed
-	sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '{ if ($0!="defconfig") { print $0 } }' RS=' ')
+	sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '(match($0, "defconfig") == 0) { print $0 }' RS=' ')
+
 	if [ -n "$in_tree_defconfig" ]; then
 		sccs_defconfig=$in_tree_defconfig
 		if [ -n "$src_uri_defconfig" ]; then
-- 
2.17.1

