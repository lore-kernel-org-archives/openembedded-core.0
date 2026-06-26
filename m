Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92ECCC43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 22:28:11 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45676.1782512889461120197
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 15:28:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1S7CRt5U;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4926046fbc5so16545285e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 15:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782512887; x=1783117687; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Z3ZoNAqpRPOAlnMoYzsUMNa9Xsaa5GzzdMUfSZh9u8=;
        b=1S7CRt5UnEceFR2SvwTwnR057k+9W87L4nb8MQrG0y7dxoMuomxjVD3X6ajCWz+4US
         8CfCTLR5zuZeOw3mrk2pydodktJ5DyEdZbNRIToCWROHJxjzt+PY1BtFea8D4jJMdTG5
         Vz2jnponkX806QeHlz5IoEDC1d7LqJLyDQz2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782512887; x=1783117687;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Z3ZoNAqpRPOAlnMoYzsUMNa9Xsaa5GzzdMUfSZh9u8=;
        b=iJ4MpMg5glQjQ4p7PyAOcbSxzdd8yDB8dPctKJdovT1BjzwUDFk8uu6J5W0X7NyQ3C
         LV7bsFm9PSJ/E9uxb2ZdgUAR7aFJY4hKiltN6l+HKX8048nx70UQisyCgW0G0k4Pwf4N
         nE6MRykYstWu5QDngoSZ9azJ1Lkj82/sXGM9fVoraT4alAlBP/BShPJPXX4pAHSiuB8J
         fVw0RjKcwsaC3xGBjbtnnfKW9C3VqCeY9l7kJ/5cRKFhJBaUaLRLctuQgLx/7BAJW/5q
         xVgnPs5TIBrDn/1lU0hDZ9eI3FqV0kvvv4nYcoznEdpUWiuHJ9V3Q3yAyY8Ml2EP5hvg
         AaWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+JZki3ts7Az2U1UWqOTu9Jb0nIf4HEuY00rzXwvfR4LmKVuGyVpjuBoHtTKMXIxSt96EUxvLWtRDjBpK6q2WYCaw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx4BICV/5ZO4ZYpNKYwlGIHC+F2dd9Vj6OxGC9Ga0RNikfKCJ/X
	SYq8WAsQ3Mcn1R9sxkAz3OT8hjGqnTpI9pKjDUDkWJwZjaVCw8v7tgNLe4wwz0l8s/3MBg3/Bnn
	54Jl3
X-Gm-Gg: AfdE7cmoIcN+RHv3vZIe6DaDt42JK7mT4xpSs/C67rcyNqt+5fPDCWY47Itz0dXtxYj
	TW0DnG6vfY44ZPgQq8NnI4MM94N/bF4yWScXKJMVhoVVTmlWDEu2emboxISkTuO9CVKj9+FpgCP
	YcAG638XllcIV3xwI0E4uWvIV2v1yiDcAE4wDPC3R7ystoWzcnfOzr9Oh0dZyazTuwRPQvWLoKd
	4mFLZnCNK1AmTYfp6OOOZ2kOA43pXTUwJvHRX1oVWONl9fNbVZCf8+4ZyCG3JlIO97GEVf2xyTS
	cUK93Iyft+UaljiZcrVj8zHiI1yCsO0wzxn2+TlARuawZXILmZ/5aTuaafjm/IT1R75acwqp359
	ekdYB/OSYrxJVkoTSfvxCcNX7phKh7S+9ZbXu74zkWmogG1Qyh9GA/65T6g9P3FLFUnK5qwpSor
	eiwIM8Lyw6DZwMkmkeNSC6AxS6Qprr+bsmzjL7Hz1pRkjxR2b2OfrjeSaUzhL593iwqAdnNdtbR
	quVMw==
X-Received: by 2002:a05:600c:1551:b0:490:3cf0:8d81 with SMTP id 5b1f17b1804b1-492664241a4mr111542465e9.13.1782512887152;
        Fri, 26 Jun 2026 15:28:07 -0700 (PDT)
Received: from localhost (2a01cb001331aa00b5501ee7aae29268.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b550:1ee7:aae2:9268])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268ff9f40sm106074445e9.6.2026.06.26.15.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 15:28:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Jun 2026 00:28:06 +0200
Message-Id: <DJJC2Z9O0GQE.2MXZQBQZX5X8W@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] vim: Fix for
 CVE-2026-52858,CVE-2026-52859,CVE-2026-52860
X-Mailer: aerc 0.20.0
References: <20260622122724.26065-1-hprajapati@mvista.com>
In-Reply-To: <20260622122724.26065-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 22:28:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239667

On Mon Jun 22, 2026 at 2:27 PM CEST, Hitendra Prajapati via lists.openembed=
ded.org wrote:
> Pick patch from [1], [2] & [3] also mentioned at NVD report in [4,5 & 6]
>
> [1] https://github.com/vim/vim/commit/4b850457e12e1a678dd209f2868154f7553=
cbf8d
> [2] https://github.com/vim/vim/commit/63680c6d3d52477817b49cd1a66e7aabe8a=
7aa19
> [3] https://github.com/vim/vim/commit/c8c63673bc4253212820626aeeb75999d9a=
539d2
> [4] https://nvd.nist.gov/vuln/detail/CVE-2026-52858

Hello,

CVE-2026-52858 impacts wrynose and a patch must be sent for wrynose
before the fix can be merged on scarthgap.

I'm sorry but your whole set of vim patches is not acceptable on
scarthgap :(

Regards,


> [5] https://nvd.nist.gov/vuln/detail/CVE-2026-52859
> [6] https://nvd.nist.gov/vuln/detail/CVE-2026-52860
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../vim/files/CVE-2026-52858.patch            | 167 +++++++
>  .../vim/files/CVE-2026-52859.patch            | 274 +++++++++++
>  .../vim/files/CVE-2026-52860.patch            | 446 ++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |   3 +
>  4 files changed, 890 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-52858.patch
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-52859.patch
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-52860.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2026-52858.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-52858.patch
> new file mode 100644
> index 0000000000..c7474f792b
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-52858.patch
> @@ -0,0 +1,167 @@
> +From 4b850457e12e1a678dd209f2868154f7553cbf8d Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Fri, 29 May 2026 19:05:53 +0000
> +Subject: [PATCH] patch 9.2.0561: [security]: possible code execution wit=
h
> + python3complete
> +
> +Problem:  [security]: possible code execution with python3complete
> +Solution: Disable execution of import/from statements
> +
> +Github Security Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-52mc-rq6p-rc7c
> +
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +
> +Upstream-Status: Backport from [https://github.com/vim/vim/commit/4b8504=
57e12e1a678dd209f2868154f7553cbf8d]
> +CVE: CVE-2026-52858
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + runtime/autoload/README.txt          |  1 +
> + runtime/autoload/python3complete.vim | 17 ++++++++++++++---
> + runtime/autoload/pythoncomplete.vim  | 17 ++++++++++++++---
> + runtime/doc/filetype.txt             | 15 ++++++++++++++-
> + 4 files changed, 43 insertions(+), 7 deletions(-)
> +
> +diff --git a/runtime/autoload/README.txt b/runtime/autoload/README.txt
> +index 3b18d3d..b225819 100644
> +--- a/runtime/autoload/README.txt
> ++++ b/runtime/autoload/README.txt
> +@@ -17,6 +17,7 @@ htmlcomplete.vim	HTML
> + javascriptcomplete.vim  Javascript
> + phpcomplete.vim		PHP
> + pythoncomplete.vim	Python
> ++python3complete.vim Python
> + rubycomplete.vim	Ruby
> + syntaxcomplete.vim	from syntax highlighting
> + xmlcomplete.vim		XML (uses files in the xml directory)
> +diff --git a/runtime/autoload/python3complete.vim b/runtime/autoload/pyt=
hon3complete.vim
> +index ea0a331..aba3412 100644
> +--- a/runtime/autoload/python3complete.vim
> ++++ b/runtime/autoload/python3complete.vim
> +@@ -14,6 +14,10 @@
> + "   i.e. "import url<c-x,c-o>"
> + " Continue parsing on invalid line??
> + "
> ++" v 0.10 by Vim project
> ++"   * disables importing local modules, unless the global Vim variable
> ++"     g:pythoncomplete_allow_import is set to non-zero
> ++"
> + " v 0.9
> + "   * Fixed docstring parsing for classes and functions
> + "   * Fixed parsing of *args and **kwargs type arguments
> +@@ -132,11 +136,20 @@ class Completer(object):
> +=20
> +     def evalsource(self,text,line=3D0):
> +         sc =3D self.parser.parse(text,line)
> ++        try: allow_imports =3D int(
> ++          vim.eval("get(g:, 'pythoncomplete_allow_import', 0)"))
> ++        except Exception:
> ++          allow_imports =3D 0
> +         src =3D sc.get_code()
> +         dbg("source: %s" % src)
> +         try: exec(src,self.compldict)
> +         except: dbg("parser: %s, %s" % (sys.exc_info()[0],sys.exc_info(=
)[1]))
> +         for l in sc.locals:
> ++            # Executing import/from statements harvested from the buffe=
r runs
> ++            # arbitrary package code; only do so when the user opted in=
.
> ++            if not allow_imports and (l.startswith('import')
> ++                                            or l.startswith('from ')):
> ++                continue
> +             try: exec(l,self.compldict)
> +             except: dbg("locals: %s, %s [%s]" % (sys.exc_info()[0],sys.=
exc_info()[1],l))
> +=20
> +@@ -300,13 +313,11 @@ class Scope(object):
> +     def get_code(self):
> +         str =3D ""
> +         if len(self.docstr) > 0: str +=3D '"""'+self.docstr+'"""\n'
> +-        for l in self.locals:
> +-            if l.startswith('import'): str +=3D l+'\n'
> +         str +=3D 'class _PyCmplNoType:\n    def __getattr__(self,name):=
\n        return None\n'
> +         for sub in self.subscopes:
> +             str +=3D sub.get_code()
> +         for l in self.locals:
> +-            if not l.startswith('import'): str +=3D l+'\n'
> ++            if not l.startswith('import') and not l.startswith('from ')=
: str +=3D l+'\n'
> +=20
> +         return str
> +=20
> +diff --git a/runtime/autoload/pythoncomplete.vim b/runtime/autoload/pyth=
oncomplete.vim
> +index aa28bb7..1014776 100644
> +--- a/runtime/autoload/pythoncomplete.vim
> ++++ b/runtime/autoload/pythoncomplete.vim
> +@@ -12,6 +12,10 @@
> + "   i.e. "import url<c-x,c-o>"
> + " Continue parsing on invalid line??
> + "
> ++" v 0.10 by Vim project
> ++"   * disables importing local modules, unless the global Vim variable
> ++"     g:pythoncomplete_allow_import is set to non-zero
> ++"
> + " v 0.9
> + "   * Fixed docstring parsing for classes and functions
> + "   * Fixed parsing of *args and **kwargs type arguments
> +@@ -146,11 +150,20 @@ class Completer(object):
> +=20
> +     def evalsource(self,text,line=3D0):
> +         sc =3D self.parser.parse(text,line)
> ++        try: allow_imports =3D int(
> ++          vim.eval("get(g:, 'pythoncomplete_allow_import', 0)"))
> ++        except Exception:
> ++          allow_imports =3D 0
> +         src =3D sc.get_code()
> +         dbg("source: %s" % src)
> +         try: exec(src) in self.compldict
> +         except: dbg("parser: %s, %s" % (sys.exc_info()[0],sys.exc_info(=
)[1]))
> +         for l in sc.locals:
> ++            # Executing import/from statements harvested from the buffe=
r runs
> ++            # arbitrary package code; only do so when the user opted in=
.
> ++            if not allow_imports and (l.startswith('import')
> ++                                            or l.startswith('from ')):
> ++                continue
> +             try: exec(l) in self.compldict
> +             except: dbg("locals: %s, %s [%s]" % (sys.exc_info()[0],sys.=
exc_info()[1],l))
> +=20
> +@@ -315,13 +328,11 @@ class Scope(object):
> +     def get_code(self):
> +         str =3D ""
> +         if len(self.docstr) > 0: str +=3D '"""'+self.docstr+'"""\n'
> +-        for l in self.locals:
> +-            if l.startswith('import'): str +=3D l+'\n'
> +         str +=3D 'class _PyCmplNoType:\n    def __getattr__(self,name):=
\n        return None\n'
> +         for sub in self.subscopes:
> +             str +=3D sub.get_code()
> +         for l in self.locals:
> +-            if not l.startswith('import'): str +=3D l+'\n'
> ++            if not l.startswith('import') and not l.startswith('from ')=
: str +=3D l+'\n'
> +=20
> +         return str
> +=20
> +diff --git a/runtime/doc/filetype.txt b/runtime/doc/filetype.txt
> +index 597141d..c8572fe 100644
> +--- a/runtime/doc/filetype.txt
> ++++ b/runtime/doc/filetype.txt
> +@@ -739,7 +739,20 @@ By default the following options are set, in accord=
ance with PEP8: >
> + To disable this behavior, set the following variable in your vimrc: >
> +=20
> + 	let g:python_recommended_style =3D 0
> +-
> ++<
> ++Python omni-completion |compl-omni| is provided by python3complete.vim =
(or
> ++pythoncomplete.vim) for Vim builds with the |+python|/|+python3| interp=
reter.
> ++By default it does not inspect the import / from statements found in th=
e
> ++buffer. This means completion of names defined in the buffer itself (cl=
asses,
> ++functions, variables) works, but completion of members of imported modu=
les is
> ++not offered.
> ++
> ++To enable completion of imported module members, set: >
> ++	let g:pythoncomplete_allow_import =3D 1
> ++<
> ++WARNING: enabling this causes omni-completion to execute the import sta=
tements
> ++found in the buffer through Python's import machinery, which runs the i=
mported
> ++modules' top-level code. Only enable this for code you trust.
> +=20
> + QF QUICKFIX					    *qf.vim* *ft-qf-plugin*
> +=20
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-support/vim/files/CVE-2026-52859.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-52859.patch
> new file mode 100644
> index 0000000000..f734d7efe2
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-52859.patch
> @@ -0,0 +1,274 @@
> +From 63680c6d3d52477817b49cd1a66e7aabe8a7aa19 Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Sat, 30 May 2026 16:34:40 +0000
> +Subject: [PATCH] patch 9.2.0565: [security]: out-of-bounds read in
> + update_snapshot()
> +
> +Problem:  Out-of-bounds read in update_snapshot() when a terminal cell
> +          fills all VTERM_MAX_CHARS_PER_CELL slots (a base character
> +          plus five combining marks): the loop over cell.chars[] has no
> +          upper bound and libvterm leaves the array unterminated when fu=
ll, so
> +          it reads past the array and appends out-of-bounds values to a
> +          buffer sized for only VTERM_MAX_CHARS_PER_CELL characters.
> +Solution: Bound the loop with i < VTERM_MAX_CHARS_PER_CELL, mirroring
> +          the loop in handle_pushline() (Christian Brabandt).
> +
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +
> +Upstream-Status: Backport from [https://github.com/vim/vim/commit/63680c=
6d3d52477817b49cd1a66e7aabe8a7aa19]
> +CVE: CVE-2026-52859
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + src/terminal.c                          |   3 +-
> + src/testdir/samples/combining_chars.txt | 200 ++++++++++++++++++++++++
> + src/testdir/test_terminal3.vim          |  15 ++
> + 3 files changed, 217 insertions(+), 1 deletion(-)
> + create mode 100644 src/testdir/samples/combining_chars.txt
> +
> +diff --git a/src/terminal.c b/src/terminal.c
> +index 78990ac..527f1b9 100644
> +--- a/src/terminal.c
> ++++ b/src/terminal.c
> +@@ -2080,7 +2080,8 @@ update_snapshot(term_T *term)
> + 			    int	    i;
> + 			    int	    c;
> +=20
> +-			    for (i =3D 0; (c =3D cell.chars[i]) > 0 || i =3D=3D 0; ++i)
> ++			    for (i =3D 0; i < VTERM_MAX_CHARS_PER_CELL &&
> ++				    ((c =3D cell.chars[i]) > 0 || i =3D=3D 0); ++i)
> + 				ga.ga_len +=3D utf_char2bytes(c =3D=3D NUL ? ' ' : c,
> + 					     (char_u *)ga.ga_data + ga.ga_len);
> + 			}
> +diff --git a/src/testdir/samples/combining_chars.txt b/src/testdir/sampl=
es/combining_chars.txt
> +new file mode 100644
> +index 0000000..d9a3c17
> +--- /dev/null
> ++++ b/src/testdir/samples/combining_chars.txt
> +@@ -0,0 +1,200 @@
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81=E1=8C=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81=E1=8C=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81=E1=8C=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81=E1=8C=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81=E1=8C=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81=E1=8C=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81=E1=8C=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81=E1=8C=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81=E1=8C=81
> ++a=CC=81=CC=81=CC=81=CC=81=CC=81=E1=8C=81
> +diff --git a/src/testdir/test_terminal3.vim b/src/testdir/test_terminal3=
.vim
> +index cb1946f..c02801e 100644
> +--- a/src/testdir/test_terminal3.vim
> ++++ b/src/testdir/test_terminal3.vim
> +@@ -1051,4 +1051,19 @@ func Test_terminal_max_combining_chars()
> +   exe buf . "bwipe!"
> + endfunc
> +=20
> ++func Test_terminal_output_combining_chars()
> ++  CheckUnix
> ++  new
> ++  let cmd =3D "cat samples/combining_chars.txt"
> ++  let buf =3D term_start(cmd, {'curwin': 1, 'term_finish': 'open', 'ter=
m_rows': 10, 'term_cols': 30})
> ++  call WaitForAssert({-> assert_match('finished', term_getstatus(buf))}=
)
> ++  call TermWait(buf)
> ++  let lines =3D getbufline(buf, 1, '$')
> ++  " get byte lengths to confirm combining chars present
> ++  let lens =3D map(copy(lines), 'len(v:val)')
> ++  let expected =3D repeat([11], 190) + repeat([14], 10)
> ++  call assert_equal(expected, lens)
> ++  bw!
> ++endfunc
> ++
> + " vim: shiftwidth=3D2 sts=3D2 expandtab
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-support/vim/files/CVE-2026-52860.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-52860.patch
> new file mode 100644
> index 0000000000..2f4ffdeacf
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-52860.patch
> @@ -0,0 +1,446 @@
> +From c8c63673bc4253212820626aeeb75999d9a539d2 Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Thu, 4 Jun 2026 21:06:09 +0000
> +Subject: [PATCH] patch 9.2.0597: [security]: possible code execution wit=
h
> + python complete
> +
> +Problem:  [security]: another possible code execution with python comple=
te
> +          (David Carliez)
> +Solution: Strip default expressions and annotations from generated
> +          source for pythoncomplete and python3complete.
> +
> +Github Security Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-65p9-mwwx-7468
> +
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +
> +Upstream-Status: Backport from [https://github.com/vim/vim/commit/c8c636=
73bc4253212820626aeeb75999d9a539d2]
> +CVE: CVE-2026-52860
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + runtime/autoload/python3complete.vim        |  43 +++-
> + runtime/autoload/pythoncomplete.vim         |  43 +++-
> + src/testdir/Make_all.mak                    |   2 +
> + src/testdir/test_plugin_python3complete.vim | 224 ++++++++++++++++++++
> + 4 files changed, 304 insertions(+), 8 deletions(-)
> + create mode 100644 src/testdir/test_plugin_python3complete.vim
> +
> +diff --git a/runtime/autoload/python3complete.vim b/runtime/autoload/pyt=
hon3complete.vim
> +index aba3412..a031424 100644
> +--- a/runtime/autoload/python3complete.vim
> ++++ b/runtime/autoload/python3complete.vim
> +@@ -1,8 +1,8 @@
> + "python3complete.vim - Omni Completion for python
> + " Maintainer: <vacancy>
> + " Previous Maintainer: Aaron Griffin <aaronmgriffin@gmail.com>
> +-" Version: 0.9
> +-" Last Updated: 2022 Mar 30
> ++" Version: 0.10
> ++" Last Updated: 2026 Jun 04
> + "
> + " Roland Puntaier: this file contains adaptations for python3 and is pa=
rallel to pythoncomplete.vim
> + "
> +@@ -17,6 +17,11 @@
> + " v 0.10 by Vim project
> + "   * disables importing local modules, unless the global Vim variable
> + "     g:pythoncomplete_allow_import is set to non-zero
> ++"   * strip default values and annotations from function parameter list=
s
> ++"     before exec(), and whitelist class base lists to dotted names: th=
e
> ++"     previous code passed buffer-supplied expressions to exec() which
> ++"     Python evaluates at definition time, allowing arbitrary code
> ++"     execution via crafted def/class headers
> + "
> + " v 0.9
> + "   * Fixed docstring parsing for classes and functions
> +@@ -100,6 +105,24 @@ warnings.simplefilter(action=3D'ignore', category=
=3DFutureWarning)
> +=20
> + import sys, tokenize, io, types
> + from token import NAME, DEDENT, NEWLINE, STRING
> ++import re
> ++
> ++# Used by Class.get_code(): a base class expression is only included in=
 the
> ++# code passed to exec() if it is a pure dotted name (e.g. "Base", "mod.=
Base",
> ++# "pkg.sub.Cls").  Anything containing calls, subscripts, "=3D", ":" or=
 other
> ++# operators is dropped, since exec()-ing it would evaluate buffer-suppl=
ied
> ++# expressions.  See the security note in the file header.
> ++_DOTTED_NAME_RE =3D re.compile(r'^[A-Za-z_]\w*(\s*\.\s*[A-Za-z_]\w*)*$'=
)
> ++
> ++def _strip_param(p):
> ++    # Return the bare parameter name from a parameter spec harvested by
> ++    # _parenparse(), discarding any default value or annotation.  Defau=
lt
> ++    # values and annotations would otherwise be evaluated by exec() at
> ++    # function-definition time.  Star prefixes ("*args", "**kw") and ba=
re
> ++    # "*" / "/" are preserved as written.
> ++    p =3D p.split('=3D', 1)[0]
> ++    p =3D p.split(':', 1)[0]
> ++    return p.strip()
> +=20
> + debugstmts=3D[]
> + def dbg(s): debugstmts.append(s)
> +@@ -347,7 +370,13 @@ class Class(Scope):
> +         return c
> +     def get_code(self):
> +         str =3D '%sclass %s' % (self.currentindent(),self.name)
> +-        if len(self.supers) > 0: str +=3D '(%s)' % ','.join(self.supers=
)
> ++        # Only include base class expressions that are pure dotted name=
s.
> ++        # Anything else (calls, subscripts, conditionals, ...) is dropp=
ed
> ++        # because exec() would evaluate it at class-definition time.  S=
ee
> ++        # the security note in the file header.
> ++        safe_supers =3D [s.strip() for s in self.supers
> ++                       if _DOTTED_NAME_RE.match(s.strip())]
> ++        if len(safe_supers) > 0: str +=3D '(%s)' % ','.join(safe_supers=
)
> +         str +=3D ':\n'
> +         if len(self.docstr) > 0: str +=3D self.childindent()+'"""'+self=
.docstr+'"""\n'
> +         if len(self.subscopes) > 0:
> +@@ -364,8 +393,14 @@ class Function(Scope):
> +     def copy_decl(self,indent=3D0):
> +         return Function(self.name,self.params,indent, self.docstr)
> +     def get_code(self):
> ++        # Strip default values and annotations from each parameter befo=
re
> ++        # joining: exec() evaluates these at definition time and a host=
ile
> ++        # buffer could otherwise execute arbitrary code via crafted def
> ++        # headers.  See file header for details.
> ++        safe_params =3D [_strip_param(p) for p in self.params]
> ++        safe_params =3D [p for p in safe_params if p]
> +         str =3D "%sdef %s(%s):\n" % \
> +-            (self.currentindent(),self.name,','.join(self.params))
> ++            (self.currentindent(),self.name,','.join(safe_params))
> +         if len(self.docstr) > 0: str +=3D self.childindent()+'"""'+self=
.docstr+'"""\n'
> +         str +=3D "%spass\n" % self.childindent()
> +         return str
> +diff --git a/runtime/autoload/pythoncomplete.vim b/runtime/autoload/pyth=
oncomplete.vim
> +index 1014776..39b1efd 100644
> +--- a/runtime/autoload/pythoncomplete.vim
> ++++ b/runtime/autoload/pythoncomplete.vim
> +@@ -1,8 +1,8 @@
> + "pythoncomplete.vim - Omni Completion for python
> + " Maintainer: <vacancy>
> + " Previous Maintainer: Aaron Griffin <aaronmgriffin@gmail.com>
> +-" Version: 0.9
> +-" Last Updated: 2020 Oct 9
> ++" Version: 0.10
> ++" Last Updated: 2026 Jun 04
> + "
> + " Changes
> + " TODO:
> +@@ -15,6 +15,11 @@
> + " v 0.10 by Vim project
> + "   * disables importing local modules, unless the global Vim variable
> + "     g:pythoncomplete_allow_import is set to non-zero
> ++"   * strip default values and annotations from function parameter list=
s
> ++"     before exec(), and whitelist class base lists to dotted names: th=
e
> ++"     previous code passed buffer-supplied expressions to exec() which
> ++"     Python evaluates at definition time, allowing arbitrary code
> ++"     execution via crafted def/class headers
> + "
> + " v 0.9
> + "   * Fixed docstring parsing for classes and functions
> +@@ -95,6 +100,24 @@ function! s:DefPython()
> + python << PYTHONEOF
> + import sys, tokenize, cStringIO, types
> + from token import NAME, DEDENT, NEWLINE, STRING
> ++import re
> ++
> ++# Used by Class.get_code(): a base class expression is only included in=
 the
> ++# code passed to exec() if it is a pure dotted name (e.g. "Base", "mod.=
Base",
> ++# "pkg.sub.Cls").  Anything containing calls, subscripts, "=3D", ":" or=
 other
> ++# operators is dropped, since exec()-ing it would evaluate buffer-suppl=
ied
> ++# expressions.  See the security note in the file header.
> ++_DOTTED_NAME_RE =3D re.compile(r'^[A-Za-z_]\w*(\s*\.\s*[A-Za-z_]\w*)*$'=
)
> ++
> ++def _strip_param(p):
> ++    # Return the bare parameter name from a parameter spec harvested by
> ++    # _parenparse(), discarding any default value or annotation.  Defau=
lt
> ++    # values and annotations would otherwise be evaluated by exec() at
> ++    # function-definition time.  Star prefixes ("*args", "**kw") and ba=
re
> ++    # "*" / "/" are preserved as written.
> ++    p =3D p.split('=3D', 1)[0]
> ++    p =3D p.split(':', 1)[0]
> ++    return p.strip()
> +=20
> + debugstmts=3D[]
> + def dbg(s): debugstmts.append(s)
> +@@ -362,7 +385,13 @@ class Class(Scope):
> +         return c
> +     def get_code(self):
> +         str =3D '%sclass %s' % (self.currentindent(),self.name)
> +-        if len(self.supers) > 0: str +=3D '(%s)' % ','.join(self.supers=
)
> ++        # Only include base class expressions that are pure dotted name=
s.
> ++        # Anything else (calls, subscripts, conditionals, ...) is dropp=
ed
> ++        # because exec() would evaluate it at class-definition time.  S=
ee
> ++        # the security note in the file header.
> ++        safe_supers =3D [s.strip() for s in self.supers
> ++                       if _DOTTED_NAME_RE.match(s.strip())]
> ++        if len(safe_supers) > 0: str +=3D '(%s)' % ','.join(safe_supers=
)
> +         str +=3D ':\n'
> +         if len(self.docstr) > 0: str +=3D self.childindent()+'"""'+self=
.docstr+'"""\n'
> +         if len(self.subscopes) > 0:
> +@@ -379,8 +408,14 @@ class Function(Scope):
> +     def copy_decl(self,indent=3D0):
> +         return Function(self.name,self.params,indent, self.docstr)
> +     def get_code(self):
> ++        # Strip default values and annotations from each parameter befo=
re
> ++        # joining: exec() evaluates these at definition time and a host=
ile
> ++        # buffer could otherwise execute arbitrary code via crafted def
> ++        # headers.  See file header for details.
> ++        safe_params =3D [_strip_param(p) for p in self.params]
> ++        safe_params =3D [p for p in safe_params if p]
> +         str =3D "%sdef %s(%s):\n" % \
> +-            (self.currentindent(),self.name,','.join(self.params))
> ++            (self.currentindent(),self.name,','.join(safe_params))
> +         if len(self.docstr) > 0: str +=3D self.childindent()+'"""'+self=
.docstr+'"""\n'
> +         str +=3D "%spass\n" % self.childindent()
> +         return str
> +diff --git a/src/testdir/Make_all.mak b/src/testdir/Make_all.mak
> +index 0d4aeb0..87545b7 100644
> +--- a/src/testdir/Make_all.mak
> ++++ b/src/testdir/Make_all.mak
> +@@ -247,6 +247,7 @@ NEW_TESTS =3D \
> + 	test_plugin_helptoc \
> + 	test_plugin_man \
> + 	test_plugin_matchparen \
> ++	test_plugin_python3complete \
> + 	test_plugin_tar \
> + 	test_plugin_termdebug \
> + 	test_plugin_tohtml \
> +@@ -520,6 +521,7 @@ NEW_TESTS_RES =3D \
> + 	test_plugin_helptoc.res \
> + 	test_plugin_man.res \
> + 	test_plugin_matchparen.res \
> ++	test_plugin_python3complete.res \
> + 	test_plugin_tar.res \
> + 	test_plugin_termdebug.res \
> + 	test_plugin_tohtml.res \
> +diff --git a/src/testdir/test_plugin_python3complete.vim b/src/testdir/t=
est_plugin_python3complete.vim
> +new file mode 100644
> +index 0000000..e2b0c66
> +--- /dev/null
> ++++ b/src/testdir/test_plugin_python3complete.vim
> +@@ -0,0 +1,224 @@
> ++" Tests for the Python omni-completion plugin (runtime/autoload/python3=
complete.vim).
> ++"
> ++CheckFeature python3
> ++
> ++" Run omni-completion against the given buffer contents and assert that=
 the
> ++" marker file was not created.  Pre-patch behaviour exec()s reconstruct=
ed
> ++" def/class headers, which evaluates the buffer-supplied expression and
> ++" creates the marker file.  Post-patch, the expressions are stripped.
> ++func s:CompleteAndExpectNoMarker(buffer_lines, marker_path, msg)
> ++  call delete(a:marker_path)
> ++  defer delete(a:marker_path)
> ++  let g:pythoncomplete_allow_import =3D 0
> ++  new
> ++  setfiletype python
> ++  call setline(1, a:buffer_lines)
> ++  call cursor(line('$'), col([line('$'), '$']))
> ++
> ++  " The PoC trigger -- direct invocation of the omnifunc with an empty =
base.
> ++  " This is the same path Vim takes for CTRL-X CTRL-O.
> ++  silent! call python3complete#Complete(0, '')
> ++
> ++  call assert_false(filereadable(a:marker_path),
> ++        \ a:msg . ' (marker ' . a:marker_path . ' was created)')
> ++
> ++  bwipe!
> ++  unlet! g:pythoncomplete_allow_import
> ++endfunc
> ++
> ++func Test_python3complete_no_exec_via_function_default()
> ++  let marker =3D tempname()
> ++  call s:CompleteAndExpectNoMarker([
> ++        \ 'def f(x=3Dopen(' . string(marker) . ', "w").close()):',
> ++        \ '    pass',
> ++        \ 'f.',
> ++        \ ], marker,
> ++        \ 'function default expression was evaluated during omni-comple=
tion')
> ++endfunc
> ++
> ++func Test_python3complete_no_exec_via_function_annotation()
> ++  let marker =3D tempname()
> ++  call s:CompleteAndExpectNoMarker([
> ++        \ 'def f(x: open(' . string(marker) . ', "w").close()):',
> ++        \ '    pass',
> ++        \ 'f.',
> ++        \ ], marker,
> ++        \ 'function annotation expression was evaluated during omni-com=
pletion')
> ++endfunc
> ++
> ++func Test_python3complete_no_exec_via_class_base()
> ++  let marker =3D tempname()
> ++  " "or object" gives the class a valid base after the side-effecting
> ++  " open().close() expression returns None.  Without "or object" the
> ++  " exec would raise TypeError, but the file would still be created
> ++  " before the exception -- the assertion would still hold.  Using
> ++  " "or object" keeps the buffer parseable as valid Python.
> ++  call s:CompleteAndExpectNoMarker([
> ++        \ 'class Foo(open(' . string(marker) . ', "w").close() or objec=
t):',
> ++        \ '    pass',
> ++        \ 'Foo.',
> ++        \ ], marker,
> ++        \ 'class base expression was evaluated during omni-completion')
> ++endfunc
> ++
> ++func Test_python3complete_no_exec_with_multiple_params()
> ++  " The strip must apply to every parameter, not just the first.
> ++  let marker =3D tempname()
> ++  call s:CompleteAndExpectNoMarker([
> ++        \ 'def f(a, b=3D1, c=3Dopen(' . string(marker) . ', "w").close(=
), d=3D2):',
> ++        \ '    pass',
> ++        \ 'f.',
> ++        \ ], marker,
> ++        \ 'non-first parameter default was evaluated during omni-comple=
tion')
> ++endfunc
> ++
> ++func Test_python3complete_no_exec_via_starargs_default()
> ++  " "*args" and "**kw" must still be preserved after stripping; ensure =
a
> ++  " default following them is also stripped.
> ++  let marker =3D tempname()
> ++  call s:CompleteAndExpectNoMarker([
> ++        \ 'def f(*args, key=3Dopen(' . string(marker) . ', "w").close()=
, **kw):',
> ++        \ '    pass',
> ++        \ 'f.',
> ++        \ ], marker,
> ++        \ 'keyword-only default after *args was evaluated during omni-c=
ompletion')
> ++endfunc
> ++
> ++func Test_python3complete_normal_completion_still_works()
> ++  " Positive control: completion against a buffer with a legitimate cla=
ss
> ++  " must still produce completion items.  The stripping logic should no=
t
> ++  " break the normal completion path.
> ++  let g:pythoncomplete_allow_import =3D 0
> ++
> ++  new
> ++  setfiletype python
> ++  call setline(1, [
> ++        \ 'class MyHelper:',
> ++        \ '    def alpha(self): pass',
> ++        \ '    def beta(self): pass',
> ++        \ 'h =3D MyHelper()',
> ++        \ 'h.',
> ++        \ ])
> ++  call cursor(5, 3)
> ++
> ++  " First call returns the column to start completion at; second return=
s
> ++  " the list of completion items.
> ++  let start =3D python3complete#Complete(1, '')
> ++  call assert_true(start >=3D 0,
> ++        \ 'python3complete#Complete(1, "") returned ' . start)
> ++
> ++  let items =3D python3complete#Complete(0, '')
> ++  " Items should be a list (possibly empty if the parser can't resolve =
"h",
> ++  " but should not be a parse error from our stripping changes).
> ++  call assert_equal(type([]), type(items),
> ++        \ 'python3complete#Complete(0, "") did not return a list')
> ++
> ++  bwipe!
> ++  unlet! g:pythoncomplete_allow_import
> ++endfunc
> ++
> ++func Test_python3complete_inherited_completion_via_dotted_base()
> ++  " Positive control for the class-base whitelist: a dotted-name base c=
lass
> ++  " (the common, safe case) must still be carried into the reconstructe=
d
> ++  " source so that completion on a subclass can resolve inherited membe=
rs.
> ++  let g:pythoncomplete_allow_import =3D 0
> ++
> ++  new
> ++  setfiletype python
> ++  call setline(1, [
> ++        \ 'class Base:',
> ++        \ '    def shared(self): pass',
> ++        \ 'class Derived(Base):',
> ++        \ '    def own(self): pass',
> ++        \ 'd =3D Derived()',
> ++        \ 'd.',
> ++        \ ])
> ++  call cursor(6, 3)
> ++
> ++  let items =3D python3complete#Complete(0, '')
> ++  call assert_equal(type([]), type(items),
> ++        \ 'completion against a subclass with a dotted base did not ret=
urn a list')
> ++
> ++  bwipe!
> ++  unlet! g:pythoncomplete_allow_import
> ++endfunc
> ++
> ++" Build a tiny Python module that creates a marker file as a side effec=
t of
> ++" being imported, add its directory to sys.path, run omni-completion ag=
ainst
> ++" a buffer containing `import vimtest_marker_mod`, and report whether t=
he
> ++" marker file was created.  Used by the two allow_import tests below.
> ++func s:RunImportCompletion(allow_import_value)
> ++  let g:pythoncomplete_allow_import =3D a:allow_import_value
> ++  let marker =3D tempname()
> ++  let module_dir =3D tempname()
> ++  call mkdir(module_dir, 'R')
> ++
> ++  call writefile([
> ++        \ 'open(' . string(marker) . ', "w").close()',
> ++        \ ], module_dir . '/vimtest_marker_mod.py')
> ++
> ++  defer delete(marker)
> ++
> ++  " Pass module_dir to Python via a g: variable so vim.eval() can read =
it.
> ++  let g:pythoncomplete_test_module_dir =3D module_dir
> ++  py3 << EOF
> ++import sys, vim
> ++_p =3D vim.eval('g:pythoncomplete_test_module_dir')
> ++if _p not in sys.path:
> ++    sys.path.insert(0, _p)
> ++# Drop any cached copy so the module body re-runs and the marker side
> ++# effect fires on import.
> ++sys.modules.pop('vimtest_marker_mod', None)
> ++EOF
> ++
> ++  new
> ++  setfiletype python
> ++  call setline(1, [
> ++        \ 'import vimtest_marker_mod',
> ++        \ 'vimtest_marker_mod.',
> ++        \ ])
> ++  call cursor(2, 2)
> ++
> ++  silent! call python3complete#Complete(0, '')
> ++
> ++  let ran =3D filereadable(marker)
> ++
> ++  bwipe!
> ++  unlet g:pythoncomplete_allow_import
> ++
> ++  " Teardown: restore sys.path, drop the cached module so a subsequent
> ++  " test run starts clean, clean up the temp module dir.
> ++  py3 << EOF
> ++import sys, vim
> ++_p =3D vim.eval('g:pythoncomplete_test_module_dir')
> ++if _p in sys.path:
> ++    sys.path.remove(_p)
> ++sys.modules.pop('vimtest_marker_mod', None)
> ++EOF
> ++  unlet g:pythoncomplete_test_module_dir
> ++  call delete(module_dir, 'rf')
> ++  call delete(marker)
> ++  unlet! g:pythoncomplete_allow_import
> ++
> ++  return ran
> ++endfunc
> ++
> ++func Test_python3complete_allow_import_off_blocks_imports()
> ++  " GHSA-52mc-rq6p-rc7c mitigation: with the default flag value (0), an
> ++  " `import` line harvested from the buffer must NOT be exec()'d.  The
> ++  " marker module's side effect (creating a file when its body runs) is
> ++  " the observable proof that the exec did or did not happen.
> ++  call assert_false(s:RunImportCompletion(0),
> ++        \ 'g:pythoncomplete_allow_import=3D0 did not block the buffer i=
mport')
> ++endfunc
> ++
> ++func Test_python3complete_allow_import_on_runs_imports()
> ++  " Symmetric positive control: with the flag set to non-zero, the harv=
ested
> ++  " import IS exec()'d and the module loads.  Without this control the
> ++  " negative test above could pass for unrelated reasons (e.g. completi=
on
> ++  " failing to parse the buffer at all).
> ++  call assert_true(s:RunImportCompletion(1),
> ++        \ 'g:pythoncomplete_allow_import=3D1 did not run the buffer imp=
ort')
> ++endfunc
> ++
> ++" vim: shiftwidth=3D2 sts=3D2 expandtab
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
> index 95d00a09bd..4311c36f5b 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -33,6 +33,9 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmast=
er;protocol=3Dhttps \
>             file://CVE-2026-45130.patch \
>             file://CVE-2026-46483.patch \
>             file://CVE-2026-28420.patch \
> +           file://CVE-2026-52858.patch \
> +           file://CVE-2026-52859.patch \
> +           file://CVE-2026-52860.patch \
>             "
> =20
>  PV .=3D ".1683"


--=20
Yoann Congal
Smile ECS


