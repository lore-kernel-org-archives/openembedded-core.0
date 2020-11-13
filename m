Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web12.637.1605296943608729669
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 11:49:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZBazQcO6;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id o20so12140447eds.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 11:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jkp7biTHgL5bwS95iVrUjkJ3R0nPmIoOog6n8MoUlWU=;
        b=ZBazQcO6KUYOVV0aGASS7in07EjpUkaQpUNsAxqAQroX1btqqQ3dkA1OEXwkrb6Lh5
         4CigAJDZbaJrW7GsJX1HA/umDN8rgfDR/jGkaSy0zRM6jPjBY7fZDbXOhdq6INY1KOnA
         Vlcf2I/AD8P1ipPt99HzERQlppZg5eDGEJu0pmHubB/zvKG5GoTwgKmpqzdt+XSO87pT
         QNzF6ZVHy+ZEj/D/Tmw9kituCsgkQrsgm1iudkRfsWkTOBglXvfzSAxyhr2RsG48CPVO
         WNehT8+xdksLcBMhq5nopkmKZTaP9GQESEdL447CJ6WDUQaXyM1GeSyZ+o2UMYRJkWkG
         S8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jkp7biTHgL5bwS95iVrUjkJ3R0nPmIoOog6n8MoUlWU=;
        b=OF68maraEjE8dC9y0ku4fS9xtgO984zjPQyelRK1RfI5uWX6batcNd5FRVmJeQouLl
         7CjyoxXe4lGKbB5EGIRM9A27N9LMGHnDaGOKw8A6QeuFslctqeeJqzsjgf2dAQp/7zXb
         1y/afg58dAWcr4zV2+fqI0BaX0h0nc5DOX7YdFdA72GEcJNMeZfzFF9xjAHKhYmgqViM
         Tkyn6J+ASktuptVsnUGJHeDITZ6eA0PZWSR031KWj0XatTIwWzNN/1xwRmc6UQM0OIQH
         ox+WzzmaaCLIjLXOdbBdndYgGEWBN7ryIBZW7VmEX2LfEhbSf1tN1SkiTlYIq+NJfI9J
         2RQQ==
X-Gm-Message-State: AOAM531yxRW8PL4HuWjDpIQ6ofq63E2iFhxcLcPzc1wqE/nxd5twGaTF
	1AaF/G8Gf71zAJZGX07H3u45xD+VcEBuzA==
X-Google-Smtp-Source: ABdhPJy7E8JOEw6rSDwTCM2U6WPuo4pA//zcy6q9Xgi0+8TQpCWN2SdEb7ivAKJrjWXYOShI/gvJ8Q==
X-Received: by 2002:aa7:d550:: with SMTP id u16mr4072978edr.147.1605296941360;
        Fri, 13 Nov 2020 11:49:01 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id lz27sm4499287ejb.39.2020.11.13.11.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 11:49:00 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/5] python3: split python target configuration into own class
Date: Fri, 13 Nov 2020 20:48:50 +0100
Message-Id: <20201113194854.21266-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting _PYTHON_SYSCONFIGDATA_NAME in python3native class globally was
problematic as it was leaking into host python environment, which
was causing tracebacks depending on host distro and action
(typically anything involving importing sysconfig module).

The new class sets the variable only in specific tasks where it is needed,
and should be inherited explicitly:
- use python3native to run scripts with native python
- use python3targetconfig to run scripts with native python
if those scripts need to access target config data (such
as correct installation directories). This also adds a dependency
on target python, so should be used carefully to avoid lengthening builds.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/python3native.bbclass       |  2 --
 meta/classes/python3targetconfig.bbclass | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 meta/classes/python3targetconfig.bbclass

diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
index d98fb4c758..2e3a88c126 100644
--- a/meta/classes/python3native.bbclass
+++ b/meta/classes/python3native.bbclass
@@ -17,8 +17,6 @@ export STAGING_LIBDIR
 export PYTHON_LIBRARY="${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so"
 export PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
 
-export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
-
 # suppress host user's site-packages dirs.
 export PYTHONNOUSERSITE = "1"
 
diff --git a/meta/classes/python3targetconfig.bbclass b/meta/classes/python3targetconfig.bbclass
new file mode 100644
index 0000000000..640d0c97b6
--- /dev/null
+++ b/meta/classes/python3targetconfig.bbclass
@@ -0,0 +1,15 @@
+inherit python3native
+
+DEPENDS_append = " python3"
+
+do_configure_prepend() {
+        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+}
+
+do_compile_prepend() {
+        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+}
+
+do_install_prepend() {
+        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+}
-- 
2.29.2

