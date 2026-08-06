Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B069C55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 14:26:08 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21054.1786026360290862008
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 07:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DSCWc07N;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-667923d86a7so1882433d50.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 07:26:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786026359; cv=none;
        d=google.com; s=arc-20260327;
        b=Y3naTConI+LXQFXGAhpvBTWaBhiTehFmPvvYTZDihUyQPajYOGVcb+khugDMJV7NKX
         VLFYENAVz2xpGsGnlCsCrS2bLp1KiVDfukoXtfB8D7CohU7vwb53g4+Oy1mjccK9aK2m
         qziXR8ybs5gU35DzYU1Ow10HfP6Wny0s1lBNyZm/m9qPZqcETkMfXlBf5q3kooFf5l+P
         0gMDNt1fAO2NcjPmIt6yMfLGi7MgaAa+z7Jd3JCfpD7psedtGdYtebEz30c+KVSNzKN+
         UsJ5oP2uC0SbrWhUEVF0OajokR6eJvIN4zLhhrl3Oryhlk7gXa9UH+lLhq9eTWTjY4HB
         xccQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UkWnQM7W5f2Syhrwqm1R02VCUt+U4Fzl/vaEKgQXeC4=;
        fh=M9Qp7N4TtDyoX+CgtT9+FnQbFuiO5nllHdvaR98P43E=;
        b=MhmDycu+7GXBdjEQvpAFBKfa5R3kVbUKUbHz8hE5RlSRRVg+uZYz9dSaActbfkUyAT
         3icBnUAk4shGvbLVVJqpwUWu3LCt2RvB52CQ80FaGqGsRmt3ShpyIqKwHwkPl371nP3U
         FjhCcJeaAIBEZ9PNqNmv5EZunbSsE0CFYoGQaleEAHndsbCIL6WdkUcqtUNBSYMyfAk6
         YbhPBAODQeNf+jhV2M6xLy3EwNo/CmfJuIgw5kBAayt9C4Du7uCChIBPGT00GSINcruk
         QMkZRuqfX63P/YWwzF59J6lYjMQjvmrhp0Vxjec/P5lZem9vkIzRrWMwQ8a6EX2Btxu9
         +z+A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786026359; x=1786631159; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UkWnQM7W5f2Syhrwqm1R02VCUt+U4Fzl/vaEKgQXeC4=;
        b=DSCWc07N4RiWaD4vqqUyECnNXdHBR7WeSwp/Z1kDPrcMiGeIwq4FG/9m368u6gRz9/
         FHN5xSbFJ+9US3a33kDaT8Xk2wM8u8i7wTcX27eFEWIBSI8Q2SPqpgTkUGzuH9CB0heD
         MWxDICbABRNFgEZVb/WZdKQC0ozqfYDEFEe+1vVTZAdN99l5IEV60KMSucqFd/NmVzD2
         fO5PYgq9HRo2upkSzo1hqxrZniGr2Q/KiXRZZPlBK6YEGBODw+FlhufaKP++bJ8fRgTY
         6bRXEO10eSA3gQXpvuLqQkCkrWEMh0d0R7Z3n4k7967vZb7X/YGEAmywrPZ1AZc7HH/B
         5FLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786026359; x=1786631159;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UkWnQM7W5f2Syhrwqm1R02VCUt+U4Fzl/vaEKgQXeC4=;
        b=j8GA+SSAvJsEBDbnNqvLJCO+GopdwB1AVukGRwBfsrCm9ho7TRDwEyJMAXrtoAPZdt
         FvZjBN+FQRtOlo/vDcv1Yz1ju4KELWRsbFOr4rHhQ9On1gksciu8ABAUze/totXt2wYT
         zhaQ1JeVufQ1axmsHyl+R/ISnfqd4qCaE8I21Bnz0ZdQNrAC1+azjvpid/kmGjE/ZYIW
         Pi8MFmF1YnhpXW3yXlEJL3qo9jkA7/WKHly9wzrF5PpCHsW2Ptr7jVZNLziB8mbwF4/r
         ro7BhCVOi5L73dGEnw9eBsH5sAuyPqKyvUc8ej1qSL4FN+N7EcOcW5WtkeUA3QrU1rJX
         xcjw==
X-Gm-Message-State: AOJu0YxbFHHryd8HHAKDp+t/Zvh9jAWJPbs5+j9hahlMCEpTyF99TTAD
	Zwd63Yh97aLzf2znk2MAb09I3Kxclicgewt8Lt/kHqPy1PiMCevGFNVXYCLUaKZKSN4+tCu3Noy
	KFoqfa0IFrdbBZ8FRO2YIgkbVQbXEdaU=
X-Gm-Gg: AR+sD11l1xnZOBs2P6kwUt4egiasrI/Q3MHUoEihbZyzOsl5/lybCA2ZAWrHqFqUtaY
	j/MkYeIxvlCldBotYl4ceeBsGfm3yBZkyzqbZhL/mKQml0krhJglUxVr5n88XY4YoYkWJ98EiKE
	0LG6+8QC0mtO4/VrX/fitYXGPgRfQv4rKEhjL6eCSHS2m/dsUB4DJX41aDutYNLedQUq/BWcZLx
	i+MZhV5B9kPW78a0cFAn7YBxiJJSr0+YS368F+tADVJkXJHvkjhkGQIPddkDOWt49Pu95EeQGee
	QFRdGXZRIcKEYVPA0wMJ7TuOQlbv404wRU1Bnw5E+Q81h3arb7Xa9GOFshw=
X-Received: by 2002:a53:ac8e:0:b0:667:f1e8:4772 with SMTP id
 956f58d0204a3-66ab284523emr4258438d50.12.1786026359222; Thu, 06 Aug 2026
 07:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260727-fix-get-patched-src-v1-0-f5054ca10e14@bootlin.com> <20260727-fix-get-patched-src-v1-1-f5054ca10e14@bootlin.com>
In-Reply-To: <20260727-fix-get-patched-src-v1-1-f5054ca10e14@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 6 Aug 2026 08:25:47 -0600
X-Gm-Features: AUfX_mxVYwTnspYcIBBbEfJghbRST9l7U5UANVTMZ8kNqhW-gL2QjH58aJxTrxE
Message-ID: <CAJdd5GZuhobNYMevSd+gtj+LnEpV1s1iszNm9O4ddaFBWJU_GQ@mail.gmail.com>
Subject: Re: [PATCH RFC 1/3] spdx_common: simplify get_patched_src() implementation
To: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, antonin.godard@bootlin.com, 
	mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
	daniel.turull@ericsson.com
Content-Type: multipart/alternative; boundary="000000000000b376d9065861aae4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 14:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242948

--000000000000b376d9065861aae4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 2:34=E2=80=AFAM Benjamin Robin <benjamin.robin@boot=
lin.com>
wrote:

> The behavior remains unchanged:
> - Instead of saving and restoring the values of various variables, use a
>   copy of the data store via `d.createCopy()`. This prevents side effects
>   for other tasks.
> - This allows removing the `try ... finally` block.
> - The function `is_work_shared_spdx()` no longer needs to be called twice=
.
> - In the work-shared case, there is no need to modify `WORKDIR` since no
>   task is executed from that branch.
>
> Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
>

LGTM Thanks.

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>


> ---
>  meta/lib/oe/spdx_common.py | 81
> ++++++++++++++++++++++------------------------
>  1 file changed, 39 insertions(+), 42 deletions(-)
>
> diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
> index 6b1a409c40c2..9d1e22629b21 100644
> --- a/meta/lib/oe/spdx_common.py
> +++ b/meta/lib/oe/spdx_common.py
> @@ -172,50 +172,47 @@ def get_patched_src(d):
>      Save patched source of the recipe in SPDX_WORKDIR.
>      """
>      spdx_workdir =3D d.getVar("SPDXWORK")
> -    spdx_sysroot_native =3D d.getVar("STAGING_DIR_NATIVE")
>
> -    workdir =3D d.getVar("WORKDIR")
> +    # The kernel class functions require it to be on work-shared, so we
> don't change WORKDIR
> +    if not is_work_shared_spdx(d):
> +        spdx_sysroot_native =3D d.getVar("STAGING_DIR_NATIVE")
> +        localdata =3D d.createCopy()
>
> -    try:
> -        # The kernel class functions require it to be on work-shared, so
> we dont change WORKDIR
> -        if not is_work_shared_spdx(d):
> -            # Change the WORKDIR to make do_unpack do_patch run in
> another dir.
> -            d.setVar("WORKDIR", spdx_workdir)
> -            # Restore the original path to recipe's native sysroot (it's
> relative to WORKDIR).
> -            d.setVar("STAGING_DIR_NATIVE", spdx_sysroot_native)
> -
> -            # The changed 'WORKDIR' also caused 'B' changed, create dir
> 'B' for the
> -            # possibly requiring of the following tasks (such as some
> recipes's
> -            # do_patch required 'B' existed).
> -            bb.utils.mkdirhier(d.getVar("B"))
> -
> -            bb.build.exec_func("do_unpack", d)
> -
> -            if d.getVar("SRC_URI") !=3D "":
> -                if bb.data.inherits_class("dos2unix", d):
> -                    bb.build.exec_func("do_convert_crlf_to_lf", d)
> -                bb.build.exec_func("do_patch", d)
> -
> -        # Copy source from work-share to spdx_workdir
> -        if is_work_shared_spdx(d):
> -            share_src =3D d.getVar("S")
> -            d.setVar("WORKDIR", spdx_workdir)
> -            d.setVar("STAGING_DIR_NATIVE", spdx_sysroot_native)
> -            # Copy source to ${SPDXWORK}, same basename dir of ${S};
> -            src_dir =3D spdx_workdir + "/" + os.path.basename(share_src)
> -            # For kernel souce, rename suffix dir 'kernel-source'
> -            # to ${BP} (${BPN}-${PV})
> -            if bb.data.inherits_class("kernel", d):
> -                src_dir =3D spdx_workdir + "/" + d.getVar("BP")
> -
> -            bb.note(f"copyhardlinktree {share_src} to {src_dir}")
> -            oe.path.copyhardlinktree(share_src, src_dir)
> -
> -        # Some userland has no source.
> -        if not os.path.exists(spdx_workdir):
> -            bb.utils.mkdirhier(spdx_workdir)
> -    finally:
> -        d.setVar("WORKDIR", workdir)
> +        # Change the WORKDIR to make do_unpack do_patch run in another
> dir.
> +        localdata.setVar("WORKDIR", spdx_workdir)
> +        # Restore the original path to recipe's native sysroot (it's
> relative to WORKDIR).
> +        localdata.setVar("STAGING_DIR_NATIVE", spdx_sysroot_native)
> +
> +        # The changed 'WORKDIR' also caused 'B' changed, create dir 'B'
> for the
> +        # possibly requiring of the following tasks (such as some recipe=
's
> +        # do_patch required 'B' existed).
> +        bb.utils.mkdirhier(localdata.getVar("B"))
> +
> +        bb.build.exec_func("do_unpack", localdata)
> +
> +        if localdata.getVar("SRC_URI") !=3D "":
> +            if bb.data.inherits_class("dos2unix", localdata):
> +                bb.build.exec_func("do_convert_crlf_to_lf", localdata)
> +            bb.build.exec_func("do_patch", localdata)
> +
> +    # Copy source from work-shared to spdx_workdir
> +    else:
> +        share_src =3D d.getVar("S")
> +
> +        if bb.data.inherits_class("kernel", d):
> +            # For kernel source, rename suffix dir 'kernel-source' to
> ${BP} (${BPN}-${PV})
> +            dir_name =3D d.getVar("BP")
> +        else:
> +            # Copy source to ${SPDXWORK}, same basename dir of ${S}
> +            dir_name =3D os.path.basename(share_src)
> +
> +        src_dir =3D f"{spdx_workdir}/{dir_name}"
> +        bb.note(f"copyhardlinktree {share_src} to {src_dir}")
> +        oe.path.copyhardlinktree(share_src, src_dir)
> +
> +    # Some userland has no source.
> +    if not os.path.exists(spdx_workdir):
> +        bb.utils.mkdirhier(spdx_workdir)
>
>
>  def has_task(d, task):
>
> --
> 2.55.0
>
>

--000000000000b376d9065861aae4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 27,=
 2026 at 2:34=E2=80=AFAM Benjamin Robin &lt;<a href=3D"mailto:benjamin.robi=
n@bootlin.com">benjamin.robin@bootlin.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">The behavior remains unchanged:<br=
>
- Instead of saving and restoring the values of various variables, use a<br=
>
=C2=A0 copy of the data store via `d.createCopy()`. This prevents side effe=
cts<br>
=C2=A0 for other tasks.<br>
- This allows removing the `try ... finally` block.<br>
- The function `is_work_shared_spdx()` no longer needs to be called twice.<=
br>
- In the work-shared case, there is no need to modify `WORKDIR` since no<br=
>
=C2=A0 task is executed from that branch.<br>
<br>
Signed-off-by: Benjamin Robin &lt;<a href=3D"mailto:benjamin.robin@bootlin.=
com" target=3D"_blank">benjamin.robin@bootlin.com</a>&gt;<br></blockquote><=
div><br></div><div>LGTM Thanks.</div><div><br></div><div>Reviewed-by: Joshu=
a Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com">JPEWhacker@gmail.com</a>=
&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
---<br>
=C2=A0meta/lib/oe/spdx_common.py | 81 ++++++++++++++++++++++---------------=
---------<br>
=C2=A01 file changed, 39 insertions(+), 42 deletions(-)<br>
<br>
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py<br>
index 6b1a409c40c2..9d1e22629b21 100644<br>
--- a/meta/lib/oe/spdx_common.py<br>
+++ b/meta/lib/oe/spdx_common.py<br>
@@ -172,50 +172,47 @@ def get_patched_src(d):<br>
=C2=A0 =C2=A0 =C2=A0Save patched source of the recipe in SPDX_WORKDIR.<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0spdx_workdir =3D d.getVar(&quot;SPDXWORK&quot;)<br>
-=C2=A0 =C2=A0 spdx_sysroot_native =3D d.getVar(&quot;STAGING_DIR_NATIVE&qu=
ot;)<br>
<br>
-=C2=A0 =C2=A0 workdir =3D d.getVar(&quot;WORKDIR&quot;)<br>
+=C2=A0 =C2=A0 # The kernel class functions require it to be on work-shared=
, so we don&#39;t change WORKDIR<br>
+=C2=A0 =C2=A0 if not is_work_shared_spdx(d):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 spdx_sysroot_native =3D d.getVar(&quot;STAGING=
_DIR_NATIVE&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 localdata =3D d.createCopy()<br>
<br>
-=C2=A0 =C2=A0 try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # The kernel class functions require it to be =
on work-shared, so we dont change WORKDIR<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not is_work_shared_spdx(d):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Change the WORKDIR to make do_=
unpack do_patch run in another dir.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;WORKDIR&quot;, sp=
dx_workdir)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Restore the original path to r=
ecipe&#39;s native sysroot (it&#39;s relative to WORKDIR).<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;STAGING_DIR_NATIV=
E&quot;, spdx_sysroot_native)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # The changed &#39;WORKDIR&#39; =
also caused &#39;B&#39; changed, create dir &#39;B&#39; for the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # possibly requiring of the foll=
owing tasks (such as some recipes&#39;s<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # do_patch required &#39;B&#39; =
existed).<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.mkdirhier(d.getVar(&quo=
t;B&quot;))<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.exec_func(&quot;do_unpa=
ck&quot;, d)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&quot;SRC_URI&quot;)=
 !=3D &quot;&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb.data.inherit=
s_class(&quot;dos2unix&quot;, d):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.b=
uild.exec_func(&quot;do_convert_crlf_to_lf&quot;, d)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.exec_func=
(&quot;do_patch&quot;, d)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Copy source from work-share to spdx_workdir<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if is_work_shared_spdx(d):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 share_src =3D d.getVar(&quot;S&q=
uot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;WORKDIR&quot;, sp=
dx_workdir)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;STAGING_DIR_NATIV=
E&quot;, spdx_sysroot_native)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Copy source to ${SPDXWORK}, sa=
me basename dir of ${S};<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src_dir =3D spdx_workdir + &quot=
;/&quot; + os.path.basename(share_src)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # For kernel souce, rename suffi=
x dir &#39;kernel-source&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # to ${BP} (${BPN}-${PV})<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb.data.inherits_class(&quot;=
kernel&quot;, d):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src_dir =3D spdx_w=
orkdir + &quot;/&quot; + d.getVar(&quot;BP&quot;)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(f&quot;copyhardlinktree =
{share_src} to {src_dir}&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.path.copyhardlinktree(share_s=
rc, src_dir)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Some userland has no source.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.exists(spdx_workdir):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.mkdirhier(spdx_workdir)=
<br>
-=C2=A0 =C2=A0 finally:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;WORKDIR&quot;, workdir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Change the WORKDIR to make do_unpack do_patc=
h run in another dir.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 localdata.setVar(&quot;WORKDIR&quot;, spdx_wor=
kdir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Restore the original path to recipe&#39;s na=
tive sysroot (it&#39;s relative to WORKDIR).<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 localdata.setVar(&quot;STAGING_DIR_NATIVE&quot=
;, spdx_sysroot_native)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # The changed &#39;WORKDIR&#39; also caused &#=
39;B&#39; changed, create dir &#39;B&#39; for the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # possibly requiring of the following tasks (s=
uch as some recipe&#39;s<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # do_patch required &#39;B&#39; existed).<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.mkdirhier(localdata.getVar(&quot;B&qu=
ot;))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.exec_func(&quot;do_unpack&quot;, loca=
ldata)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if localdata.getVar(&quot;SRC_URI&quot;) !=3D =
&quot;&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb.data.inherits_class(&quot;=
dos2unix&quot;, localdata):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.exec_func=
(&quot;do_convert_crlf_to_lf&quot;, localdata)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.exec_func(&quot;do_patc=
h&quot;, localdata)<br>
+<br>
+=C2=A0 =C2=A0 # Copy source from work-shared to spdx_workdir<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 share_src =3D d.getVar(&quot;S&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb.data.inherits_class(&quot;kernel&quot;, =
d):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # For kernel source, rename suff=
ix dir &#39;kernel-source&#39; to ${BP} (${BPN}-${PV})<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dir_name =3D d.getVar(&quot;BP&q=
uot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Copy source to ${SPDXWORK}, sa=
me basename dir of ${S}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dir_name =3D os.path.basename(sh=
are_src)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 src_dir =3D f&quot;{spdx_workdir}/{dir_name}&q=
uot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(f&quot;copyhardlinktree {share_src} to=
 {src_dir}&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.path.copyhardlinktree(share_src, src_dir)<b=
r>
+<br>
+=C2=A0 =C2=A0 # Some userland has no source.<br>
+=C2=A0 =C2=A0 if not os.path.exists(spdx_workdir):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.mkdirhier(spdx_workdir)<br>
<br>
<br>
=C2=A0def has_task(d, task):<br>
<br>
-- <br>
2.55.0<br>
<br>
</blockquote></div></div>

--000000000000b376d9065861aae4--

