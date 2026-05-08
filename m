Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62DA9CD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 06:26:56 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7591.1778221606009568927
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 23:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kJ/iudRr;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso15207515e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 23:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778221604; x=1778826404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PdzBHTty7k914pVNmhW+92GprYPRh3xCg7Rv/T5lfuE=;
        b=kJ/iudRr5jvLEaQL+7NZUGF0FVa6Lsd6gzEBarua/73fuYqriEmCsxGEl4DzAfvNAh
         TCrRMD/FGLliIDZixPSdgzICkPaX+KTlq7LEL7rfF+iFhs5BUyP5nTpwSxzn37toFEMk
         PI8SVx/T/jIXWtC57HJE4V6nNqvi/HWw6cknQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221604; x=1778826404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PdzBHTty7k914pVNmhW+92GprYPRh3xCg7Rv/T5lfuE=;
        b=kewj7zTArhqjq1LqeKuq2HH0/IwDLcZCJaO6htRDLAnEbfEoMT1Pa5rO7pY5chzBWZ
         arKi6pl0pG3dDhrSrMUqbVcukYTrb/t1EA6vDxU7x7jLVUQSAW5iIBQVQE6qid1Rnn7+
         J+GmAVVVCaPM3DtS5v++VKCF5e3mJ+8eNj6oJRszF/yobGfjvumXE+rPDRr2SKFHv5kP
         +Ob9aG/8t2s8mJQWIyMaLfOk7hDvdZA+3xDyFtBoaGnrpjkPLh3MFBIpUkRA9lLA7OIk
         Igrkf4y5eTJkNJRQsQo2d1z0awe2wKIZhkmF4lWuSy3SWrDcGnNdBcEk0rrpJxdWZP8m
         9/Og==
X-Gm-Message-State: AOJu0YwT1h1tbgteT08g5dWXEPa8CHSTNRljZ/YLDXNQtb6XfnY5BmnM
	XRzTp+KdpOLyf/zDQ7+/HfzslqiuzCl60a26NzR+ICfhH8eOjl/M2QrXIRQzfi8w2VNSVIWR/s2
	cSkUegFA=
X-Gm-Gg: AeBDieu1lEwl2H+g8xS46dchayD8hNKXa8P5gM1W6Q2Yymp/jZe3lYDxRAOKOp7ObSP
	Ev2IXRJ8ur2VhuhgwhYQd9/EDY1z0p1aT2j/l/rZXL1xJofg6OYYkHMeeswYFZXvrLJgA6hgwns
	6wss/u/CUXLt8Qg6O+gj0EFWn9h/ZXNSHYu5wd65jsQu+Fqx2banTRnyMOUc09tY/QkH5edxzXe
	MEGlAzDiL/KQlq51qnpOz/JlRcwIBbtB6cNwGdUjkmj8wbJoPH14lsmMnDtpQ3md7f4sZSjLyo2
	b3qoBFibUQEU/PZlyIllMEPIrMKBmz/RrrsPZenY/HPgGw4eTX2d2JjjxG0FT8yrZiBU2aU2Z8p
	YB94znIRARs73COdd9EBzCZaUh61CHzmXHBlwLXhkZxY7dkSfB046l5a28BDXZYx0a7RDOi1oUY
	VdHtK0vN/z/SEnakSFnZNu7wRWGUgJvl5JcBZn7XkubY84wCTaRKgFWSJnsFHx+fIoSNmD+WTMw
	gUma/kjAC3MHSVh3KvDg1OC4JCbk4wqiaKJaQ==
X-Received: by 2002:a05:600c:c107:b0:48e:51f8:eb37 with SMTP id 5b1f17b1804b1-48e51f8eb65mr135974015e9.25.1778221603970;
        Thu, 07 May 2026 23:26:43 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68ec5c49sm15202695e9.11.2026.05.07.23.26.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:26:43 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/8] vim: fix for CVE-2026-39881
Date: Fri,  8 May 2026 08:25:55 +0200
Message-ID: <e92dd3b16cd75d9c765f0ff4bc84fbdda8c3dca6.1778198884.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198884.git.yoann.congal@smile.fr>
References: <cover.1778198884.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 06:26:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236635

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] also mentioned at Debian report in [2]

[1] https://github.com/vim/vim/commit/7ab76a86048ed492374ac6b19c6cb52f89a365b4
[2] https://security-tracker.debian.org/tracker/CVE-2026-39881

More details: https://nvd.nist.gov/vuln/detail/CVE-2026-39881

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-39881.patch            | 248 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 249 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-39881.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-39881.patch b/meta/recipes-support/vim/files/CVE-2026-39881.patch
new file mode 100644
index 00000000000..e0d21c5f239
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
index 9456cf3e13c..1396ac4fbc7 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-33412.patch \
            file://CVE-2026-28418.patch \
            file://CVE-2026-28419.patch \
+           file://CVE-2026-39881.patch \
            "
 
 PV .= ".1683"

