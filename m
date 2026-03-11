Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C88104C007
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 11:24:13 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19111.1773228245894802275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 04:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XX1Da5IJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4853fd7b59aso19484275e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 04:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773228244; x=1773833044; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xAVFEptVeZo1o1o1xlChGcn73QvbgX6V5Teu40++WCQ=;
        b=XX1Da5IJy9W7zIG0JLP4XGqMxFwRt/0yxtRIHLGAwjl2i2bAQLVGqq1qKVvuZb+M/e
         fTNK6WYhcraY7LUJ6ablvmPxI2bYNdjSrLq6oK2K4ibSdnGGvqT8IXB3F8wk+ukkpJdB
         b0vZ0NTbwphTZTM/VmAR5ejhMILyed1Fa9lZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773228244; x=1773833044;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xAVFEptVeZo1o1o1xlChGcn73QvbgX6V5Teu40++WCQ=;
        b=xTD6dnM903vdcyvlxmZ7Qm+4JQbXK5SGECN70LWYHQ5whmDW88sebN2grutdXR7VkH
         qPBq43NhBGz6QOwkzCsuSfPx+CHSrHG2QzVYKbdJ7QbTcchj0Dy+WVIIOejae64OyfCf
         DEAeARWhmqB+T2/gtTUiHveubylRVL2EnJfpxC5vxXaOVnqObyz3b8Vj7Cc0FNAyTBTo
         b+SUb1Ob7hhQwxn/jRuTUWfiVzGUjTPtQE/Y+KeGLvL9ZExGNpZqzPRCqEkpQYtUtnFT
         T3vI1OZ2libR1b6RYgDmVvFAfSDlm3lzlKd8uq0s6j3LdtDmPxBNUrkAmCVzRWtbLXiO
         XMig==
X-Forwarded-Encrypted: i=1; AJvYcCXG2MoFlepJSkZ0YsOOvnEhyz3Ln5UGKFVti5FbT1yLcqLWNzWlam5GtuT1uB06L0lHTT7lcrg9HyQ815M7cMOV3A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyfUuW5J7StIWwEgJH3vHTk/cWvBZ8ugbibjMmabJWzBB5HoX2t
	twQ4/pgybTW8T/q+ZMTgvvtt43m7c9cRPyhn3V/ZnE3+2wGhAW5LroMzFxZhsxVojUo=
X-Gm-Gg: ATEYQzy5aXjvb5BjOu/SMBLxNi3NsUR1zG6CHikdH/xkb00zxD8WSu/zMiOxupJTE6q
	qCWGUYZzETYYu50XiuGgDlLfMorkil0Xb9tMnPrM22i64QQfW68d+OA9koDRP8Ii9FcuYQOpWS8
	SW5tidbEkFVJsHd8vBs8Gt9fwi/SeCsI522olbuVqZxNOVeH6jFpC0dmfh+DrswD5XPcHMagUnb
	fiiNAU9BxIARAKR/vrCHlXdzLnUh6Z/YN8XW3xUCjPN9NV9B2CHZgKh6i9PuXe+k0r1MZLSje77
	SO4Q3ySKrDenNtVQDQeeGKj9MPHa1wrT6CZYmN+PxYELksS5uKE/tD90+N+iWZa1Lom3hwuRnzZ
	vvy8jQY/C9LNPBuISd38Ts5EYTCpAjFDWLbB6wltz5oSKrvCmr6ea1K84HX8zTcFmWsGJ/BBoyh
	oywvxVtz+Hh2Ezeoj6Th9aD4VVt+i522EpO8JJdrzNJ8rLtZ7N36/1W+eu1Fj/fWOSSdZapBGQ5
	jjMK4PJDtrmE6nnzoRb8FjOjA==
X-Received: by 2002:a05:600c:314e:b0:477:6d96:b3c8 with SMTP id 5b1f17b1804b1-4854b10f1e5mr38311085e9.23.1773228244100;
        Wed, 11 Mar 2026 04:24:04 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda211036bsm123245085a.23.2026.03.11.04.24.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 04:24:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 12:24:00 +0100
Message-Id: <DGZWY7O0F2CL.N6QM0K8VUK90@smile.fr>
Cc: <xe-linux-external@cisco.com>, <to@cisco.com>
To: <adongare@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [Whinlatter] [PATCH V2 2/2] vim: Fix CVE-2026-26269
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <131089.1773220389419496773@lists.openembedded.org>
 <20260311095159.2755236-1-adongare@cisco.com>
 <20260311095159.2755236-2-adongare@cisco.com>
In-Reply-To: <20260311095159.2755236-2-adongare@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 11:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232868

On Wed Mar 11, 2026 at 10:51 AM CET, Anil Dongare -X (adongare - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Anil Dongare <adongare@cisco.com>
>
> Pick patch from [1] also mentioned in [2]
> [1] https://github.com/vim/vim/commit/c5f312aad8e4179e437f81ad39a860cd0ef=
11970
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-26269
>
> Signed-off-by: Anil Dongare <adongare@cisco.com>
> ---
>  .../vim/files/CVE-2026-26269.patch            | 149 ++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |   1 +
>  2 files changed, 150 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-26269.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2026-26269.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-26269.patch
> new file mode 100644
> index 0000000000..c1c93782f2
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-26269.patch
> @@ -0,0 +1,149 @@
> +From b4fb08c06ee37e38c257d800347b062b78fed141 Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Fri, 13 Feb 2026 10:27:12 +0100
> +Subject: [PATCH] patch 9.1.2148: [security]: Buffer overflow in netbeans
> + interface
> +
> +Problem:  [security]: Buffer overflow in netbeans special_keys() handlin=
g
> +Solution: Limit writing to max KEYBUFLEN bytes to prevent writing out of
> +          bounds.
> +
> +Github Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-9w5c-hwr9-hc68
> +
> +CVE: CVE-2026-26269
> +Upstream-Status: Backport [https://github.com/vim/vim/commit/c5f312aad8e=
4179e437f81ad39a860cd0ef11970]
> +
> +Backport Changes:
> +- Excluded changes to src/version.c and runtime/doc/version9.txt

Except version9.txt is still included in the patch. Since you are adding
comment to the patch, please make sure they are accurate.

Thanks!

> +  from this backport. This file only tracks upstream version increments.
> +  We are applying a security fix, not a version upgrade. These changes
> +  were skipped to maintain current package versioning and avoid merge co=
nflicts.
> +
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +(cherry picked from commit c5f312aad8e4179e437f81ad39a860cd0ef11970)
> +Signed-off-by: Anil Dongare <adongare@cisco.com>
> +---
> + runtime/doc/version9.txt      |  5 +++
> + src/netbeans.c                |  2 +-
> + src/testdir/test_netbeans.py  |  4 ++-
> + src/testdir/test_netbeans.vim | 57 +++++++++++++++++++++++++++++++++++
> + 4 files changed, 66 insertions(+), 2 deletions(-)
> +
> +diff --git a/runtime/doc/version9.txt b/runtime/doc/version9.txt
> +index b82071757..b32400f17 100644
> +--- a/runtime/doc/version9.txt
> ++++ b/runtime/doc/version9.txt
> +@@ -41899,4 +41899,9 @@ features, but does not include runtime file chan=
ges (syntax, indent, ftplugin,
> + documentation, etc.)
> +
> +
> ++Patch 9.1.2148
> ++Problem:  [security]: Buffer overflow in netbeans special_keys() handli=
ng
> ++Solution: Limit writing to max KEYBUFLEN bytes to prevent writing out o=
f
> ++          bounds.
> ++
> +  vim:tw=3D78:ts=3D8:noet:ft=3Dhelp:norl:fdm=3Dmanual:nofoldenable
> +diff --git a/src/netbeans.c b/src/netbeans.c
> +index 4f5378512..8a341a20b 100644
> +--- a/src/netbeans.c
> ++++ b/src/netbeans.c
> +@@ -2302,7 +2302,7 @@ special_keys(char_u *args)
> +	if ((sep =3D strchr(tok, '-')) !=3D NULL)
> +	{
> +	    *sep =3D NUL;
> +-	    while (*tok)
> ++	    while (*tok && i + 2 < KEYBUFLEN)
> +	    {
> +		switch (*tok)
> +		{
> +diff --git a/src/testdir/test_netbeans.py b/src/testdir/test_netbeans.py
> +index 0d6b09680..585886fb4 100644
> +--- a/src/testdir/test_netbeans.py
> ++++ b/src/testdir/test_netbeans.py
> +@@ -112,7 +112,9 @@ class ThreadedTCPRequestHandler(socketserver.BaseReq=
uestHandler):
> +                   'startAtomic_Test' : '0:startAtomic!94\n',
> +                   'endAtomic_Test' : '0:endAtomic!95\n',
> +                   'AnnoScale_Test' : "".join(['2:defineAnnoType!60 ' + =
str(i) + ' "s' + str(i) + '" "x" "=3D>" blue none\n' for i in range(2, 26)]=
),
> +-                  'detach_Test' : '2:close!96\n1:close!97\nDETACH\n'
> ++                  'detach_Test' : '2:close!96\n1:close!97\nDETACH\n',
> ++                  'specialKeys_overflow_Test' : '0:specialKeys!200 "' +=
 'A'*80 + '-X"\n'
> ++
> +                 }
> +                 # execute the specified test
> +                 if cmd not in testmap:
> +diff --git a/src/testdir/test_netbeans.vim b/src/testdir/test_netbeans.v=
im
> +index d3d5e8baf..d1be5066e 100644
> +--- a/src/testdir/test_netbeans.vim
> ++++ b/src/testdir/test_netbeans.vim
> +@@ -958,6 +958,58 @@ func Nb_bwipe_buffer(port)
> +   sleep 10m
> + endfunc
> +
> ++func Nb_specialKeys_overflow(port)
> ++  call delete("Xnetbeans")
> ++  call writefile([], "Xnetbeans")
> ++
> ++  " Last line number in the Xnetbeans file. Used to verify the result o=
f the
> ++  " communication with the netbeans server
> ++  let g:last =3D 0
> ++
> ++  " Establish the connection with the netbeans server
> ++  exe 'nbstart :localhost:' .. a:port .. ':bunny'
> ++  call WaitFor('len(ReadXnetbeans()) > (g:last + 2)')
> ++  let l =3D ReadXnetbeans()
> ++  call assert_equal(['AUTH bunny',
> ++        \ '0:version=3D0 "2.5"',
> ++        \ '0:startupDone=3D0'], l[-3:])
> ++  let g:last +=3D 3
> ++
> ++  " Open the command buffer to communicate with the server
> ++  split Xcmdbuf
> ++  let cmdbufnr =3D bufnr()
> ++  call WaitFor('len(ReadXnetbeans()) > (g:last + 2)')
> ++  let l =3D ReadXnetbeans()
> ++  call assert_equal('0:fileOpened=3D0 "Xcmdbuf" T F',
> ++        \ substitute(l[-3], '".*/', '"', ''))
> ++  call assert_equal('send: 1:putBufferNumber!15 "Xcmdbuf"',
> ++        \ substitute(l[-2], '".*/', '"', ''))
> ++  call assert_equal('1:startDocumentListen!16', l[-1])
> ++  let g:last +=3D 3
> ++
> ++  " Keep the command buffer loaded for communication
> ++  hide
> ++
> ++  sleep 1m
> ++
> ++  " Open the command buffer to communicate with the server
> ++  split Xcmdbuf
> ++  let cmdbufnr =3D bufnr()
> ++  call appendbufline(cmdbufnr, '$', 'specialKeys_overflow_Test')
> ++  call WaitFor('len(ReadXnetbeans()) >=3D (g:last + 6)')
> ++  call WaitForAssert({-> assert_match('send: 0:specialKeys!200 "A\{80}-=
X"',
> ++        \ ReadXnetbeans()[-1])})
> ++
> ++  " Verify that specialKeys test, still works after the previous junk
> ++  call appendbufline(cmdbufnr, '$', 'specialKeys_Test')
> ++  call WaitFor('len(ReadXnetbeans()) >=3D (g:last + 1)')
> ++  call WaitForAssert({-> assert_match('^send: 0:specialKeys!91 "F12 F13=
 C-F13"$',
> ++        \ ReadXnetbeans()[-1])})
> ++  let g:last +=3D 1
> ++
> ++  sleep 10m
> ++endfunc
> ++
> + " This test used to reference a buffer after it was freed leading to an=
 ASAN
> + " error.
> + func Test_nb_bwipe_buffer()
> +@@ -967,4 +1019,9 @@ func Test_nb_bwipe_buffer()
> +   nbclose
> + endfunc
> +
> ++" Verify that the specialKeys argument does not overflow
> ++func Test_nb_specialKeys_overflow()
> ++  call s:run_server('Nb_specialKeys_overflow')
> ++endfunc
> ++
> + " vim: shiftwidth=3D2 sts=3D2 expandtab
> +--
> +2.43.7
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
> index 044117a57f..792a46faf7 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -17,6 +17,7 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmast=
er;protocol=3Dhttps;tag=3Dv${PV}
>             file://0001-src-Makefile-improve-reproducibility.patch \
>             file://no-path-adjust.patch \
>             file://CVE-2026-25749.patch \
> +           file://CVE-2026-26269.patch \
>             "
> =20
>  PV .=3D ".1683"


--=20
Yoann Congal
Smile ECS


