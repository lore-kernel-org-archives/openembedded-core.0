Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.408.1585597399149814363
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2020 12:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: <nil>, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: FZEYmL2TRtBGU3XNsyPp9V14NTbHMiF58EA6MsWF+K7oJGZ5U9Nzqzhcd1nBUMjKP8/wZ+Vt04
 tQcM1Wr9P88A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2020 12:43:22 -0700
IronPort-SDR: ljOCiZLiFW8Qoff+A5T9Qll8Q11QRWAFdIin1PdRJOTKpNB3t9/uR2mRVX7lo0+1jLeYQJhhgf
 4aJOc/vASs5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,325,1580803200"; 
   d="scan'208";a="359273394"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by fmsmga001.fm.intel.com with ESMTP; 30 Mar 2020 12:43:22 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH 2/4] oe-buildenv-internal: python 3.5 as min version
Date: Mon, 30 Mar 2020 12:43:00 -0700
Message-Id: <20200330194302.30032-2-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200330194302.30032-1-timothy.t.orling@linux.intel.com>
References: <20200330194302.30032-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Python 3.4 is EOL:
https://www.python.org/downloads/release/python-3410/

The last supported distro was probably CentOS-7, which has python36 available
from epel-7 or scl (as rh-python36) [1]

[1] https://www.softwarecollections.org/en/scls/rhscl/rh-python36/

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 scripts/oe-buildenv-internal | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 8cbe34669d..c62688fbd2 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -32,12 +32,12 @@ fi
 # We potentially have code that doesn't parse correctly with older versions 
 # of Python, and rather than fixing that and being eternally vigilant for 
 # any other new feature use, just check the version here.
-py_v34_check=$(python3 -c 'import sys; print(sys.version_info >= (3,4,0))')
-if [ "$py_v34_check" != "True" ]; then
-    echo >&2 "BitBake requires Python 3.4.0 or later as 'python3'"
+py_v35_check=$(python3 -c 'import sys; print(sys.version_info >= (3,5,0))')
+if [ "$py_v35_check" != "True" ]; then
+    echo >&2 "BitBake requires Python 3.5.0 or later as 'python3'"
     return 1
 fi
-unset py_v34_check
+unset py_v35_check
 
 if [ -z "$BDIR" ]; then
     if [ -z "$1" ]; then
-- 
2.24.0

