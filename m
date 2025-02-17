Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185B7C021A0
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 06:29:08 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.45793.1739773737874718469
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Feb 2025 22:28:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zmWlp9Dj;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38f2b7ce2e5so1399303f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 22:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739773736; x=1740378536; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ExRW/XBFm+J7Qk0TAUoEvKiUKgLtPkxU9bYMxbRahsQ=;
        b=zmWlp9DjFEs9wdtoJUB19So8VjExHfBnTjc/ZEyn9ZxjZFgBzH5QESZZ3MM7kM2BHr
         X9/07hajPbpBoXLixkHSNnox/Y5hYKZlpMmTJ/4Qu2PY6K0TADz/olMPvMp6+5XjX5Nj
         /o7n4fNtVYvFImjL951pEavajpCHbL4nY4JCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739773736; x=1740378536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExRW/XBFm+J7Qk0TAUoEvKiUKgLtPkxU9bYMxbRahsQ=;
        b=qfFnWWc4TOaDV6bxkw9+gk433jafeT88hfHX1m4/2mKm+BSD62UV5UQQIiDoraTJcW
         kaJoBqclRJwYoGAX69AsaaH5A2LtUsWv1HzZD3uXP1Rk64JdH2UGCo5zvia4Xg3RBoUL
         gS4kJ299CUWQQPEEbdhwjxHjgw6WZgChbV4bcK8L7Sgy+zkjKADMSbSy/KVydcWw6ca2
         NjmVUsn766/jJ48xWRRgCXDbcKpiLm/JlvLndgqpEoeZ9YFYONS7ATOecl+7DuPYQoJs
         V1Y+Tra+Sln3qJK9sGsxqyAi2oz8HuYV1aGBQVBpFeRHzl243jKmSGWgvYjM3110f3qG
         +TgQ==
X-Gm-Message-State: AOJu0YwSQn770G8ciFCVLNBXdYJOT9TDTcme0tsY+1jIszxvIczkxjGi
	AKu7kFaiXZ5sxm57Dt7FOMfeexgbM+9HGVPLw2aRw7sDc26Gbsz2o+4hxI9XnuZsKTFLOqNaS70
	YP1G5BDgr4yqaZSOncPCQI93cj05YMi1wIAriKzoafjUew8FC
X-Gm-Gg: ASbGnctOy+kmC3luxxByP2FWwQMIXepfxIdo6FbsbCDYWLXAr9+W5B7U74PuhsSR7Qa
	zmFMmP/z7NQNUXALr52Kab3t+XoxOM1N1EQ9IaeTPUQFwfw64POXe5v57lzhr3CeCFa+NkjZW
X-Google-Smtp-Source: AGHT+IFgzcl2NvR1cNvihFrfxFeZIKXrdNXjWlt3hHdLw+y76HCYc+LQ9z4FleOsgs79uOkjl6upzmNAfciJSzm3BLA=
X-Received: by 2002:a5d:47c3:0:b0:38f:3c8a:4bfd with SMTP id
 ffacd0b85a97d-38f3c8a4ea3mr2992728f8f.20.1739773736020; Sun, 16 Feb 2025
 22:28:56 -0800 (PST)
MIME-Version: 1.0
References: <1824E84CBF53452B.4193@lists.openembedded.org> <20250217055455.3351270-1-hongxu.jia@windriver.com>
In-Reply-To: <20250217055455.3351270-1-hongxu.jia@windriver.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 17 Feb 2025 07:28:42 +0100
X-Gm-Features: AWEUYZkyyO5EZal4FnpVSXNp7tUEh0XSS9wgIK0qPnNug1wWjoZOmNGVuGDR_Aw
Message-ID: <CAMSfU+5JFiSZXkJGWA0aGqJZO-Lz1dsXqwNw-bQEo9QCRmrxAw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2] setuptools3-base.bbclass: override default
 subprocess timeout
To: hongxu.jia@eng.windriver.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000868d29062e50a332"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 06:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211514

--000000000000868d29062e50a332
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,


Le lun. 17 f=C3=A9vr. 2025 =C3=A0 06:54, hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> a =C3=A9crit :

> The environment variable SETUPTOOLS_SCM_SUBPROCESS_TIMEOUT allows to
> override
> the subprocess timeout. The default is 40 seconds and should work for mos=
t
> needs.[1] However, it was not enough while using git shallow tarball and
> starting
> multiple Yocto world builds in one host.
>
> |   File
> "tmp/work/x86_64-linux/python3-scancode-native/32.1.0/recipe-sysroot-
> native/usr/lib/python3.13/subprocess.py", line 1263, in _check_timeout
> |     raise TimeoutExpired(
> |     ...<2 lines>...
> |             stderr=3Db''.join(stderr_seq) if stderr_seq else None)
> | subprocess.TimeoutExpired: Command '['git', '--git-dir',
> 'tmp/work/x86_64-
> linux/python3-scancode-native/32.1.0/git/.git', 'status', '--porcelain',
> '--untracked-files=3Dno']' timed out after 40 seconds
>
> Explicitly set variable SETUPTOOLS_SCM_SUBPROCESS_TIMEOUT to 600s in
> bbclass,
> and we could override it in local.conf
>
> [1] https://github.com/pypa/setuptools-scm/blob/main/docs/overrides.md
>
> Issue: LINCD-21838
> (LOCAL REV: NOT UPSTREAM) -- Sent to oe-core on 20250217

That looks like an internal tag that should not be part of the patch sent
to oe-core.

Regards,


> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/classes-recipe/setuptools3-base.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes-recipe/setuptools3-base.bbclass
> b/meta/classes-recipe/setuptools3-base.bbclass
> index 27af6abc58..190d9e6e3a 100644
> --- a/meta/classes-recipe/setuptools3-base.bbclass
> +++ b/meta/classes-recipe/setuptools3-base.bbclass
> @@ -23,6 +23,10 @@ export CCSHARED  =3D "-fPIC -DPIC"
>  # the python executable
>  export LINKFORSHARED =3D "${SECURITY_CFLAGS} -Xlinker -export-dynamic"
>
> +# The environment variable SETUPTOOLS_SCM_SUBPROCESS_TIMEOUT allows
> +# to override the subprocess timeout.
> +export SETUPTOOLS_SCM_SUBPROCESS_TIMEOUT ??=3D "600"
> +
>  FILES:${PN} +=3D "${PYTHON_SITEPACKAGES_DIR}"
>  FILES:${PN}-staticdev +=3D "${PYTHON_SITEPACKAGES_DIR}/*.a"
>  FILES:${PN}-dev +=3D "${PYTHON_SITEPACKAGES_DIR}/*.la"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211513):
> https://lists.openembedded.org/g/openembedded-core/message/211513
> Mute This Topic: https://lists.openembedded.org/mt/111227231/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000868d29062e50a332
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hello,<br><br><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le lun. 17 f=C3=A9vr. =
2025 =C3=A0 06:54, hongxu via <a href=3D"http://lists.openembedded.org">lis=
ts.openembedded.org</a> &lt;hongxu.jia=3D<a href=3D"mailto:eng.windriver.co=
m@lists.openembedded.org">eng.windriver.com@lists.openembedded.org</a>&gt; =
a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">The environment variable SETUPTOOLS_SCM_SUBPROCESS_TIMEOUT allows to ov=
erride<br>
the subprocess timeout. The default is 40 seconds and should work for most<=
br>
needs.[1] However, it was not enough while using git shallow tarball and st=
arting<br>
multiple Yocto world builds in one host.<br>
<br>
| =C2=A0 File &quot;tmp/work/x86_64-linux/python3-scancode-native/32.1.0/re=
cipe-sysroot-<br>
native/usr/lib/python3.13/subprocess.py&quot;, line 1263, in _check_timeout=
<br>
| =C2=A0 =C2=A0 raise TimeoutExpired(<br>
| =C2=A0 =C2=A0 ...&lt;2 lines&gt;...<br>
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stderr=3Db&#39;&#39;.join(stder=
r_seq) if stderr_seq else None)<br>
| subprocess.TimeoutExpired: Command &#39;[&#39;git&#39;, &#39;--git-dir&#3=
9;, &#39;tmp/work/x86_64-<br>
linux/python3-scancode-native/32.1.0/git/.git&#39;, &#39;status&#39;, &#39;=
--porcelain&#39;,<br>
&#39;--untracked-files=3Dno&#39;]&#39; timed out after 40 seconds<br>
<br>
Explicitly set variable SETUPTOOLS_SCM_SUBPROCESS_TIMEOUT to 600s in bbclas=
s,<br>
and we could override it in local.conf<br>
<br>
[1] <a href=3D"https://github.com/pypa/setuptools-scm/blob/main/docs/overri=
des.md" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/=
pypa/setuptools-scm/blob/main/docs/overrides.md</a><br>
<br>
Issue: LINCD-21838<br>
(LOCAL REV: NOT UPSTREAM) -- Sent to oe-core on 20250217=C2=A0</blockquote>=
</div></div><div dir=3D"auto">That looks like an internal tag that should n=
ot be part of the patch sent to oe-core.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Regards,</div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"></blockquote></div></div><div dir=3D"auto"><div c=
lass=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank" rel=3D"noreferrer">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/setuptools3-base.bbclass | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/classes-recipe/setuptools3-base.bbclass b/meta/classes-re=
cipe/setuptools3-base.bbclass<br>
index 27af6abc58..190d9e6e3a 100644<br>
--- a/meta/classes-recipe/setuptools3-base.bbclass<br>
+++ b/meta/classes-recipe/setuptools3-base.bbclass<br>
@@ -23,6 +23,10 @@ export CCSHARED=C2=A0 =3D &quot;-fPIC -DPIC&quot;<br>
=C2=A0# the python executable<br>
=C2=A0export LINKFORSHARED =3D &quot;${SECURITY_CFLAGS} -Xlinker -export-dy=
namic&quot;<br>
<br>
+# The environment variable SETUPTOOLS_SCM_SUBPROCESS_TIMEOUT allows<br>
+# to override the subprocess timeout.<br>
+export SETUPTOOLS_SCM_SUBPROCESS_TIMEOUT ??=3D &quot;600&quot;<br>
+<br>
=C2=A0FILES:${PN} +=3D &quot;${PYTHON_SITEPACKAGES_DIR}&quot;<br>
=C2=A0FILES:${PN}-staticdev +=3D &quot;${PYTHON_SITEPACKAGES_DIR}/*.a&quot;=
<br>
=C2=A0FILES:${PN}-dev +=3D &quot;${PYTHON_SITEPACKAGES_DIR}/*.la&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#211513): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/211513" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/211513</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111227231/431=
6185" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/111227231/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@sm=
ile.fr" target=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000868d29062e50a332--

