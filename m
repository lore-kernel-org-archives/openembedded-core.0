Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web11.4791.1585685005811098451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 13:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 192.55.52.120, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: XaO2Wyc23fulkqRCNCXRHvo2biojWybRNPn4wjEEncZVK7oheTxPmBTjvGCAFI1v962S4vWoLf
 ew0/yJRlh3yQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2020 13:03:25 -0700
IronPort-SDR: HD98vU8I+igy2Ncx5qIWgKmYK2KDhOeIsJkaDHAd6ymzUkm3Q/xmEno1VBFE49+mO5OMADSjT0
 VzHFzyaZA/Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,328,1580803200"; 
   d="scan'208";a="267398023"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by orsmga002.jf.intel.com with ESMTP; 31 Mar 2020 13:03:25 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: kai.kang@windriver.com,
	randy.macleod@windriver.com,
	Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH v2 2/6] oe-buildenv-internal: python 3.5 as min version
Date: Tue, 31 Mar 2020 13:03:02 -0700
Message-Id: <20200331200306.36942-2-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200331200306.36942-1-timothy.t.orling@linux.intel.com>
References: <20200331200306.36942-1-timothy.t.orling@linux.intel.com>
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

