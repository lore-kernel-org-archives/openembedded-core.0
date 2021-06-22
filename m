Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web08.157.1624400302505095416
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 15:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CmWshCIJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: andrea.adami@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id s6so785089edu.10
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 15:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=e+tr4EcL7JYokTMgB42Uo6+8oQwOHb0qxUXj8z3XVlI=;
        b=CmWshCIJIiZTdOlnHnFdeXELxG4JAZ71w+eNzA5McNjZpFLq+ZACnCl2KfY1aOSYI7
         FxT+u0GwrdpjGHfIk8cqAYHfkUFuV+HgY2u0qkPAaq/sRXhz7amjbXlT/Y6rey7YI8iK
         YVjDSxoJ8JO9Nj1wSYJPkf69lnLF6ayKrFzNUTpjCmYvcdVct2vzYNyQuWoIwgrt95+S
         CDKI2sI5P8WJNCbe60pI8gLex+3mYUEvMXNAF8NtvSUDbIpiAZjge+QQl82IcG4F9gVJ
         bwkVoqupR/2oDd7vH89uX2iBFnpLTEjzGjM+9w4/Xlw/3JbyXhD5DANgcxzp+QLA4JbI
         WeOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=e+tr4EcL7JYokTMgB42Uo6+8oQwOHb0qxUXj8z3XVlI=;
        b=knZJC/qYSjHgph45fTJUrH0EZmCZ5dPnMdBbitgrT4ykBogCBj5b6be6anTQ3jkVoI
         Pu+Q34orkRwuZI9QBqeVCH8rPjuz9Ls9SbrHRi4B2NWstEpfvvKCTtv5p/VHqGfJ0XSd
         swBk85l3fXbQrNsvpToNpb1PfaDRkeGbG3+bJAte3x25JyTxETaBXuwBWmXJ7irD3M7H
         7YVRt2wHq9cY1OQ4RW2DefF/w7JaRUKO38iVqYTBB6YyH7iklm1/Ow9KEiWWfU9YnWxV
         xAgv7jPF0shn/tcZQMglSLfisslW6LcEf6sVHMzmqRvczRETkkkXaXRk8HwS+Hsfsc9G
         9S9w==
X-Gm-Message-State: AOAM533wuM/u7xxgCFtkuShyOCc5syt9J7skxxHceqvk42bA9yS+cJUl
	Odz4UdLAvTlRXmA0bkvVpFs7HPCm4D4DxVev
X-Google-Smtp-Source: ABdhPJxTqQ4lCC/ZsMU1+yWprCxFjbiEUBkiyu/OZhTbHJ2FN1Ar8hqAhqtRmD0cTmqRVRQ36PKG4w==
X-Received: by 2002:a05:6402:50ce:: with SMTP id h14mr8161534edb.219.1624400300673;
        Tue, 22 Jun 2021 15:18:20 -0700 (PDT)
Return-Path: <andrea.adami@gmail.com>
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it (host-87-0-253-36.retail.telecomitalia.it. [87.0.253.36])
        by smtp.googlemail.com with ESMTPSA id j22sm6644476ejt.11.2021.06.22.15.18.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 15:18:20 -0700 (PDT)
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] kernel.bbclass: run read_package_metadata only if packaging is enabled
Date: Wed, 23 Jun 2021 00:18:17 +0200
Message-Id: <20210622221818.4613-1-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1

As exposed in the ML
https://lists.openembedded.org/g/openembedded-core/message/153000

up to commit 86142da in Gatesgarth it was possible to build a second mini-kernel w/out
modules to be just deployed and collected by other recipes.

These kernels use special care to avoid packaging:

inherit nopackages

PACKAGES = ""
PROVIDES = ""

Now the change in kernel.bblass calls a packaging routine:
do_deploy[prefuncs] += "read_subpackage_metadata"

As a result the kernel build fails.

Fix this using bb.data.inherits_class() to verify the
possible previous inherit of nopackages.bbclass.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/classes/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 379bed44f2..06e6446a08 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -771,8 +771,8 @@ kernel_do_deploy() {
 }
 
 # We deploy to filenames that include PKGV and PKGR, read the saved data to
-# ensure we get the right values for both
-do_deploy[prefuncs] += "read_subpackage_metadata"
+# ensure we get the right values for both. Do this only if packaging is enabled.
+do_deploy[prefuncs] += "${@ '' if bb.data.inherits_class('nopackages', d) else 'read_subpackage_metadata' }"
 
 addtask deploy after do_populate_sysroot do_packagedata
 
-- 
2.17.1

