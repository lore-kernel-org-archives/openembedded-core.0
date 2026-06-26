Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D207C43211
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 22:22:41 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45593.1782512552651569420
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 15:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2BKbXGJ3;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49263703c6eso13161525e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 15:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782512551; x=1783117351; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NB/yO8qFQXw5omSp4skQ7F0MERFu4YFjVbFz8zlhqo=;
        b=2BKbXGJ3ohFOo/LMWOvvZGvUJqu63/zbJgVStf5Hs+7nqUA2BJZeJIwODdUBCeEdZO
         4oLF2UIvjSNjlIkHawnxrntuAzvwtLnqSCnqDkMe0ovgvvJz2cUX24Ol5eVWUd5qaYdY
         u6L6CFoVNbKpq5PK/JRh8I3rIeL9u1+9Pchuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782512551; x=1783117351;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5NB/yO8qFQXw5omSp4skQ7F0MERFu4YFjVbFz8zlhqo=;
        b=ZpgyIT31U3KSeHz13HqG7vP46wQ5/YHx4kgjOxkXQ6JWom2QtMst4+FRk+jn3NiTrD
         cu+K8rRj5H8N5sezPSerZ2llFwe80E4AbKjkLBvbLI/pUbACdkUcfS2KImMZmLgZ0nlt
         riU97Di7U57XftCUG1FaDzAqmSRBGnK5xnt4ONQro+qf5Om4DhH9vNIZN8lnAg0g611J
         p5s6L7RVFMNaPKHV0BWy5dd62HDG4ndmfIfoCfP+veoXziRL/ZGSqTFwh/H2dp+2E9xz
         QWcNv3W9BZFQQWUw8M9K8MMjWU/8L/QFKjbNuu/embKZJmdgSMSn6mUUFqc/WvERLxm0
         vQSQ==
X-Forwarded-Encrypted: i=1; AFNElJ9PR/kRbSiI1RxVcwLxF27BiNJU5kr09pXD/FtcIE9QUr3WoBavO2fUbB1uDnvqlUGqPC/8BEFyFqf54u6eKBYIdA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyJnmul9Wo32b3xyyhKuBimo4delEnw3ajT81WwekS6h4Ws3OrE
	mP/XZzHtdh30AtziGablAboutTQlrRT43hbG7Efe/Y/qZW9tUFglMtGErzKl6xhB+YQ=
X-Gm-Gg: AfdE7cmOTkrqEvpO55ZXJpixsh5wPNiJHSq8mpIr6LuskQx6LdCisoyvS3jPqnUTUGK
	e6EYY6EsY8qPgoYKWPn/EUIbKWdkHwPEHnz7qdV/UQz49wHWrJg2PblvfxRAjq5V0sCh72u3Ed5
	Dc20238Ya5KH1q1BnPW++6yfFMrl6JbunsHEiS9uKeZGmYyevp84fCtoHdGyUPuS43HXgLyo5Qc
	UKIo+7aeFalBsmMkr/SDI8Fe9kIGH3BUbc12Bu3vZYzUF2q0mkyE/8nWMaXbuC2jneqB/ZLlFZt
	7UxG3qTeibSXjT0mxqGfR9RyLhOoRQtHxuNluqot3tkDwoNoEsz5ihU5mtUhrawc7Bd47FNzcRU
	l6w+XZMZ4tprwgpIBaQmOedVCpHzpbRJr24UTVkUdVBUCRsJuQf6cNgjLURq/ktEwy2Lul4F77M
	8FWzTg19pKEJ1S/6Z+a/yedU66egH2MAxfP/NyCbLSWWJC0gMLj5HZiCTG59WlN+CcVY9mHxNRO
	OiEgA==
X-Received: by 2002:a05:600c:1d0e:b0:492:63ff:d577 with SMTP id 5b1f17b1804b1-49266899cf0mr130882375e9.27.1782512550733;
        Fri, 26 Jun 2026 15:22:30 -0700 (PDT)
Received: from localhost (2a01cb001331aa00b5501ee7aae29268.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b550:1ee7:aae2:9268])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c02088dsm68323275e9.0.2026.06.26.15.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 15:22:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Jun 2026 00:22:30 +0200
Message-Id: <DJJBYOS9JEWI.3KS96J6UW40UZ@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCHv2] vim: Security fix for
 CVE-2026-28420 & CVE-2026-46483
X-Mailer: aerc 0.20.0
References: <20260622122522.25851-1-hprajapati@mvista.com>
In-Reply-To: <20260622122522.25851-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 22:22:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239666

On Mon Jun 22, 2026 at 2:25 PM CEST, Hitendra Prajapati via lists.openembed=
ded.org wrote:
> Pick patch from [1] & [2] also mentioned at NVD report in 3 & 4
>
> [1] https://github.com/vim/vim/commit/bb6de2105b160e729c340631435cd62f3e6=
9bd32
> [2] https://github.com/vim/vim/commit/3fb5e58fbc63d86a3e65f1a141b0d67af2a=
a38a1
> [3] https://nvd.nist.gov/vuln/detail/CVE-2026-28420
> [4] https://nvd.nist.gov/vuln/detail/CVE-2026-46483

Hello,

CVE-2026-46483 impacts wrynose and a patch must be sent for wrynose
before the fix can be merged on scarthgap.

Regards,

>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../vim/files/CVE-2026-28420.patch            | 162 ++++++++++++++++++
>  .../vim/files/CVE-2026-46483.patch            |  77 +++++++++
>  meta/recipes-support/vim/vim.inc              |   2 +
>  3 files changed, 241 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-28420.patch
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-46483.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2026-28420.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-28420.patch
> new file mode 100644
> index 0000000000..72e87d470a
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-28420.patch
> @@ -0,0 +1,162 @@
> +From bb6de2105b160e729c340631435cd62f3e69bd32 Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Mon, 23 Feb 2026 20:29:43 +0000
> +Subject: [PATCH] patch 9.2.0076: [security]: buffer-overflow in terminal
> + handling
> +
> +Problem:  When processing terminal output with many combining characters
> +          from supplementary planes (4-byte UTF-8), a heap-buffer
> +          overflow occurs. Additionally, the loop iterating over
> +          cell characters can read past the end of the vterm array
> +          (ehdgks0627, un3xploitable).
> +Solution: Use VTERM_MAX_CHARS_PER_CELL * 4 for ga_grow() to ensure
> +          sufficient space. Add a boundary check to the character
> +          loop to prevent index out-of-bounds access.
> +
> +Github Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-rvj2-jrf9-2phg
> +
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +
> +Upstream-Status: Backport from [https://github.com/vim/vim/commit/bb6de2=
105b160e729c340631435cd62f3e69bd32]
> +CVE: CVE-2026-28420
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + src/terminal.c                                |  5 +-
> + .../samples/terminal_max_combining_chars.txt  | 80 +++++++++++++++++++
> + src/testdir/test_terminal3.vim                | 14 ++++
> + 3 files changed, 97 insertions(+), 2 deletions(-)
> + create mode 100644 src/testdir/samples/terminal_max_combining_chars.txt
> +
> +diff --git a/src/terminal.c b/src/terminal.c
> +index 921b234..78990ac 100644
> +--- a/src/terminal.c
> ++++ b/src/terminal.c
> +@@ -3533,12 +3533,13 @@ handle_pushline(int cols, const VTermScreenCell =
*cells, void *user)
> +     {
> + 	for (col =3D 0; col < len; col +=3D cells[col].width)
> + 	{
> +-	    if (ga_grow(&ga, MB_MAXBYTES) =3D=3D FAIL)
> ++	    if (ga_grow(&ga, VTERM_MAX_CHARS_PER_CELL * 4) =3D=3D FAIL)
> + 	    {
> + 		ga.ga_len =3D 0;
> + 		break;
> + 	    }
> +-	    for (i =3D 0; (c =3D cells[col].chars[i]) > 0 || i =3D=3D 0; ++i)
> ++	    for (i =3D 0; i < VTERM_MAX_CHARS_PER_CELL &&
> ++		    ((c =3D cells[col].chars[i]) > 0 || i =3D=3D 0); ++i)
> + 		ga.ga_len +=3D utf_char2bytes(c =3D=3D NUL ? ' ' : c,
> + 			(char_u *)ga.ga_data + ga.ga_len);
> + 	    cell2cellattr(&cells[col], &p[col]);
> +diff --git a/src/testdir/samples/terminal_max_combining_chars.txt b/src/=
testdir/samples/terminal_max_combining_chars.txt
> +new file mode 100644
> +index 0000000..a4f508d
> +--- /dev/null
> ++++ b/src/testdir/samples/terminal_max_combining_chars.txt
> +@@ -0,0 +1,80 @@
> ++padding line 000
> ++padding line 001
> ++padding line 002
> ++padding line 003
> ++padding line 004
> ++padding line 005
> ++padding line 006
> ++padding line 007
> ++padding line 008
> ++padding line 009
> ++padding line 010
> ++padding line 011
> ++padding line 012
> ++padding line 013
> ++padding line 014
> ++padding line 015
> ++padding line 016
> ++padding line 017
> ++padding line 018
> ++padding line 019
> ++padding line 020
> ++padding line 021
> ++padding line 022
> ++padding line 023
> ++padding line 024
> ++padding line 025
> ++padding line 026
> ++padding line 027
> ++padding line 028
> ++padding line 029
> ++padding line 030
> ++padding line 031
> ++padding line 032
> ++padding line 033
> ++padding line 034
> ++padding line 035
> ++padding line 036
> ++padding line 037
> ++padding line 038
> ++padding line 039
> ++padding line 040
> ++padding line 041
> ++padding line 042
> ++padding line 043
> ++padding line 044
> ++padding line 045
> ++padding line 046
> ++padding line 047
> ++padding line 048
> ++padding line 049
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> ++AAAAAAAAAAAAAAAAAAAAAAAAAAAA=F0=90=80=80=F3=A0=84=80=F3=A0=84=81=F3=A0=
=84=82=F3=A0=84=83=F3=A0=84=84
> +diff --git a/src/testdir/test_terminal3.vim b/src/testdir/test_terminal3=
.vim
> +index 218b4e6..cb1946f 100644
> +--- a/src/testdir/test_terminal3.vim
> ++++ b/src/testdir/test_terminal3.vim
> +@@ -1037,4 +1037,18 @@ func Test_terminal_visual_empty_listchars()
> +   call StopVimInTerminal(buf)
> + endfunc
> +=20
> ++func Test_terminal_max_combining_chars()
> ++  " somehow doesn't work on MS-Windows
> ++  CheckUnix
> ++  let cmd =3D "cat samples/terminal_max_combining_chars.txt\<CR>"
> ++  let buf =3D Run_shell_in_terminal({'term_rows': 15, 'term_cols': 35})
> ++  call TermWait(buf)
> ++  call term_sendkeys(buf, cmd)
> ++  " last char is a space with many combining chars
> ++  call WaitForAssert({-> assert_match("AAAAAAAAAAAAAAAAAAAAAAAAAAAA.", =
term_getline(buf, 14))})
> ++
> ++  call term_sendkeys(buf, "exit\r")
> ++  exe buf . "bwipe!"
> ++endfunc
> ++
> + " vim: shiftwidth=3D2 sts=3D2 expandtab
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-support/vim/files/CVE-2026-46483.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-46483.patch
> new file mode 100644
> index 0000000000..d28402cc67
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-46483.patch
> @@ -0,0 +1,77 @@
> +From 3fb5e58fbc63d86a3e65f1a141b0d67af2aa38a1 Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Thu, 14 May 2026 15:35:28 +0000
> +Subject: [PATCH] patch 9.2.0479: [security]: runtime(tar): command injec=
tion
> + in tar plugin
> +
> +Problem:  [security]: runtime(tar): command injection in tar plugin
> +          (Christopher Lusk)
> +Solution: Use the correct shellescape(args, 1) form for a :! command
> +
> +Github Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-2fpv-9ff7-xg5w
> +
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +
> +Upstream-Status: Backport from [https://github.com/vim/vim/commit/3fb5e5=
8fbc63d86a3e65f1a141b0d67af2aa38a1]
> +CVE: CVE-2026-46483
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + runtime/autoload/tar.vim        |  5 +++--
> + src/testdir/test_plugin_tar.vim | 19 +++++++++++++++++++
> + 2 files changed, 22 insertions(+), 2 deletions(-)
> +
> +diff --git a/runtime/autoload/tar.vim b/runtime/autoload/tar.vim
> +index 74a5b38..95d2be0 100644
> +--- a/runtime/autoload/tar.vim
> ++++ b/runtime/autoload/tar.vim
> +@@ -18,6 +18,7 @@
> + "   2025 May 19 by Vim Project: restore working directory after read/wr=
ite
> + "   2025 Jul 13 by Vim Project: warn with path traversal attacks
> + "   2025 Jul 16 by Vim Project: update minimum vim version
> ++"   2026 May 14 by Vim Project: use correct shellescape() call in Vimun=
tar()
> + "
> + "	Contains many ideas from Michael Toren's <tar.vim>
> + "
> +@@ -800,9 +801,9 @@ fun! tar#Vimuntar(...)
> +   " if necessary, decompress the tarball; then, extract it
> +   if tartail =3D~ '\.tgz'
> +    if executable("gunzip")
> +-    silent exe "!gunzip ".shellescape(tartail)
> ++    silent exe "!gunzip ".shellescape(tartail, 1)
> +    elseif executable("gzip")
> +-    silent exe "!gzip -d ".shellescape(tartail)
> ++    silent exe "!gzip -d ".shellescape(tartail, 1)
> +    else
> +     echoerr "unable to decompress<".tartail."> on this system"
> +     if simplify(curdir) !=3D simplify(tarhome)
> +diff --git a/src/testdir/test_plugin_tar.vim b/src/testdir/test_plugin_t=
ar.vim
> +index ebf74d7..8e776a4 100644
> +--- a/src/testdir/test_plugin_tar.vim
> ++++ b/src/testdir/test_plugin_tar.vim
> +@@ -126,3 +126,22 @@ def g:Test_tar_evil()
> +=20
> +   bw!
> + enddef
> ++
> ++def g:Test_extract_command_injection()
> ++  CheckExecutable gunzip
> ++  CheckExecutable touch
> ++  var tgz =3D eval('0z1F8B08087795056A000364756D6D792E74617200EDCE2B12C=
2300004D01C254' ..
> ++   '7480269CE534080A8495BD1DBF3996106C3A08A7ACFACD8157B59A7690BFB4A0FC3=
707C666E357D' ..
> ++   'E65BC8B5A47CC8A5D61A522EA5B510D3CEBF5ED679197B8CE17CEDB7F9D4C76FBB5=
F3D000000000' ..
> ++   '000000000FCD11D32415E2C00280000')
> ++  var dirname =3D tempname()
> ++
> ++  mkdir(dirname, 'R')
> ++  var tar =3D dirname .. "/';%$(touch pwned)'.tgz"
> ++  writefile(tgz, tar)
> ++  new
> ++  exe "e " .. fnameescape(tar)
> ++  exe ":Vimuntar " .. dirname
> ++  assert_false(filereadable(dirname .. "/pwned"))
> ++  bw!
> ++enddef
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
> index 262833ea33..95d00a09bd 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -31,6 +31,8 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmast=
er;protocol=3Dhttps \
>             file://CVE-2026-32249.patch \
>             file://CVE-2026-28417.patch \
>             file://CVE-2026-45130.patch \
> +           file://CVE-2026-46483.patch \
> +           file://CVE-2026-28420.patch \
>             "
> =20
>  PV .=3D ".1683"


--=20
Yoann Congal
Smile ECS


