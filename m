Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.10811.1619460378584267499
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Apr 2021 11:06:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uvfocyrx;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id w10so3176797pgh.5
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Apr 2021 11:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uKyVsmHLY4yvn72TL8tSaonllf3Tt/Tjzc82fxLeiMQ=;
        b=uvfocyrxOdLEqcee+uYfdRhLwTSn+LXyWGaPxlRFrpIXskiJGK80prmneKFPXJaSXD
         ohFlgQdhMRpdASJe/Rrd8L08RHIx2WgCb814v4ToDIEsQE/mTRfnsqnLNx0Y4rNPHHny
         N121/YzBAlilXCM9KjICEl1J72L3P/vE5oq5bXI6qhr6kmUVr30+9CqABkN3aMm/AQzZ
         IqTRyxyjODwXDi0cCQVZOIM9iMSdH/eqAgnhIQuEbm7WfL/dgWEmMojgtudf4vD7PJMe
         2MLYpf+Q1sHM4TRV7maAo582RdiHjyBCamm/1y39+sPJorJKWCWr1kwfDfiAdgTnGwOu
         5clw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uKyVsmHLY4yvn72TL8tSaonllf3Tt/Tjzc82fxLeiMQ=;
        b=lESzA09rewGSSALSY1w7u92EPw6nkCms2i5t0Pq8VTWPei62pxKZu98fmQi0Vn7Y1H
         +SQWDbtL7c1S92DmPA87b37rjeta8xXfvGMlqu9/yfJwxH4VFWnoJ0Fcc38ew6U9gjaT
         YWDIpZ7lykeiU8s0kZuzYQvUypGz3oxX5DqL4CFJpKcCbxK61rXFndKCvR2AOlYCmbO/
         /xxgy3QVTD9UoW5uIAreCE1DzlU8I4+fHAMn6ulniG1ovm/nMxPuMKexrd8ZL5PF2rq8
         PU4O5fc1cGEiL/rvKDGasDF+7DDMashTL+jPW7+hugikTuI2cV8exaeKMHhgbXsibi4U
         bPWw==
X-Gm-Message-State: AOAM531Ctby1vJN2XD4i6K1EBNxe/cW4xC+C8PAxEmx+7tiCpy694IJw
	xQuWKn0m6dH2cPr5k/2A0rErBqDs7Hx6Bg==
X-Google-Smtp-Source: ABdhPJx9qp85kMd7XqBi5d+rMsC1QS2UJAUFOvYyoX8cfgEp7AkxDJCnzc+d8pAHsNKnP0c88P3WIQ==
X-Received: by 2002:a63:b59:: with SMTP id a25mr17936561pgl.235.1619460377799;
        Mon, 26 Apr 2021 11:06:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id ga21sm310657pjb.5.2021.04.26.11.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 11:06:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>
Subject: [PATCH] gnutls: Point to staging area for finding seccomp libs and includes
Date: Mon, 26 Apr 2021 11:06:15 -0700
Message-Id: <20210426180615.2837459-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This ensures that if libseccomp is installed on build host then it does
not resort to use it.

Fixes
checking for libseccomp... (cached) yes
checking how to link with libseccomp... /usr/lib/libseccomp.so

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/gnutls/gnutls_3.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.1.bb b/meta/recipes-support/gnutls/gnutls_3.7.1.bb
index 3e1958c969..350d0a018b 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.1.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.1.bb
@@ -31,7 +31,7 @@ PACKAGECONFIG ??= "libidn  ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)}"
 
 # You must also have CONFIG_SECCOMP enabled in the kernel for
 # seccomp to work.
-PACKAGECONFIG[seccomp] = "ac_cv_libseccomp=yes,ac_cv_libseccomp=no,libseccomp"
+PACKAGECONFIG[seccomp] = "--with-libseccomp-prefix=${STAGING_EXECPREFIXDIR},ac_cv_libseccomp=no,libseccomp"
 PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
 PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
 PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
-- 
2.31.1

