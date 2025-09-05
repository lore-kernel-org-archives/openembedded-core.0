Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF95CA1002
	for <webhook@archiver.kernel.org>; Sat,  6 Sep 2025 13:03:39 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.566.1757095767587401898
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 11:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MrmTIoGV;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: rmmuniz@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-80a6937c8c6so307459085a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 11:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757095766; x=1757700566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9nnH9KgC5gaBZzN+IRwGOSkIc/vf9E+YIoevfN/MgDU=;
        b=MrmTIoGVWXVaR8mjV18pvlYm+WLLqdrLSqL0D7gpMguNleymEgwREEtapWMbsT45Y6
         TklVqtaGj44QqVZOgA2SqsdXo6pB+SK82i4nXgB7749G5i6U/g+u5iPuMamMQtYlJjx2
         U+seZXmNTMriz+m7Xi4qBbch1gu6MMFns9m1uV+DytjcwovxMDfVHhjNdWUYxaUzCqwP
         msZF5jO8IuWdIFvVZ/CrFmoEUb8tTETfDU9bLURqnjn2uZHs+jslr4Wd63+h9QONqBnv
         LKr70oInhd9SmySjWev2I35f7OmP91qT4c9QRiOqDZT4Q1mNxip8oTIb0iE8FhlRfjct
         VBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757095766; x=1757700566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9nnH9KgC5gaBZzN+IRwGOSkIc/vf9E+YIoevfN/MgDU=;
        b=bZMJvt5jcUALpoWQmYyRic+V43ASUItJ5UXzRRfvrCmc1nvnOwjtpHF4ky/5HuV+O5
         q1BOb5aEwO7x1eNrUy3VnJbx/Ul7ytNdHFbuJtsC94uqVBHIl/YNHsYXhwzZ+YDdDITL
         1dlIgHftuToAtA3eHdjRAcBIwvAXkA29Rv8bVQB/XlgZ/bPFmTzV453FoytJQer4Dpos
         TZVs9zejZF7XiZHHA+FtTgPnPTnUfNRGVAO5ST6ZIk2U1bmFg/v5sHCUQ3fFDtWlrkM+
         LI5W1KrBFWiWMFBxJxq61dC5xuL9woKwOZDiPHHTt13bQtg4jnM7VmnXJCv8VYRqKnOH
         saKg==
X-Gm-Message-State: AOJu0Yz/WAOmdcAW13wdAK2YdnJpaC5bo8yL7Rvn2fS9/E4NtIX3kn3r
	sFk/zmpci2CR8AF1gXbr0Jxq3cTGBw8+sbUUtGyLf67foIM8PdDKRR4ncWpPnQ==
X-Gm-Gg: ASbGncuosAlZaAjhRi5298f4rdT08GybQZNAx0Q/Z6keQ7Z/wmXzQIXWdBpDynIIKse
	rPr4YjYo6C78iXDVh83mrXCxAuaup/WplPm9b6eeHc0E4iuOVz+kEZsqGUe4oxGUKiPaTG+TzXK
	wrnlNX7jJklygwoOh0A5O3GOmBSTDct4vUssVfZOLhmVzr+oXzLu+yp+dLZfTRFbX31V2e/cnXf
	nvK5pLON0ER7iRwZThgO4X+StBIzRPWlDeOJZQ48Whp4qQStWiPfwnvGRfbsUqa9izwHcDAN+X3
	lAboRUs2raA8b40FWJg3v0YoijlkKrCGh3uj7B55scKAVeth21YxhS5F0teGHJDhUP43EkhkOal
	GpVKMK5W8PMg5SPGcsVVgw0FXShNqxDLyQ3ZNzQzC/2Jbry1vJXekdo+oRdj5vguqPRTHoYw/ri
	6nrJn2OEaZUNeFj1lNfhUb
X-Google-Smtp-Source: AGHT+IEKGjWzC+J69r57jYDW01nwW5q9SSoZoYH3Oakda/VVIsKTZEOd1wEmTAgZ7T+TrcW4rEtcHw==
X-Received: by 2002:a05:6214:4015:b0:70b:5320:d416 with SMTP id 6a1803df08f44-70fac700be4mr305365516d6.14.1757095311271;
        Fri, 05 Sep 2025 11:01:51 -0700 (PDT)
Received: from rmuniz-SER5.home (bras-base-qubcpq0974w-grc-17-64-228-161-9.dsl.bell.ca. [64.228.161.9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7243de51ad4sm50816226d6.53.2025.09.05.11.01.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 11:01:50 -0700 (PDT)
From: Rene Muniz <rmmuniz@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 1/3] python3-evdev: upgrade 1.9.1 -> 1.9.2
Date: Fri,  5 Sep 2025 14:01:47 -0400
Message-Id: <20250905180149.2497823-1-rmmuniz@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Sep 2025 13:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223043

From: Yoann Congal <yoann.congal@smile.fr>

* Remove a merged reproducibility patch
* Adapt the --reproducible option

Changelog (from [0]):

1.9.2 (May 01, 2025)
====================
- Add the "--reproducible" build option which removes the build date and used headers from the
  generated ``ecodes.c``. Example usage::

    python -m build --config-setting=--build-option='build_ecodes --reproducible' -n

- Use ``Generic`` to set precise type for ``InputDevice.path``.

[0]: https://github.com/gvalkov/python-evdev/blob/v1.9.2/docs/changelog.rst

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ibility-option-for-building-ecodes.c.patch | 116 ------------------
 ...-evdev_1.9.1.bb => python3-evdev_1.9.2.bb} |   5 +-
 2 files changed, 2 insertions(+), 119 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-evdev/0001-Add-a-reproducibility-option-for-building-ecodes.c.patch
 rename meta-python/recipes-devtools/python/{python3-evdev_1.9.1.bb => python3-evdev_1.9.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-evdev/0001-Add-a-reproducibility-option-for-building-ecodes.c.patch b/meta-python/recipes-devtools/python/python3-evdev/0001-Add-a-reproducibility-option-for-building-ecodes.c.patch
deleted file mode 100644
index e730519884..0000000000
--- a/meta-python/recipes-devtools/python/python3-evdev/0001-Add-a-reproducibility-option-for-building-ecodes.c.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From d05c1c9dd298cb95d7feccbddb5caa043a319a01 Mon Sep 17 00:00:00 2001
-From: Yoann Congal <yoann.congal@smile.fr>
-Date: Sun, 13 Apr 2025 00:52:13 +0200
-Subject: [PATCH] Add a reproducibility option for building ecodes.c
-
-ecodes.c currently contains the kernel info of the build machine and the
-full path of the input*.h headers: This is not reproducible as output
-can change even is headers content do not. Downstream distributions
-might package ecodes.c and get non-reproducible output.
-
-To fix this: introduce a --reproducible option in the build:
-- in setup.py build_ecodes command
-- in underlying genecodes_c.py
-
-Note: These options are disabled by default so no change is expected in
-current builds.
-
-Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
-Upstream-Status: Submitted [https://github.com/gvalkov/python-evdev/pull/242]
----
- setup.py                 | 13 ++++++++++---
- src/evdev/genecodes_c.py | 17 +++++++++++------
- 2 files changed, 21 insertions(+), 9 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 6b721d7..3371199 100755
---- a/setup.py
-+++ b/setup.py
-@@ -14,7 +14,7 @@ curdir = Path(__file__).resolve().parent
- ecodes_c_path = curdir / "src/evdev/ecodes.c"
- 
- 
--def create_ecodes(headers=None):
-+def create_ecodes(headers=None, reproducibility=False):
-     if not headers:
-         include_paths = set()
-         cpath = os.environ.get("CPATH", "").strip()
-@@ -65,7 +65,10 @@ def create_ecodes(headers=None):
- 
-     print("writing %s (using %s)" % (ecodes_c_path, " ".join(headers)))
-     with ecodes_c_path.open("w") as fh:
--        cmd = [sys.executable, "src/evdev/genecodes_c.py", "--ecodes", *headers]
-+        cmd = [sys.executable, "src/evdev/genecodes_c.py"]
-+        if reproducibility:
-+            cmd.append("--reproducibility")
-+        cmd.extend(["--ecodes", *headers])
-         run(cmd, check=True, stdout=fh)
- 
- 
-@@ -74,17 +77,21 @@ class build_ecodes(Command):
- 
-     user_options = [
-         ("evdev-headers=", None, "colon-separated paths to input subsystem headers"),
-+        ("reproducibility", None, "hide host details (host/paths) to create a reproducible output"),
-     ]
- 
-     def initialize_options(self):
-         self.evdev_headers = None
-+        self.reproducibility = False
- 
-     def finalize_options(self):
-         if self.evdev_headers:
-             self.evdev_headers = self.evdev_headers.split(":")
-+        if self.reproducibility is None:
-+            self.reproducibility = False
- 
-     def run(self):
--        create_ecodes(self.evdev_headers)
-+        create_ecodes(self.evdev_headers, reproducibility=self.reproducibility)
- 
- 
- class build_ext(_build_ext.build_ext):
-diff --git a/src/evdev/genecodes_c.py b/src/evdev/genecodes_c.py
-index 5c2d946..24cad27 100644
---- a/src/evdev/genecodes_c.py
-+++ b/src/evdev/genecodes_c.py
-@@ -15,22 +15,27 @@ headers = [
-     "/usr/include/linux/uinput.h",
- ]
- 
--opts, args = getopt.getopt(sys.argv[1:], "", ["ecodes", "stubs"])
-+opts, args = getopt.getopt(sys.argv[1:], "", ["ecodes", "stubs", "reproducibility"])
- if not opts:
--    print("usage: genecodes.py [--ecodes|--stubs] <headers>")
-+    print("usage: genecodes.py [--ecodes|--stubs] [--reproducibility] <headers>")
-     exit(2)
- 
- if args:
-     headers = args
- 
-+reproducibility = ("--reproducibility", "") in opts
-+
- 
- # -----------------------------------------------------------------------------
- macro_regex = r"#define\s+((?:KEY|ABS|REL|SW|MSC|LED|BTN|REP|SND|ID|EV|BUS|SYN|FF|UI_FF|INPUT_PROP)_\w+)"
- macro_regex = re.compile(macro_regex)
- 
--# Uname without hostname.
--uname = list(os.uname())
--uname = " ".join((uname[0], *uname[2:]))
-+if reproducibility:
-+    uname = "hidden for reproducibility"
-+else:
-+    # Uname without hostname.
-+    uname = list(os.uname())
-+    uname = " ".join((uname[0], *uname[2:]))
- 
- 
- # -----------------------------------------------------------------------------
-@@ -138,5 +143,5 @@ elif ("--stubs", "") in opts:
-     template = template_stubs
- 
- body = os.linesep.join(body)
--text = template % (uname, headers, body)
-+text = template % (uname, headers if not reproducibility else ["hidden for reproducibility"], body)
- print(text.strip())
diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb b/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb
rename to meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
index af88770c59..28c8ea4bc1 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/gvalkov/python-evdev"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d7bd1cc4c71b706c7e2d4053aef50f2a"
 
-SRC_URI += "file://0001-Add-a-reproducibility-option-for-building-ecodes.c.patch"
-SRC_URI[sha256sum] = "dc640a064cb1c9fe1f8b970dc2039945a2a275d7b7ee62284bf427238abe45ee"
+SRC_URI[sha256sum] = "5d3278892ce1f92a74d6bf888cc8525d9f68af85dbe336c95d1c87fb8f423069"
 
 inherit pypi python_setuptools_build_meta
 
@@ -14,7 +13,7 @@ do_compile:prepend() {
 
 PEP517_BUILD_OPTS = "--config-setting=--build-option='build_ecodes \
     --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h \
-    --reproducibility'"
+    --reproducible'"
 
 RDEPENDS:${PN} += "\
     python3-ctypes \
-- 
2.34.1


