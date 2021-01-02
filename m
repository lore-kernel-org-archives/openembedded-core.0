Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.14079.1609608473477801986
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Jan 2021 09:27:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KMtgJ/BE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id t16so26797337wra.3
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Jan 2021 09:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fklbqIOq6Hz9rugbsZn1+NB3grVU8yhMxqa60fqo+c0=;
        b=KMtgJ/BE6MpSXfyhwqK8N7waGBsqPCrUvJ7SN9A0LS4FYYZiOCKC1QhtWG2KnNCP5d
         ERGPDW5xhMxXOsmD1Ajqlrl5JhiXj/C/z2Bz9WAzXdekQ3pUa7Ki/IP3bOA49gX4cnSK
         8C2JqkOoGKg3+RZLCfDM3Y/KNvIuZQDCsyJyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fklbqIOq6Hz9rugbsZn1+NB3grVU8yhMxqa60fqo+c0=;
        b=CQ8C7SBTzB0veEjcs2WnIf0B4uH6l0a7pc6bYjrdOF1PkbHfdCls1yo63M9mx+by54
         pq/SozvFkiLVw0yJ3bSdSKWHN3rCXD3knBIGIprPytkyiYV0xqLey7PWG/yRwJxJ9XUt
         Y3MiGzPY93UZiv6KXbX1/i0XkxQ/FiPndeZ/emoLXK9g5iHs2vTyvswQMb8GBX2GV5kQ
         kHee8CYh+H/NZ2Al0tCxSiz58vRxmZfTzLDqZImLC+Wgoe/SGa5jM/+MfT7af/daEbB0
         5Msjzq6amd2D5c0Qn4465cwc0gOBqD1wgs/suTYUE6WDbBLNpG3JIc0bmCOtWS4pEPHL
         5+fg==
X-Gm-Message-State: AOAM5314r/XTDHe4/DCxLXNPi1DYou39CE2bZQa10iveCQGlOo93uU73
	g5J2ttA86MZ7JTKaEN8sUWP+mtA4Gy01/Q==
X-Google-Smtp-Source: ABdhPJxWb2LATAsInVB6fggHiIZQ6lbVQVGRLG/Piu83aPA0GkfzdhfnaEnQErYPh/zfNGmYIC55Iw==
X-Received: by 2002:a5d:610d:: with SMTP id v13mr73729711wrt.425.1609608471531;
        Sat, 02 Jan 2021 09:27:51 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (e.1.6.1.5.d.3.a.1.3.2.4.1.d.3.a.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:a3d1:4231:a3d5:161e])
        by smtp.gmail.com with ESMTPSA id f77sm22551280wmf.42.2021.01.02.09.27.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 09:27:50 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] man-db: Fix reproducibility issue
Date: Sat,  2 Jan 2021 17:27:50 +0000
Message-Id: <20210102172750.354108-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Executing a sequence like:

bitbake man-db
bitbake man-db -c clean
bitbake man-db -c package_write_deb -f

results in the ownership of files in the man-db package changing from "man/man"
to "6/12". This is due to base-passwd not being installed in the recipe
sysroot.

Add the missing dependency so even if a recipe "re-packages", the name
of the user/group is found and the packages are reproducible.

[YOCTO #14172]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/man-db/man-db_2.9.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/man-db/man-db_2.9.3.bb b/meta/recipes-extended/man-db/man-db_2.9.3.bb
index a28f77b7500..e8da92bd195 100644
--- a/meta/recipes-extended/man-db/man-db_2.9.3.bb
+++ b/meta/recipes-extended/man-db/man-db_2.9.3.bb
@@ -11,6 +11,7 @@ SRC_URI[sha256sum] = "fa5aa11ab0692daf737e76947f45669225db310b2801a5911bceb7551c
 
 DEPENDS = "libpipeline gdbm groff-native base-passwd"
 RDEPENDS_${PN} += "base-passwd"
+PACKAGE_WRITE_DEPS += "base-passwd"
 
 # | /usr/src/debug/man-db/2.8.0-r0/man-db-2.8.0/src/whatis.c:939: undefined reference to `_nl_msg_cat_cntr'
 USE_NLS_libc-musl = "no"
-- 
2.27.0

