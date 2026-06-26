Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F3DC43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 22:20:01 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45552.1782512393115427408
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 15:19:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mjbyX87h;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4926ee9e8d9so4960865e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 15:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782512391; x=1783117191; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNJvQezsCSa/4sjbvN7Su9f/k1l0sJARlfoEQ8ET38o=;
        b=mjbyX87h+/C8OJKN6kUU5V/SToQjslOHIQ43MmcyQqe8f8lU69mmR++VKVsjT6ACRx
         K2R+SIroOPoTzBSwwsodM1nZaxuY2r8IAmy8O84+yfLlhtB0d02wHA7OKFT48MtdZDZg
         vCxJmsVZRejVboyP5O1S+GhEvXlQ3du6k+GOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782512391; x=1783117191;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HNJvQezsCSa/4sjbvN7Su9f/k1l0sJARlfoEQ8ET38o=;
        b=gsNUOObUQ5c7JL4zXTfe0p8zmeGUqxDA428WVE12NR1tXxEaDtoGRhMEAWKjyvVkoa
         klhgPnMWQ8uncM10lxA87VZ1F5p2b4aE/4l2PVw3LQNKblFpAszXbQeA80gm+l6o9vzA
         l/kdBf2mIhCHnORLcRAoFAySg3WEM3v765GjZLpONGFI9UYNnY1vgfPjValDE/8NNnhb
         WLuwcNgNAtyhgHkJQ6xLlnObut3rukdBeUf5oN3g9KXNNsk+YvQ7jOhDtsvx5f1TEwmF
         hY//xGzS953Xlad1P4mdcy12p+RAMBHIbILaGJEJHZJ33Kx05UuyEVfsQs+bbrb2YIMe
         ZrCA==
X-Forwarded-Encrypted: i=1; AFNElJ8td7Ynoiy6nc+U5sZpqtc8SJ7wGl5wB2tdg3264xBofB1sx9elFrwM9bWr4L2DtV0MVLEvGu5CPm40q4aIHN161Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwiXQ/vEH4xaY89iL2ayajODDPZP915AIfsPfDsvA0iOv1HWsTj
	tq4abNQlQXdoJCLUQYRkJzUGSNgds2Pjmr+KmB6H/quVDAI52bZNRWTT5wb1QH3hi3A=
X-Gm-Gg: AfdE7cn0PAeJcX/GJF4z6BUcPKtreeifF5bi8Iv56wdEhLjap1hVKDREmBHk5ONj0u+
	T+FmBfkuReSt5Qzciy/+MWwUkaCaELFPaqSquxxMNWAXA9TzQl1k3rsxUQ9HHIGCZ96EP5AgKdz
	I1gROd7m99ffx68XMc4w+Te2Tti4vSqocSS5DYPq5pxAATO/FtS5aM+WH2AqDFmF1yDABn2OiMH
	3RpGIYp6tWx28zL5JIuTgTwq5l/u6GUydHcsyE3UmxT7jSHrdhvacSmGK7wNBDJt9xsxy2HC3dU
	93MmZ/Bmp9rVjSsPHXnrBHdUlUwW5xGpdcjvep7zde4qNL45no+B5kF03ZmJdX+rVmzToncynKt
	9YFH6OEuptkNtjUpp+3AP2nlOrUtaSyc8qS4az4ks2/UzeQe1RwFxdDjqxrkucW8ciZax+Z13KN
	tDvE3Tr0BHRn22Y3R71CJBDjaOpItjpaKwEsbLty/zG4hBfjCsGJMZlvpoP1GTOKs9lYPyQSW/G
	ycaoA==
X-Received: by 2002:a05:600c:c3c1:20b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-492663e3d65mr90455985e9.6.1782512391190;
        Fri, 26 Jun 2026 15:19:51 -0700 (PDT)
Received: from localhost (2a01cb001331aa00b5501ee7aae29268.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b550:1ee7:aae2:9268])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49269002511sm106287675e9.8.2026.06.26.15.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 15:19:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Jun 2026 00:19:50 +0200
Message-Id: <DJJBWNIV5W9K.3QTFPMAU76PDB@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCHv2] vim: Fix for CVE-2026-28417,
 CVE-2026-32249, CVE-2026-45130
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260622055848.13061-1-hprajapati@mvista.com>
In-Reply-To: <20260622055848.13061-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 22:20:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239665

On Mon Jun 22, 2026 at 7:58 AM CEST, Hitendra Prajapati via lists.openembed=
ded.org wrote:
> Pick patch from [1], [2] & [3] also mentioned at NVD report in [4,5 & 6]
>
> [1] https://github.com/vim/vim/commit/79348dbbc09332130f4c86045e1541d6851=
4fcc1
> [2] https://github.com/vim/vim/commit/36d6e87542cf823d833e451e09a90ee4298=
99cec
> [3] https://github.com/vim/vim/commit/92993329178cb1f72d700fff45ca86e1c2d=
369f8
> [4] https://nvd.nist.gov/vuln/detail/CVE-2026-28417
> [5] https://nvd.nist.gov/vuln/detail/CVE-2026-32249
> [6] https://nvd.nist.gov/vuln/detail/CVE-2026-45130

Hello,

CVE-2026-45130 impacts wrynose and a patch must be sent for wrynose
before the fix can be merged on scarthgap.

Regards,

>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../vim/files/CVE-2026-28417.patch            |  92 ++++++++++++++
>  .../vim/files/CVE-2026-32249.patch            | 117 ++++++++++++++++++
>  .../vim/files/CVE-2026-45130.patch            | 115 +++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |   3 +
>  4 files changed, 327 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-28417.patch
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-32249.patch
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-45130.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2026-28417.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-28417.patch
> new file mode 100644
> index 0000000000..6598323c41
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-28417.patch
> @@ -0,0 +1,92 @@
> +From 79348dbbc09332130f4c86045e1541d68514fcc1 Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Sun, 22 Feb 2026 21:24:48 +0000
> +Subject: [PATCH] patch 9.2.0073: [security]: possible command injection =
using
> + netrw
> +
> +Problem:  [security]: Insufficient validation of hostname and port in
> +          netrw URIs allows command injection via shell metacharacters
> +          (ehdgks0627, un3xploitable).
> +Solution: Implement stricter RFC1123 hostname and IP validation.
> +          Use shellescape() for the provided hostname and port.
> +
> +Github Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-m3xh-9434-g336
> +
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +
> +Upstream-Status: Backport from [https://github.com/vim/vim/commit/79348d=
bbc09332130f4c86045e1541d68514fcc1]
> +CVE: CVE-2026-28417
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + .../pack/dist/opt/netrw/autoload/netrw.vim    | 34 +++++++++++++------
> + 1 file changed, 24 insertions(+), 10 deletions(-)
> +
> +diff --git a/runtime/pack/dist/opt/netrw/autoload/netrw.vim b/runtime/pa=
ck/dist/opt/netrw/autoload/netrw.vim
> +index 1c98104..7ebcd92 100644
> +--- a/runtime/pack/dist/opt/netrw/autoload/netrw.vim
> ++++ b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
> +@@ -5,6 +5,7 @@
> + " 2025 Aug 07 by Vim Project (use correct "=3D~#" for netrw_stylesize o=
ption #17901)
> + " 2025 Aug 07 by Vim Project (netrw#BrowseX() distinguishes remote file=
s #17794)
> + " 2025 Aug 22 by Vim Project netrw#Explore handle terminal correctly #1=
8069
> ++" 2026 Feb 27 by Vim Project Make the hostname validation more strict
> + " Copyright:  Copyright (C) 2016 Charles E. Campbell {{{1
> + "             Permission is hereby granted to use and distribute this c=
ode,
> + "             with or without modifications, provided that this copyrig=
ht
> +@@ -2575,13 +2576,26 @@ endfunction
> +=20
> + " s:NetrwValidateHostname:  Validate that the hostname is valid {{{2
> + " Input:
> +-"   hostname
> ++"   hostname, may include an optional username, e.g. user@hostname
> ++"   allow a alphanumeric hostname or an IPv(4/6) address
> + " Output:
> + "  true if g:netrw_machine is valid according to RFC1123 #Section 2
> + function s:NetrwValidateHostname(hostname)
> +-    " RFC1123#section-2 mandates, a valid hostname starts with letters =
or digits
> +-    " so reject everyhing else
> +-    return a:hostname =3D~? '^[a-z0-9]'
> ++  " Username:
> ++  let user_pat =3D '\%([a-zA-Z0-9._-]\+@\)\?'
> ++  " Hostname: 1-64 chars, alphanumeric/dots/hyphens.
> ++  " No underscores. No leading/trailing dots/hyphens.
> ++  let host_pat =3D '[a-zA-Z0-9]\%([-a-zA-Z0-9.]{,62}[a-zA-Z0-9]\)\?$'
> ++
> ++  " IPv4: 1-3 digits separated by dots
> ++  let ipv4_pat =3D '\%(\d\{1,3}\.\)\{3\}\d\{1,3\}$'
> ++
> ++  " IPv6: Hex, colons, and optional brackets
> ++  let ipv6_pat =3D '\[\?\%([a-fA-F0-9:]\{2,}\)\+\]\?$'
> ++
> ++  return a:hostname =3D~? '^'.user_pat.host_pat ||
> ++       \ a:hostname =3D~? '^'.user_pat.ipv4_pat ||
> ++       \ a:hostname =3D~? '^'.user_pat.ipv6_pat
> + endfunction
> +=20
> + " NetUserPass: set username and password for subsequent ftp transfer {{=
{2
> +@@ -8948,15 +8962,15 @@ endfunction
> + " s:MakeSshCmd: transforms input command using USEPORT HOSTNAME into {{=
{2
> + "               a correct command for use with a system() call
> + function s:MakeSshCmd(sshcmd)
> +-    if s:user =3D=3D ""
> +-        let sshcmd =3D substitute(a:sshcmd,'\<HOSTNAME\>',s:machine,'')
> +-    else
> +-        let sshcmd =3D substitute(a:sshcmd,'\<HOSTNAME\>',s:user."@".s:=
machine,'')
> ++    let machine =3D shellescape(s:machine, 1)
> ++    if s:user !=3D ''
> ++        let machine    =3D shellescape(s:user, 1).'@'.machine
> +     endif
> ++    let sshcmd =3D substitute(a:sshcmd,'\<HOSTNAME\>',machine,'')
> +     if exists("g:netrw_port") && g:netrw_port !=3D ""
> +-        let sshcmd=3D substitute(sshcmd,"USEPORT",g:netrw_sshport.' '.g=
:netrw_port,'')
> ++        let sshcmd=3D substitute(sshcmd,"USEPORT",g:netrw_sshport.' '.s=
hellescape(g:netrw_port,1),'')
> +     elseif exists("s:port") && s:port !=3D ""
> +-        let sshcmd=3D substitute(sshcmd,"USEPORT",g:netrw_sshport.' '.s=
:port,'')
> ++        let sshcmd=3D substitute(sshcmd,"USEPORT",g:netrw_sshport.' '.s=
hellescape(s:port,1),'')
> +     else
> +         let sshcmd=3D substitute(sshcmd,"USEPORT ",'','')
> +     endif
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-support/vim/files/CVE-2026-32249.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-32249.patch
> new file mode 100644
> index 0000000000..841db9e016
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-32249.patch
> @@ -0,0 +1,117 @@
> +From 36d6e87542cf823d833e451e09a90ee429899cec Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Wed, 11 Mar 2026 14:16:29 +0100
> +Subject: [PATCH] patch 9.2.0137: [security]: crash with composing char i=
n
> + collection range
> +
> +Problem:  Using a composing character as the end of a range inside a
> +          collection may corrupt the NFA postfix stack
> +          (Nathan Mills, after v9.1.0011)
> +Solution: When a character is used as the endpoint of a range, do not em=
it
> +          its composing characters separately. Range handling only uses
> +          the base codepoint.
> +
> +supported by AI
> +
> +Github Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-9phh-423r-778r
> +
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +
> +Upstream-Status: Backport from [https://github.com/vim/vim/commit/36d6e8=
7542cf823d833e451e09a90ee429899cec]
> +CVE: CVE-2026-32249
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + src/regexp_nfa.c                 | 17 +++++++++++++++--
> + src/testdir/test_regexp_utf8.vim | 19 +++++++++++++++++++
> + 2 files changed, 34 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/regexp_nfa.c b/src/regexp_nfa.c
> +index 6ad682b..7905ec1 100644
> +--- a/src/regexp_nfa.c
> ++++ b/src/regexp_nfa.c
> +@@ -1765,6 +1765,7 @@ collection:
> + 	    if (*endp =3D=3D ']')
> + 	    {
> + 		int plen;
> ++		bool range_endpoint;
> + 		/*
> + 		 * Try to reverse engineer character classes. For example,
> + 		 * recognize that [0-9] stands for \d and [A-Za-z_] for \h,
> +@@ -1812,6 +1813,7 @@ collection:
> + 		while (regparse < endp)
> + 		{
> + 		    int	    oldstartc =3D startc;
> ++		    range_endpoint =3D false;
> +=20
> + 		    startc =3D -1;
> + 		    got_coll_char =3D FALSE;
> +@@ -1975,6 +1977,7 @@ collection:
> + 		    if (emit_range)
> + 		    {
> + 			int	endc =3D startc;
> ++			range_endpoint =3D true;
> +=20
> + 			startc =3D oldstartc;
> + 			if (startc > endc)
> +@@ -2053,7 +2056,14 @@ collection:
> + 			}
> + 		    }
> +=20
> +-		    if (enc_utf8 && (utf_ptr2len(regparse) !=3D (plen =3D utfc_ptr2le=
n(regparse))))
> ++		    //
> ++		    // If this character was consumed as the end of a range, do not e=
mit its
> ++		    // composing characters separately.  Range handling only uses the=
 base
> ++		    // codepoint; emitting the composing part again would duplicate t=
he
> ++		    // character in the postfix stream and corrupt the NFA stack.
> ++		    //
> ++		    if (!range_endpoint && enc_utf8 &&
> ++			    (utf_ptr2len(regparse) !=3D (plen =3D utfc_ptr2len(regparse))))
> + 		    {
> + 			int i =3D utf_ptr2len(regparse);
> +=20
> +@@ -3187,7 +3197,10 @@ nfa_max_width(nfa_state_T *startstate, int depth)
> + 		    ++len;
> + 		if (state->c !=3D NFA_ANY)
> + 		{
> +-		    // skip over the characters
> ++		    // Skip over the compiled collection.
> ++		    // malformed NFAs must not crash width estimation.
> ++		    if (state->out1 =3D=3D NULL || state->out1->out =3D=3D NULL)
> ++			return -1;
> + 		    state =3D state->out1->out;
> + 		    continue;
> + 		}
> +diff --git a/src/testdir/test_regexp_utf8.vim b/src/testdir/test_regexp_=
utf8.vim
> +index a4353f1..3b58416 100644
> +--- a/src/testdir/test_regexp_utf8.vim
> ++++ b/src/testdir/test_regexp_utf8.vim
> +@@ -615,6 +615,25 @@ func Test_search_multibyte_match_ascii()
> +     call assert_equal(['=C5=BF=C5=BF','=C5=BF'], noic_match3, "No-Ignor=
ecase Collection Regex-engine: " .. &re)
> +   endfor
> +   bw!
> ++  set ignorecase&vim re&vim
> ++endfun
> ++
> ++func Test_regex_collection_range_with_composing_crash()
> ++  " Regression test: composing char in collection range caused NFA cras=
h/E874
> ++  new
> ++  call setline(1, ['00', '0=D6=BB', '01'])
> ++  let patterns =3D [ '0[0-0=D6=BB]\@<!','0[0=D6=BB]\@<!']
> ++
> ++  for pat in patterns
> ++    " Should compile and execute without crash or error
> ++    for re in range(3)
> ++      let regex =3D '\%#=3D' .. re .. pat
> ++      call search(regex)
> ++      call assert_fails($"/{regex}\<cr>", 'E486:')
> ++    endfor
> ++  endfor
> ++
> ++  bwipe!
> + endfunc
> +=20
> + " vim: shiftwidth=3D2 sts=3D2 expandtab
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-support/vim/files/CVE-2026-45130.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-45130.patch
> new file mode 100644
> index 0000000000..f44dfd66d6
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-45130.patch
> @@ -0,0 +1,115 @@
> +From 92993329178cb1f72d700fff45ca86e1c2d369f8 Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Wed, 6 May 2026 20:50:00 +0200
> +Subject: [PATCH] patch 9.2.0450: [security]: heap buffer overflow in
> + spellfile.c read_compound()
> +
> +Problem:  read_compound() in spellfile.c computes the size of the regex
> +          pattern buffer using signed-int arithmetic on the attacker
> +          controlled SN_COMPOUND sectionlen.  With sectionlen=3D0x400000=
08
> +          and UTF-8 encoding active the multiplication wraps to 27 while
> +          the per-byte loop writes up to ~1B bytes, overflowing the heap=
.
> +          Reachable when loading a crafted .spl file (e.g. via 'set spel=
l'
> +          after a modeline sets 'spelllang').  The cp/ap/crp allocations
> +          have the same int + 1 overflow class (Daniel Cervera)
> +Solution: Use type size_t as buffer size and reject values larger than
> +          COMPOUND_MAX_LEN (100000).  Apply the same size_t treatment to
> +          the cp/ap/crp allocations.
> +
> +Github Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-q4jv-r9gj-6cwv
> +
> +Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +
> +Upstream-Status: Backport from [https://github.com/vim/vim/commit/929933=
29178cb1f72d700fff45ca86e1c2d369f8]
> +CVE: CVE-2026-45130
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + src/spellfile.c                | 20 ++++++++++++++------
> + src/testdir/test_spellfile.vim |  4 ++++
> + 2 files changed, 18 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/spellfile.c b/src/spellfile.c
> +index 0b9536d..768e9fd 100644
> +--- a/src/spellfile.c
> ++++ b/src/spellfile.c
> +@@ -296,6 +296,9 @@
> + #define CF_WORD		0x01
> + #define CF_UPPER	0x02
> +=20
> ++// Max allowed length for COMPOUND section
> ++#define COMPOUND_MAX_LEN	100000
> ++
> + /*
> +  * Loop through all the siblings of a node (including the node)
> +  */
> +@@ -1225,6 +1228,8 @@ read_compound(FILE *fd, slang_T *slang, int len)
> +     char_u	*crp;
> +     int		cnt;
> +     garray_T	*gap;
> ++    size_t	patsize;
> ++    size_t	flagsize;
> +=20
> +     if (todo < 2)
> + 	return SP_FORMERROR;	// need at least two bytes
> +@@ -1281,16 +1286,19 @@ read_compound(FILE *fd, slang_T *slang, int len)
> +     // "a[bc]/a*b+" -> "^\(a[bc]\|a*b\+\)$".
> +     // Inserting backslashes may double the length, "^\(\)$<Nul>" is 7 =
bytes.
> +     // Conversion to utf-8 may double the size.
> +-    c =3D todo * 2 + 7;
> ++    if ((size_t)todo > COMPOUND_MAX_LEN)
> ++	return SP_FORMERROR;
> ++    patsize =3D (size_t)todo * 2 + 7;
> +     if (enc_utf8)
> +-	c +=3D todo * 2;
> +-    pat =3D alloc(c);
> ++	patsize +=3D (size_t)todo * 2;
> ++    flagsize =3D (size_t)todo + 1;
> ++    pat =3D alloc(patsize);
> +     if (pat =3D=3D NULL)
> + 	return SP_OTHERERROR;
> +=20
> +     // We also need a list of all flags that can appear at the start an=
d one
> +     // for all flags.
> +-    cp =3D alloc(todo + 1);
> ++    cp =3D alloc(flagsize);
> +     if (cp =3D=3D NULL)
> +     {
> + 	vim_free(pat);
> +@@ -1299,7 +1307,7 @@ read_compound(FILE *fd, slang_T *slang, int len)
> +     slang->sl_compstartflags =3D cp;
> +     *cp =3D NUL;
> +=20
> +-    ap =3D alloc(todo + 1);
> ++    ap =3D alloc(flagsize);
> +     if (ap =3D=3D NULL)
> +     {
> + 	vim_free(pat);
> +@@ -1311,7 +1319,7 @@ read_compound(FILE *fd, slang_T *slang, int len)
> +     // And a list of all patterns in their original form, for checking =
whether
> +     // compounding may work in match_compoundrule().  This is freed whe=
n we
> +     // encounter a wildcard, the check doesn't work then.
> +-    crp =3D alloc(todo + 1);
> ++    crp =3D alloc(flagsize);
> +     slang->sl_comprules =3D crp;
> +=20
> +     pp =3D pat;
> +diff --git a/src/testdir/test_spellfile.vim b/src/testdir/test_spellfile=
.vim
> +index b72974e..d345492 100644
> +--- a/src/testdir/test_spellfile.vim
> ++++ b/src/testdir/test_spellfile.vim
> +@@ -334,6 +334,10 @@ func Test_spellfile_format_error()
> +   " SN_COMPOUND: incorrect comppatlen
> +   call Spellfile_Test(0z080000000007040101000000020165, 'E758:')
> +=20
> ++  " SN_COMPOUND: oversized sectionlen
> ++  let v =3D eval('0z08004000000803010161' .. repeat('61', 50) .. 'FF')
> ++  call Spellfile_Test(v, 'E759:')
> ++
> +   " SN_INFO: missing info
> +   call Spellfile_Test(0z0F0000000005040101, '')
> +=20
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
> index 3a988fbe7d..262833ea33 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -28,6 +28,9 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmast=
er;protocol=3Dhttps \
>             file://CVE-2026-44656.patch \
>             file://CVE-2026-41411.patch \
>             file://CVE-2026-28421.patch \
> +           file://CVE-2026-32249.patch \
> +           file://CVE-2026-28417.patch \
> +           file://CVE-2026-45130.patch \
>             "
> =20
>  PV .=3D ".1683"


--=20
Yoann Congal
Smile ECS


