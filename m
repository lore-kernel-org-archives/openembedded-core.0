Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web08.6326.1604890637303091526
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 18:57:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=sntgWeA4;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id i13so1008678pgm.9
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 18:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Dk1joxCub7MDXUyabphDuJnt93Ax9jz/9m9k85VR8uM=;
        b=sntgWeA4gsg1STawE4UFByuPTZOfQhzxsYgIpo1S/PV3xIUUxRfhIbRpsv5sbBLr2j
         RBbNH8yx4tVOa3GyJ+jpYtua2OxvN4m5WIhVAaXOeuLCKwoIWD7CsCNA7KYjynjOE9VL
         7ysCEBd3RxtkZME6hlbwTiSPd8reF/4ioZineSMXFHXttZ0kAP9DTH68CKMtkCjcUT1z
         jHmJ30HvWNMI6WnQaTPzDkXHvEw+kT3Drxp3P4fSukDMnLMm8cz8G3pvzolUH8hvHFsr
         NLhwpWIZBkddN6xrg783/E3Szin0ifRJYZNpy53fX2LE+Gz8UwO5k5xFI1Pb8H+lrOrz
         q3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Dk1joxCub7MDXUyabphDuJnt93Ax9jz/9m9k85VR8uM=;
        b=Np95cneI4i1la/LGtxphfC17bvoYIWJVDI9CGjR3+XQ/c4Cx/peci8hpqSmuqpNo6g
         ktbkIT/qU09gvVZ8QTBBfJoxAXfE8yizbAefDR5kuvKl9zAU9F4q7N0jxzuyiIR1ehDO
         eoCvD8QcCh7X8c0DZzfGPk75AoJO6JzBP+t1gXgAz29CCPCHQe48zGi4+cGfrHvKAvkp
         LVTV0VWfu24bboaWwJQ7u5C1a5lS36OAqcGqvf5PwARLcdgjsTnZa0vLyv+7ZDc1fOty
         XbLT/klFOBQNBPuEhM9xW6a/VyLpJ5rAtdGcAzhhgIuz1X8bHldpddTrcXGqjIf60AID
         ayug==
X-Gm-Message-State: AOAM533dKwFUKb5PdXrSGU9ybfDt2m4EfaDdLJQj48QcBeH+0blyyxnG
	naSyIzhuOYL99Re/exHXYjmcKXIW5S95mPrD
X-Google-Smtp-Source: ABdhPJyQBvME/BiGkFTT9DHQ0E0sXUqI1MoJniCs5lLZtpv7xI+7oTplfYMCVmKO+3Z1Vf4yXYwpXw==
X-Received: by 2002:a17:90a:6683:: with SMTP id m3mr11140039pjj.225.1604890636434;
        Sun, 08 Nov 2020 18:57:16 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s4sm9107037pjp.17.2020.11.08.18.57.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 18:57:15 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/12] ruby: fix CVE-2020-25613
Date: Sun,  8 Nov 2020 16:56:17 -1000
Message-Id: <80077479fd687a887cd321fe2e65dfd58edb5832.1604890441.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604890441.git.steve@sakoman.com>
References: <cover.1604890441.git.steve@sakoman.com>

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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

