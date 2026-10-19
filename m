Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738A8CCF2E4
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 12:19:12 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33106.1792412348479556627
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 05:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=btkCQKhZ;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1177187f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 05:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792412347; x=1793017147; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TxE0tIBB9sknZOK1of/Lk3AHIQYB3RnmDTs1e83TNw4=;
        b=btkCQKhZcKlSvF8qWs5qZxfqmPwZKo1SqErJNafUxPYlKeHiN8SFjQQa5Jd0DWWAsy
         ymayoyhhdxo3VBAeqNr+UiYDIbzLsWerh/pdOGqSG8y1OPO6H0wUUXxkeQmDgO20jv7J
         x6uzEdoOnvgGCYvqTKZ0lI6ueJqa82QAc6eY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792412347; x=1793017147;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TxE0tIBB9sknZOK1of/Lk3AHIQYB3RnmDTs1e83TNw4=;
        b=J7XhQZ/QesoZChvjqJAcsaLqK2MzB7eLy7wayJxZiqUug/r57vsRLKMcn0VDcWMAom
         VhkmaUENoosBbACHO5Z901pY5jibTnPCGVRKMyRfMKrPbsmUPU6hqungrRTqPBUYh1kj
         LvKhgKELf/xmL57lp4cN/i7d4KHgfu0B31SYmmU3+FuSjQVV+qdQOUpKLwUFhaE47cKw
         utfU256kAZaPxYTfYcLfw4wQLJWOFRCVusnnqZTptSwNRtsIxAaUk4hzR9lVS4PIjhQy
         6pTA9eaas4fVq23427NZqXZnHjb5KUbOrSoI8JvS7dOhLySm2EESek8HZeG9RJJ/rPi+
         zl2A==
X-Forwarded-Encrypted: i=1; AKwUvBymN9gd+Wqf4OX7amfyZDTXSNQvwuwJcZPwzBctJpyXEqnND410y3224NLRvcNaMYFwKTr+OhjEjVVQxWVIjvFL8Q==@lists.openembedded.org
X-Gm-Message-State: AFq9FYK2+uSlu6ZidGh+cIp+b7UwBs6w6Mr6yYCTbYd/8KtHCh8udKWH
	HCx3n3PWW/fWdemsXI0aN6Sqyn4yPOJNxSepSZT6EmBmumrRRUGoldAHjXHhKEBqAxA=
X-Gm-Gg: AYBFou1e7/eazsm+rymQJvq8yuh3X/HQtBbkPKqSL/tbsApseihZ5d9vxlBlq4p3zJD
	zxqqvV0ZVrJWpABZ7tWQoC9VP+mQYHDlhmLj5KLGLzkLg4PUdV4JE5N+k2U1c6T1a/vY8d5YfQR
	rfKmOBFhHgw/YBsPvA4WxmJMEe4xEFdRyvJrBurjweZaQDNPR58YB1rhHQBf+QAqhYyakBc9DQ2
	Aca9Y5w7pdrIavSpnvQxZviiqNRkUlnWM37wu7ohhMOe5RhjQsoF8KbsQUPTvvMBj/ifZOkZpSQ
	PqTedbY67xTr8IuG8ECHuQ/GZspmhoSL4UXxMWeF5pqHkoxKeohXD4oVFbRrw/XG7Z1dqjfCV2F
	xp5JItP5Vwjuha46j3YlkGAjB9MbiUl/V3AT0w4DdjMeiF4xh0ENJMtdCFtSSZEUk9O1cm/kK8B
	E2Ga9Jo+mdtu9J5I3CAuO2z3ylaC4tDug2WoDQWMxYj/Lby5MjqEAPb+xaoE4Rd5T8kUksEoT/b
	3plMZVbWj7QWjyQhy6qSrWsDMINeWpBuHjn8WE5uj/gY/z9OvUg9Od5kPgWqw==
X-Received: by 2002:a05:6000:4b07:b0:48d:f9a4:bd68 with SMTP id ffacd0b85a97d-48e07bbe7c3mr14137522f8f.27.1792412346188;
        Mon, 19 Oct 2026 05:19:06 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f576asm24597842f8f.32.2026.10.19.05.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:19:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 14:19:05 +0200
Message-Id: <DM8T5C1XSOS8.32SN8QTXAO48H@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCHv3] vim: Fix for CVE-2026-73076
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20261019084027.640800-1-hprajapati@mvista.com>
In-Reply-To: <20261019084027.640800-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 12:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248159

On Mon Oct 19, 2026 at 10:40 AM CEST, Hitendra Prajapati via lists.openembe=
dded.org wrote:
> Pick the patch from [1], also referenced in the NVD report [2].
>
> [1] https://github.com/vim/vim/commit/581a2f3ac9c6f96a26324f6b2c8c11415fd=
0d452
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-73076
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../vim/files/CVE-2026-73076.patch            | 141 ++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |   1 +
>  2 files changed, 142 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-73076.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2026-73076.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-73076.patch
> new file mode 100644
> index 0000000000..04c8e07d9d
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-73076.patch
> @@ -0,0 +1,141 @@
> +From 581a2f3ac9c6f96a26324f6b2c8c11415fd0d452 Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Fri, 24 Jul 2026 17:43:51 +0200
> +Subject: [PATCH] patch 9.2.0847: [security]: vimball: code execution via
> + .VimballRecord file
> +
> +Problem:  [security]: vimball: code execution via .VimballRecord file
> +          (tdjackey)
> +Solution: Forbid arbitrary commands, fix broken directory deletion code,
> +          refactor code
> +
> +Github Security Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-r22p-fhw4-84p2
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +
> +Backport Changes:
> +Modify runtime/autoload/vimball.vim file as per vim source code v9.1.168=
3 which is
> +little different from vim v9.2.
> +Omitted src/testdir/test_plugin_vimball.vim because the current vim sour=
ce
> +archive does not include it.

Hello,

I'm sorry but this first phrase does not provide any new information... :/

For example, here is what the diff between your patch and upstreams
looks like (this is the interdiff[0] output) :
| --- a/runtime/autoload/vimball.vim
| +++ b/runtime/autoload/vimball.vim
| @@ -0,0 +0,0 @@
|--" Date:			Jun 29, 2026
|-+" Date:			Jul 23, 2026
|-@@ -0,0 +0,0 @@
|--if v:version < 704
|-+if v:version < 900
|-- echo "***warning*** this version of vimball needs vim 7.4"
|-+ echo "***warning*** this version of vimball needs vim 9.0"
|-@@ -0,0 +0,0 @@
|-+   elseif fname =3D~? '\%(^\|/\)\.VimballRecord$'
|++   if fname =3D~? '\%(^\|/\)\.VimballRecord$'
| +     echomsg "(Vimball) Forbidding .VimballRecord filename, aborting..."
| +     exe "tabn ".curtabnr
| +     bw! Vimball
| +     call s:ChgDir(curdir)
| +     return
|++   endif
| @@ -0,0 +0,0 @@
|--      call s:RecordInVar(home,"rmdir('".dirname."')")
|-+      call s:RecordDirInVar(dirname)
|+-	  call s:RecordInVar(home,"rmdir('".dirname."')")
|++	  call s:RecordDirInVar(dirname)
| @@ -0,0 +0,0 @@
|--    call s:RecordInVar(home,"call delete('".escape(fnamepath, '"''|')."'=
)")
|-+    call s:RecordInVar(fnamepath)
|+-	call s:RecordInVar(home,"call delete('".fnamepath."')")
|++	call s:RecordInVar(fnamepath)
| @@ -0,0 +0,0 @@
|--    sil! keepalt keepjumps exe exestring
|-+    let nr_files=3D 0
|+-	sil! keepalt keepjumps exe exestring
|++	let nr_files=3D 0
| +    for line in split(exestring, '|')
| +      if line !~ '^call delete(''[^'']\{-}''\(,"d"\)\?)$'
| +        echomsg "ignoring .VimballRecord entry: " line
|@@ -33,58 +26,42 @@
| +        let nr_files+=3D 1
| +      endif
| +    endfor
|--    let exestring=3D strlen(substitute(exestring,'call delete(.\{-})|\=
=3D',"D","g"))
|--    echomsg "removed ".exestring." files"
|-+    echomsg "removed ".nr_files." files"
|+-	let exestring=3D strlen(substitute(exestring,'call delete(.\{-})|\=3D',=
"D","g"))
|+-"	call Decho("exestring<".exestring.">")
|+-	echomsg "removed ".exestring." files"
|++	 echomsg "removed ".nr_files." files"
| @@ -0,0 +0,0 @@
| -" s:RecordInVar: record a un-vimball command in the .VimballRecord file =
{{{2
| -fun! s:RecordInVar(home,cmd)
|-+" s:RecordInVar: record a un-vimball file deletion in the .VimballRecord=
 file {{{2
|-+fun! s:RecordInVar(file)
|+-"  call Dfunc("RecordInVar(home<".a:home."> cmd<".a:cmd.">)")
|+-  if a:cmd =3D~ '^rmdir'
|+-"   if !exists("s:recorddir")
|+-"    let s:recorddir=3D substitute(a:cmd,'^rmdir',"call s:Rmdir",'')
|+-"   else
|+-"    let s:recorddir=3D s:recorddir."|".substitute(a:cmd,'^rmdir',"call =
s:Rmdir",'')
|+-"   endif
|+-  elseif !exists("s:recordfile")
| -   let s:recordfile=3D a:cmd
| -  else
| -   let s:recordfile=3D s:recordfile."|".a:cmd
|++" s:RecordInVar: record a un-vimball file deletion in the .VimballRecord=
 file {{{2
|++fun! s:RecordInVar(file)
|++  if !exists("s:recordfile")
| +    let s:recordfile=3D[]
|-+  endif
|+-"  call Dret("RecordInVar : s:recordfile<".(exists("s:recordfile")? s:re=
cordfile : "")."> s:recorddir<".(exists("s:recorddir")? s:recorddir : "")."=
>")
| +  call add(s:recordfile, $'call delete({string(a:file)})')
|-+endfun
|-+
| +" s:RecordDirInVar: record a un-vimball dir deletion in the .VimballReco=
rd file {{{2
| +fun! s:RecordDirInVar(dir)
| +  if !exists("s:recorddir")
| +    let s:recorddir =3D []
|++   endif
| +  call add(s:recorddir, $'call delete({string(a:dir)},"d")')
|++ endfun
|++
| @@ -0,0 +0,0 @@
|--    let cmd=3D cmd.s:recordfile."|".s:recorddir
|-+    let cmd=3D cmd.join(s:recordfile, '|')."|".join(s:recorddir, '|')
|--    let cmd=3D cmd.s:recorddir
|-+    let cmd=3D cmd.join(s:recorddir, '|')
|--    let cmd=3D cmd.s:recordfile
|-+    let cmd=3D cmd.join(s:recordfile, '|')
|-diff --git a/src/testdir/test_plugin_vimball.vim b/src/testdir/test_plugi=
n_vimball.vim
|---- a/src/testdir/test_plugin_vimball.vim
|-+++ b/src/testdir/test_plugin_vimball.vim
|-@@ -0,0 +0,0 @@
|--  call assert_match('^Xtest.vmb: rmdir.*call delete(', record[0])
|-+  call assert_match('^Xtest.vmb: call delete(''.\{-}'')|call delete(''.\=
{-}'',"d")$', record[0])
|-@@ -0,0 +0,0 @@
|-+
|-+func Test_vimball_VimballRecord_filenames()
|-+  call s:Mkvimball()
|-+  call delete('XVimball', 'rf')
|-+  sp Xtest.vmb
|-+  4s#.*\ze\t#.VimballRecord#
|-+  so %
|-+  call feedkeys("\<cr>", "it")
|-+
|-+  let mess =3D execute(':mess')->split('\n')[-1]
|-+  call assert_match('(Vimball) Forbidding .VimballRecord filename.* abor=
ting\.\.\.', mess)
|-+  call assert_false(filereadable('.VimballRecord'))
|-+  call s:teardown()
|-+endfunc
|-diff --git a/src/version.c b/src/version.c
|---- a/src/version.c
|-+++ b/src/version.c
|-@@ -0,0 +0,0 @@
|-+/**/
|-+    847,
|+-   	let cmd=3D cmd.s:recordfile."|".s:recorddir
|++        let cmd=3D cmd.join(s:recordfile, '|')."|".join(s:recorddir, '|'=
)
|+-   	let cmd=3D cmd.s:recorddir
|++        let cmd=3D cmd.join(s:recorddir, '|')
|+-   	let cmd=3D cmd.s:recordfile
|++        let cmd=3D cmd.join(s:recordfile, '|')

All those hunks above can't be explained by just "Modify
runtime/autoload/vimball.vim file as per vim source code v9.1.1683 which
is little different from vim v9.2."

Regards,

[0]: https://github.com/twaugh/patchutils#core-tools
--=20
Yoann Congal
Smile ECS


