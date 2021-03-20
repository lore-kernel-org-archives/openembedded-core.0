Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.1958.1616235080101965880
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Mar 2021 03:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AD/Wxi/2;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id e7so13590798edu.10
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Mar 2021 03:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dJ+crCH3W3yJPvIOCAZLJqhzNOgWfXgan7ZSXlSv77U=;
        b=AD/Wxi/24j1FSvJ+wvO+JMRXzTDsAqtVWQEO1h66NtJAMbPekk2r0nsfu8jFCEYjFL
         PP6lASaZ7GoLuUKVmbogUqibMMk0uWjeJaNebL2ng09w4cJjz2SeYRBw5InrwAGz1Tv5
         MrSBDpw6kDT5WyPvqY/68ot45xuUADrBiqKqmgVkNWJY8VdnaLgFkMNkshtkTgmUMwVI
         xZk1TWwu9UvkxYxz3JBWH2v7Dl7M+Qg4a8oV6bLS717ZVZPXY0AzJKr0WNH8RhyFuWd/
         3quribJIXfGbAJRMzbuOqNsuUuJ3NMqCG5EIZBeUd9rZojHOAXARmye00tzhLRbKrdIa
         +nAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dJ+crCH3W3yJPvIOCAZLJqhzNOgWfXgan7ZSXlSv77U=;
        b=Sx0CZPHg+mD5kXi5kxUD9JpCVgllck3WpxGqasALM65djvNd6fpjfbtLlfy9w3MOiq
         fM77BWnqlu5ZL3+ebmZNGcKtfSXYIPUuhZtGzT4Xehn03D1WaIVme3se7yY0I9ZYxvGB
         wEGDhITtssX3xamuuhQ9AD9/fYw8DUSVXLvSWmaR4zwoX3lqG09cjgsDuS9IhPvJov43
         7I94b6S/NykGHc2sRerZc3HFZbwmtck66/HWUFHe+Tg8TYCOuWGMznV175gxz1O9s3tI
         BWr79fD842gdL9QApInmphhNzUgXrBWW7+lG024js7w8fQFcZg1vANMAY2jUKUmtauqp
         Rylg==
X-Gm-Message-State: AOAM53245cQykA8iTT1Otu2oSTLJxM05AekF36vY79clIL1w77341flk
	GsytmA6BwWV1nPbZgdI9I71ET5JtmKs=
X-Google-Smtp-Source: ABdhPJxxTVBeRg5JUgS/JZEpWIDI2oDafgh8qQW3ln/nzOrHXod4voG8yDEZdCr+FDMWAt0uCUmuPA==
X-Received: by 2002:aa7:d3ca:: with SMTP id o10mr14744833edr.374.1616235078444;
        Sat, 20 Mar 2021 03:11:18 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y24sm5936374eds.23.2021.03.20.03.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 03:11:18 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	alejandro@enedino.org,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] python3: fix PACKAGECONFIG handling
Date: Sat, 20 Mar 2021 11:11:13 +0100
Message-Id: <20210320101113.136096-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* it was changed from sysconf_dis to mods_disabled in:
  https://git.openembedded.org/openembedded-core/diff/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch?id=7347556b18b45c5f9afc2cade565a75c95876914

  but unfortunately this doesn't work as mods_disabled set by remove_configured_extensions
  can contain only extensions which were disabled, as this list:
  self.extensions: ['_struct', 'array', '_contextvars', 'math', 'cmath', 'time', '_datetime', '_zoneinfo', '_random', '_bisect', '_heapq', '_pickle', 'atexit', '_json', '_lsprof', 'unicodedata', '_opcode', '_asyncio', '_abc', '_queue', '_statistics', 'fcntl', 'pwd', 'grp', 'spwd', 'select', 'parser', 'mmap', 'syslog', '_xxsubinterpreters', 'audioop', '_csv', '_posixsubprocess', '_testcapi', '_testinternalcapi', '_testbuffer', '_testimportmultiple', '_testmultiphase', '_xxtestfuzz', '_curses', '_curses_panel', '_crypt', '_socket', '_ssl', '_hashlib', '_sha256', '_sha512', '_md5', '_sha1', '_blake2', '_sha3', '_sqlite3', 'termios', 'resource', 'ossaudiodev', 'nis', 'zlib', 'binascii', '_bz2', '_lzma', 'pyexpat', '_elementtree', '_multibytecodec', '_codecs_kr', '_codecs_jp', '_codecs_cn', '_codecs_tw', '_codecs_hk', '_codecs_iso2022', '_decimal', '_ctypes_test', '_posixshmem', '_multiprocessing', '_uuid', 'xxlimited', '_ctypes']

  while PACKAGECONFIG in python3 usually uses this to disable _dbm, _gdbm or runtime modules.

* without this change the do_install will fail (based on check_build_completeness.py log.do_compile) with:
  | ERROR: Execution of '/OE/build/oe-core/tmp-glibc/work/x86_64-linux/python3-native/3.9.0-r0/temp/run.do_install.69743' failed with exit code 1:
  | The necessary bits to build these optional modules were not found:
  | _dbm                  _gdbm                 readline

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...y-do-not-report-missing-dependencies-for-disa.patch | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
index 5c620361da..5823273af3 100644
--- a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
+++ b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
@@ -10,6 +10,8 @@ build completeness checker which relies on the report.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
 
 ---
  setup.py | 4 ++++
@@ -19,13 +21,17 @@ diff --git a/setup.py b/setup.py
 index 7691258..ec3f2a4 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -408,6 +408,10 @@ class PyBuildExt(build_ext):
+@@ -408,6 +408,14 @@ class PyBuildExt(build_ext):
                  print("%-*s   %-*s   %-*s" % (longest, e, longest, f,
                                                longest, g))
  
 +        # There is no need to report missing module dependencies,
 +        # if the modules have been disabled in the first place.
-+        self.missing = list(set(self.missing) - set(mods_disabled))
++        # cannot use mods_disabled here, because remove_configured_extensions adds
++        # only disabled extensions into it (doesn't cover _dbm, _gdbm, readline
++        # we support disabling through PACKAGECONFIG)
++        sysconf_dis = sysconfig.get_config_var('MODDISABLED_NAMES').split()
++        self.missing = list(set(self.missing) - set(sysconf_dis))
 +
          if self.missing:
              print()
-- 
2.30.2

