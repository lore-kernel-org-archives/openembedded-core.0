Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE90C35274
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:28:12 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.2838.1702391290294320351
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:28:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IOiVyrPX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6ce9c8c45a7so3527239b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391289; x=1702996089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Euo9SJ2cxixaDUNqV7ApI/5fvxStwYY1wmjRP+uquys=;
        b=IOiVyrPXXDjVSGv7+U/pzdRGaND4fA+mqWd0DN0pRLcRNXTDK2FoYB8bw7mCtTzKzg
         xiX51kc6M65yb+OBSRwjvaQ/oRKO3jV9dmaHnQM2CLrbQLipxnA/4ptBNxzee5xGLEJJ
         bmvCneeB90J30oUR5vdWMWCC+7wGmLW883i8bIHdtTiB46cTEM9kj54GIHcC4+4k2zaF
         kaTHtwh4rj+HguNKQl+TeQXtEmckm4ihDlXKUm8WGLng0JYprd0U1cM5zHYyZIoFYVce
         Ug9lfahTn7JKkb4hLvlBE6hQnIRDuwOlJztZMIfvhnpxyLAPbW8xfu3k2QjIm3rig2EM
         knhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391289; x=1702996089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Euo9SJ2cxixaDUNqV7ApI/5fvxStwYY1wmjRP+uquys=;
        b=gtua4Ybgose/Tw211Zp7b+83Q4luz0jpyigynGifVsFnLISyzoRAks12/PN/n6jwks
         9vFzC+kqccuQeF1Fzquu11Np3njGRn5ibZaX0PUTdQq/6iGjEON6EX9WwEh50RZonuf5
         5MiMy0HlQqLuP8ywuT+cLp3pnVVHGwCeTtjl39cN9qm3ttjdbfDZHN6YDtoxoVvOWnQj
         reOiIXtwGS21NaREYVQDvoqiSFsdASMnmCXr77642Qt4VwEWvd/zkY20DywbTCNBX6G/
         h2LIKqNUJ/f08ZxvQiZiuHVju3tksdywzH9aHIqwdD5SgO2YvDUq1mqwtUXdQSaIVz+1
         QqSg==
X-Gm-Message-State: AOJu0YzFi9Q7/8PURvwsXB4ERMwlhGHQrXq3uZWC/z+kCEIWx1M6kxb0
	B2YEC0255HICl3k91jrB+Zw7/c7rEQqLG/X5jTc=
X-Google-Smtp-Source: AGHT+IFStWNeXfzS1f2DE0tSuMvR1C3e3jASH/47WfMRxhmvx3CmvBpwH/Tq2VOGEpE7R7Od/yVUHA==
X-Received: by 2002:a05:6a20:13c6:b0:18f:97c:4f63 with SMTP id ho6-20020a056a2013c600b0018f097c4f63mr3255748pzc.111.1702391289432;
        Tue, 12 Dec 2023 06:28:09 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.28.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:28:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 14/29] kernel-yocto: improve metadata patching
Date: Tue, 12 Dec 2023 04:27:20 -1000
Message-Id: <98d981ba1bf903da441df22f298633bedbd718da.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702391115.git.steve@sakoman.com>
References: <cover.1702391115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192218

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The ability to patch the kernel-yocto metadata was added to support
debug and easier test cycles on kernel-cache provided fragments. As
such, it was very simple and has limited functionality.

That being said, it is an available feature and can be improved to
handle patches that fail to apply.

The main kernel patching is already handled by the kern-tools, so
we extend the patching of the meta-data to same tools and inherit
more functinality from the scripts.

[YOCTO #15266]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e867addd6c2f508f7a95e72222e750d37f3d19d8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 30 ++++++++++++++++++++----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 4ac977b122..4b7c0b829f 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -176,12 +176,32 @@ do_kernel_metadata() {
 		# kernel source tree, where they'll be used later.
 		check_git_config
 		patches="${@" ".join(find_patches(d,'kernel-meta'))}"
-		for p in $patches; do
+		if [ -n "$patches" ]; then
 		    (
-			cd ${WORKDIR}/kernel-meta
-			git am -s $p
-		    )
-		done
+			    cd ${WORKDIR}/kernel-meta
+
+			    # take the SRC_URI patches, and create a series file
+			    # this is required to support some better processing
+			    # of issues with the patches
+			    rm -f series
+			    for p in $patches; do
+				cp $p .
+				echo "$(basename $p)" >> series
+			    done
+
+			    # process the series with kgit-s2q, which is what is
+			    # handling the rest of the kernel. This allows us
+			    # more flexibility for handling failures or advanced
+			    # mergeing functinoality
+			    message=$(kgit-s2q --gen -v --patches ${WORKDIR}/kernel-meta 2>&1)
+			    if [ $? -ne 0 ]; then
+				# setup to try the patch again
+				kgit-s2q --prev
+				bberror "Problem applying patches to: ${WORKDIR}/kernel-meta"
+				bbfatal_log "\n($message)"
+			    fi
+			)
+		fi
 	fi
 
 	sccs_from_src_uri="${@" ".join(find_sccs(d))}"
-- 
2.34.1


