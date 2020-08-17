Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.36527.1597635026474022565
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2020 20:30:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UmjLkk1Q;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id t10so6811767plz.10
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2020 20:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZSfEWifV1OZiGFOjlizkzrq6+JXDrLG/KjSCMSf0zcQ=;
        b=UmjLkk1QH/v4IINChkV94aWo+Rlt+70lXJk55TlDtcOmio0ky21BzJdFkHHFIo7OVt
         TftbZnMaXUF4bCeGwf3r7ncZwVkBoD96NLcdnEEHyAGnu5hE6pdWn4J025/CWtu04lnz
         WdkRmMf54KZjmJmCYXakA20smwIg/eaegmZqC18IEogfCwV+MvDN7wSoz+UWWAu3RipE
         B0LJ7RnAyADBWsKX1g6HtZz3fNCqPEV6oKttnsBqyvDOww36+x17pP/mySrIVT9SqEHe
         z3OO+rJMBjzc6/PZC5/yv1SZW3nkXvbtiHLMKH98GkKHAgidoiWa2rng9h/pyCW9Q4cu
         /V4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZSfEWifV1OZiGFOjlizkzrq6+JXDrLG/KjSCMSf0zcQ=;
        b=uHNdD8kh8Gg2l+u/EGt7LatcQux70OWymf/KGlD0690aZD2+bIsjwSLr5oZ4Z+Q0LA
         hohFqvpfYCd/OKv8q1kYdMtRjhJknbm0fyKdPWZlz3P05Qct9Li0VWG/wE+pDEf0PWal
         sw0RpK4HGuUk/6LVw3EF7GodwbTUOOocvKolbk4LzCpOunNWhQaeqeYCTYEfSuDLcfxz
         E3YBuXDwqQxmKCLZ2/cOffetTGwKL5yFCH1t9qc3Z6zQruu/gK3lYP5zsOjuzvvAYaQK
         vktedsRdPDy9e2wvq0ThZ1Y0J0NMV5Kmut4471BnlQbeLq3sqrhVPEH4KHd/jZp9gPE9
         k7AA==
X-Gm-Message-State: AOAM532W4MdWZIkHuTgZuehG/hT1KOtBKhw56IwZF6gzlEAsYP+/9yi0
	J1B/yg1Pcddf8Rrz+r+/ljcdG7tb06tEsA==
X-Google-Smtp-Source: ABdhPJxd/XpnmSlMhpgVjXxC/m4k76E1ogdhJPQCEa0/yQxIeVNgUZmiaplGdcP6b/lJAbWNdqH5tg==
X-Received: by 2002:a17:902:9a45:: with SMTP id x5mr9407312plv.243.1597635025677;
        Sun, 16 Aug 2020 20:30:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id i11sm14563247pjg.50.2020.08.16.20.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 20:30:25 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] buildgalculator: Patch to fix build with -fno-common
Date: Sun, 16 Aug 2020 20:30:16 -0700
Message-Id: <20200817033016.1539073-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817033016.1539073-1-raj.khem@gmail.com>
References: <20200817033016.1539073-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to apply a patch to galculator for it to build with gcc-10+
Remove double definition of 'prefs' variable

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oeqa/sdk/cases/buildgalculator.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index bbaa5c55c9..1121ed20ef 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -35,7 +35,7 @@ class GalculatorTest(OESDKTestCase):
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
 
-            self._run("cd {source} && autoreconf -i -f -I $OECORE_TARGET_SYSROOT/usr/share/aclocal -I m4".format(**dirs))
+            self._run("cd {source} && sed -i -e '/s_preferences.*prefs;/d' src/main.c && autoreconf -i -f -I $OECORE_TARGET_SYSROOT/usr/share/aclocal -I m4".format(**dirs))
             self._run("cd {build} && {source}/configure $CONFIGURE_FLAGS".format(**dirs))
             self._run("cd {build} && make -j".format(**dirs))
             self._run("cd {build} && make install DESTDIR={install}".format(**dirs))
-- 
2.28.0

