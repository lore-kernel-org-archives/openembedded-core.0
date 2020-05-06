Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web10.1956.1588749894838462956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 00:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=M5Yc+ZVt;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=388eec6a1=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588749894; x=1620285894;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7cPJaH5EQQqYrUFCGNv5PSU3u5TA4ngOKGE0TIx73jU=;
  b=M5Yc+ZVtq263/890maZ9zksW+/hGxtiSur4KG5AbuYpcvmL2gr1MVeKw
   zhL1DOA3/53ibH6K9VHMbvEinn0zb5hITd8KqCEoJiOWtnXsU0HpsvU6M
   SbmGy+bTt6gWVEFjWShRPq7q8TdiHuXfbfA2k7oA2hcw6npYyGgaKFs/T
   YTT5jxxBMuW/uKAajFLncteYyCu/LyACB3gUeJRi2yEN3wT9VCyuDhTR2
   FyoisI9zr9GaGs6LYv5bX9fPkG9EeH+hKeMADzaw/lYB2crfszaypJL86
   In5xHyNS6gZP0/ysQvGwtGZ4TFsi5d+xRRL69dEFZmRSuPUI8J2GXalQl
   w==;
IronPort-SDR: SnB9H+RFMu7j9ZH0d/Rai7Xb81Gjb1ZX5Ik414Py+Eh5Jb3L9PfMfo25vs5IygQRaJR4Cd6kRC
 DsQYpb4pKoc9If4xPpwL62Ygcwmz4Q/MqnSvcPKp4/DKb/bHnrw0DgsefVoKbMXibXXBMhZawQ
 7MLFOZLRPj/k6sCBlNF+fJ3OffjRbT174ONe47NLc2+s3elxAQrSXNU5UfxavAT0wrPVi8ANKd
 Lpk2uRGoWjoj1liLecueAx/OlXO1ARTUhXPFFtxrlF8XpOnYPr/7XGXnjl2pSrIu8NdIlcrogf
 0ik=
X-IronPort-AV: E=Sophos;i="5.73,358,1583190000"; 
   d="scan'208";a="24183874"
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-core@lists.openembedded.org>
CC: <bunk@stusta.de>, Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH v2 1/2] libtirpc: remove extra "-fcommon" from CFLAGS
Date: Wed, 6 May 2020 09:24:30 +0200
Message-ID: <20200506072431.1271445-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

commit daed7eedba ("Avoid multiple-definiton with gcc -fno-common") of
libtirpc fixed the -fno-common issues. Therefore it should be save to
remove the extra "-fcommon" in CFLAGS.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
Changes v2:
 - no changes
---
 meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb b/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb
index 6100d157e5..10a324c3b6 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb
@@ -19,8 +19,6 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-gssapi"
 
-CFLAGS += "-fcommon"
-
 do_install_append() {
 	chown root:root ${D}${sysconfdir}/netconfig
 }
-- 
2.26.2

