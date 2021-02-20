Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.10781.1613848169609566570
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Feb 2021 11:09:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u0vFf1HD;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id c11so4049019pfp.10
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Feb 2021 11:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P91ljgP/AKr3BpLgIhyzJaqX/e3yFzezOBvFqYq5JXQ=;
        b=u0vFf1HDYsgsbS7Lyx1DVZIfKBlNNMk6HX+Bp1jGS4O37+voB9TTkEh0yU4EMQWhDf
         3qOvWSDXVMCLqZSojS/vGfguCvHJBHTVBIPEjnY4E0m9D/DG2tdi3JAwkd7BP/PfvLiG
         E2eJTuY8AU0MKyQk1FKjmfvgmL5Q4UocBLGrs/ESjxPMz4Xq/qPo34UkgSdNFBABQlcI
         uDv7vAtwsuGO2Ls/0+7PGCcmHK7lNApP44EBMLR401bgz6EkO/8ZMh4a1sRORh2+wfa8
         REmaqBw326zCgifwUoOkB8zU5Gm885hf014YnbxWU6CYzPFrDhQosjEwarDCGeuzV6Ce
         cKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P91ljgP/AKr3BpLgIhyzJaqX/e3yFzezOBvFqYq5JXQ=;
        b=ZFNBauiNwxXNrUu1277pUvnYlXf7Xj6Iwbeqw1S9hoaM8lPH0Y3Pu526Zr2DzfvSkA
         LsxP/AWyGAk4q3aMYbDmIJJK0++rIIfDoDDln3U0zZrGW/st2IXfJtxAIiHNB2u8+hgo
         QQtBuHsiJolWkXzE4eHh1UMd5nkPkIYW8catO35iWfHJlfz1oJphWOmh3rO2YqWZJ+HK
         qdSX4PDQCfR3GN6xjXII4/Hho2df0W1zax/+mMc0TcsJa8U35LUcbhyxahyE/CdU0gM6
         0wCndKHi1lxCJyjjKZ6E9eInLCtSHMvj/OtKIl9b/zydgyBd2ll/PbEsEyaCW7QV1vQe
         1/7Q==
X-Gm-Message-State: AOAM530hFvaPtpFy1y81OgU6DnZl7evS03UMrHDVutPqU1A78hawf5GL
	gik+0ca7E/SD227BBNXQCwlYzyVh/ZkYKQ==
X-Google-Smtp-Source: ABdhPJxthdL6utF34eZdHDz4Yf8Uw8ehUNMT4FJvAVsROZ90W2Z5FvE9OPqvuWNSEgcWAcmVaYO3ag==
X-Received: by 2002:a63:a401:: with SMTP id c1mr13687964pgf.60.1613848168987;
        Sat, 20 Feb 2021 11:09:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::54b4])
        by smtp.gmail.com with ESMTPSA id x190sm13632307pfx.60.2021.02.20.11.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Feb 2021 11:09:28 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/4] musl: Install /lib directory
Date: Sat, 20 Feb 2021 11:09:23 -0800
Message-Id: <20210220190924.3153040-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210220190924.3153040-1-raj.khem@gmail.com>
References: <20210220190924.3153040-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

loader is installed into /lib and ${base_libdir} may not be always
pointing to /lib, while here we want to create the directory where ldso
will reside

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 562e80ae43..e6f9e2441e 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -62,7 +62,7 @@ do_compile() {
 
 do_install() {
 	oe_runmake install DESTDIR='${D}'
-	install -d ${D}${bindir} ${D}${base_libdir} ${D}${sysconfdir}
+	install -d ${D}${bindir} ${D}/lib ${D}${sysconfdir}
         echo "${base_libdir}" > ${D}${sysconfdir}/ld-musl-${MUSL_LDSO_ARCH}.path
         echo "${libdir}" >> ${D}${sysconfdir}/ld-musl-${MUSL_LDSO_ARCH}.path
 	rm -f ${D}${bindir}/ldd ${D}${GLIBC_LDSO}
-- 
2.30.1

