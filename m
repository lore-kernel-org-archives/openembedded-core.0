Received: from mga01.intel.com (mga01.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.8284.1604644110706190146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 22:28:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: jzyQ6gzHga+SmfoeofEoqLxgVIY5X/3huxBbXza9NWnfC23mkG9/8JS93T5EtmIfcEg7Hz7DGZ
 K7HbsXjJmvVA==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="187428878"
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="187428878"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:28:49 -0800
IronPort-SDR: 28bZzaz18kJQmK518I2TMgIYErNHEBwCXzm/dv32jnL6Br+qD2MzOOJxNhk+b2QEf4xuMorT5+
 1Xo40BDYPJ7Q==
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="321490073"
Received: from gcquah-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.239])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:28:48 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 14/22] ruby: fix CVE-2020-25613
Date: Fri,  6 Nov 2020 14:28:12 +0800
Message-Id: <26e931e1e68304424b4e29a34597d968a660b36f.1604643684.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1604643684.git.anuj.mittal@intel.com>
References: <cover.1604643684.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chee Yang Lee <chee.yang.lee@intel.com>

(From OE-Core rev: 4e02862b4fcfbf3a9cace8a35e355f156d26ed37)

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
2.28.0

