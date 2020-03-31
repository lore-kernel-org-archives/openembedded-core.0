Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.4791.1585685005811098451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 13:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: <nil>, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: KTPtkVz10Bn6OcgGnqvrNysQl0VOJEPe4fgCFkt4y9uFpfDzqknghRtr/pjoDFeLLp+fqjQ2hs
 Eg1fL0gSyvxQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2020 13:03:27 -0700
IronPort-SDR: IMJ7r601VatiSRE2kxS3MPrsfdoIMjLPfomovyLSDdTyFZJpT+EN2us+2mjPgo19TE+edUxblJ
 N3qlfImmxLqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,328,1580803200"; 
   d="scan'208";a="267398047"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by orsmga002.jf.intel.com with ESMTP; 31 Mar 2020 13:03:27 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: kai.kang@windriver.com,
	randy.macleod@windriver.com,
	Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH v2 4/6] lib/oe/utils.py: add get_host_compiler_version()
Date: Tue, 31 Mar 2020 13:03:04 -0700
Message-Id: <20200331200306.36942-4-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200331200306.36942-1-timothy.t.orling@linux.intel.com>
References: <20200331200306.36942-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add helper function to get the host compiler and version.
Do not assume compiler is gcc.

NOTE: cannot set env to d.getVar("PATH") as that does not contain
the session PATH which was set by environment-setup-... which
breaks the install-buildtools use-case

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/lib/oe/utils.py | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 9042b370f7..13f4271da0 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -373,6 +373,37 @@ def format_pkg_list(pkg_dict, ret_format=None):
 
     return output_str
 
+
+# Helper function to get the host compiler version
+# Do not assume the compiler is gcc
+def get_host_compiler_version(d, taskcontextonly=False):
+    import re, subprocess
+
+    if taskcontextonly and d.getVar('BB_WORKERCONTEXT') != '1':
+        return
+
+    compiler = d.getVar("BUILD_CC")
+    # Get rid of ccache since it is not present when parsing.
+    if compiler.startswith('ccache '):
+        compiler = compiler[7:]
+    try:
+        env = os.environ.copy()
+        # datastore PATH does not contain session PATH as set by environment-setup-...
+        # this breaks the install-buildtools use-case
+        # env["PATH"] = d.getVar("PATH")
+        output = subprocess.check_output("%s --version" % compiler, \
+                    shell=True, env=env, stderr=subprocess.STDOUT).decode("utf-8")
+    except subprocess.CalledProcessError as e:
+        bb.fatal("Error running %s --version: %s" % (compiler, e.output.decode("utf-8")))
+
+    match = re.match(r".* (\d+\.\d+)\.\d+.*", output.split('\n')[0])
+    if not match:
+        bb.fatal("Can't get compiler version from %s --version output" % compiler)
+
+    version = match.group(1)
+    return compiler, version
+
+
 def host_gcc_version(d, taskcontextonly=False):
     import re, subprocess
 
-- 
2.24.0

