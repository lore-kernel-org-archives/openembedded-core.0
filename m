Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABA1C5DF7D
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 22:17:31 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20508.1787091446547152266
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 15:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MoHqFpnd;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6acc15016f1so297046eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 15:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787091446; x=1787696246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6raJIPmTG7VtAMhwKES+Kg/EVkmCJyE0MVpZfRAWt4U=;
        b=MoHqFpnd65FC/JLfAm0nyGHGlNDrRdkUdw0g++X7cELunb8DNFA3P8rlQ+Q0i/kw1z
         h/cuUxe7J16agPzLXmhT5xW+cBze9ZZSeA9vhVPu0fdBoB2k1oDJv2c1ZnfQtVRDDWgx
         TE1ecaTH4WW0dE+6b6ikuT6rYkvgpurVTXyNPE/pyDta87Sc7nCTFsSsrhv2ZuWTOgVW
         D7J2M7fqdVIHSCTvs86r41z5MrqY57CAh3EnjDyQOYMvq7qTcKKqzyDXE1/T/DInPNj5
         2yhmBTIEHvlHxG0Qcd+K0Kw4FLysvTadBoJGE1ht4n/KSRgfSmfCtp1k6AKAP3bU2tFr
         wLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787091446; x=1787696246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6raJIPmTG7VtAMhwKES+Kg/EVkmCJyE0MVpZfRAWt4U=;
        b=n+1rPHmpittpcDe+pHErHHEHNsma1Wzll+5XmcXGgT37tIfZkB/y9YeRfSdhbEX7cQ
         ktR9p+j61+xEpKRDL6jrd+YK2aLGbThS5xspxfTlWtDMz8StK5rjqoEAzWdpgfludBcC
         qtngTQ7TE1PXmsa7RYiri8fvX87K+PWP7yVlyQqFF3KA2kV6/G9YCOgLgYItL9pgmROQ
         L7jFlRk94ZGYj7FGFl9/tkeCUZMzU3VSvUgFnQEC4F1ZE2QCNlKgmNBNRc/TPC9KfuML
         HoJN6YQp/T4rVH9XZPUXs12O2UtX9Jzew5g1OesLNiC1O2Qaidsx6tEIzOy2HSqRSvyj
         sytw==
X-Gm-Message-State: AOJu0Yzr69rQoe7u1jBG1Vyj52t/bHND++dbpF113SD2bRsxcRHOtJf0
	nQzUex1jx2MrijCM7UuK3iunfgOrm9FZV9mW50UsJG9JWl1SMST+jNQvBZF6Ww==
X-Gm-Gg: AR+sD12gjsWwzsj4GWNV50uRCRS2t/rIB1GdDu035UVD2fBmFvNufoq5bBHS8IApurO
	VURWudZGhSEIQGP1UUWARruvldwjuwemk8Ip044MGLnnxte0zO/8QBjqCg5Rm6/V6FXhbhwwW9F
	Xm/MmwpuSfHjzLg3q3Jf+0aU1Q+UDJDC95YmHfl8/RTeudXCmjNDkkUClhr92U6FdFcj/uL7KXw
	vOi9U0zoioyssWeDWURhFvyq0UyLGcOKbHsT75q5aGulg2WPLEbHt5LAHP/OVR7nerh/40O2a/7
	nLeBZizYXAwtcg0B4WYNAer9hMbGX9Mp5oRo+g9zoNu0S2TZ1fDff+aaMqnMaJC/+bLKO5/hV6B
	MoyK5x08wz9wTZr2n01/ZfUiWqBNvC22PIBcV88cUu+IJWviWpL5ZkOxbjOLHqgteF9EeWfcyDV
	sMg9dQqsj2rdCLKRVf8mr/P6PZalKxLamtekuKyfM31c19RrWeUd97eG41OQ==
X-Received: by 2002:a05:6820:80c5:b0:6b1:3417:548b with SMTP id 006d021491bc7-6b13c5e4751mr465296eaf.24.1787091445274;
        Tue, 18 Aug 2026 15:17:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b01:ba50::17e2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b13cebeb1fsm76345eaf.11.2026.08.18.15.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 15:17:24 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] licences: Move exceptions to subdirectory
Date: Tue, 18 Aug 2026 16:17:21 -0600
Message-ID: <20260818221721.3820389-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 22:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243695

Moves the SPDX license exceptions to a subdirectory to make the easier
to identify as license exceptions vs. actual licenses

This should have no effect on other layers since SPDX doesn't allow
custom Exceptions like it does for Licenses (via LicenseRef-); since we
have already enumerated all known exceptions, its unlikely any other
layer have added their own

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/files/common-licenses/{ => exceptions}/389-exception   | 0
 .../common-licenses/{ => exceptions}/Asterisk-exception     | 0
 .../{ => exceptions}/Asterisk-linking-protocols-exception   | 0
 .../common-licenses/{ => exceptions}/Autoconf-exception-2.0 | 0
 .../common-licenses/{ => exceptions}/Autoconf-exception-3.0 | 0
 .../{ => exceptions}/Autoconf-exception-generic             | 0
 .../{ => exceptions}/Autoconf-exception-generic-3.0         | 0
 .../{ => exceptions}/Autoconf-exception-macro               | 0
 .../common-licenses/{ => exceptions}/Bison-exception-1.24   | 0
 .../common-licenses/{ => exceptions}/Bison-exception-2.2    | 0
 .../common-licenses/{ => exceptions}/Bootloader-exception   | 0
 .../common-licenses/{ => exceptions}/CGAL-linking-exception | 0
 .../common-licenses/{ => exceptions}/CLISP-exception-2.0    | 0
 .../{ => exceptions}/Classpath-exception-2.0                | 0
 .../{ => exceptions}/Classpath-exception-2.0-short          | 0
 .../{ => exceptions}/DigiRule-FOSS-exception                | 0
 .../{ => exceptions}/Digia-Qt-LGPL-exception-1.1            | 0
 meta/files/common-licenses/{ => exceptions}/FLTK-exception  | 0
 .../{ => exceptions}/Fawkes-Runtime-exception               | 0
 .../common-licenses/{ => exceptions}/Font-exception-2.0     | 0
 .../common-licenses/{ => exceptions}/GCC-exception-2.0      | 0
 .../common-licenses/{ => exceptions}/GCC-exception-2.0-note | 0
 .../common-licenses/{ => exceptions}/GCC-exception-3.1      | 0
 meta/files/common-licenses/{ => exceptions}/GNAT-exception  | 0
 .../{ => exceptions}/GNOME-examples-exception               | 0
 .../common-licenses/{ => exceptions}/GNU-compiler-exception | 0
 .../{ => exceptions}/GPL-3.0-389-ds-base-exception          | 0
 .../{ => exceptions}/GPL-3.0-interface-exception            | 0
 .../{ => exceptions}/GPL-3.0-linking-exception              | 0
 .../{ => exceptions}/GPL-3.0-linking-source-exception       | 0
 meta/files/common-licenses/{ => exceptions}/GPL-CC-1.0      | 0
 .../{ => exceptions}/GStreamer-exception-2005               | 0
 .../{ => exceptions}/GStreamer-exception-2008               | 0
 meta/files/common-licenses/{ => exceptions}/Gmsh-exception  | 0
 .../{ => exceptions}/Independent-modules-exception          | 0
 .../{ => exceptions}/KiCad-libraries-exception              | 0
 .../{ => exceptions}/LGPL-3.0-linking-exception             | 0
 meta/files/common-licenses/{ => exceptions}/LLGPL           | 0
 meta/files/common-licenses/{ => exceptions}/LLVM-exception  | 0
 meta/files/common-licenses/{ => exceptions}/LZMA-exception  | 0
 .../common-licenses/{ => exceptions}/Libtool-exception      | 0
 .../common-licenses/{ => exceptions}/Linux-syscall-note     | 0
 .../common-licenses/{ => exceptions}/OCCT-exception-1.0     | 0
 .../{ => exceptions}/OCaml-LGPL-linking-exception           | 0
 .../{ => exceptions}/OpenJDK-assembly-exception-1.0         | 0
 meta/files/common-licenses/{ => exceptions}/PCRE2-exception | 0
 .../{ => exceptions}/PS-or-PDF-font-exception-20170817      | 0
 .../{ => exceptions}/QPL-1.0-INRIA-2004-exception           | 0
 .../common-licenses/{ => exceptions}/Qt-GPL-exception-1.0   | 0
 .../common-licenses/{ => exceptions}/Qt-LGPL-exception-1.1  | 0
 .../common-licenses/{ => exceptions}/Qwt-exception-1.0      | 0
 .../{ => exceptions}/RRDtool-FLOSS-exception-2.0            | 0
 meta/files/common-licenses/{ => exceptions}/SANE-exception  | 0
 meta/files/common-licenses/{ => exceptions}/SHL-2.0         | 0
 meta/files/common-licenses/{ => exceptions}/SHL-2.1         | 0
 meta/files/common-licenses/{ => exceptions}/SWI-exception   | 0
 .../{ => exceptions}/Simple-Library-Usage-exception         | 0
 meta/files/common-licenses/{ => exceptions}/Swift-exception | 0
 .../common-licenses/{ => exceptions}/Texinfo-exception      | 0
 meta/files/common-licenses/{ => exceptions}/UBDL-exception  | 0
 .../{ => exceptions}/Universal-FOSS-exception-1.0           | 0
 .../{ => exceptions}/WxWindows-exception-3.1                | 0
 .../{ => exceptions}/cryptsetup-OpenSSL-exception           | 0
 .../common-licenses/{ => exceptions}/eCos-exception-2.0     | 0
 .../{ => exceptions}/erlang-otp-linking-exception           | 0
 meta/files/common-licenses/{ => exceptions}/fmt-exception   | 0
 .../common-licenses/{ => exceptions}/freertos-exception-2.0 | 0
 .../common-licenses/{ => exceptions}/gnu-javamail-exception | 0
 .../common-licenses/{ => exceptions}/harbour-exception      | 0
 .../common-licenses/{ => exceptions}/i2p-gpl-java-exception | 0
 .../{ => exceptions}/kvirc-openssl-exception                | 0
 .../{ => exceptions}/libpri-OpenH323-exception              | 0
 meta/files/common-licenses/{ => exceptions}/mif-exception   | 0
 meta/files/common-licenses/{ => exceptions}/mxml-exception  | 0
 .../{ => exceptions}/openvpn-openssl-exception              | 0
 .../common-licenses/{ => exceptions}/polyparse-exception    | 0
 meta/files/common-licenses/{ => exceptions}/romic-exception | 0
 .../{ => exceptions}/rsync-linking-exception                | 0
 .../{ => exceptions}/sqlitestudio-OpenSSL-exception         | 0
 .../common-licenses/{ => exceptions}/stunnel-exception      | 0
 .../common-licenses/{ => exceptions}/u-boot-exception-2.0   | 0
 .../{ => exceptions}/vsftpd-openssl-exception               | 0
 .../{ => exceptions}/x11vnc-openssl-exception               | 0
 meta/lib/oe/license.py                                      | 6 ++++++
 scripts/pull-spdx-licenses.py                               | 2 +-
 85 files changed, 7 insertions(+), 1 deletion(-)
 rename meta/files/common-licenses/{ => exceptions}/389-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/Asterisk-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/Asterisk-linking-protocols-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/Autoconf-exception-2.0 (100%)
 rename meta/files/common-licenses/{ => exceptions}/Autoconf-exception-3.0 (100%)
 rename meta/files/common-licenses/{ => exceptions}/Autoconf-exception-generic (100%)
 rename meta/files/common-licenses/{ => exceptions}/Autoconf-exception-generic-3.0 (100%)
 rename meta/files/common-licenses/{ => exceptions}/Autoconf-exception-macro (100%)
 rename meta/files/common-licenses/{ => exceptions}/Bison-exception-1.24 (100%)
 rename meta/files/common-licenses/{ => exceptions}/Bison-exception-2.2 (100%)
 rename meta/files/common-licenses/{ => exceptions}/Bootloader-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/CGAL-linking-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/CLISP-exception-2.0 (100%)
 rename meta/files/common-licenses/{ => exceptions}/Classpath-exception-2.0 (100%)
 rename meta/files/common-licenses/{ => exceptions}/Classpath-exception-2.0-short (100%)
 rename meta/files/common-licenses/{ => exceptions}/DigiRule-FOSS-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/Digia-Qt-LGPL-exception-1.1 (100%)
 rename meta/files/common-licenses/{ => exceptions}/FLTK-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/Fawkes-Runtime-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/Font-exception-2.0 (100%)
 rename meta/files/common-licenses/{ => exceptions}/GCC-exception-2.0 (100%)
 rename meta/files/common-licenses/{ => exceptions}/GCC-exception-2.0-note (100%)
 rename meta/files/common-licenses/{ => exceptions}/GCC-exception-3.1 (100%)
 rename meta/files/common-licenses/{ => exceptions}/GNAT-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/GNOME-examples-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/GNU-compiler-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/GPL-3.0-389-ds-base-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/GPL-3.0-interface-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/GPL-3.0-linking-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/GPL-3.0-linking-source-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/GPL-CC-1.0 (100%)
 rename meta/files/common-licenses/{ => exceptions}/GStreamer-exception-2005 (100%)
 rename meta/files/common-licenses/{ => exceptions}/GStreamer-exception-2008 (100%)
 rename meta/files/common-licenses/{ => exceptions}/Gmsh-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/Independent-modules-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/KiCad-libraries-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/LGPL-3.0-linking-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/LLGPL (100%)
 rename meta/files/common-licenses/{ => exceptions}/LLVM-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/LZMA-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/Libtool-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/Linux-syscall-note (100%)
 rename meta/files/common-licenses/{ => exceptions}/OCCT-exception-1.0 (100%)
 rename meta/files/common-licenses/{ => exceptions}/OCaml-LGPL-linking-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/OpenJDK-assembly-exception-1.0 (100%)
 rename meta/files/common-licenses/{ => exceptions}/PCRE2-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/PS-or-PDF-font-exception-20170817 (100%)
 rename meta/files/common-licenses/{ => exceptions}/QPL-1.0-INRIA-2004-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/Qt-GPL-exception-1.0 (100%)
 rename meta/files/common-licenses/{ => exceptions}/Qt-LGPL-exception-1.1 (100%)
 rename meta/files/common-licenses/{ => exceptions}/Qwt-exception-1.0 (100%)
 rename meta/files/common-licenses/{ => exceptions}/RRDtool-FLOSS-exception-2.0 (100%)
 rename meta/files/common-licenses/{ => exceptions}/SANE-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/SHL-2.0 (100%)
 rename meta/files/common-licenses/{ => exceptions}/SHL-2.1 (100%)
 rename meta/files/common-licenses/{ => exceptions}/SWI-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/Simple-Library-Usage-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/Swift-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/Texinfo-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/UBDL-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/Universal-FOSS-exception-1.0 (100%)
 rename meta/files/common-licenses/{ => exceptions}/WxWindows-exception-3.1 (100%)
 rename meta/files/common-licenses/{ => exceptions}/cryptsetup-OpenSSL-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/eCos-exception-2.0 (100%)
 rename meta/files/common-licenses/{ => exceptions}/erlang-otp-linking-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/fmt-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/freertos-exception-2.0 (100%)
 rename meta/files/common-licenses/{ => exceptions}/gnu-javamail-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/harbour-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/i2p-gpl-java-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/kvirc-openssl-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/libpri-OpenH323-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/mif-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/mxml-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/openvpn-openssl-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/polyparse-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/romic-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/rsync-linking-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/sqlitestudio-OpenSSL-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/stunnel-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/u-boot-exception-2.0 (100%)
 rename meta/files/common-licenses/{ => exceptions}/vsftpd-openssl-exception (100%)
 rename meta/files/common-licenses/{ => exceptions}/x11vnc-openssl-exception (100%)

diff --git a/meta/files/common-licenses/389-exception b/meta/files/common-licenses/exceptions/389-exception
similarity index 100%
rename from meta/files/common-licenses/389-exception
rename to meta/files/common-licenses/exceptions/389-exception
diff --git a/meta/files/common-licenses/Asterisk-exception b/meta/files/common-licenses/exceptions/Asterisk-exception
similarity index 100%
rename from meta/files/common-licenses/Asterisk-exception
rename to meta/files/common-licenses/exceptions/Asterisk-exception
diff --git a/meta/files/common-licenses/Asterisk-linking-protocols-exception b/meta/files/common-licenses/exceptions/Asterisk-linking-protocols-exception
similarity index 100%
rename from meta/files/common-licenses/Asterisk-linking-protocols-exception
rename to meta/files/common-licenses/exceptions/Asterisk-linking-protocols-exception
diff --git a/meta/files/common-licenses/Autoconf-exception-2.0 b/meta/files/common-licenses/exceptions/Autoconf-exception-2.0
similarity index 100%
rename from meta/files/common-licenses/Autoconf-exception-2.0
rename to meta/files/common-licenses/exceptions/Autoconf-exception-2.0
diff --git a/meta/files/common-licenses/Autoconf-exception-3.0 b/meta/files/common-licenses/exceptions/Autoconf-exception-3.0
similarity index 100%
rename from meta/files/common-licenses/Autoconf-exception-3.0
rename to meta/files/common-licenses/exceptions/Autoconf-exception-3.0
diff --git a/meta/files/common-licenses/Autoconf-exception-generic b/meta/files/common-licenses/exceptions/Autoconf-exception-generic
similarity index 100%
rename from meta/files/common-licenses/Autoconf-exception-generic
rename to meta/files/common-licenses/exceptions/Autoconf-exception-generic
diff --git a/meta/files/common-licenses/Autoconf-exception-generic-3.0 b/meta/files/common-licenses/exceptions/Autoconf-exception-generic-3.0
similarity index 100%
rename from meta/files/common-licenses/Autoconf-exception-generic-3.0
rename to meta/files/common-licenses/exceptions/Autoconf-exception-generic-3.0
diff --git a/meta/files/common-licenses/Autoconf-exception-macro b/meta/files/common-licenses/exceptions/Autoconf-exception-macro
similarity index 100%
rename from meta/files/common-licenses/Autoconf-exception-macro
rename to meta/files/common-licenses/exceptions/Autoconf-exception-macro
diff --git a/meta/files/common-licenses/Bison-exception-1.24 b/meta/files/common-licenses/exceptions/Bison-exception-1.24
similarity index 100%
rename from meta/files/common-licenses/Bison-exception-1.24
rename to meta/files/common-licenses/exceptions/Bison-exception-1.24
diff --git a/meta/files/common-licenses/Bison-exception-2.2 b/meta/files/common-licenses/exceptions/Bison-exception-2.2
similarity index 100%
rename from meta/files/common-licenses/Bison-exception-2.2
rename to meta/files/common-licenses/exceptions/Bison-exception-2.2
diff --git a/meta/files/common-licenses/Bootloader-exception b/meta/files/common-licenses/exceptions/Bootloader-exception
similarity index 100%
rename from meta/files/common-licenses/Bootloader-exception
rename to meta/files/common-licenses/exceptions/Bootloader-exception
diff --git a/meta/files/common-licenses/CGAL-linking-exception b/meta/files/common-licenses/exceptions/CGAL-linking-exception
similarity index 100%
rename from meta/files/common-licenses/CGAL-linking-exception
rename to meta/files/common-licenses/exceptions/CGAL-linking-exception
diff --git a/meta/files/common-licenses/CLISP-exception-2.0 b/meta/files/common-licenses/exceptions/CLISP-exception-2.0
similarity index 100%
rename from meta/files/common-licenses/CLISP-exception-2.0
rename to meta/files/common-licenses/exceptions/CLISP-exception-2.0
diff --git a/meta/files/common-licenses/Classpath-exception-2.0 b/meta/files/common-licenses/exceptions/Classpath-exception-2.0
similarity index 100%
rename from meta/files/common-licenses/Classpath-exception-2.0
rename to meta/files/common-licenses/exceptions/Classpath-exception-2.0
diff --git a/meta/files/common-licenses/Classpath-exception-2.0-short b/meta/files/common-licenses/exceptions/Classpath-exception-2.0-short
similarity index 100%
rename from meta/files/common-licenses/Classpath-exception-2.0-short
rename to meta/files/common-licenses/exceptions/Classpath-exception-2.0-short
diff --git a/meta/files/common-licenses/DigiRule-FOSS-exception b/meta/files/common-licenses/exceptions/DigiRule-FOSS-exception
similarity index 100%
rename from meta/files/common-licenses/DigiRule-FOSS-exception
rename to meta/files/common-licenses/exceptions/DigiRule-FOSS-exception
diff --git a/meta/files/common-licenses/Digia-Qt-LGPL-exception-1.1 b/meta/files/common-licenses/exceptions/Digia-Qt-LGPL-exception-1.1
similarity index 100%
rename from meta/files/common-licenses/Digia-Qt-LGPL-exception-1.1
rename to meta/files/common-licenses/exceptions/Digia-Qt-LGPL-exception-1.1
diff --git a/meta/files/common-licenses/FLTK-exception b/meta/files/common-licenses/exceptions/FLTK-exception
similarity index 100%
rename from meta/files/common-licenses/FLTK-exception
rename to meta/files/common-licenses/exceptions/FLTK-exception
diff --git a/meta/files/common-licenses/Fawkes-Runtime-exception b/meta/files/common-licenses/exceptions/Fawkes-Runtime-exception
similarity index 100%
rename from meta/files/common-licenses/Fawkes-Runtime-exception
rename to meta/files/common-licenses/exceptions/Fawkes-Runtime-exception
diff --git a/meta/files/common-licenses/Font-exception-2.0 b/meta/files/common-licenses/exceptions/Font-exception-2.0
similarity index 100%
rename from meta/files/common-licenses/Font-exception-2.0
rename to meta/files/common-licenses/exceptions/Font-exception-2.0
diff --git a/meta/files/common-licenses/GCC-exception-2.0 b/meta/files/common-licenses/exceptions/GCC-exception-2.0
similarity index 100%
rename from meta/files/common-licenses/GCC-exception-2.0
rename to meta/files/common-licenses/exceptions/GCC-exception-2.0
diff --git a/meta/files/common-licenses/GCC-exception-2.0-note b/meta/files/common-licenses/exceptions/GCC-exception-2.0-note
similarity index 100%
rename from meta/files/common-licenses/GCC-exception-2.0-note
rename to meta/files/common-licenses/exceptions/GCC-exception-2.0-note
diff --git a/meta/files/common-licenses/GCC-exception-3.1 b/meta/files/common-licenses/exceptions/GCC-exception-3.1
similarity index 100%
rename from meta/files/common-licenses/GCC-exception-3.1
rename to meta/files/common-licenses/exceptions/GCC-exception-3.1
diff --git a/meta/files/common-licenses/GNAT-exception b/meta/files/common-licenses/exceptions/GNAT-exception
similarity index 100%
rename from meta/files/common-licenses/GNAT-exception
rename to meta/files/common-licenses/exceptions/GNAT-exception
diff --git a/meta/files/common-licenses/GNOME-examples-exception b/meta/files/common-licenses/exceptions/GNOME-examples-exception
similarity index 100%
rename from meta/files/common-licenses/GNOME-examples-exception
rename to meta/files/common-licenses/exceptions/GNOME-examples-exception
diff --git a/meta/files/common-licenses/GNU-compiler-exception b/meta/files/common-licenses/exceptions/GNU-compiler-exception
similarity index 100%
rename from meta/files/common-licenses/GNU-compiler-exception
rename to meta/files/common-licenses/exceptions/GNU-compiler-exception
diff --git a/meta/files/common-licenses/GPL-3.0-389-ds-base-exception b/meta/files/common-licenses/exceptions/GPL-3.0-389-ds-base-exception
similarity index 100%
rename from meta/files/common-licenses/GPL-3.0-389-ds-base-exception
rename to meta/files/common-licenses/exceptions/GPL-3.0-389-ds-base-exception
diff --git a/meta/files/common-licenses/GPL-3.0-interface-exception b/meta/files/common-licenses/exceptions/GPL-3.0-interface-exception
similarity index 100%
rename from meta/files/common-licenses/GPL-3.0-interface-exception
rename to meta/files/common-licenses/exceptions/GPL-3.0-interface-exception
diff --git a/meta/files/common-licenses/GPL-3.0-linking-exception b/meta/files/common-licenses/exceptions/GPL-3.0-linking-exception
similarity index 100%
rename from meta/files/common-licenses/GPL-3.0-linking-exception
rename to meta/files/common-licenses/exceptions/GPL-3.0-linking-exception
diff --git a/meta/files/common-licenses/GPL-3.0-linking-source-exception b/meta/files/common-licenses/exceptions/GPL-3.0-linking-source-exception
similarity index 100%
rename from meta/files/common-licenses/GPL-3.0-linking-source-exception
rename to meta/files/common-licenses/exceptions/GPL-3.0-linking-source-exception
diff --git a/meta/files/common-licenses/GPL-CC-1.0 b/meta/files/common-licenses/exceptions/GPL-CC-1.0
similarity index 100%
rename from meta/files/common-licenses/GPL-CC-1.0
rename to meta/files/common-licenses/exceptions/GPL-CC-1.0
diff --git a/meta/files/common-licenses/GStreamer-exception-2005 b/meta/files/common-licenses/exceptions/GStreamer-exception-2005
similarity index 100%
rename from meta/files/common-licenses/GStreamer-exception-2005
rename to meta/files/common-licenses/exceptions/GStreamer-exception-2005
diff --git a/meta/files/common-licenses/GStreamer-exception-2008 b/meta/files/common-licenses/exceptions/GStreamer-exception-2008
similarity index 100%
rename from meta/files/common-licenses/GStreamer-exception-2008
rename to meta/files/common-licenses/exceptions/GStreamer-exception-2008
diff --git a/meta/files/common-licenses/Gmsh-exception b/meta/files/common-licenses/exceptions/Gmsh-exception
similarity index 100%
rename from meta/files/common-licenses/Gmsh-exception
rename to meta/files/common-licenses/exceptions/Gmsh-exception
diff --git a/meta/files/common-licenses/Independent-modules-exception b/meta/files/common-licenses/exceptions/Independent-modules-exception
similarity index 100%
rename from meta/files/common-licenses/Independent-modules-exception
rename to meta/files/common-licenses/exceptions/Independent-modules-exception
diff --git a/meta/files/common-licenses/KiCad-libraries-exception b/meta/files/common-licenses/exceptions/KiCad-libraries-exception
similarity index 100%
rename from meta/files/common-licenses/KiCad-libraries-exception
rename to meta/files/common-licenses/exceptions/KiCad-libraries-exception
diff --git a/meta/files/common-licenses/LGPL-3.0-linking-exception b/meta/files/common-licenses/exceptions/LGPL-3.0-linking-exception
similarity index 100%
rename from meta/files/common-licenses/LGPL-3.0-linking-exception
rename to meta/files/common-licenses/exceptions/LGPL-3.0-linking-exception
diff --git a/meta/files/common-licenses/LLGPL b/meta/files/common-licenses/exceptions/LLGPL
similarity index 100%
rename from meta/files/common-licenses/LLGPL
rename to meta/files/common-licenses/exceptions/LLGPL
diff --git a/meta/files/common-licenses/LLVM-exception b/meta/files/common-licenses/exceptions/LLVM-exception
similarity index 100%
rename from meta/files/common-licenses/LLVM-exception
rename to meta/files/common-licenses/exceptions/LLVM-exception
diff --git a/meta/files/common-licenses/LZMA-exception b/meta/files/common-licenses/exceptions/LZMA-exception
similarity index 100%
rename from meta/files/common-licenses/LZMA-exception
rename to meta/files/common-licenses/exceptions/LZMA-exception
diff --git a/meta/files/common-licenses/Libtool-exception b/meta/files/common-licenses/exceptions/Libtool-exception
similarity index 100%
rename from meta/files/common-licenses/Libtool-exception
rename to meta/files/common-licenses/exceptions/Libtool-exception
diff --git a/meta/files/common-licenses/Linux-syscall-note b/meta/files/common-licenses/exceptions/Linux-syscall-note
similarity index 100%
rename from meta/files/common-licenses/Linux-syscall-note
rename to meta/files/common-licenses/exceptions/Linux-syscall-note
diff --git a/meta/files/common-licenses/OCCT-exception-1.0 b/meta/files/common-licenses/exceptions/OCCT-exception-1.0
similarity index 100%
rename from meta/files/common-licenses/OCCT-exception-1.0
rename to meta/files/common-licenses/exceptions/OCCT-exception-1.0
diff --git a/meta/files/common-licenses/OCaml-LGPL-linking-exception b/meta/files/common-licenses/exceptions/OCaml-LGPL-linking-exception
similarity index 100%
rename from meta/files/common-licenses/OCaml-LGPL-linking-exception
rename to meta/files/common-licenses/exceptions/OCaml-LGPL-linking-exception
diff --git a/meta/files/common-licenses/OpenJDK-assembly-exception-1.0 b/meta/files/common-licenses/exceptions/OpenJDK-assembly-exception-1.0
similarity index 100%
rename from meta/files/common-licenses/OpenJDK-assembly-exception-1.0
rename to meta/files/common-licenses/exceptions/OpenJDK-assembly-exception-1.0
diff --git a/meta/files/common-licenses/PCRE2-exception b/meta/files/common-licenses/exceptions/PCRE2-exception
similarity index 100%
rename from meta/files/common-licenses/PCRE2-exception
rename to meta/files/common-licenses/exceptions/PCRE2-exception
diff --git a/meta/files/common-licenses/PS-or-PDF-font-exception-20170817 b/meta/files/common-licenses/exceptions/PS-or-PDF-font-exception-20170817
similarity index 100%
rename from meta/files/common-licenses/PS-or-PDF-font-exception-20170817
rename to meta/files/common-licenses/exceptions/PS-or-PDF-font-exception-20170817
diff --git a/meta/files/common-licenses/QPL-1.0-INRIA-2004-exception b/meta/files/common-licenses/exceptions/QPL-1.0-INRIA-2004-exception
similarity index 100%
rename from meta/files/common-licenses/QPL-1.0-INRIA-2004-exception
rename to meta/files/common-licenses/exceptions/QPL-1.0-INRIA-2004-exception
diff --git a/meta/files/common-licenses/Qt-GPL-exception-1.0 b/meta/files/common-licenses/exceptions/Qt-GPL-exception-1.0
similarity index 100%
rename from meta/files/common-licenses/Qt-GPL-exception-1.0
rename to meta/files/common-licenses/exceptions/Qt-GPL-exception-1.0
diff --git a/meta/files/common-licenses/Qt-LGPL-exception-1.1 b/meta/files/common-licenses/exceptions/Qt-LGPL-exception-1.1
similarity index 100%
rename from meta/files/common-licenses/Qt-LGPL-exception-1.1
rename to meta/files/common-licenses/exceptions/Qt-LGPL-exception-1.1
diff --git a/meta/files/common-licenses/Qwt-exception-1.0 b/meta/files/common-licenses/exceptions/Qwt-exception-1.0
similarity index 100%
rename from meta/files/common-licenses/Qwt-exception-1.0
rename to meta/files/common-licenses/exceptions/Qwt-exception-1.0
diff --git a/meta/files/common-licenses/RRDtool-FLOSS-exception-2.0 b/meta/files/common-licenses/exceptions/RRDtool-FLOSS-exception-2.0
similarity index 100%
rename from meta/files/common-licenses/RRDtool-FLOSS-exception-2.0
rename to meta/files/common-licenses/exceptions/RRDtool-FLOSS-exception-2.0
diff --git a/meta/files/common-licenses/SANE-exception b/meta/files/common-licenses/exceptions/SANE-exception
similarity index 100%
rename from meta/files/common-licenses/SANE-exception
rename to meta/files/common-licenses/exceptions/SANE-exception
diff --git a/meta/files/common-licenses/SHL-2.0 b/meta/files/common-licenses/exceptions/SHL-2.0
similarity index 100%
rename from meta/files/common-licenses/SHL-2.0
rename to meta/files/common-licenses/exceptions/SHL-2.0
diff --git a/meta/files/common-licenses/SHL-2.1 b/meta/files/common-licenses/exceptions/SHL-2.1
similarity index 100%
rename from meta/files/common-licenses/SHL-2.1
rename to meta/files/common-licenses/exceptions/SHL-2.1
diff --git a/meta/files/common-licenses/SWI-exception b/meta/files/common-licenses/exceptions/SWI-exception
similarity index 100%
rename from meta/files/common-licenses/SWI-exception
rename to meta/files/common-licenses/exceptions/SWI-exception
diff --git a/meta/files/common-licenses/Simple-Library-Usage-exception b/meta/files/common-licenses/exceptions/Simple-Library-Usage-exception
similarity index 100%
rename from meta/files/common-licenses/Simple-Library-Usage-exception
rename to meta/files/common-licenses/exceptions/Simple-Library-Usage-exception
diff --git a/meta/files/common-licenses/Swift-exception b/meta/files/common-licenses/exceptions/Swift-exception
similarity index 100%
rename from meta/files/common-licenses/Swift-exception
rename to meta/files/common-licenses/exceptions/Swift-exception
diff --git a/meta/files/common-licenses/Texinfo-exception b/meta/files/common-licenses/exceptions/Texinfo-exception
similarity index 100%
rename from meta/files/common-licenses/Texinfo-exception
rename to meta/files/common-licenses/exceptions/Texinfo-exception
diff --git a/meta/files/common-licenses/UBDL-exception b/meta/files/common-licenses/exceptions/UBDL-exception
similarity index 100%
rename from meta/files/common-licenses/UBDL-exception
rename to meta/files/common-licenses/exceptions/UBDL-exception
diff --git a/meta/files/common-licenses/Universal-FOSS-exception-1.0 b/meta/files/common-licenses/exceptions/Universal-FOSS-exception-1.0
similarity index 100%
rename from meta/files/common-licenses/Universal-FOSS-exception-1.0
rename to meta/files/common-licenses/exceptions/Universal-FOSS-exception-1.0
diff --git a/meta/files/common-licenses/WxWindows-exception-3.1 b/meta/files/common-licenses/exceptions/WxWindows-exception-3.1
similarity index 100%
rename from meta/files/common-licenses/WxWindows-exception-3.1
rename to meta/files/common-licenses/exceptions/WxWindows-exception-3.1
diff --git a/meta/files/common-licenses/cryptsetup-OpenSSL-exception b/meta/files/common-licenses/exceptions/cryptsetup-OpenSSL-exception
similarity index 100%
rename from meta/files/common-licenses/cryptsetup-OpenSSL-exception
rename to meta/files/common-licenses/exceptions/cryptsetup-OpenSSL-exception
diff --git a/meta/files/common-licenses/eCos-exception-2.0 b/meta/files/common-licenses/exceptions/eCos-exception-2.0
similarity index 100%
rename from meta/files/common-licenses/eCos-exception-2.0
rename to meta/files/common-licenses/exceptions/eCos-exception-2.0
diff --git a/meta/files/common-licenses/erlang-otp-linking-exception b/meta/files/common-licenses/exceptions/erlang-otp-linking-exception
similarity index 100%
rename from meta/files/common-licenses/erlang-otp-linking-exception
rename to meta/files/common-licenses/exceptions/erlang-otp-linking-exception
diff --git a/meta/files/common-licenses/fmt-exception b/meta/files/common-licenses/exceptions/fmt-exception
similarity index 100%
rename from meta/files/common-licenses/fmt-exception
rename to meta/files/common-licenses/exceptions/fmt-exception
diff --git a/meta/files/common-licenses/freertos-exception-2.0 b/meta/files/common-licenses/exceptions/freertos-exception-2.0
similarity index 100%
rename from meta/files/common-licenses/freertos-exception-2.0
rename to meta/files/common-licenses/exceptions/freertos-exception-2.0
diff --git a/meta/files/common-licenses/gnu-javamail-exception b/meta/files/common-licenses/exceptions/gnu-javamail-exception
similarity index 100%
rename from meta/files/common-licenses/gnu-javamail-exception
rename to meta/files/common-licenses/exceptions/gnu-javamail-exception
diff --git a/meta/files/common-licenses/harbour-exception b/meta/files/common-licenses/exceptions/harbour-exception
similarity index 100%
rename from meta/files/common-licenses/harbour-exception
rename to meta/files/common-licenses/exceptions/harbour-exception
diff --git a/meta/files/common-licenses/i2p-gpl-java-exception b/meta/files/common-licenses/exceptions/i2p-gpl-java-exception
similarity index 100%
rename from meta/files/common-licenses/i2p-gpl-java-exception
rename to meta/files/common-licenses/exceptions/i2p-gpl-java-exception
diff --git a/meta/files/common-licenses/kvirc-openssl-exception b/meta/files/common-licenses/exceptions/kvirc-openssl-exception
similarity index 100%
rename from meta/files/common-licenses/kvirc-openssl-exception
rename to meta/files/common-licenses/exceptions/kvirc-openssl-exception
diff --git a/meta/files/common-licenses/libpri-OpenH323-exception b/meta/files/common-licenses/exceptions/libpri-OpenH323-exception
similarity index 100%
rename from meta/files/common-licenses/libpri-OpenH323-exception
rename to meta/files/common-licenses/exceptions/libpri-OpenH323-exception
diff --git a/meta/files/common-licenses/mif-exception b/meta/files/common-licenses/exceptions/mif-exception
similarity index 100%
rename from meta/files/common-licenses/mif-exception
rename to meta/files/common-licenses/exceptions/mif-exception
diff --git a/meta/files/common-licenses/mxml-exception b/meta/files/common-licenses/exceptions/mxml-exception
similarity index 100%
rename from meta/files/common-licenses/mxml-exception
rename to meta/files/common-licenses/exceptions/mxml-exception
diff --git a/meta/files/common-licenses/openvpn-openssl-exception b/meta/files/common-licenses/exceptions/openvpn-openssl-exception
similarity index 100%
rename from meta/files/common-licenses/openvpn-openssl-exception
rename to meta/files/common-licenses/exceptions/openvpn-openssl-exception
diff --git a/meta/files/common-licenses/polyparse-exception b/meta/files/common-licenses/exceptions/polyparse-exception
similarity index 100%
rename from meta/files/common-licenses/polyparse-exception
rename to meta/files/common-licenses/exceptions/polyparse-exception
diff --git a/meta/files/common-licenses/romic-exception b/meta/files/common-licenses/exceptions/romic-exception
similarity index 100%
rename from meta/files/common-licenses/romic-exception
rename to meta/files/common-licenses/exceptions/romic-exception
diff --git a/meta/files/common-licenses/rsync-linking-exception b/meta/files/common-licenses/exceptions/rsync-linking-exception
similarity index 100%
rename from meta/files/common-licenses/rsync-linking-exception
rename to meta/files/common-licenses/exceptions/rsync-linking-exception
diff --git a/meta/files/common-licenses/sqlitestudio-OpenSSL-exception b/meta/files/common-licenses/exceptions/sqlitestudio-OpenSSL-exception
similarity index 100%
rename from meta/files/common-licenses/sqlitestudio-OpenSSL-exception
rename to meta/files/common-licenses/exceptions/sqlitestudio-OpenSSL-exception
diff --git a/meta/files/common-licenses/stunnel-exception b/meta/files/common-licenses/exceptions/stunnel-exception
similarity index 100%
rename from meta/files/common-licenses/stunnel-exception
rename to meta/files/common-licenses/exceptions/stunnel-exception
diff --git a/meta/files/common-licenses/u-boot-exception-2.0 b/meta/files/common-licenses/exceptions/u-boot-exception-2.0
similarity index 100%
rename from meta/files/common-licenses/u-boot-exception-2.0
rename to meta/files/common-licenses/exceptions/u-boot-exception-2.0
diff --git a/meta/files/common-licenses/vsftpd-openssl-exception b/meta/files/common-licenses/exceptions/vsftpd-openssl-exception
similarity index 100%
rename from meta/files/common-licenses/vsftpd-openssl-exception
rename to meta/files/common-licenses/exceptions/vsftpd-openssl-exception
diff --git a/meta/files/common-licenses/x11vnc-openssl-exception b/meta/files/common-licenses/exceptions/x11vnc-openssl-exception
similarity index 100%
rename from meta/files/common-licenses/x11vnc-openssl-exception
rename to meta/files/common-licenses/exceptions/x11vnc-openssl-exception
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index adcfc827cf..d38206a8d6 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -454,6 +454,12 @@ def get_license_path(d, node):
             return d.expand("${S}/" + filename), filename
 
     for lic_dir in [d.getVar("COMMON_LICENSE_DIR")] + (d.getVar("LICENSE_PATH") or "").split():
+        if isinstance(node, oe.spdx_license.ExceptionId):
+            p = os.path.join(lic_dir, "exceptions", node.name)
+            if os.path.isfile(p):
+                return p, None
+            return None, None
+
         p = os.path.join(lic_dir, node.name)
         if os.path.isfile(p):
             return p, None
diff --git a/scripts/pull-spdx-licenses.py b/scripts/pull-spdx-licenses.py
index 7d1715ff24..c8e2cfaf5f 100755
--- a/scripts/pull-spdx-licenses.py
+++ b/scripts/pull-spdx-licenses.py
@@ -72,7 +72,7 @@ def update_exceptions(dest, version, overwrite, deprecated):
 
         print(f"[{idx + 1} of {total_count}] ", end="")
 
-        dest_license_file = dest / lic_id
+        dest_license_file = dest / "exceptions" / lic_id
         if dest_license_file.is_file() and not overwrite:
             print(f"Skipping {lic_id} since it already exists")
             continue
-- 
2.55.0


