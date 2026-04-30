Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F4EFF8873
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 12:23:46 +0000 (UTC)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19108.1777551821331707906
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 05:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WY+3ngkg;
 spf=pass (domain: mvista.com, ip: 74.125.82.179, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso816658eec.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 05:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1777551821; x=1778156621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3e7PKlvod8ByimSkAjW76FNMn8O+/drdZ3dyhrLK98U=;
        b=WY+3ngkgjn5WoeVo9c64/T/mwYTSGKzyLR8wv9+MCy7HKLp3wx2NOrVn5NcrrBUeN7
         nh0vaHHxq/z2J14pVJm9VWCCqaaPfQEATX8VQTH+hdl0u8/2Bz2S7+X9JFgWg1n1yh5o
         wLKuYMH+Uo/gdyIsXDZpZ6yTn71dh+LGbYOzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777551821; x=1778156621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3e7PKlvod8ByimSkAjW76FNMn8O+/drdZ3dyhrLK98U=;
        b=RGBTpWRpX83Tm6cjNzQlK31tBYfSsg+odZRWli0sEJuxZcQGpS2J945qln0zVpA/vs
         5MhmzAVmIbkeg2mdvtOHgNz7yHG736YDJRlCgcWMWiz9iH2FrrGU5tR6SN435I30TsIC
         OBg4BDY0d/yCLYb8jM3TLI7vpmzefZLO4MTmGwHHJWUhgTECbb9k/Y3GDm76/80YDife
         9WUZctSGyRyk4m4fEMhMUlv3LBNbznQpKFu78BQo4SkjznTvqjm6wb2hF0ckqNlCgxg/
         zTLedVJ1WOiJwgmEORTW1L9S1gMqiUIO7K3JCwXN3RZaKb4k86pVOjprv44N+VTXERO3
         TLCA==
X-Gm-Message-State: AOJu0YxqCbubPZEutLk/bYiKMC5DbOLBC5Cjfi/kOpYJSr4rR+LZ3z3e
	x4+AcqDAMeUYqvxIBmx6cjVm17XZyKMrbWZkjrGQVzZRvWiOZczYp5M4AmYQjvtzqttsgaavPjb
	J3N1D2fA=
X-Gm-Gg: AeBDievOX6N1fGhDklK4ijoiaqFPUQMUofs5cA6ZXyszS0GlNErm8MynTuk4XKJR8kA
	+RfGTpTSXElEGPKzsW/jApA8Uxgwgsnejc3ScAlwj0fijff3bin1wWgEXIr+O2MTPIgN1ce4R+R
	ddOF99Puhb+m5hwVvwVkSSrZk+c3QI4+0vuBJvJe/fK6gA6TTLByj8gTJbF/U7A95vNFFXrKRJS
	LvcBO13iBhs32OgocwVG+rfj5VFm9cmBm9w7Ft9CeGrGbd9BNiBq+EKCyNQMy3VVrybUBHAjofd
	74gTvTdMtDgXa8Jew5uB0KOoXDHK0rSXgqW/5ObLdwaNpPK3GkmLxFrV4F2oSbQPIL7yVeqhYMn
	P4RVYJl0JCe25MC58Tg181F90vjtcSAOXYLfj8Zfv+H7I6CKre1ccK0o2kOfnjt3CShJxKtboR7
	bDboEGCMU7jJPuRfQ5piIUOOCCMLvcwZmIoHcpvRBOTh4WmB5vI3Xhx5/u
X-Received: by 2002:a05:7301:618:b0:2c1:82c2:bc31 with SMTP id 5a478bee46e88-2ed4f1bafbfmr940256eec.10.1777551820380;
        Thu, 30 Apr 2026 05:23:40 -0700 (PDT)
Received: from MVIN00013.mvista.com ([43.249.234.253])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1c09b911sm8915071eec.23.2026.04.30.05.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:23:39 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] vim: fix for CVE-2026-39881
Date: Thu, 30 Apr 2026 17:53:24 +0530
Message-ID: <20260430122326.642225-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 12:23:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236161

Pick patch from [1] also mentioned at Debian report in [2]

[1] https://github.com/vim/vim/commit/7ab76a86048ed492374ac6b19c6cb52f89a365b4
[2] https://security-tracker.debian.org/tracker/CVE-2026-39881

More details: https://nvd.nist.gov/vuln/detail/CVE-2026-39881

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-39881.patch            | 248 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 249 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-39881.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-39881.patch b/meta/recipes-support/vim/files/CVE-2026-39881.patch
new file mode 100644
index 0000000000..e0d21c5f23
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-39881.patch
@@ -0,0 +1,248 @@
+From 7ab76a86048ed492374ac6b19c6cb52f89a365b4 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Tue, 7 Apr 2026 17:32:02 +0000
+Subject: [PATCH] patch 9.2.0316: [security]: command injection in netbeans
+ interface via defineAnnoType
+
+Problem:  [security]: The netbeans defineAnnoType command passes typeName, fg and bg
+          unsanitized to coloncmd(), allowing a malicious server to inject
+          arbitrary Ex commands via '|'. Similarly, specialKeys does not
+          validate key tokens before building a map command.
+Solution: Validate typeName, fg and bg against an allowlist of safe
+          characters before passing them to coloncmd()
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-mr87-rhgv-7pw6
+
+Supported by AI
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-39881
+Upstream-Status: Backport [https://github.com/vim/vim/commit/7ab76a86048ed492374ac6b19c6cb52f89a365b4]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ runtime/doc/netbeans.txt      |  4 +--
+ runtime/doc/tags              |  1 +
+ src/errors.h                  |  3 ++-
+ src/netbeans.c                | 46 ++++++++++++++++++++++++++++++++++-
+ src/po/vim.pot                |  5 +++-
+ src/testdir/test_netbeans.py  |  4 ++-
+ src/testdir/test_netbeans.vim | 38 +++++++++++++++++++++++++++++
+ 7 files changed, 96 insertions(+), 7 deletions(-)
+
+diff --git a/runtime/doc/netbeans.txt b/runtime/doc/netbeans.txt
+index ca32f06f66..fa53eae784 100644
+--- a/runtime/doc/netbeans.txt
++++ b/runtime/doc/netbeans.txt
+@@ -1,4 +1,4 @@
+-*netbeans.txt*  For Vim version 9.1.  Last change: 2025 Aug 10
++*netbeans.txt*  For Vim version 9.1.  Last change: 2026 Apr 30
+ 
+ 
+ 		  VIM REFERENCE MANUAL    by Gordon Prieur et al.
+@@ -847,7 +847,7 @@ REJECT		Not used.
+ These errors occur when a message violates the protocol:
+ *E627* *E628* *E629* *E632* *E633* *E634* *E635* *E636*
+ *E637* *E638* *E639* *E640* *E641* *E642* *E643* *E644* *E645* *E646*
+-*E647* *E648* *E650* *E651* *E652*
++*E647* *E648* *E649* *E650* *E651* *E652*
+ 
+ 
+ ==============================================================================
+diff --git a/runtime/doc/tags b/runtime/doc/tags
+index 8af54eae0a..300dfd18a6 100644
+--- a/runtime/doc/tags
++++ b/runtime/doc/tags
+@@ -5236,6 +5236,7 @@ E645	netbeans.txt	/*E645*
+ E646	netbeans.txt	/*E646*
+ E647	netbeans.txt	/*E647*
+ E648	netbeans.txt	/*E648*
++E649	netbeans.txt	/*E649*
+ E65	pattern.txt	/*E65*
+ E650	netbeans.txt	/*E650*
+ E651	netbeans.txt	/*E651*
+diff --git a/src/errors.h b/src/errors.h
+index 5d6867464b..01ed16a035 100644
+--- a/src/errors.h
++++ b/src/errors.h
+@@ -1664,7 +1664,8 @@ EXTERN char e_invalid_buffer_identifier_in_setdot[]
+ 	INIT(= N_("E647: Invalid buffer identifier in setDot"));
+ EXTERN char e_invalid_buffer_identifier_in_close[]
+ 	INIT(= N_("E648: Invalid buffer identifier in close"));
+-// E649 unused
++EXTERN char e_invalid_identifier_in_defineannotype[]
++	INIT(= N_("E649: Invalid identifier name in defineAnnoType"));
+ EXTERN char e_invalid_buffer_identifier_in_defineannotype[]
+ 	INIT(= N_("E650: Invalid buffer identifier in defineAnnoType"));
+ EXTERN char e_invalid_buffer_identifier_in_addanno[]
+diff --git a/src/netbeans.c b/src/netbeans.c
+index 8a341a20be..599cdc1994 100644
+--- a/src/netbeans.c
++++ b/src/netbeans.c
+@@ -40,6 +40,11 @@
+ #define GUARDEDOFFSET 1000000 // base for "guarded" sign id's
+ #define MAX_COLOR_LENGTH 32 // max length of color name in defineAnnoType
+ 
++// Characters valid in a sign/highlight group name
++#define VALID_CHARS         (char_u *)"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
++#define VALID_SIGNNAME_CHARS    VALID_CHARS "_"
++#define VALID_COLOR_CHARS       VALID_CHARS "#"
++
+ // The first implementation (working only with Netbeans) returned "1.1".  The
+ // protocol implemented here also supports A-A-P.
+ static char *ExtEdProtocolVersion = "2.5";
+@@ -77,6 +82,22 @@ static int dosetvisible = FALSE;
+ static int needupdate = 0;
+ static int inAtomic = 0;
+ 
++/*
++ * Return TRUE if "str" contains only characters from "allowed".
++ * Used to validate NetBeans-supplied strings before interpolating them
++ * into Ex commands via coloncmd().
++ */
++    static int
++nb_is_safe_string(char_u *str, char_u *allowed)
++{
++    if (str == NULL)
++	return FALSE;
++    for (char_u *p = str; *p != NUL; p++)
++	if (vim_strchr(allowed, *p) == NULL)
++	    return FALSE;
++    return TRUE;
++}
++
+ /*
+  * Callback invoked when the channel is closed.
+  */
+@@ -1949,6 +1970,15 @@ nb_do_cmd(
+ 		VIM_CLEAR(typeName);
+ 		parse_error = TRUE;
+ 	    }
++	    else if (!nb_is_safe_string(typeName, VALID_SIGNNAME_CHARS) ||
++		    (*fg != NUL && !nb_is_safe_string(fg, VALID_COLOR_CHARS)) ||
++		    (*bg != NUL && !nb_is_safe_string(bg, VALID_COLOR_CHARS)))
++	    {
++		nbdebug(("    invalid chars in typeName/fg/bg in defineAnnoType\n"));
++		emsg(_(e_invalid_identifier_in_defineannotype));
++		VIM_CLEAR(typeName);
++		parse_error = TRUE;
++	    }
+ 	    else if (typeName != NULL && tooltip != NULL && glyphFile != NULL)
+ 		addsigntype(buf, typeNum, typeName, tooltip, glyphFile, fg, bg);
+ 
+@@ -2321,11 +2351,25 @@ special_keys(char_u *args)
+ 
+ 	if (strlen(tok) + i < KEYBUFLEN)
+ 	{
+-	    strcpy(&keybuf[i], tok);
++	    // Only allow alphanumeric and function-key name characters.
++	    // Reject anything else to prevent map command injection.
++	    int safe = TRUE;
++	    for (char_u *tp = (char_u *)tok; *tp != NUL; tp++)
++	    {
++		if (!ASCII_ISALNUM(*tp) && *tp != '-')
++		{
++		    safe = FALSE;
++		    break;
++		}
++	    }
++	    if (safe)
++	    {
++	    vim_strncpy((char_u *)&keybuf[i], (char_u *)tok, KEYBUFLEN - i - 1);
+ 	    vim_snprintf(cmdbuf, sizeof(cmdbuf),
+ 				 "<silent><%s> :nbkey %s<CR>", keybuf, keybuf);
+ 	    do_map(MAPTYPE_MAP, (char_u *)cmdbuf, MODE_NORMAL, FALSE);
+ 	}
++    }
+ 	tok = strtok(NULL, " ");
+     }
+     vim_free(save_str);
+diff --git a/src/po/vim.pot b/src/po/vim.pot
+index bf44567726..9608271418 100644
+--- a/src/po/vim.pot
++++ b/src/po/vim.pot
+@@ -8,7 +8,7 @@ msgid ""
+ msgstr ""
+ "Project-Id-Version: Vim\n"
+ "Report-Msgid-Bugs-To: vim-dev@vim.org\n"
+-"POT-Creation-Date: 2025-08-23 16:16+0200\n"
++"POT-Creation-Date: 2026-04-30 12:40+0200\n"
+ "PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE\n"
+ "Last-Translator: FULL NAME <EMAIL@ADDRESS>\n"
+ "Language-Team: LANGUAGE <LL@li.org>\n"
+@@ -5866,6 +5866,9 @@ msgstr ""
+ msgid "E648: Invalid buffer identifier in close"
+ msgstr ""
+ 
++msgid "E649: Invalid identifier name in defineAnnoType"
++msgstr ""
++
+ msgid "E650: Invalid buffer identifier in defineAnnoType"
+ msgstr ""
+ 
+diff --git a/src/testdir/test_netbeans.py b/src/testdir/test_netbeans.py
+index 585886fb40..ba5fd638ec 100644
+--- a/src/testdir/test_netbeans.py
++++ b/src/testdir/test_netbeans.py
+@@ -113,7 +113,9 @@ class ThreadedTCPRequestHandler(socketserver.BaseRequestHandler):
+                   'endAtomic_Test' : '0:endAtomic!95\n',
+                   'AnnoScale_Test' : "".join(['2:defineAnnoType!60 ' + str(i) + ' "s' + str(i) + '" "x" "=>" blue none\n' for i in range(2, 26)]),
+                   'detach_Test' : '2:close!96\n1:close!97\nDETACH\n',
+-                  'specialKeys_overflow_Test' : '0:specialKeys!200 "' + 'A'*80 + '-X"\n'
++                  'specialKeys_overflow_Test' : '0:specialKeys!200 "' + 'A'*80 + '-X"\n',
++                  'defineAnnoType_injection_Test': '1:defineAnnoType!1 "MySign guifg=red|call writefile([\'inject\'],\'Xinject\')|" "tooltip" "glyphFile" 1 2\n'
++
+ 
+                 }
+                 # execute the specified test
+diff --git a/src/testdir/test_netbeans.vim b/src/testdir/test_netbeans.vim
+index d1be5066ef..a464c63acc 100644
+--- a/src/testdir/test_netbeans.vim
++++ b/src/testdir/test_netbeans.vim
+@@ -1024,4 +1024,42 @@ func Test_nb_specialKeys_overflow()
+   call s:run_server('Nb_specialKeys_overflow')
+ endfunc
+ 
++func Nb_defineAnnoType_injection(port)
++  call writefile([], "Xnetbeans", 'D')
++  let g:last = 0
++
++  exe 'nbstart :localhost:' .. a:port .. ':bunny'
++  call assert_true(has("netbeans_enabled"))
++  call WaitFor('len(ReadXnetbeans()) > (g:last + 2)')
++  let g:last += 3
++
++  split Xcmdbuf
++  let cmdbufnr = bufnr()
++  call WaitFor('len(ReadXnetbeans()) > (g:last + 2)')
++  let g:last += 3
++  hide
++
++  sleep 1m
++
++  call delete('Xinject')
++  call appendbufline(cmdbufnr, '$', 'defineAnnoType_injection_Test')
++  " E475 from :sign is expected — catch it before RunServer sees it.
++  " give it a bit of time to process it
++  try
++    sleep 500m
++  catch /E475/
++  catch /E649/
++  endtry
++
++  " Injected call must not have created this file
++  call assert_false(filereadable('Xinject'))
++  call delete('Xinject')
++  bwipe! Xcmdbuf
++  nbclose
++endfunc
++
++func Test_nb_defineAnnoType_injection()
++  call ch_log('Test_nb_defineAnnoType_injection')
++  call s:run_server('Nb_defineAnnoType_injection')
++endfunc
+ " vim: shiftwidth=2 sts=2 expandtab
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 9456cf3e13..1396ac4fbc 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-33412.patch \
            file://CVE-2026-28418.patch \
            file://CVE-2026-28419.patch \
+           file://CVE-2026-39881.patch \
            "
 
 PV .= ".1683"
-- 
2.50.1


