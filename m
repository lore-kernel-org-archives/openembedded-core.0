Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.10872.1588946831604573425
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2020 07:07:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=K9WT73kt;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: anton.eliasson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1255; q=dns/txt; s=axis-central1;
  t=1588946832; x=1620482832;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=Ac9kS1598BJ7W03zo4SrA6/dqj13XHPoCQEA5HaNGDo=;
  b=K9WT73kt41N0NkvguqO2xgl5DfrQfEVFKO/crfzPDkZt4CWEsGutgy8P
   tkrVWYWEtCMODG3iPgQL7GZMuIjWCwoxuwF5rzsg5YdOt6nh1FKpQtrCZ
   NiRMP/LPN3jCEkrkUEwiUyxZsuU2w//JhV/yWEx8jl4bGis69IXpYu5zw
   7j0uL5/7BB7gnGdhG6bjWZuqMXHKbLUCG3/46rbVJs4EqqbLC9Jtr4LB9
   U3+3ran/LjBIsEsJJKiELayg80Bv4QjNGsOOZmSQvG4ZH177RTKivn3zO
   YLxxMO45YlZhLI6ryMKGiBwkZJgK9DjO0b/6eydqWjjuxXkybqJ69Fsgi
   w==;
IronPort-SDR: Eb/iWZnvNgAFQWwkiFcY+ti0yw2J/lFQWYPbsyCpqfaPvArIvbuJ+HWeqN/VwmQV94SFVkqqO0
 fs2IHFG2dbKWBeXCzQK4gf1Kklh9+XJwpJCN6Yn2Gm++YBPw5XXGgV9A0MFmJtrN8r2nXRUKW/
 98BTEH9RLcPF0oxSkWkzJzmaDgQKW+0CJMExVhwRfek/RrUJwQ6sJ52+p4EwLzjcVO0N5JFfLD
 Ih4UyU3zGFJ4N77uvYWJvgzBxF1FZZqseplyoVKRqHnhhO/d2Nf6ADzS7z2ubaOrwMiYp/BsTU
 EOE=
X-IronPort-AV: E=Sophos;i="5.73,367,1583190000"; 
   d="scan'208";a="8534403"
From: anton.eliasson@axis.com
To: <openembedded-core@lists.openembedded.org>
CC: Anton Eliasson <anton.eliasson@axis.com>
Subject: [PATCH] meson.bbclass: Close the log file after reading
Date: Fri, 8 May 2020 16:07:04 +0200
Message-ID: <20200508140704.14505-1-anton.eliasson@axis.com>
X-Mailer: git-send-email 2.11.0
Return-Path: antone@axis.com
MIME-Version: 1.0
Content-Type: text/plain

This fixes warnings like:

    WARNING: package-name-0.0.1-r0 do_configure: <string>:164: ResourceWarning:
    unclosed file <_io.TextIOWrapper
    name='/source_directory/build/tmp/work/arch/package-name/0.0.1-r0/package-name-0.0.1//meson-logs/meson-log.txt'
    mode='r' encoding='UTF-8'>

Signed-off-by: Anton Eliasson <anton.eliasson@axis.com>
Reviewed-by: Ola x Nilsson <ola.x.nilsson@axis.com>
Signed-off-by: Anton Eliasson <anton.eliasson@axis.com>
---
 meta/classes/meson.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 06034e8b47..e9628033c6 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -164,7 +164,8 @@ meson_do_configure_prepend_class-native() {
 python meson_do_qa_configure() {
     import re
     warn_re = re.compile(r"^WARNING: Cross property (.+) is using default value (.+)$", re.MULTILINE)
-    log = open(d.expand("${B}/meson-logs/meson-log.txt")).read()
+    with open(d.expand("${B}/meson-logs/meson-log.txt")) as logfile:
+        log = logfile.read()
     for (prop, value) in warn_re.findall(log):
         bb.warn("Meson cross property %s used without explicit assignment, defaulting to %s" % (prop, value))
 }
-- 
2.11.0

