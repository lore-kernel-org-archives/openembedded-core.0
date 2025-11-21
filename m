Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69931CFC28D
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 15:42:17 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14147.1763739727367450526
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 07:42:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=THJi01uQ;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5958187fa55so1733239e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 07:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763739725; x=1764344525; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ny13viwL/ON5ZrsqhTWs6wg51ICMeIRVDBNeO195g20=;
        b=THJi01uQcsRl5xtzHlgwYD1VdxggILOOI7msSpr28WdTr7yUAnYtOMV6tysnHyMmLi
         LG9I7bxbHCXCRxtZc7uCYfwZ1qNJDKHSgOZUTGRbqzv8u1mNp+FJ20g2Mn1/98jTqfTH
         4CpERtXiYhYYQ8f3kYuyl1bamG2J5mQK14lvWHivMopvFMkkPR9WpMLSwcV/hNTt4kpr
         j2PMW3cSYuiMHcBpadIYl1GyORkxReP/chz0WZ537zh3jML21dxcY/ZCH64ELjn8fqaH
         dgkez4Xm2vqHZV3EoMZHCZ0z2VlZIixoyFVOAT2u+3vRw6bXgVecrPq70GfCs+SIzJ4D
         wE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763739725; x=1764344525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ny13viwL/ON5ZrsqhTWs6wg51ICMeIRVDBNeO195g20=;
        b=EVUd7RfrowIwcMJT6HOBi612vBA877iqBbP8gaXgUfK9yY7DcaKUqBkbD2041jquo6
         t0g6bIUk6670XeJTsra8Es/5zeK5AxF6CMgWnM477PascyCcMyP3h+zZmr+l1DG+NXWu
         sEiRXPaMnGVdAYFIxmac2IfTd+O6/YS4vqVGzUGScTE4KJb88g/BTj+EIVrHznZS1HNA
         UKxYeeDl8nDkRET7YWQw4Tr5bVZnUonx2ht+9306QVIFuKU+sEo8ZeBhAiXaEJtLwwZ3
         CjkTp0oRoKL3bTI+7JBf42CsOSpmGgjzWEZU3RgDK2DiG3XVnMdKRbV4jrLhRIJ222ww
         zpNA==
X-Gm-Message-State: AOJu0YwNx08Dq2DrePatLAHenBqzN96gukHFubkMpvDAs2miTK8ejVv3
	4WJD7BFnhh6s5ZPSZSDM0ezRltM+jE/aT53ZwUI4U2QiCkEtaoNrHPPJzHPjq8yhBFZ089S+wji
	XKi6S1W0=
X-Gm-Gg: ASbGncsaXqr8qDb+WjyBkGURa/mdCKXjPRUpTvvAkh4FyItyQ6gpr+ALxc+TM7RFFgG
	eWWlGw+L9gB9eQ0/nJp1zw/nRBbMp8/7+KEypCPDBtmdCuxjQ5wzMNBrITvWgSyQ/2onfbyHpFd
	eTZ261wi22br97+GllwaeYc5twP1ZGpSK/+e53E4DTkT0fDm3w5gU5gaFDv5j8lf2TCouO14TV1
	L9iNMiLhVcsrPxnuekZERKcNoFnJxhegiLYI90QHZxMlMA/4dZ8J80dWLe3N3tqeVE8/0cFVHCH
	eoGtR4tCzjRvx8bE1hL/b1eD4h1WwaFKKKWQVzQNwn008/XcHU5UKKBqNsiYI4JjhXdYJdFfjAY
	IObMV85CUdZbX9I7cxr0imqXZljtoxuiAHwVBaUIIJsULFHUcsweFBhSs7qDODW7l4YUrQZu2Ei
	LO//07wvzEjGFhgBaX1XZUP5HjUrum9GNXqUU+16Hiai8CyHk6hQDXub8=
X-Google-Smtp-Source: AGHT+IFXtZDpnzqS2+mD5hcpvb56AY5ELQO/CCH6RRqXtYCbt50ic1WTxl6YjnawJdYmhiqi3xPJ4Q==
X-Received: by 2002:a05:6512:ac6:b0:594:1957:a36b with SMTP id 2adb3069b0e04-596a3e9eb10mr958745e87.2.1763739725094;
        Fri, 21 Nov 2025 07:42:05 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db75705sm1720511e87.15.2025.11.21.07.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 07:42:04 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2] testexport.bbclass: export bitbake/lib
Date: Fri, 21 Nov 2025 17:41:39 +0200
Message-ID: <20251121154139.1232410-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 15:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226688

utils/httpserver.py now depends on bb and multiprocessing.

Fixes oeqa test execution:

https://ledge.validation.linaro.org/scheduler/job/123974

ImportError: Failed to import test module: apt
Traceback (most recent call last):
  File "/usr/lib/python3.13/unittest/loader.py", line 396, in _find_test_path
    module = self._get_module_from_name(name)
  File "/usr/lib/python3.13/unittest/loader.py", line 339, in _get_module_from_name
    __import__(name)
    ~~~~~~~~~~^^^^^^
  File "/lava-downloads/core-image-sato/meta/lib/oeqa/runtime/cases/apt.py", line 8, in <module>
    from oeqa.utils.httpserver import HTTPService
  File "/lava-downloads/core-image-sato/meta/lib/oeqa/utils/httpserver.py", line 9, in <module>
    from bb import multiprocessing
ModuleNotFoundError: No module named 'bb'

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/testexport.bbclass | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

v2: changed from python import workaround to exporting bitbake/lib in
    testexport.bbclass as requested by Richard

v1: https://lists.openembedded.org/g/openembedded-core/message/226668

diff --git a/meta/classes-recipe/testexport.bbclass b/meta/classes-recipe/testexport.bbclass
index 843d777e3b..344ae489b5 100644
--- a/meta/classes-recipe/testexport.bbclass
+++ b/meta/classes-recipe/testexport.bbclass
@@ -84,6 +84,7 @@ def copy_needed_files(d, tc):
     from oeqa.core.utils.test import getSuiteCasesFiles
 
     export_path = d.getVar('TEST_EXPORT_DIR')
+    bitbake_path = d.getVar('BITBAKEPATH')
     corebase_path = d.getVar('COREBASE')
     bblayers = d.getVar('BBLAYERS').split()
 
@@ -91,9 +92,18 @@ def copy_needed_files(d, tc):
     oe.path.remove(export_path)
     bb.utils.mkdirhier(os.path.join(export_path, 'lib', 'oeqa'))
 
-    # The source of files to copy are relative to 'COREBASE' directory
-    # The destination is relative to 'TEST_EXPORT_DIR'
-    # core files/dirs first
+    # The source of files to copy are relative to 'BITBAKEPATH' and 'COREBASE'
+    # directory. The destination is relative to 'TEST_EXPORT_DIR'.
+    # bitbake and core files/dirs first.
+    bitbake_files_to_copy = [os.path.join('..', 'lib')]
+    for f in bitbake_files_to_copy:
+        src = os.path.join(bitbake_path, f)
+        dst = os.path.join(export_path, 'bitbake', f.split('/', 1)[-1])
+        if os.path.isdir(src):
+            oe.path.copytree(src, dst)
+        else:
+            shutil.copy2(src, dst)
+
     core_files_to_copy = [ os.path.join('scripts', 'oe-test'),
                       os.path.join('scripts', 'lib', 'argparse_oe.py'),
                       os.path.join('scripts', 'lib', 'scriptutils.py'), ]
-- 
2.34.1


