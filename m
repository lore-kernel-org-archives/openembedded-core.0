Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 by mx.groups.io with SMTP id smtpd.web11.2383.1592426889410233174
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 13:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.129.153, mailfrom: awais_belal@mentor.com)
IronPort-SDR: Vs2uLIQyl0YWE2BSBYiVPEvKWh0qToggN/47yhAxiuLATJM8aU+fAAP2ml3hL4DCyEebY43inQ
 TQJKrtfqte9LrSXfkAEPhuES3IkGP+OIt1IHqu6vzIVwel+QL28o0Akn6PgALSZkBadNl1DXNA
 JDzELGP8ErMYTewlgTAe66ZAAXETRH+pD3X/W641biCreLtjEsXQKrJ02dGEZGAeljiEzeosSp
 oaKlVOw2RbC2l03Q7thfCwIRLxMIGeI5BAnVtmOBZ9OGrKAZDX34KIL7t6ycN+HiFS6oQML0c4
 /LU=
X-IronPort-AV: E=Sophos;i="5.73,523,1583222400"; 
   d="scan'208";a="52065606"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 17 Jun 2020 12:48:08 -0800
IronPort-SDR: oALvDfwbTsQCnPSwbbyZJcOZTrZR1nGJt5w4e8DbY+b1hQYkUqjvZ1v+Jz6X2grvbp7VC1rtmO
 P+RviiZG3dRPzW5c+H3HNN+2rFfLfr/zeeMev7wbhEAO6Latqg0I0uHnTrLB80ADDtTZJtmUkP
 2NBunS0ah42qJf+cngQuFbAdDQ8J8lfOXDTdxodp2VZ2oWSXAD5gEbND94B3I9sDrhzJWcbAV3
 kZPFskBGENBp7Ps2ZB7jMUO27mlGtPOWzXtIjUvrJv4KQGPVsUQmxkdX77ToNtTN6ku2YOMNyU
 fyc=
From: "Awais Belal" <Awais_Belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] toolchain-shar-relocate.sh: check for environment-setup beforehand
Date: Thu, 18 Jun 2020 01:47:39 +0500
Message-ID: <20200617204739.22441-1-awais_belal@mentor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Return-Path: awais_belal@mentor.com
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
Content-Type: text/plain

The script runs a 'cat' on the script and if it isn't present in the
sdk the cat command waits on the std input and hence the installation
process simply sits there.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/files/toolchain-shar-relocate.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index e3c10018ef..02a05664c6 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -3,6 +3,12 @@ if ! xargs --version > /dev/null 2>&1; then
 	exit 1
 fi
 
+# check if we have a valid env-setup script
+if [ ! -f "$env_setup_script" ]; then
+	echo "Main environment-setup file not found. Abort!"
+	exit 1
+fi
+
 # fix dynamic loader paths in all ELF SDK binaries
 native_sysroot=$($SUDO_EXEC cat $env_setup_script |grep 'OECORE_NATIVE_SYSROOT='|cut -d'=' -f2|tr -d '"')
 dl_path=$($SUDO_EXEC find $native_sysroot/lib -name "ld-linux*")
-- 
2.17.1

