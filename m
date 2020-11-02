Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.24258.1604277874804138387
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2020 16:44:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: Pvno4uB8IxfL0665qjQBRCqqZPlwI3Y4cYOknPvR1djwU0M582C3r4BcM9UmsfTSJxBTyep37a
 HdXvqqeSHelw==
X-IronPort-AV: E=McAfee;i="6000,8403,9792"; a="168953539"
X-IronPort-AV: E=Sophos;i="5.77,443,1596524400"; 
   d="scan'208";a="168953539"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2020 16:44:34 -0800
IronPort-SDR: cD/m3+1fV9c/7H6HvegPXJqJpPKF/nURp32FsbzIwtXemZfYwgigRLkLSrDGAVgbReHZUjtrlh
 aB/gcakXtadw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,443,1596524400"; 
   d="scan'208";a="357166766"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga002.fm.intel.com with ESMTP; 01 Nov 2020 16:44:33 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 2/2] ruby: fix CVE-2020-25613
Date: Mon,  2 Nov 2020 08:44:31 +0800
Message-Id: <20201102004431.67408-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201102004431.67408-1-chee.yang.lee@intel.com>
References: <20201102004431.67408-1-chee.yang.lee@intel.com>

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../ruby/ruby/CVE-2020-25613.patch            | 40 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_2.7.1.bb      |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2020-25613.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2020-25613.patch b/meta/recipes-devtools/ruby/ruby/CVE-2020-25613.patch
new file mode 100644
index 0000000000..1abcb7547e
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2020-25613.patch
@@ -0,0 +1,40 @@
+From 8946bb38b4d87549f0d99ed73c62c41933f97cc7 Mon Sep 17 00:00:00 2001
+From: Yusuke Endoh <mame@ruby-lang.org>
+Date: Tue, 29 Sep 2020 13:15:58 +0900
+Subject: [PATCH] Make it more strict to interpret some headers
+
+Some regexps were too tolerant.
+
+Upstream-Status: Backport
+[https://github.com/ruby/webrick/commit/8946bb38b4d87549f0d99ed73c62c41933f97cc7]
+CVE: CVE-2020-25613
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ lib/webrick/httprequest.rb | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/lib/webrick/httprequest.rb b/lib/webrick/httprequest.rb
+index 294bd91..d34eac7 100644
+--- a/lib/webrick/httprequest.rb
++++ b/lib/webrick/httprequest.rb
+@@ -227,9 +227,9 @@ def parse(socket=nil)
+         raise HTTPStatus::BadRequest, "bad URI `#{@unparsed_uri}'."
+       end
+ 
+-      if /close/io =~ self["connection"]
++      if /\Aclose\z/io =~ self["connection"]
+         @keep_alive = false
+-      elsif /keep-alive/io =~ self["connection"]
++      elsif /\Akeep-alive\z/io =~ self["connection"]
+         @keep_alive = true
+       elsif @http_version < "1.1"
+         @keep_alive = false
+@@ -508,7 +508,7 @@ def read_body(socket, block)
+       return unless socket
+       if tc = self['transfer-encoding']
+         case tc
+-        when /chunked/io then read_chunked(socket, block)
++        when /\Achunked\z/io then read_chunked(socket, block)
+         else raise HTTPStatus::NotImplemented, "Transfer-Encoding: #{tc}."
+         end
+       elsif self['content-length'] || @remaining_size
diff --git a/meta/recipes-devtools/ruby/ruby_2.7.1.bb b/meta/recipes-devtools/ruby/ruby_2.7.1.bb
index 3dd9fb0a62..f87686f6f7 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.1.bb
@@ -6,6 +6,7 @@ SRC_URI += " \
            file://remove_has_include_macros.patch \
            file://run-ptest \
            file://0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch \
+           file://CVE-2020-25613.patch \
            "
 
 SRC_URI[md5sum] = "debb9c325bf65021214451660f46e909"
-- 
2.17.1

