Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.457.1598393892487249802
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 15:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gRohI2Fp;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id z18so211634pjr.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2020 15:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9xbz+nZgmHgF+EZTeXm+7SlpMZoOYyZ9OaJWbf3HnQ8=;
        b=gRohI2FpKUxHG3hVDV59gzNt3sCy2qRekVeLoJVRBtfwlXpZj66l28bK3hZjKHbosO
         nTeFYKIviWvfIKOL9YE6md1PmRxNC16OUH0m9ux+oPXN4FqXrejPgXY3/w4TyiliLlda
         7M+5DebQxwVwVFw2emfVhnVjhIec7EPCQlbdOvDeToFt7sf9EuR/mSobrHcvUusdrfte
         7/00STXcdyM+4VOPgS+pQHNIzrjSxdUZfljC8UO2sNQhgD/Eu+P0L2bSZYV2CwMnScBf
         PNgaJPTvdPw3XrjPAYpCNE3sgwv1fdxr6sdatohRUSEL7tMX1IFX0RW6xGJAArYKZocX
         HUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9xbz+nZgmHgF+EZTeXm+7SlpMZoOYyZ9OaJWbf3HnQ8=;
        b=R6IsQ7qTZOubpQl7/4A0QhIA+zU2PyFzVXbuz91iKqT6sMQDChpr3ZmHdJHPfsDIZU
         Y9qZ9DyZT2t7VS1MOdQzXssJb0hOYcso7XQH1TGYkOcOx8+jctEANxHHRSfFGEjeg2cC
         8ijNlGFI78zZA4/jU7dISZCX/YW0NsUn/aJK34Ir1wcXw4dy4hyAoqEyXpX5+eVaIWMm
         /umi3tq/Sd04b0R/T7lxAb51OUZ5qV5bVAmgvqUT/ipa/ysZvOOQV+qMDvUbMBw6GL9y
         7kYPs6lWp1GX+04njwqSeWSH16WWbUCtH3Cfvk4uJBiNkmKou8mpkDog9PdCWpqqMZTR
         WIeg==
X-Gm-Message-State: AOAM532ATsVH83Y450OZYhsJ5slsykh4E06TiJoGa2+l2CPg0LrVtgTQ
	4R9X3fcxXoUpEcRmGf+x8oIFIN63y9D2Xw==
X-Google-Smtp-Source: ABdhPJx1b+LAucPxZbnGtszVClF2CsI247iKVl9zaYdyRLVksjMB+DNsrhF7g9zAAX1vR0wvBqditg==
X-Received: by 2002:a17:90b:1214:: with SMTP id gl20mr3431938pjb.225.1598393891622;
        Tue, 25 Aug 2020 15:18:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4fbd])
        by smtp.gmail.com with ESMTPSA id q201sm255023pfq.80.2020.08.25.15.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 15:18:10 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] oeqa/selftest: Apply patch to fix cpio build with -fno-common
Date: Tue, 25 Aug 2020 15:18:08 -0700
Message-Id: <20200825221809.671196-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oeqa/selftest/cases/meta_ide.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
index 809142559a..4dcebc5a06 100644
--- a/meta/lib/oeqa/selftest/cases/meta_ide.py
+++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
@@ -43,7 +43,7 @@ class MetaIDE(OESelftestTestCase):
                         "https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.gz",
                         self.tmpdir_metaideQA, self.td['DATETIME'], dl_dir=dl_dir)
         self.project.download_archive()
-        self.assertEqual(self.project.run_configure(), 0,
+        self.assertEqual(self.project.run_configure('--disable-maintainer-mode','sed -i -e "/char \*program_name/d" src/global.c;'), 0,
                         msg="Running configure failed")
         self.assertEqual(self.project.run_make(), 0,
                         msg="Running make failed")
-- 
2.28.0

