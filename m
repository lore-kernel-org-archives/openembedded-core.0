Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.11403.1590314680966777395
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 May 2020 03:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H9I8Q6zQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: gzatko@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id e1so14511177wrt.5
        for <openembedded-core@lists.openembedded.org>; Sun, 24 May 2020 03:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q2lpKTBM8Cs6QJZSvlbHAytlvWUAcRuSIynj5bjgS4M=;
        b=H9I8Q6zQwxf5kLnyqtm3vm9OXt9icuXWN4w3NrC+6gcgUs/3CfvgaKLG7afjTODx6e
         QnU2KRm61WCcocUpxIrNUXFT9/kPLo9I6bzS1SCAsYbNwOZexwnBtoAWZebtykMm5fbr
         oq7/NYJKHry0kw5ZN+V3pmk+bAz29bKYI5B3IpBfGl3kohIrTtdLCMZ7b6qu3aajCcRs
         ru9Nln35ulZ/yyaS870Sx8HCdvzJ3IsxtHyMLVtk87u2UUxECGITLLTPqz+FPV7eouvp
         N5AqNS0WZihnUHDNV4DoAdleG306JtE9Reg5QEU5gTyc9EY/sJ/WMExtQ+ydTmaDFfhu
         YcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q2lpKTBM8Cs6QJZSvlbHAytlvWUAcRuSIynj5bjgS4M=;
        b=hN21kZJIyeCV8B6zOXSnhUARq7G588dUvVu2nu9IpB+OPFrO0p0f9SflI0SOeL0gRi
         UsnSQZZ2dzil4i/w4PBDc0xrbRko2PmJeGL8+kdJ89SFXNKxi2O1FWoZfvI1e9oMXvRl
         +yDjsaF9/1rjxcsx8pq5cwaAHVnFjg1BQvXTozWhUSC/V3pK+xWCYhDJGLlIOqP3P6GP
         M65r/CBS22QSuy4i7/8dxEylVoIq7TUrm8l4PbTOfI0J5CLcpbcBn9wDY5jz/yZUf97Q
         4tiXunOs1xQo5o19E9HlOAs4FXhkdmrZPaV7EsEp/9s+syB/KLypbHpF9IMti3yA++2C
         k/tQ==
X-Gm-Message-State: AOAM5325/3xNEG2nmfutIn2leaiay8c//7EM3GFBytWHdwJJTttEHmIC
	ngvCR1vGWswO47DBLjMA2GvhxdJaiFk=
X-Google-Smtp-Source: ABdhPJyS6ybTwnv6erPWVGQEcGqpHw2c3tbHJQXncsLgladh+uya416i8nNhVQ28u8YnexKYTR7sCg==
X-Received: by 2002:a5d:5006:: with SMTP id e6mr9565047wrt.170.1590314679233;
        Sun, 24 May 2020 03:04:39 -0700 (PDT)
Return-Path: <gzatko@gmail.com>
Received: from blizzard-1040g6.lan (93.184.67.240.host.vnet.sk. [93.184.67.240])
        by smtp.gmail.com with ESMTPSA id l12sm15965723wrh.20.2020.05.24.03.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 03:04:38 -0700 (PDT)
From: "Gregor Zatko" <gzatko@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jan-Simon Moeller <dl9pf@gmx.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] file: add bzip2-replacement-native to DEPENDS to fix sstate issue
Date: Sun, 24 May 2020 12:04:33 +0200
Message-Id: <20200524100433.3919445-1-gzatko@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jan-Simon Moeller <dl9pf@gmx.de>

file-native when built on a Debian 10 host will embed a dependency to
'libbz2.so.1.0' (instead of 'libbz2.so.1'). This can cause issues
when sharing the sstate between hosts e.g.:

 recipe-sysroot-native/usr/lib/rpm/rpmdeps:
      error while loading shared libraries: libbz2.so.1.0: \
        cannot open shared object file: No such file or directory

To avoid this situation, let's add the bzip2-replacement-native to the
file recipe's DEPENDS_class-native .

Details in https://bugzilla.yoctoproject.org/show_bug.cgi?id=13915 .

(From OE-Core rev: 4a996574464028bd5d57b90920d0887d1a81e9e9)

Signed-off-by: Jan-Simon Moeller <dl9pf@gmx.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 292c5591dd..e021b9d240 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -784,6 +784,12 @@ def check_sanity_everybuild(status, d):
     if "." in paths or "./" in paths or "" in paths:
         status.addresult("PATH contains '.', './' or '' (empty element), which will break the build, please remove this.\nParsed PATH is " + str(paths) + "\n")
 
+    # Check whether 'inherit' directive is found (used for a class to inherit)
+    # in conf file it's supposed to be uppercase INHERIT
+    inherit = d.getVar('inherit')
+    if inherit:
+        status.addresult("Please don't use inherit directive in your local.conf. The directive is supposed to be used in classes and recipes only to inherit of bbclasses. Here INHERIT should be used.\n")
+
     # Check that the DISTRO is valid, if set
     # need to take into account DISTRO renaming DISTRO
     distro = d.getVar('DISTRO')
-- 
2.26.2

