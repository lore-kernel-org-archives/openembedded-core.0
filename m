Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.11048.1611768476066845643
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 09:27:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OZsxcROY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f47.google.com with SMTP id d2so3413528edz.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 09:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=L57EyzHooqZCIwOFKjiOhTcFePsh00kQWbqcgMNDuSw=;
        b=OZsxcROYSb0e+D1DZLvj+LdAot6Z4k3R/nzGIgx4mrYskCAULr41WxfDqyzobAiLDb
         uog43Bf3OS0GcHZdZXcSekGfccC3kYTuXyVfETp4mtK9IHb1xBN9dJ5dR0UPwrw/rS3/
         O8JYgJOV5+uMlLE99XkKyxZRwXGz4O5SDh3Rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L57EyzHooqZCIwOFKjiOhTcFePsh00kQWbqcgMNDuSw=;
        b=b96TEDStUw5L2ddg4IX1rLfOZ4Vvuaq5X+ojhq3M65I4lLDcluElR6CBAMFDpSfzja
         oZrRmFsJrl/ewuXjacGaUviaQcpHUyvn2JTnWHW4lHVTWUhx62lMkxxxD0+HR9bJWUJp
         5daLBq7oSWYyiVsEa9hqz1+ffzFLfrM0e8yaR3iA6QTCY8dRoAAT0x/BTg4b7ipiAcg5
         l/QHY++QMIsBi3Kpb+kJMiksoKRT1ALlerRbMaK5lSiScomOmt4f/N3PIgTLHOoPHh+w
         9WgeT8MyKGN4SdXwgILP5gmoPQRaP3L/bIKc2UeBB4aAh3U1/tN0Nc+EYNg+4afM/+Xa
         FM7A==
X-Gm-Message-State: AOAM533QbJsLRXDMvDqZ3Nj4QQJBa/TBq+l7CfEee5Jdya8vv0yp8oAW
	qRECYEyrKLgyIlI7rh6udax1qG7fOPfMVA==
X-Google-Smtp-Source: ABdhPJwfEy999ziEqFjMuWfLBI+WK0DuE535BdApSRIa0FDzbiyqJF/dGKluwaOB61V56Hj99n21sw==
X-Received: by 2002:a50:fc04:: with SMTP id i4mr10109114edr.137.1611768474537;
        Wed, 27 Jan 2021 09:27:54 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:52a7:b6a0:dca3:45dc])
        by smtp.gmail.com with ESMTPSA id k27sm1115581eje.67.2021.01.27.09.27.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 09:27:54 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] python3: Avoid installing test data into recipe-sysroot
Date: Wed, 27 Jan 2021 17:27:48 +0000
Message-Id: <20210127172753.1286275-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
References: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are several thousand files in the test directory which we don't need.
Adding these for the native and target sysroots is a crazy amount of files
to be throwing around needlessly. Delete the files from the sysroot side
of things to tidy up the sysroots and improve performance.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3_3.9.1.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.9.1.bb b/meta/recipes-devtools/python/python3_3.9.1.bb
index 17d0c032f73..a89122f9494 100644
--- a/meta/recipes-devtools/python/python3_3.9.1.bb
+++ b/meta/recipes-devtools/python/python3_3.9.1.bb
@@ -372,3 +372,9 @@ RDEPENDS_${PN}-dev = ""
 
 RDEPENDS_${PN}-tests_append_class-target = " ${MLPREFIX}bash"
 RDEPENDS_${PN}-tests_append_class-nativesdk = " ${MLPREFIX}bash"
+
+# Python's tests contain large numbers of files we don't need in the recipe sysroots
+SYSROOT_PREPROCESS_FUNCS += " py3_sysroot_cleanup"
+py3_sysroot_cleanup () {
+	rm -rf ${SYSROOT_DESTDIR}${libdir}/python${PYTHON_MAJMIN}/test
+}
-- 
2.27.0

