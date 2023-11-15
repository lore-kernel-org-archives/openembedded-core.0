Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A051C47075
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 03:17:56 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.4873.1700018274337669598
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 19:17:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=D0eJeiH1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1cc3bb4c307so50095495ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 19:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700018273; x=1700623073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkZK9M5tj2KC2wgtvXppRw+ZgeYvryLLhaSDeXXceBU=;
        b=D0eJeiH1NQwGb3sxfNB8Zgvv5VVagsr7dzChvM1SYSWM4KCCk6LK8MPgUCDqriawZn
         Jp/D7hbbFSgzw8QSTjXca3hnDTwysZQ2JLTML84BomBe3IY3lze0IZDExHi747SyZpvY
         nju1Kb7MDQF2UxXw0GWDmB1wLsw0R9dtvEzGG9b8s+oeXLvk97Ua4XuMPmg3ySOInBoZ
         YCrA0Pj/Duf7JTjfJhzv+Z5KjqZ55Xc0kn9VRJ/tfUr02TgUrW5nIUKxkzFh5JgIeRXf
         kNhZjOBsX1GOM0Dn8tAdujYlDGoWxAk4D6z/gIwoS4AQ5B5bW5LxrVfMnloiJ/e+eUCL
         O5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700018273; x=1700623073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkZK9M5tj2KC2wgtvXppRw+ZgeYvryLLhaSDeXXceBU=;
        b=eoLZ/bP0oOm+/VkjhTPPc0Wwnx6CjcQgBhta4/9TSQEvcDPHOaxQd584wa+7wunnD3
         h02pxEABhYaVKr/VPhSv98AyARHY5lbUnDQakg6Mk7s/S1/rSp5k9nXIwKPuN5mwXXc1
         S+rPVrtlKipRn2Pm53/zI9D/EDO+Ns755JhNeuQUkVjbEwg56mbW0+eBv2q2rexsf2N0
         Ycr7gnR1GteK7Eo1mFOBVdux1xotc3SuHlGBlun9zpJfOR+S+jsdrOycD87r2BIbyv84
         k+tdDZqDnoOxqLEVBrbTZ/2P9loiMt8UI8MpNf4U2PXb3nuxsh8wDa9h5yzawurkteJG
         mn/Q==
X-Gm-Message-State: AOJu0Yylxj0dgQaFF3buzmnb9KMNDO9lFwU3XzoPc1RyqOPXNHVhWLS+
	YCEFw12+8YqVExPtnf6WyjbcPArdbRUSBWXZBpytyA==
X-Google-Smtp-Source: AGHT+IH/zcZU3X91izNXyQTTd6wg6i6YujHDnlQSd5nOBUnCIzpls0rufZFAbAzTGXskLvqbIzUarA==
X-Received: by 2002:a17:902:d548:b0:1cc:c857:14a0 with SMTP id z8-20020a170902d54800b001ccc85714a0mr4709306plf.3.1700018273460;
        Tue, 14 Nov 2023 19:17:53 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l5-20020a170903120500b001c6187f2875sm6369300plh.225.2023.11.14.19.17.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 19:17:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/17] zlib: Backport fix for CVE-2023-45853
Date: Tue, 14 Nov 2023 17:17:24 -1000
Message-Id: <bbe5e13c2ff981d7defd14f9e2d91ebbe107bb4b.1700018112.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700018112.git.steve@sakoman.com>
References: <cover.1700018112.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 03:17:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190537

From: Ashish Sharma <asharma@mvista.com>

Upstream-Status: Backport from [https://github.com/madler/zlib/commit/73331a6a0481067628f065ffe87bb1d8f787d10c]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../zlib/zlib/CVE-2023-45853.patch            | 40 +++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.11.bb         |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2023-45853.patch

diff --git a/meta/recipes-core/zlib/zlib/CVE-2023-45853.patch b/meta/recipes-core/zlib/zlib/CVE-2023-45853.patch
new file mode 100644
index 0000000000..654579eb81
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/CVE-2023-45853.patch
@@ -0,0 +1,40 @@
+From 73331a6a0481067628f065ffe87bb1d8f787d10c Mon Sep 17 00:00:00 2001
+From: Hans Wennborg <hans@chromium.org>
+Date: Fri, 18 Aug 2023 11:05:33 +0200
+Subject: [PATCH] Reject overflows of zip header fields in minizip.
+
+This checks the lengths of the file name, extra field, and comment
+that would be put in the zip headers, and rejects them if they are
+too long. They are each limited to 65535 bytes in length by the zip
+format. This also avoids possible buffer overflows if the provided
+fields are too long.
+
+Upstream-Status: Backport from [https://github.com/madler/zlib/commit/73331a6a0481067628f065ffe87bb1d8f787d10c]
+CVE: CVE-2023-45853
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+---
+ contrib/minizip/zip.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/contrib/minizip/zip.c b/contrib/minizip/zip.c
+index 3d3d4cadd..0446109b2 100644
+--- a/contrib/minizip/zip.c
++++ b/contrib/minizip/zip.c
+@@ -1043,6 +1043,17 @@ extern int ZEXPORT zipOpenNewFileInZip4_64(zipFile file, const char* filename, c
+       return ZIP_PARAMERROR;
+ #endif
+ 
++    // The filename and comment length must fit in 16 bits.
++    if ((filename!=NULL) && (strlen(filename)>0xffff))
++        return ZIP_PARAMERROR;
++    if ((comment!=NULL) && (strlen(comment)>0xffff))
++        return ZIP_PARAMERROR;
++    // The extra field length must fit in 16 bits. If the member also requires
++    // a Zip64 extra block, that will also need to fit within that 16-bit
++    // length, but that will be checked for later.
++    if ((size_extrafield_local>0xffff) || (size_extrafield_global>0xffff))
++        return ZIP_PARAMERROR;
++
+     zi = (zip64_internal*)file;
+ 
+     if (zi->in_opened_file_inzip == 1)
diff --git a/meta/recipes-core/zlib/zlib_1.2.11.bb b/meta/recipes-core/zlib/zlib_1.2.11.bb
index e2fbc12bd8..910fc2ec17 100644
--- a/meta/recipes-core/zlib/zlib_1.2.11.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.11.bb
@@ -11,6 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
            file://CVE-2018-25032.patch \
            file://run-ptest \
 	    file://CVE-2022-37434.patch \
+           file://CVE-2023-45853.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-- 
2.34.1


