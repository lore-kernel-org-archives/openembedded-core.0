Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46338CDB46B
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 05:52:38 +0000 (UTC)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36809.1782107557657009925
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jun 2026 22:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WcfbsM3C;
 spf=pass (domain: mvista.com, ip: 74.125.82.54, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-139a71baa35so5610615c88.0
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Jun 2026 22:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1782107557; x=1782712357; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YUnLr4a2i2+0wnsae1xMhshdd+PJxZugJ9M1zoDJ/Is=;
        b=WcfbsM3C3zkW5sg4ET9yK4yvZB7R7ikAtNbE+JeZH1rVcuc6PAvxE+1WsBv8FBJLHa
         K6PWX9Xyhq94aj2uhT5yOg1D9uPEXqUwK55iE16ct1ZqY57t+SeYqTNLSH1Qlpr/mKRo
         K+kaPbOu7NEbNIMG7cIn4UhVtJuG7ZCmWpLaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782107557; x=1782712357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUnLr4a2i2+0wnsae1xMhshdd+PJxZugJ9M1zoDJ/Is=;
        b=g1lFU2IfXRXbjrY2Nqbci9Tjr6MjbxKtWKSDt+vllS2VY35Xi/IA6wBFQ8Y2/sw3Km
         8MYMiUEYBp0sf2b8BJdMrva6m4G3uANGOLzQbXbu2sj3rlugPBiRqsvvFDqQegmmUbbp
         po+iB/Sl4XRmwAJxMLTzxJMX9ICSnPrxNef+sKWl5BMXHG2ov5CSIkDnZYWjZjLlSt95
         sqwfl4am6ARd6pugEJfL1uTE71SVmhMe6k6RZlUgtMXjaBHa04w3cXprl0IfzjhSIkon
         AuNOziGmdzQfaKifIMpr4k1cWXmX0OOyHWwXjCHnwsmt+q/feF/r2Oi12AxiKT0klW+z
         f8ug==
X-Gm-Message-State: AOJu0Yw+bzE2y20e/IiVCBqBdzAx1LcMcWrqDmXnkD6Lfk94lUJtgwtz
	2f2GzNSykqcbYs2ZyauWjFRaP5jXTMi4J0KGJSVymbCrnFXtm1FxNTYr+N8ny1zGfi0o0TA5n9R
	DFKgH
X-Gm-Gg: AfdE7cm30vdvWqLssH3MqfBXzceF8jFpYPetihNle+dHZly0ZQ4WVKK+7XrxeaI4GHb
	+9uR1U+SZFt3MmhlbD41YkDEW3t6EQSXw57hZLbOsO8XiOKeEnzgSD0fwADsQHq3EyAQWlfcJsj
	094WmCTUT1qdxFFSTKIqK8b7zy2ozAEBp2lcvNCEh5d8933nWvvVgHu4jT9GV8U8oik7LEfPP6e
	5yf5PrmmjIqTB71ck3HBz42H0X5d+q7hqovXq46f17UpXbvKLJ/ALgK13tFLNeHn6gLvTQj6ePo
	yBaOImRCmwZD/KXF8B0RJMVajwTJT27H7BBibCkW70jy40eZO4jr5L0Hu7d3QT9VsMrxrnp5FbC
	TiG+6jAoqMS+BD2k9LZmmZ+kSVghnKspW4LHYZe3ztFFJtLjoSHMoYshmoYsoNB15h7QOwEJbLi
	fUH7eUHw+hL3Yccnmk/bhkmjgpHg==
X-Received: by 2002:a05:7022:3d18:b0:137:1ae1:bc19 with SMTP id a92af1059eb24-139a34e4cfemr7776822c88.5.1782107556810;
        Sun, 21 Jun 2026 22:52:36 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.200])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139adc0fdb6sm6264669c88.0.2026.06.21.22.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:52:36 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] vim: Fix for CVE-2026-28417, CVE-2026-32249, CVE-2026-45130
Date: Mon, 22 Jun 2026 11:22:28 +0530
Message-ID: <20260622055229.12314-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 05:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239267

Pick patch from [1], [2] & [3] also mentioned at NVD report in [4,5 & 6]

[1] https://github.com/vim/vim/commit/79348dbbc09332130f4c86045e1541d68514fcc1
[2] https://github.com/vim/vim/commit/36d6e87542cf823d833e451e09a90ee429899cec
[3] https://github.com/vim/vim/commit/92993329178cb1f72d700fff45ca86e1c2d369f8
[4] https://nvd.nist.gov/vuln/detail/CVE-2026-28417
[5] https://nvd.nist.gov/vuln/detail/CVE-2026-32249
[6] https://nvd.nist.gov/vuln/detail/CVE-2026-45130

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-28417.patch            |  92 ++++++++++++++
 .../vim/files/CVE-2026-32249.patch            | 117 ++++++++++++++++++
 .../vim/files/CVE-2026-45130.patch            | 115 +++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   3 +
 4 files changed, 327 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28417.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-32249.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-45130.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-28417.patch b/meta/recipes-support/vim/files/CVE-2026-28417.patch
new file mode 100644
index 0000000000..1136aa7f0c
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-28417.patch
@@ -0,0 +1,92 @@
+From 79348dbbc09332130f4c86045e1541d68514fcc1 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Sun, 22 Feb 2026 21:24:48 +0000
+Subject: [PATCH] patch 9.2.0073: [security]: possible command injection using
+ netrw
+
+Problem:  [security]: Insufficient validation of hostname and port in
+          netrw URIs allows command injection via shell metacharacters
+          (ehdgks0627, un3xploitable).
+Solution: Implement stricter RFC1123 hostname and IP validation.
+          Use shellescape() for the provided hostname and port.
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-m3xh-9434-g336
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport from [https://github.com/vim/vim/commit/79348dbbc09332130f4c86045e1541d68514fcc1]
+CVE: CVE-2026-28417
+Signed-off-by: Milan Satpathy <msatpathy@mvista.com>
+---
+ .../pack/dist/opt/netrw/autoload/netrw.vim    | 34 +++++++++++++------
+ 1 file changed, 24 insertions(+), 10 deletions(-)
+
+diff --git a/runtime/pack/dist/opt/netrw/autoload/netrw.vim b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+index 1c98104..7ebcd92 100644
+--- a/runtime/pack/dist/opt/netrw/autoload/netrw.vim
++++ b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+@@ -5,6 +5,7 @@
+ " 2025 Aug 07 by Vim Project (use correct "=~#" for netrw_stylesize option #17901)
+ " 2025 Aug 07 by Vim Project (netrw#BrowseX() distinguishes remote files #17794)
+ " 2025 Aug 22 by Vim Project netrw#Explore handle terminal correctly #18069
++" 2026 Feb 27 by Vim Project Make the hostname validation more strict
+ " Copyright:  Copyright (C) 2016 Charles E. Campbell {{{1
+ "             Permission is hereby granted to use and distribute this code,
+ "             with or without modifications, provided that this copyright
+@@ -2575,13 +2576,26 @@ endfunction
+ 
+ " s:NetrwValidateHostname:  Validate that the hostname is valid {{{2
+ " Input:
+-"   hostname
++"   hostname, may include an optional username, e.g. user@hostname
++"   allow a alphanumeric hostname or an IPv(4/6) address
+ " Output:
+ "  true if g:netrw_machine is valid according to RFC1123 #Section 2
+ function s:NetrwValidateHostname(hostname)
+-    " RFC1123#section-2 mandates, a valid hostname starts with letters or digits
+-    " so reject everyhing else
+-    return a:hostname =~? '^[a-z0-9]'
++  " Username:
++  let user_pat = '\%([a-zA-Z0-9._-]\+@\)\?'
++  " Hostname: 1-64 chars, alphanumeric/dots/hyphens.
++  " No underscores. No leading/trailing dots/hyphens.
++  let host_pat = '[a-zA-Z0-9]\%([-a-zA-Z0-9.]{,62}[a-zA-Z0-9]\)\?$'
++
++  " IPv4: 1-3 digits separated by dots
++  let ipv4_pat = '\%(\d\{1,3}\.\)\{3\}\d\{1,3\}$'
++
++  " IPv6: Hex, colons, and optional brackets
++  let ipv6_pat = '\[\?\%([a-fA-F0-9:]\{2,}\)\+\]\?$'
++
++  return a:hostname =~? '^'.user_pat.host_pat ||
++       \ a:hostname =~? '^'.user_pat.ipv4_pat ||
++       \ a:hostname =~? '^'.user_pat.ipv6_pat
+ endfunction
+ 
+ " NetUserPass: set username and password for subsequent ftp transfer {{{2
+@@ -8948,15 +8962,15 @@ endfunction
+ " s:MakeSshCmd: transforms input command using USEPORT HOSTNAME into {{{2
+ "               a correct command for use with a system() call
+ function s:MakeSshCmd(sshcmd)
+-    if s:user == ""
+-        let sshcmd = substitute(a:sshcmd,'\<HOSTNAME\>',s:machine,'')
+-    else
+-        let sshcmd = substitute(a:sshcmd,'\<HOSTNAME\>',s:user."@".s:machine,'')
++    let machine = shellescape(s:machine, 1)
++    if s:user != ''
++        let machine    = shellescape(s:user, 1).'@'.machine
+     endif
++    let sshcmd = substitute(a:sshcmd,'\<HOSTNAME\>',machine,'')
+     if exists("g:netrw_port") && g:netrw_port != ""
+-        let sshcmd= substitute(sshcmd,"USEPORT",g:netrw_sshport.' '.g:netrw_port,'')
++        let sshcmd= substitute(sshcmd,"USEPORT",g:netrw_sshport.' '.shellescape(g:netrw_port,1),'')
+     elseif exists("s:port") && s:port != ""
+-        let sshcmd= substitute(sshcmd,"USEPORT",g:netrw_sshport.' '.s:port,'')
++        let sshcmd= substitute(sshcmd,"USEPORT",g:netrw_sshport.' '.shellescape(s:port,1),'')
+     else
+         let sshcmd= substitute(sshcmd,"USEPORT ",'','')
+     endif
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/files/CVE-2026-32249.patch b/meta/recipes-support/vim/files/CVE-2026-32249.patch
new file mode 100644
index 0000000000..88440a3bae
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-32249.patch
@@ -0,0 +1,117 @@
+From 36d6e87542cf823d833e451e09a90ee429899cec Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Wed, 11 Mar 2026 14:16:29 +0100
+Subject: [PATCH] patch 9.2.0137: [security]: crash with composing char in
+ collection range
+
+Problem:  Using a composing character as the end of a range inside a
+          collection may corrupt the NFA postfix stack
+          (Nathan Mills, after v9.1.0011)
+Solution: When a character is used as the endpoint of a range, do not emit
+          its composing characters separately. Range handling only uses
+          the base codepoint.
+
+supported by AI
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-9phh-423r-778r
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport from [https://github.com/vim/vim/commit/36d6e87542cf823d833e451e09a90ee429899cec]
+CVE: CVE-2026-32249
+Signed-off-by: Milan Satpathy <msatpathy@mvista.com>
+---
+ src/regexp_nfa.c                 | 17 +++++++++++++++--
+ src/testdir/test_regexp_utf8.vim | 19 +++++++++++++++++++
+ 2 files changed, 34 insertions(+), 2 deletions(-)
+
+diff --git a/src/regexp_nfa.c b/src/regexp_nfa.c
+index 6ad682b..7905ec1 100644
+--- a/src/regexp_nfa.c
++++ b/src/regexp_nfa.c
+@@ -1765,6 +1765,7 @@ collection:
+ 	    if (*endp == ']')
+ 	    {
+ 		int plen;
++		bool range_endpoint;
+ 		/*
+ 		 * Try to reverse engineer character classes. For example,
+ 		 * recognize that [0-9] stands for \d and [A-Za-z_] for \h,
+@@ -1812,6 +1813,7 @@ collection:
+ 		while (regparse < endp)
+ 		{
+ 		    int	    oldstartc = startc;
++		    range_endpoint = false;
+ 
+ 		    startc = -1;
+ 		    got_coll_char = FALSE;
+@@ -1975,6 +1977,7 @@ collection:
+ 		    if (emit_range)
+ 		    {
+ 			int	endc = startc;
++			range_endpoint = true;
+ 
+ 			startc = oldstartc;
+ 			if (startc > endc)
+@@ -2053,7 +2056,14 @@ collection:
+ 			}
+ 		    }
+ 
+-		    if (enc_utf8 && (utf_ptr2len(regparse) != (plen = utfc_ptr2len(regparse))))
++		    //
++		    // If this character was consumed as the end of a range, do not emit its
++		    // composing characters separately.  Range handling only uses the base
++		    // codepoint; emitting the composing part again would duplicate the
++		    // character in the postfix stream and corrupt the NFA stack.
++		    //
++		    if (!range_endpoint && enc_utf8 &&
++			    (utf_ptr2len(regparse) != (plen = utfc_ptr2len(regparse))))
+ 		    {
+ 			int i = utf_ptr2len(regparse);
+ 
+@@ -3187,7 +3197,10 @@ nfa_max_width(nfa_state_T *startstate, int depth)
+ 		    ++len;
+ 		if (state->c != NFA_ANY)
+ 		{
+-		    // skip over the characters
++		    // Skip over the compiled collection.
++		    // malformed NFAs must not crash width estimation.
++		    if (state->out1 == NULL || state->out1->out == NULL)
++			return -1;
+ 		    state = state->out1->out;
+ 		    continue;
+ 		}
+diff --git a/src/testdir/test_regexp_utf8.vim b/src/testdir/test_regexp_utf8.vim
+index a4353f1..3b58416 100644
+--- a/src/testdir/test_regexp_utf8.vim
++++ b/src/testdir/test_regexp_utf8.vim
+@@ -615,6 +615,25 @@ func Test_search_multibyte_match_ascii()
+     call assert_equal(['ſſ','ſ'], noic_match3, "No-Ignorecase Collection Regex-engine: " .. &re)
+   endfor
+   bw!
++  set ignorecase&vim re&vim
++endfun
++
++func Test_regex_collection_range_with_composing_crash()
++  " Regression test: composing char in collection range caused NFA crash/E874
++  new
++  call setline(1, ['00', '0ֻ', '01'])
++  let patterns = [ '0[0-0ֻ]\@<!','0[0ֻ]\@<!']
++
++  for pat in patterns
++    " Should compile and execute without crash or error
++    for re in range(3)
++      let regex = '\%#=' .. re .. pat
++      call search(regex)
++      call assert_fails($"/{regex}\<cr>", 'E486:')
++    endfor
++  endfor
++
++  bwipe!
+ endfunc
+ 
+ " vim: shiftwidth=2 sts=2 expandtab
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/files/CVE-2026-45130.patch b/meta/recipes-support/vim/files/CVE-2026-45130.patch
new file mode 100644
index 0000000000..00972d1c2f
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-45130.patch
@@ -0,0 +1,115 @@
+From 92993329178cb1f72d700fff45ca86e1c2d369f8 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Wed, 6 May 2026 20:50:00 +0200
+Subject: [PATCH] patch 9.2.0450: [security]: heap buffer overflow in
+ spellfile.c read_compound()
+
+Problem:  read_compound() in spellfile.c computes the size of the regex
+          pattern buffer using signed-int arithmetic on the attacker
+          controlled SN_COMPOUND sectionlen.  With sectionlen=0x40000008
+          and UTF-8 encoding active the multiplication wraps to 27 while
+          the per-byte loop writes up to ~1B bytes, overflowing the heap.
+          Reachable when loading a crafted .spl file (e.g. via 'set spell'
+          after a modeline sets 'spelllang').  The cp/ap/crp allocations
+          have the same int + 1 overflow class (Daniel Cervera)
+Solution: Use type size_t as buffer size and reject values larger than
+          COMPOUND_MAX_LEN (100000).  Apply the same size_t treatment to
+          the cp/ap/crp allocations.
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-q4jv-r9gj-6cwv
+
+Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport from [https://github.com/vim/vim/commit/92993329178cb1f72d700fff45ca86e1c2d369f8]
+CVE: CVE-2026-45130 
+Signed-off-by: Milan Satpathy <msatpathy@mvista.com>
+---
+ src/spellfile.c                | 20 ++++++++++++++------
+ src/testdir/test_spellfile.vim |  4 ++++
+ 2 files changed, 18 insertions(+), 6 deletions(-)
+
+diff --git a/src/spellfile.c b/src/spellfile.c
+index 0b9536d..768e9fd 100644
+--- a/src/spellfile.c
++++ b/src/spellfile.c
+@@ -296,6 +296,9 @@
+ #define CF_WORD		0x01
+ #define CF_UPPER	0x02
+ 
++// Max allowed length for COMPOUND section
++#define COMPOUND_MAX_LEN	100000
++
+ /*
+  * Loop through all the siblings of a node (including the node)
+  */
+@@ -1225,6 +1228,8 @@ read_compound(FILE *fd, slang_T *slang, int len)
+     char_u	*crp;
+     int		cnt;
+     garray_T	*gap;
++    size_t	patsize;
++    size_t	flagsize;
+ 
+     if (todo < 2)
+ 	return SP_FORMERROR;	// need at least two bytes
+@@ -1281,16 +1286,19 @@ read_compound(FILE *fd, slang_T *slang, int len)
+     // "a[bc]/a*b+" -> "^\(a[bc]\|a*b\+\)$".
+     // Inserting backslashes may double the length, "^\(\)$<Nul>" is 7 bytes.
+     // Conversion to utf-8 may double the size.
+-    c = todo * 2 + 7;
++    if ((size_t)todo > COMPOUND_MAX_LEN)
++	return SP_FORMERROR;
++    patsize = (size_t)todo * 2 + 7;
+     if (enc_utf8)
+-	c += todo * 2;
+-    pat = alloc(c);
++	patsize += (size_t)todo * 2;
++    flagsize = (size_t)todo + 1;
++    pat = alloc(patsize);
+     if (pat == NULL)
+ 	return SP_OTHERERROR;
+ 
+     // We also need a list of all flags that can appear at the start and one
+     // for all flags.
+-    cp = alloc(todo + 1);
++    cp = alloc(flagsize);
+     if (cp == NULL)
+     {
+ 	vim_free(pat);
+@@ -1299,7 +1307,7 @@ read_compound(FILE *fd, slang_T *slang, int len)
+     slang->sl_compstartflags = cp;
+     *cp = NUL;
+ 
+-    ap = alloc(todo + 1);
++    ap = alloc(flagsize);
+     if (ap == NULL)
+     {
+ 	vim_free(pat);
+@@ -1311,7 +1319,7 @@ read_compound(FILE *fd, slang_T *slang, int len)
+     // And a list of all patterns in their original form, for checking whether
+     // compounding may work in match_compoundrule().  This is freed when we
+     // encounter a wildcard, the check doesn't work then.
+-    crp = alloc(todo + 1);
++    crp = alloc(flagsize);
+     slang->sl_comprules = crp;
+ 
+     pp = pat;
+diff --git a/src/testdir/test_spellfile.vim b/src/testdir/test_spellfile.vim
+index b72974e..d345492 100644
+--- a/src/testdir/test_spellfile.vim
++++ b/src/testdir/test_spellfile.vim
+@@ -334,6 +334,10 @@ func Test_spellfile_format_error()
+   " SN_COMPOUND: incorrect comppatlen
+   call Spellfile_Test(0z080000000007040101000000020165, 'E758:')
+ 
++  " SN_COMPOUND: oversized sectionlen
++  let v = eval('0z08004000000803010161' .. repeat('61', 50) .. 'FF')
++  call Spellfile_Test(v, 'E759:')
++
+   " SN_INFO: missing info
+   call Spellfile_Test(0z0F0000000005040101, '')
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 3a988fbe7d..262833ea33 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -28,6 +28,9 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-44656.patch \
            file://CVE-2026-41411.patch \
            file://CVE-2026-28421.patch \
+           file://CVE-2026-32249.patch \
+           file://CVE-2026-28417.patch \
+           file://CVE-2026-45130.patch \
            "
 
 PV .= ".1683"
-- 
2.50.1


