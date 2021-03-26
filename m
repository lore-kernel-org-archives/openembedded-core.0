Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web10.8818.1616738052333882685
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 22:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A1H50pk9;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id e5so2156370vse.4
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 22:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rDnRSaOufkHgBfhsM/DhmRpoeKRSWehdyz44eWrHj5k=;
        b=A1H50pk9Yx2daB1NDpbJgctlD1AmPEw/rwzRqrVJQ6w98uPahme8xD4yH7/6gSWpVF
         Gybb6TeW1ytVGMhroDfWkUg+Yze88gU8Tj+WHDL3wKAgTrOM4CR/J32QnwXBzLMQ4MT+
         0c7IyB3M8HOoP5CxMi9hpFfh3Qc66HJsLU0oHEFR+zu/ehselt3ULu934/QKDaJv2EmE
         kLPKq5I36agTJaGwIpQ3BZbYgSfR7VxsvbPa9+hAdhbe9ovk+eh3cmeNwndw1o+Jc8/T
         HTHBrI/Tw7D3Jz47B/IPBzK04qkzJiETYogrXjazTjG9g7J+exMuxVuBTYCZv5CduttB
         pG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rDnRSaOufkHgBfhsM/DhmRpoeKRSWehdyz44eWrHj5k=;
        b=jD/+NcQdIGG+p+0Ihv5i3jXHtJTWCpafnGqUiJAG8qBzaXyViXHvovScEQ9od53Luk
         Z/oz5vwq3XWc1aqoQ69yvixLHJIG+9ai6ukaCUAqsAr/cFVd6KL0wE/2eS8y239bMHtG
         0qllTpOzh/RuGnxHTXGFX+53Uwvjjcxbyn8Ji56WaptqeDPhIO1awfqD5mpxVWuGAgA9
         OX4/0RPiQrD8QZVgvY8oymo1ABUHKi6oKoQmM3mgBifrayUdhPLSgoStmQdFBJWK/bZF
         c6gSQzYls9gYJsGGNcxpvNYODXbitHQvsumksb95D2J//u7JmVqwWATQOvKnn5KUPsgO
         E60g==
X-Gm-Message-State: AOAM533YKUiLzp1wAjRYL+7XbWYUJ12BGPcrgZHzbBFlEW0oMNTf1WaN
	IJ5gW3FuNwDvJhf6FLjkk7+2flkk91wNVsAWs7UbcCGR5uBrow==
X-Google-Smtp-Source: ABdhPJzv7P9jZt4bXULDIgMhbe5+x45yw8HXVxEVxD1AiMRBTYY+L7A/dC5eoJ7X1cC8CYTEQOrsiPvSAb+FCV6xnjk=
X-Received: by 2002:a67:f244:: with SMTP id y4mr7160170vsm.41.1616738051461;
 Thu, 25 Mar 2021 22:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210325224402.145099-1-mark.hatle@kernel.crashing.org>
In-Reply-To: <20210325224402.145099-1-mark.hatle@kernel.crashing.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 26 Mar 2021 06:54:00 +0100
Message-ID: <CANNYZj_zPxBpj81qc85xa+PR_yKAX9To6GnHVwqmbpFu4U3qkw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] populate_sdk_ext: Avoid copying and producing .pyc files
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004094d005be6a290e"

--0000000000004094d005be6a290e
Content-Type: text/plain; charset="UTF-8"

Wait, I have to say neither reason is convincing. Pyc files are not
system-specific, they are the same on all systems. And pseudo issues should
be dealt with by fixing the issue, not working around the symptoms, no?

Alex

On Thu, 25 Mar 2021 at 23:44, Mark Hatle <mark.hatle@kernel.crashing.org>
wrote:

> Since pyc cache files are really system specific, no real reason to copy or
> generate them during the eSDK build process.  Also generating them has the
> possibility of re-using inodes that pseudo may have been tracking, leading
> a build failure.
>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>  meta/classes/populate_sdk_ext.bbclass | 4 +++-
>  meta/lib/oe/copy_buildsystem.py       | 6 +++---
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/populate_sdk_ext.bbclass
> b/meta/classes/populate_sdk_ext.bbclass
> index 9112ab6c5e..14689ec6ac 100644
> --- a/meta/classes/populate_sdk_ext.bbclass
> +++ b/meta/classes/populate_sdk_ext.bbclass
> @@ -251,7 +251,9 @@ python copy_buildsystem () {
>
>      # Create a layer for new recipes / appends
>      bbpath = d.getVar('BBPATH')
> -    bb.process.run(['devtool', '--bbpath', bbpath, '--basepath',
> baseoutpath, 'create-workspace', '--create-only', os.path.join(baseoutpath,
> 'workspace')])
> +    env = os.environ.copy()
> +    env['PYTHONDONTWRITEBYTECODE'] = '1'
> +    bb.process.run(['devtool', '--bbpath', bbpath, '--basepath',
> baseoutpath, 'create-workspace', '--create-only', os.path.join(baseoutpath,
> 'workspace')], env=env)
>
>      # Create bblayers.conf
>      bb.utils.mkdirhier(baseoutpath + '/conf')
> diff --git a/meta/lib/oe/copy_buildsystem.py
> b/meta/lib/oe/copy_buildsystem.py
> index 31a84f5b06..d97bf9d1b9 100644
> --- a/meta/lib/oe/copy_buildsystem.py
> +++ b/meta/lib/oe/copy_buildsystem.py
> @@ -20,7 +20,7 @@ def _smart_copy(src, dest):
>      mode = os.stat(src).st_mode
>      if stat.S_ISDIR(mode):
>          bb.utils.mkdirhier(dest)
> -        cmd = "tar --exclude='.git' --xattrs --xattrs-include='*' -chf -
> -C %s -p . \
> +        cmd = "tar --exclude='.git' --exclude='__pycache__' --xattrs
> --xattrs-include='*' -chf - -C %s -p . \
>          | tar --xattrs --xattrs-include='*' -xf - -C %s" % (src, dest)
>          subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
>      else:
> @@ -259,7 +259,7 @@ def create_locked_sstate_cache(lockedsigs,
> input_sstate_cache, output_sstate_cac
>      bb.note('Generating sstate-cache...')
>
>      nativelsbstring = d.getVar('NATIVELSBSTRING')
> -    bb.process.run("gen-lockedsig-cache %s %s %s %s %s" % (lockedsigs,
> input_sstate_cache, output_sstate_cache, nativelsbstring, filterfile or ''))
> +    bb.process.run("PYTHONDONTWRITEBYTECODE=1 gen-lockedsig-cache %s %s
> %s %s %s" % (lockedsigs, input_sstate_cache, output_sstate_cache,
> nativelsbstring, filterfile or ''))
>      if fixedlsbstring and nativelsbstring != fixedlsbstring:
>          nativedir = output_sstate_cache + '/' + nativelsbstring
>          if os.path.isdir(nativedir):
> @@ -286,7 +286,7 @@ def check_sstate_task_list(d, targets, filteroutfile,
> cmdprefix='', cwd=None, lo
>          logparam = '-l %s' % logfile
>      else:
>          logparam = ''
> -    cmd = "%sBB_SETSCENE_ENFORCE=1 PSEUDO_DISABLED=1 oe-check-sstate %s
> -s -o %s %s" % (cmdprefix, targets, filteroutfile, logparam)
> +    cmd = "%sPYTHONDONTWRITEBYTECODE=1 BB_SETSCENE_ENFORCE=1
> PSEUDO_DISABLED=1 oe-check-sstate %s -s -o %s %s" % (cmdprefix, targets,
> filteroutfile, logparam)
>      env = dict(d.getVar('BB_ORIGENV', False))
>      env.pop('BUILDDIR', '')
>      env.pop('BBPATH', '')
> --
> 2.17.1
>
>
> 
>
>

--0000000000004094d005be6a290e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Wait, I have to say neither reason is convincing. Pyc=
 files are not system-specific, they are the same on all systems. And pseud=
o issues should be dealt with by fixing the issue, not working around the s=
ymptoms, no?</div><div><br></div><div>Alex<br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 25 Mar 2021 at =
23:44, Mark Hatle &lt;<a href=3D"mailto:mark.hatle@kernel.crashing.org">mar=
k.hatle@kernel.crashing.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Since pyc cache files are really system specific=
, no real reason to copy or<br>
generate them during the eSDK build process.=C2=A0 Also generating them ha=
s the<br>
possibility of re-using inodes that pseudo may have been tracking, leading=
<br>
a build failure.<br>
<br>
Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@kernel.crashing=
.org" target=3D"_blank">mark.hatle@kernel.crashing.org</a>&gt;<br>
---<br>
=C2=A0meta/classes/populate_sdk_ext.bbclass | 4 +++-<br>
=C2=A0meta/lib/oe/copy_buildsystem.py=C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++---=
<br>
=C2=A02 files changed, 6 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate=
_sdk_ext.bbclass<br>
index 9112ab6c5e..14689ec6ac 100644<br>
--- a/meta/classes/populate_sdk_ext.bbclass<br>
+++ b/meta/classes/populate_sdk_ext.bbclass<br>
@@ -251,7 +251,9 @@ python copy_buildsystem () {<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Create a layer for new recipes / appends<br>
=C2=A0 =C2=A0 =C2=A0bbpath =3D d.getVar(&#39;BBPATH&#39;)<br>
-=C2=A0 =C2=A0 bb.process.run([&#39;devtool&#39;, &#39;--bbpath&#39;, bbpa=
th, &#39;--basepath&#39;, baseoutpath, &#39;create-workspace&#39;, &#39;--c=
reate-only&#39;, os.path.join(baseoutpath, &#39;workspace&#39;)])<br>
+=C2=A0 =C2=A0 env =3D os.environ.copy()<br>
+=C2=A0 =C2=A0 env[&#39;PYTHONDONTWRITEBYTECODE&#39;] =3D &#39;1&#39;<br>
+=C2=A0 =C2=A0 bb.process.run([&#39;devtool&#39;, &#39;--bbpath&#39;, bbpa=
th, &#39;--basepath&#39;, baseoutpath, &#39;create-workspace&#39;, &#39;--c=
reate-only&#39;, os.path.join(baseoutpath, &#39;workspace&#39;)], env=3Denv=
)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Create bblayers.conf<br>
=C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(baseoutpath + &#39;/conf&#39;)<br>
diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsyste=
m.py<br>
index 31a84f5b06..d97bf9d1b9 100644<br>
--- a/meta/lib/oe/copy_buildsystem.py<br>
+++ b/meta/lib/oe/copy_buildsystem.py<br>
@@ -20,7 +20,7 @@ def _smart_copy(src, dest):<br>
=C2=A0 =C2=A0 =C2=A0mode =3D os.stat(src).st_mode<br>
=C2=A0 =C2=A0 =C2=A0if stat.S_ISDIR(mode):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(dest)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;tar --exclude=3D&#39;.git&#39; =
--xattrs --xattrs-include=3D&#39;*&#39; -chf - -C %s -p . \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;tar --exclude=3D&#39;.git&#39; =
--exclude=3D&#39;__pycache__&#39; --xattrs --xattrs-include=3D&#39;*&#39; -=
chf - -C %s -p . \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| tar --xattrs --xattrs-include=3D&#39;*=
&#39; -xf - -C %s&quot; % (src, dest)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subprocess.check_output(cmd, shell=3DTru=
e, stderr=3Dsubprocess.STDOUT)<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
@@ -259,7 +259,7 @@ def create_locked_sstate_cache(lockedsigs, input_sstat=
e_cache, output_sstate_cac<br>
=C2=A0 =C2=A0 =C2=A0bb.note(&#39;Generating sstate-cache...&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0nativelsbstring =3D d.getVar(&#39;NATIVELSBSTRING&#39;=
)<br>
-=C2=A0 =C2=A0 bb.process.run(&quot;gen-lockedsig-cache %s %s %s %s %s&quo=
t; % (lockedsigs, input_sstate_cache, output_sstate_cache, nativelsbstring,=
 filterfile or &#39;&#39;))<br>
+=C2=A0 =C2=A0 bb.process.run(&quot;PYTHONDONTWRITEBYTECODE=3D1 gen-locked=
sig-cache %s %s %s %s %s&quot; % (lockedsigs, input_sstate_cache, output_ss=
tate_cache, nativelsbstring, filterfile or &#39;&#39;))<br>
=C2=A0 =C2=A0 =C2=A0if fixedlsbstring and nativelsbstring !=3D fixedlsbstr=
ing:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nativedir =3D output_sstate_cache + &#39=
;/&#39; + nativelsbstring<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.isdir(nativedir):<br>
@@ -286,7 +286,7 @@ def check_sstate_task_list(d, targets, filteroutfile, =
cmdprefix=3D&#39;&#39;, cwd=3DNone, lo<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logparam =3D &#39;-l %s&#39; % logfile<b=
r>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logparam =3D &#39;&#39;<br>
-=C2=A0 =C2=A0 cmd =3D &quot;%sBB_SETSCENE_ENFORCE=3D1 PSEUDO_DISABLED=3D1=
 oe-check-sstate %s -s -o %s %s&quot; % (cmdprefix, targets, filteroutfile,=
 logparam)<br>
+=C2=A0 =C2=A0 cmd =3D &quot;%sPYTHONDONTWRITEBYTECODE=3D1 BB_SETSCENE_ENF=
ORCE=3D1 PSEUDO_DISABLED=3D1 oe-check-sstate %s -s -o %s %s&quot; % (cmdpre=
fix, targets, filteroutfile, logparam)<br>
=C2=A0 =C2=A0 =C2=A0env =3D dict(d.getVar(&#39;BB_ORIGENV&#39;, False))<br=
>
=C2=A0 =C2=A0 =C2=A0env.pop(&#39;BUILDDIR&#39;, &#39;&#39;)<br>
=C2=A0 =C2=A0 =C2=A0env.pop(&#39;BBPATH&#39;, &#39;&#39;)<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000004094d005be6a290e--
