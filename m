Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.5047.1609919369825653707
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 23:49:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: VJOnLCT3szsj/XSTouE+fOZ9fbpweySGSkXLs/2lI+jXOUvFMcgvkp07K2kEBaPxkoNvMi8U+X
 iY3RwlBzMN8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="176462919"
X-IronPort-AV: E=Sophos;i="5.78,479,1599548400"; 
   d="scan'208";a="176462919"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 23:49:29 -0800
IronPort-SDR: br6IRYdnft+d+hDsGE1AF+WWJT2fmMyC7C6msP5IYytcQZEF5qTrNqrf8zYZeFi+RE6BtLmZJW
 CY4baKWTLPKg==
X-IronPort-AV: E=Sophos;i="5.78,479,1599548400"; 
   d="scan'208";a="346565052"
Received: from ehyeoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.135.162])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 23:49:27 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH] gcc: Fix mangled patch
Date: Wed,  6 Jan 2021 15:49:22 +0800
Message-Id: <20210106074922.11303-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

To quote Zhuang <qiuguang.zqg@alibaba-inc.com>:
"""
A few days ago, I tried to compile a gcc plugin with the toolchain from poky sdk.
It failed with errors about missing header files such as backend.h etc.

After investigation, I found that the problem was brought by a gcc patch:
0012-gcc-Fix-argument-list-too-long-error.patch (which is considered derived from the original patch)

- headers=`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
+ headers="$(sort $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def))"; \

It changes the commands of install-plugin, making the sorting taken effect before the shell globs.
Thus results in the header files under gcc $(srcdir) being not installed.

By checking log.do_install, we can find that the `headers=' statement to run is incorrect and will not work as expected:
headers="$(cd *.def) *.h ../../../../../../../work-shared/gcc-10.1.0-r0/gcc-10.1.0/gcc/../include/ansidecl.h ...

As the patch says,
"The PLUGIN_HEADERS is too long before sort, so the "echo" can't handle it, ..."
my suggestion is that we can simply take care of PLUGIN_HEADERS
using the original proposed sort.
"""

This fixes the gcc patch as proposed as it does appear its been
broken over time.

(From OE-Core rev: dce28d8ac7fbae487cb6674b91fe2b574036b26d)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 94eb5724b111cf3409219be3b169af79858eab7b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../gcc-9.3/0012-gcc-Fix-argument-list-too-long-error.patch | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0012-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-9.3/0012-gcc-Fix-argument-list-too-long-error.patch
index 9d98878096..f0b79ee145 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0012-gcc-Fix-argument-list-too-long-error.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0012-gcc-Fix-argument-list-too-long-error.patch
@@ -17,6 +17,10 @@ $(sort list) doesn't need this.
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
+RP: gcc then added *.h and *.def additions to this list, breaking the original
+fix. Add the sort to the original gcc code, leaving the tr+sort to fix the original
+issue but include the new files too as reported by Zhuang <qiuguang.zqg@alibaba-inc.com>
+
 Upstream-Status: Pending
 ---
  gcc/Makefile.in | 2 +-
@@ -31,7 +35,7 @@ index fef6c4c61e3..57cf7804f0a 100644
  # files. All other files are flattened to a single directory.
  	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
 -	headers=`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
-+	headers="$(sort $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def))"; \
++	headers=`echo $(sort $(PLUGIN_HEADERS)) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
  	srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; \
  	for file in $$headers; do \
  	  if [ -f $$file ] ; then \
-- 
2.29.2

