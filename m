Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.5802.1588858021509046228
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 06:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d/D3wsXR;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id h4so6526134wmb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2020 06:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=bE+lRKP+tov7xsmK6WEJq8EtrKwVqARKOy4bzAKqYoY=;
        b=d/D3wsXRVSjvrg6oI12EUpQPB58k2nEVo4pvdGLiJp53I3b5EcLyHdvoMd/NuHQ8cy
         ANZljBkdUDYHMGIepQ12eHHsgkYGcI4rt/laKtpilYEGOVxorZ3B/Rw6HWe9NmqSxDO1
         9UPeXorbuLuqliADtLzfbNj6U3Z0tvQ8eJM3HCfnyqB64T8XlIzwFdrAdp02PiZRPvYI
         Doty16x3Pk1dAm0W52Q4f6gX1TEa1lDCTIozTFTmQn9dP5xHue19oaJMRsiPB3RdPt3e
         iLVuVuNwXHdUb8P2Az+BntK5wED3YHEYoHQIDaU+jD2fQH2I5wXZbEWYbGckT14BaMAW
         42pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bE+lRKP+tov7xsmK6WEJq8EtrKwVqARKOy4bzAKqYoY=;
        b=AN6XuEbk3S6XZUxyV6d8cYgJPyrZmNOZXUOqxc83Pl7i3K/RAQ59T32ALKEnqTkIjW
         Le6TuIZdlFDBU++CjoEuLStc4D11DZ7OQHFLUgHGfhiZLTrPVPk5MdUGR7bz5l8qmacJ
         R4w1m+9WsPMM8c9v7gOKRdBp/GPYhoniQqw2UDtZPXY5/qeyPJmEV8HVnfk7eLjFgiuB
         Nc5MurSvHHQSTBMF1mS9QTkoL+XTuH/2yTWRSd2z2kFIjH9HO1WjLEEyYzfo5hSnXvhO
         9zOV3RoUeyyJQ81EYDWYkEoOrDKQC7MDVVlhZBnDYzu6UX43/XXElJAL7C50xq4i45ph
         MF3g==
X-Gm-Message-State: AGi0PubdiXRC3N4WuuaraU0F0KdJnwILcr5vnwQedWXBLpbdo1Cn1HGa
	S569ImwyJawHXERkWRkzeJG6M6GM8Ak=
X-Google-Smtp-Source: APiQypKTwkczblGenZKqJwXhJ9ouOaNcBGRarePI5+S2YF/wZVPjlhTLY+2cU6VVDa6xYJI9wO/HMw==
X-Received: by 2002:a1c:9d84:: with SMTP id g126mr9725934wme.184.1588858019506;
        Thu, 07 May 2020 06:26:59 -0700 (PDT)
Return-Path: <jan.vermaete@gmail.com>
Received: from vm-vermaete-ubuntu18.WTSOUT.OIP.LOCAL (mail.oip.be. [81.246.50.154])
        by smtp.gmail.com with ESMTPSA id b66sm8285955wmh.12.2020.05.07.06.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 06:26:59 -0700 (PDT)
From: "jan" <jan.vermaete@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [scripts][PATCH v2] In the past the file was named 'built-in.o'. Nowadays it is 'built-in.a'.
Date: Thu,  7 May 2020 15:25:36 +0200
Message-Id: <20200507132536.25613-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.17.1

The script is modified to work with both.  I expect
it will not happen that there are built-in.a and built-in.o
files in the same kernel.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 scripts/tiny/ksize.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/tiny/ksize.py b/scripts/tiny/ksize.py
index 8316b85cb1..db2b9ec39f 100755
--- a/scripts/tiny/ksize.py
+++ b/scripts/tiny/ksize.py
@@ -4,7 +4,7 @@
 #
 # SPDX-License-Identifier: GPL-2.0-or-later
 #
-# Display details of the kernel build size, broken up by built-in.o. Sort
+# Display details of the kernel build size, broken up by built-in.[o,a]. Sort
 # the objects by size. Run from the top level kernel build directory.
 #
 # Author: Darren Hart <dvhart@linux.intel.com>
@@ -59,7 +59,7 @@ class Report:
             p = Popen("ls " + subglob, shell=True, stdout=PIPE, stderr=PIPE, universal_newlines=True)
             for f in p.communicate()[0].splitlines():
                 path = os.path.dirname(f)
-                r.parts.append(Report.create(f, path, str(path) + "/*/built-in.o"))
+                r.parts.append(Report.create(f, path, str(path) + "/*/built-in.[o,a]"))
             r.parts.sort(reverse=True)
 
         for b in r.parts:
@@ -139,7 +139,7 @@ def main():
         else:
             assert False, "unhandled option"
 
-    glob = "arch/*/built-in.o */built-in.o"
+    glob = "arch/*/built-in.[o,a] */built-in.[o,a]"
     vmlinux = Report.create("vmlinux",  "Linux Kernel", glob)
 
     vmlinux.show()
-- 
2.17.1

