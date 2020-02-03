Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 59BB160974
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 22:44:22 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id s10so1102256wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 14:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gUPm3njcy846BkMXoKSjnRp88lQ4Nq4NmQ7lxVgGbEY=;
	b=uARESDCQLDthscndaTgX1Ehu3qTRmUEOxnM3g1iIaSIu1q6tpPbD2pDupEKiCLt9Y1
	f9o0QyiQ9YZoZhseCDHWoIayVyB6YKsbe9Yz2jUcnlgUpYmud82kYAGZgIIlgXtVoGSE
	8K+J6yqTBxOhvOxbTglSyoTvkVLr4jAQZ8R3trtRGB/1p49vTTUVm+BVhIwFnTt9Os5h
	enQeTbFISr/NFrAgVI7/Wk1UevysR+c14YKAGor01S7mH5Lz6CvbU7uokgd/+ZkReAyY
	U4fHcAkChLE+UxS5VdzfpCchD/IugdDvPt9goA2mZScywoKsjTtEJG+G1JFg0B7X0gHj
	znag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gUPm3njcy846BkMXoKSjnRp88lQ4Nq4NmQ7lxVgGbEY=;
	b=C7PfsG0A+rNGxmVVDTaZWtPkER4312O4XjOzmU3nSvc5J1nsNir/e3G2/M/e6aD9a/
	xbD00NnieFJxQ4VJQcj3w+gT9ynGpOliZMUmyODDui1tuDZRmjzNOsWi9bazvgv/5Jt+
	UkHpA8rPaU3ALOlLCYg6BB86WS6M+k1qyXTft16utq8Trdkd4gOyPqfyAf95cm20QYAZ
	nRN0BuM2Q54/PP8WkY26t/DECYGt1lnWRDVVXq9dk8S2tJzY4A6A2FMOD7Zk+KGwN57L
	vYpS/xpN7xAe2SpVW/6alFjmShHRFD4q8vGCGAQu4LF/8xpTTMeBTlgJxjQPodh69oXH
	8+9A==
X-Gm-Message-State: APjAAAVwkUKurqNQUAp3ERdB/6YLNDoGHmM9cAiFdrJVEXzSNNk051dj
	IUDzxTIwgBIEIG+Sm5xLopYaiflg
X-Google-Smtp-Source: APXvYqx+OYqcumE5dV5JmCgVqPZF99XeLu5xdHqhL8T9W0OXeEOA/l7GK+2JQYVvAQZFHKgvfejqXA==
X-Received: by 2002:a1c:b789:: with SMTP id h131mr1232842wmf.148.1580769862665;
	Mon, 03 Feb 2020 14:44:22 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	b11sm11950038wrx.89.2020.02.03.14.44.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Feb 2020 14:44:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2020 23:44:20 +0100
Message-Id: <20200203224420.4801-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] kernel-yocto.bbclass: export LD in the environment used by kconf_check
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Feb 2020 22:44:22 -0000
Content-Transfer-Encoding: 8bit

* resolves following exceptions in log.do_kernel_configcheck:
DEBUG: Executing python function do_kernel_configcheck
Traceback (most recent call last):
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2776, in _expand_macro
    res += args[int(new_args[0])]
ValueError: invalid literal for int() with base 10: 'error-if'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/symbol_why.py", line 295, in <module>
    conf = kconfiglib.Kconfig( kconf, show_errors, show_errors )
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 947, in __init__
    self._init(filename, warn, warn_to_stderr, encoding)
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 1085, in _init
    self._parse_block(None, self.top_node, self.top_node).next = None
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2982, in _parse_block
    prev = self._parse_block(None, parent, prev)
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2907, in _parse_block
    while self._next_line():
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2234, in _next_line
    self._tokens = self._tokenize(line)
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2364, in _tokenize
    self._parse_assignment(s)
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2604, in _parse_assignment
    s, i = self._expand_macro(s, i, ())
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2780, in _expand_macro
    res += self._fn_val(new_args)
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2843, in _fn_val
    return py_fn(self, *args)
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 6769, in _error_if_fn
    kconf.filename, kconf.linenr, msg))
kconfiglib.KconfigError: scripts/Kconfig.include:39:  gold linker 'x86_64-oe-linux-ld --sysroot=/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot  ' not supported
Traceback (most recent call last):
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2776, in _expand_macro
    res += args[int(new_args[0])]
ValueError: invalid literal for int() with base 10: 'error-if'

* there is still 291 mismatched options in default 5.4.15 builds,
  but at least the 11804 lines long log doesn't start with 9022 lines of above exceptions

  DEBUG: Executing python function do_kernel_configcheck
  [mismatch (291)]: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/cfg/mismatch.txt
     There were hardware options requested that do not
     have a corresponding value present in the final ".config" file.
     This probably means you aren't getting the config you wanted.

  WARNING: [kernel config]: specified values did not make it into the kernel's final configuration:
  ...

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 87c681f1c3..141eeafeb9 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -370,6 +370,7 @@ python do_kernel_configcheck() {
 
     env = os.environ.copy()
     env['PATH'] = "%s:%s%s" % (d.getVar('PATH'), s, "/scripts/util/")
+    env['LD'] = "${KERNEL_LD}"
 
     try:
         configs = subprocess.check_output(['scc', '--configs', '-o', s + '/.kernel-meta'], env=env).decode('utf-8')
-- 
2.20.1


