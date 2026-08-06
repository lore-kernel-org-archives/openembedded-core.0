Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B79C56207
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 14:34:08 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21219.1786026842401143537
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 07:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lIhhsP7P;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66ac4d40da4so304596d50.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 07:34:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786026841; cv=none;
        d=google.com; s=arc-20260327;
        b=HliViJKvCS5M9ONaLssDARQeQ0R12ceSiGvkLjiRY/4LWzBwcbrf2VaAek48H9DbXE
         Fhama7BGO9rbLj+lhL0K7JdoBsEKwS1YcuyteVNiX+P0eSdW0L5hMP7KEyhjNCMm2tTl
         1s+eWfLgeKzlTLwsGuHLb93c7Sfk5XwEReJmR2tUaIPSjffLBkccC6EJTQQia9MZqTWK
         qAQwQXPGmfrKJ9N/mrms4yrLkwrGLSYXPApbT5ligTPf48qR5o7ZSpJZFAh7uCtlGl2c
         +s+xl3yEdoTJm953Jy/ryQyCySb2eHQhfQGWzDrd/yU4ojX0fdaXkg6i62TTHwzMsDEq
         1MWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IDblWFUaORg/IqnJbuzo5mtafOVFzt+UMEnRsNHS3GQ=;
        fh=M9Qp7N4TtDyoX+CgtT9+FnQbFuiO5nllHdvaR98P43E=;
        b=brQAnS9dCLaIGxfZaoAe/PayrfD4O3mC9Qle2IjWr5HNOtgKRNSLpYBYWupL19OKug
         vW99M68/noZvHeo7A7l1M1kjwUgBqVIXK1nqEJTIqiftoYzJnhCjITcA4yqvEQNtqGZJ
         tLa7jQ0xY/PP5cLImuJ9PSLMtuXH21kiIBZDmKUD5A+gcbfNzN/UwGXBl7Pn9WW1XM4/
         kxsXYQbD69AUaMbBK9t5mtTIzZkCJjfZwyAxMYLp1+QpdHcNpi8C+iJVhfr2BioW190X
         UiGOlJdtniky3bzA1kWyiUmuZ6A+wo3v2TS1c2/ecsiGxtVjQa2l6auqrGKO/4G0lm5p
         JfEw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786026841; x=1786631641; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IDblWFUaORg/IqnJbuzo5mtafOVFzt+UMEnRsNHS3GQ=;
        b=lIhhsP7PmeiCoVBVALUh8JyUcNFnyX8MVlWTChVXf5hP89ff4cf5n6oOhMhqAbtEE+
         FHPB3uKRYcrtRu92bHaDJX5o8TnQKXo1F/rIepliGc/Mo4ozgXobZ2feegakdVh76y69
         8n+pT0c2AIDaFuECIvQW6eCmwSIx+Oyv3skpJl3zNsMssDD/S6q2MFfFqyHvBl/iWWPZ
         4RYeYG2vpWp/1JezVJjTJzJF7qQEtWruYCTCKyb7yDLyE5j398jy6hAmEomLz/IdSD+m
         K94TyeSgtRYTFW1c8SuJhM00mcqKXq7h5D8t4IUPNlEDuc2LKgBVMD6mWK5PUqOwMgz3
         3gAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786026841; x=1786631641;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IDblWFUaORg/IqnJbuzo5mtafOVFzt+UMEnRsNHS3GQ=;
        b=oG9QUA7oik7O2N/CThJ8ep2hM2v+NtP3UXTrRuEz31oc+Ix4QRq027a1S0A4PmrEab
         p0hUkyxbBnAWhZfSknaCHcIXSVY2uo6ob1ndUtv8zP13PQvWAJHWTFfUtiB3o3ry2S3y
         0nAaP7R1WRddjHfoinoAgmLby8VGLGYgdo55QpoSZvnVV86HxFEKXDq2izaPVShdPB10
         M0Nbdlkc3AR6E0gzKMrKonzuS96DjG9vHBhxbUp11YswRDDEDHq0+2JvU8Dc09aJmJzA
         izjK2keL3MZ5Xz+0sdGG8sZ4uaMcBQ599RQ5y7KanHnDcXNse0MQ3Dy4epoHB1e+rRNp
         FIEA==
X-Gm-Message-State: AOJu0YzIHJyVL8ufzt9WKfTYWGXRdFXfT70AURnGVbsVaSkCAkvAVitN
	jfZG67vwvwbUVloxOZ/IdVEfGYGBCnZPPZOxrbSTIfkjRc8r39ERMh8zoWeCC5o6+nyl764Yzz9
	UVO77Ja+k5xgq1ar00khsmHSaYOp2a/0=
X-Gm-Gg: AR+sD10WNnYzCDw89gfOxuCJVFpBcsnz/bfDcGeCD6ykHnpMVqzgBx28k1a45GXSjQx
	YrLawJ4RXfkWiEwDtw3noljPx8cMZv4whKIARkDhL2eKq7dBsd3c3JWJUShe27Ujfzln8D1YeCI
	fJ39IUFjHtWr8ZEiOMR/lDIFQuwHb5a6asI/VMejIjNwlbckVYlJhkWNwORKUDHqaPdG/N4p0xQ
	mM9LemgyUdft3+qou4aU6T5JlS5IO1NLlgnU7tTdLN0461klnVUK1acsp6RKgJTbdeyqiQnioWX
	Mc5+5VQnEBKnuUj3/XRQqP9ps8WHgNVWHvufZ20LuJYZilTZKSCtJ38HUxw=
X-Received: by 2002:a05:690e:4142:b0:667:bc08:e995 with SMTP id
 956f58d0204a3-6699ab7375dmr8758281d50.50.1786026841368; Thu, 06 Aug 2026
 07:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260727-fix-get-patched-src-v1-0-f5054ca10e14@bootlin.com> <20260727-fix-get-patched-src-v1-3-f5054ca10e14@bootlin.com>
In-Reply-To: <20260727-fix-get-patched-src-v1-3-f5054ca10e14@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 6 Aug 2026 08:33:48 -0600
X-Gm-Features: AUfX_mx9n1FIyNIUVbPVir_nXZxvTFPIBAUZgW2GLDY6IL9kWe3SRzg1rHWPfvw
Message-ID: <CAJdd5GaZ9w_9Gw5mC2NmqkBupVDyHWVdmoFbYzTYXNX+pzDFjA@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] spdx_common: In get_patched_src() ensure kernel
 dir name to be ${BP}
To: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, antonin.godard@bootlin.com, 
	mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
	daniel.turull@ericsson.com
Content-Type: multipart/alternative; boundary="000000000000706dcc065861c700"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 14:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242950

--000000000000706dcc065861c700
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 2:34=E2=80=AFAM Benjamin Robin <benjamin.robin@boot=
lin.com>
wrote:

> If a kernel recipe is using a tar file instead of git repository, it is
> necessary to override `S` to point to the unpacked tar archive.
> In this case `${S}` is not going to be in work-shared. So we must handle
> this case in get_patched_src() to ensure that the kernel is extracted in
> the following path: `${SPDXWORK}/${BP}`.
>
> For a full detailed analysis see [1], but in summary this change is
> necessary because:
> - In `save_debugsources_info()` the sources are extracted from the debug
>   symbol. For the kernel Linux the source file path is modified to look
>   like `${BP}/init/main.c` (`${KERNEL_SRC_PATH}` is replaced by `${BP}`).
> - In `get_patched_src()` the sources of the recipe are extracted (again)
>   in a sub-directory of `${SPDXWORK}`. If `${S}` is in work-shared and if
>   the recipe inherits the kernel class, then the sources are extracted in
>   `${SPDXWORK}/${BP}`.
> - In `add_package_files()`, with topdir equal to `${SPDXWORK}`, all the
>   files (recursively) found in topdir are listed. For each source file,
>   if the file path (relative to topdir) is in the list of source files
>   retrieved by save_debugsources_info, then the file is added to the SPDX
>   SBoM.
> - If we are using a tar archive, `${S}` is set for example to
>   `${UNPACKDIR}/linux-${PV}`, so in `get_patched_src()` the sources are
>   extracted in `${SPDXWORK}/sources/linux-${PV}` since
>   `UNPACKDIR =3D ${WORKDIR}/sources`. `${BP}/init/main.c` is not in
>   `${SPDXWORK}`, but `sources/linux-${PV}/init/main.c` is.
>
> [1] https://github.com/bootlin/yocto-kiss/pull/26#discussion_r3626224833
>
> Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
>

LGTM Thanks

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>


> ---
>  meta/lib/oe/spdx_common.py | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
> index 013f23ae7c65..e40cf36bba18 100644
> --- a/meta/lib/oe/spdx_common.py
> +++ b/meta/lib/oe/spdx_common.py
> @@ -187,6 +187,14 @@ def get_patched_src(d):
>                  bb.build.exec_func("do_convert_crlf_to_lf", localdata)
>              bb.build.exec_func("do_patch", localdata)
>
> +        if bb.data.inherits_class("kernel", localdata):
> +            # For kernel source, rename suffix dir to ${BP} (${BPN}-${PV=
})
> +            dir_name =3D localdata.getVar("BP")
> +            kernel_dst_path =3D f"{spdx_workdir}/{dir_name}"
> +            kernel_src_path =3D localdata.getVar("S")
> +            if not os.path.exists(kernel_dst_path):
> +                shutil.move(kernel_src_path, kernel_dst_path)
> +
>      # Copy source from work-shared to spdx_workdir
>      else:
>          share_src =3D d.getVar("S")
>
> --
> 2.55.0
>
>

--000000000000706dcc065861c700
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 27,=
 2026 at 2:34=E2=80=AFAM Benjamin Robin &lt;<a href=3D"mailto:benjamin.robi=
n@bootlin.com">benjamin.robin@bootlin.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">If a kernel recipe is using a tar =
file instead of git repository, it is<br>
necessary to override `S` to point to the unpacked tar archive.<br>
In this case `${S}` is not going to be in work-shared. So we must handle<br=
>
this case in get_patched_src() to ensure that the kernel is extracted in<br=
>
the following path: `${SPDXWORK}/${BP}`.<br>
<br>
For a full detailed analysis see [1], but in summary this change is<br>
necessary because:<br>
- In `save_debugsources_info()` the sources are extracted from the debug<br=
>
=C2=A0 symbol. For the kernel Linux the source file path is modified to loo=
k<br>
=C2=A0 like `${BP}/init/main.c` (`${KERNEL_SRC_PATH}` is replaced by `${BP}=
`).<br>
- In `get_patched_src()` the sources of the recipe are extracted (again)<br=
>
=C2=A0 in a sub-directory of `${SPDXWORK}`. If `${S}` is in work-shared and=
 if<br>
=C2=A0 the recipe inherits the kernel class, then the sources are extracted=
 in<br>
=C2=A0 `${SPDXWORK}/${BP}`.<br>
- In `add_package_files()`, with topdir equal to `${SPDXWORK}`, all the<br>
=C2=A0 files (recursively) found in topdir are listed. For each source file=
,<br>
=C2=A0 if the file path (relative to topdir) is in the list of source files=
<br>
=C2=A0 retrieved by save_debugsources_info, then the file is added to the S=
PDX<br>
=C2=A0 SBoM.<br>
- If we are using a tar archive, `${S}` is set for example to<br>
=C2=A0 `${UNPACKDIR}/linux-${PV}`, so in `get_patched_src()` the sources ar=
e<br>
=C2=A0 extracted in `${SPDXWORK}/sources/linux-${PV}` since<br>
=C2=A0 `UNPACKDIR =3D ${WORKDIR}/sources`. `${BP}/init/main.c` is not in<br=
>
=C2=A0 `${SPDXWORK}`, but `sources/linux-${PV}/init/main.c` is.<br>
<br>
[1] <a href=3D"https://github.com/bootlin/yocto-kiss/pull/26#discussion_r36=
26224833" rel=3D"noreferrer" target=3D"_blank">https://github.com/bootlin/y=
octo-kiss/pull/26#discussion_r3626224833</a><br>
<br>
Signed-off-by: Benjamin Robin &lt;<a href=3D"mailto:benjamin.robin@bootlin.=
com" target=3D"_blank">benjamin.robin@bootlin.com</a>&gt;<br></blockquote><=
div><br></div><div>LGTM Thanks</div><div><br></div><div>Reviewed-by: Joshua=
 Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com">JPEWhacker@gmail.com</a>&=
gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
---<br>
=C2=A0meta/lib/oe/spdx_common.py | 8 ++++++++<br>
=C2=A01 file changed, 8 insertions(+)<br>
<br>
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py<br>
index 013f23ae7c65..e40cf36bba18 100644<br>
--- a/meta/lib/oe/spdx_common.py<br>
+++ b/meta/lib/oe/spdx_common.py<br>
@@ -187,6 +187,14 @@ def get_patched_src(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.build.exec=
_func(&quot;do_convert_crlf_to_lf&quot;, localdata)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.build.exec_func(&quot;do=
_patch&quot;, localdata)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb.data.inherits_class(&quot;kernel&quot;, =
localdata):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # For kernel source, rename suff=
ix dir to ${BP} (${BPN}-${PV})<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dir_name =3D localdata.getVar(&q=
uot;BP&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_dst_path =3D f&quot;{spdx=
_workdir}/{dir_name}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_src_path =3D localdata.ge=
tVar(&quot;S&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.exists(kernel_dst=
_path):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.move(kernel=
_src_path, kernel_dst_path)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0# Copy source from work-shared to spdx_workdir<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0share_src =3D d.getVar(&quot;S&quot;)<br>
<br>
-- <br>
2.55.0<br>
<br>
</blockquote></div></div>

--000000000000706dcc065861c700--

