Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6757AC56208
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 14:29:18 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20620.1786026557183232926
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 07:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Qq3zU9c/;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-664b05d408bso2198481d50.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 07:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786026556; cv=none;
        d=google.com; s=arc-20260327;
        b=FcHoAJhsJVEPE473JaE/vTNdo5HZMbr2BkY0krNKWrpIbrM7ALjLX/6UF8uwc/fDGD
         f/CXNr4f9m3YVV27SCN1v1NjWXuCurjFChmFl3RhfmqXbwa+vAQxhzc/hIf/7h+T+LqC
         zWSr9DAb369ghDKcPGEykmiTRZjJ1m5e/EIf+vR7Jm1x7DHKyI9bKEp2YKZl29MHLrAn
         mW4MobqLMvwv9pM9b5ZT92PaNGcnrJpsbFnMBmljbq32I4ts0X84qkAFG2CfdnSTs+Ib
         BGrA1d4MqgYzPTNBhwy2oIVHLF2Lnk/A3Fy/sFSjnQxh5tsS+QiKdrhNAA0GHuqCm2iP
         vbqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7HeoNS1p3fkCYzLbL6hvGiK90O+M0uO17dG/ohzPHxc=;
        fh=M9Qp7N4TtDyoX+CgtT9+FnQbFuiO5nllHdvaR98P43E=;
        b=U4bUiVK7LabPIm/XgxwhWtIsr7Tj50wn4C/yzetsODQQXkGo/U3brjIKtshFurlYnQ
         FbhdEueCO1BlMLrwK+g9OUarS8dqEMw/j0BHpaqwo06zQQvHj75yQ4chtC0RhxM4h0CH
         X3BZfVKzZ+76sjf80sSQSdfH4BGG6ZhI8oRCqniYG2RXciaBh60YWTuCsO08w2jAt0GO
         XCl6fEiTiTku26UTgqSK4T5HoY0F9bBVavrW4oJq6nlVAppsz7u6Eg+NVq9vwj+UoF9d
         GK3/7v18jsxg7mHBIZXAfD1R98pAs95iUmHKVvALH90pFWubeol45tVR4md1URjM5O+I
         MRmA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786026556; x=1786631356; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7HeoNS1p3fkCYzLbL6hvGiK90O+M0uO17dG/ohzPHxc=;
        b=Qq3zU9c/KzSoIwa8R5/PUZouGCIibr5M+RG5c8YZGR2GO+6HmFw4nxP+yz9HhUN6Qb
         PUAERNv0xxv0Q+20nc/YirEQEuKrgozePwR/BF6WvbFcUPIwYqk7M3B/BUfLPqoW6P0+
         Kqc6xlC86IZeeRHCTxK5R6tPTsuI7y6cB32vINBS16sbwtGJ4fCZMp5MlVVhOUNESXKt
         HzyiY035MWr0hzNDCGSZc3zfMBdfInYbH1WZuuuNXhRkRV4oEOARzX51e3Lkx41SO8FF
         OJuSj/30qhYXaSg6gD1R3sHWjpuMEEr5j8vio1p1+Cun4d0X87sy0QvRvZsaCU982p8p
         TB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786026556; x=1786631356;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7HeoNS1p3fkCYzLbL6hvGiK90O+M0uO17dG/ohzPHxc=;
        b=Aq3hQ/SVhyw6YsyAEaPRSJweTAsX3rJW7ByREtxm1rHkVsouPfpTASD1a3v+lL6oyN
         ur7H8OJGZswkOnWZS3yegd8NgmbSsYSLch5pO7Zlh84UN+UOiu0WaVR1x7XoyC0CMRQf
         ieI4H2Xes/hH4xdMkULs3TDjVpfK+2xTqy3sNqglPb+BZAX6ikYkBYO9KIGZzRiu4I93
         bgo991US6S0fykPGkbYEzy1p1tH4i5iJrszRmmSMTXn5OXqrPx52Emcgd63DKEJyXZSC
         fogRIbOVn/sbwsQeVRZ6kXR09f5oUMxISS8DquH/JiOLmq52S7be5xrwNDzaQD7RYRXD
         ZTKg==
X-Gm-Message-State: AOJu0YyxwrIOhlSz0isRuhLu5GyhiTWLTcdbij4lOhYVfQBnpNJjYJWY
	+a22ZXMz7qcRQvlgQ5Ta5FKiw5Bwu905stgxXiLtwLKbnbYaQg0VmnhjSAp0cmct8enivOFcV95
	Sd76xR3rZpVRIeg82nH3HxRZ2JVkYGw1XOg==
X-Gm-Gg: AR+sD12ByfUOF1uPxwR+Spn9hXkJA+bD5Akk373gbUr9qearX/b/p08lNzz0WLkGHNv
	S44VyJQhd33+4cEUC0YiZk2VOh1NknT6cDz3LcR6x0Elgd56ifEgvXonjkBeh2ugkHLPQq5zcoR
	wrvJ8dtCKx7K/QrPgNtq5HTQp0IWx14xnvfJZjLjNuY9W1yEVRX2vz7aHoXnD/mX7eLqnN/XJ4m
	nQAONoVkcoXrucIeR/qKx5l9SYygsmplcZai3FgMqON0r8miGwFn15GgNV84SmJcIDiGeebhV0d
	J7gqpvx7Z7AVVFBePjZoi+Neq0w2HEh0ZS4k2Wzfl8UxcTh4bAuY8ikuutg=
X-Received: by 2002:a05:690e:45:b0:667:b645:5303 with SMTP id
 956f58d0204a3-6699aba143dmr6753370d50.33.1786026556024; Thu, 06 Aug 2026
 07:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260727-fix-get-patched-src-v1-0-f5054ca10e14@bootlin.com> <20260727-fix-get-patched-src-v1-2-f5054ca10e14@bootlin.com>
In-Reply-To: <20260727-fix-get-patched-src-v1-2-f5054ca10e14@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 6 Aug 2026 08:29:03 -0600
X-Gm-Features: AUfX_mxDNwM6l2p5_A8bdD_9hGyaxPXYk3QlBttgAswq-5xasADhphxBZ56DL2A
Message-ID: <CAJdd5GaxgRzOiYncMGyvFM9Jm0ufuvo3bm6mk-ngOYxd-obMYg@mail.gmail.com>
Subject: Re: [PATCH RFC 2/3] spdx_common: modify UNPACKDIR instead of WORKDIR
 in get_patched_src()
To: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, antonin.godard@bootlin.com, 
	mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
	daniel.turull@ericsson.com
Content-Type: multipart/alternative; boundary="0000000000006e6d67065861b63b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 14:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242949

--0000000000006e6d67065861b63b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 2:34=E2=80=AFAM Benjamin Robin <benjamin.robin@boot=
lin.com>
wrote:

> This change will affect the SPDX output: the source file path will no
> longer be prefixed by `sources/`.
>

This is fine (and probably better)


>
> The rest of the changes are safe because:
> - `S` should reference `UNPACKDIR` and not directly reference `WORKDIR`.
>

Correct. This is a nice improvement that UNPACKDIR allows us tomake


> - After analyzing all public layers, no `do_unpack()` or `do_patch()` was
>   found to reference the `${B}` variable. The comment mentioning the
>   `${B}` variable traces back to [1] (though no further explanation was
>   provided).
>
> Additionally, this ensures proper capture of sources if the recipe
> modifies `UNPACKDIR` outside of `WORKDIR` (though such cases should be
> rare).
>
> With these changes, SPDXWORK is no longer a working directory which is
> "temporary" replacing WORKDIR, it is now a "temporary" directory containi=
ng
> unpacked source files.
> The run.do_patch.XXXX and associated files are now stored in
> ${WORKDIR}/temp.
>
> [1] https://github.com/doubleopen-io/meta-doubleopen/blob/
> e84f0c32663da9c743e4f1802042b733df0e36d7/classes/doubleopen.bbclass#L285
>
> Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
>

LGTM Thanks.

Reviewed-by: Joshua Watt <JPEWhacker@gmai.com>


> ---
>  meta/lib/oe/spdx30_tasks.py |  1 -
>  meta/lib/oe/spdx_common.py  | 18 +++++-------------
>  2 files changed, 5 insertions(+), 14 deletions(-)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index ef12e638ae85..4da9e8bb7e24 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -843,7 +843,6 @@ def create_spdx(d):
>              lambda filepath: [oe.spdx30.software_SoftwarePurpose.source]=
,
>              license_data,
>              ignore_dirs=3D[".git"],
> -            ignore_top_level_dirs=3D["temp"],
>              archive=3DNone,
>          )
>          build_inputs |=3D files
> diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
> index 9d1e22629b21..013f23ae7c65 100644
> --- a/meta/lib/oe/spdx_common.py
> +++ b/meta/lib/oe/spdx_common.py
> @@ -169,28 +169,20 @@ def collect_package_providers(d, direct_deps):
>
>  def get_patched_src(d):
>      """
> -    Save patched source of the recipe in SPDX_WORKDIR.
> +    Save patched source of the recipe in SPDXWORK.
>      """
>      spdx_workdir =3D d.getVar("SPDXWORK")
>
> -    # The kernel class functions require it to be on work-shared, so we
> don't change WORKDIR
> +    # Do not unpack the sources again for the recipe using work-shared
>      if not is_work_shared_spdx(d):
> -        spdx_sysroot_native =3D d.getVar("STAGING_DIR_NATIVE")
>          localdata =3D d.createCopy()
>
> -        # Change the WORKDIR to make do_unpack do_patch run in another
> dir.
> -        localdata.setVar("WORKDIR", spdx_workdir)
> -        # Restore the original path to recipe's native sysroot (it's
> relative to WORKDIR).
> -        localdata.setVar("STAGING_DIR_NATIVE", spdx_sysroot_native)
> -
> -        # The changed 'WORKDIR' also caused 'B' changed, create dir 'B'
> for the
> -        # possibly requiring of the following tasks (such as some recipe=
's
> -        # do_patch required 'B' existed).
> -        bb.utils.mkdirhier(localdata.getVar("B"))
> +        # Change the UNPACKDIR to make do_unpack do_patch run in another
> dir.
> +        localdata.setVar("UNPACKDIR", spdx_workdir)
>
>          bb.build.exec_func("do_unpack", localdata)
>
> -        if localdata.getVar("SRC_URI") !=3D "":
> +        if localdata.getVar("SRC_URI"):
>              if bb.data.inherits_class("dos2unix", localdata):
>                  bb.build.exec_func("do_convert_crlf_to_lf", localdata)
>              bb.build.exec_func("do_patch", localdata)
>
> --
> 2.55.0
>
>

--0000000000006e6d67065861b63b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 27,=
 2026 at 2:34=E2=80=AFAM Benjamin Robin &lt;<a href=3D"mailto:benjamin.robi=
n@bootlin.com">benjamin.robin@bootlin.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">This change will affect the SPDX o=
utput: the source file path will no<br>
longer be prefixed by `sources/`.<br></blockquote><div><br></div><div>This =
is fine (and probably better)</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
The rest of the changes are safe because:<br>
- `S` should reference `UNPACKDIR` and not directly reference `WORKDIR`.<br=
></blockquote><div><br></div><div>Correct. This is a nice improvement that =
UNPACKDIR=C2=A0allows us tomake</div><div></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
- After analyzing all public layers, no `do_unpack()` or `do_patch()` was<b=
r>
=C2=A0 found to reference the `${B}` variable. The comment mentioning the<b=
r>
=C2=A0 `${B}` variable traces back to [1] (though no further explanation wa=
s<br>
=C2=A0 provided).<br>
<br>
Additionally, this ensures proper capture of sources if the recipe<br>
modifies `UNPACKDIR` outside of `WORKDIR` (though such cases should be<br>
rare).<br>
<br>
With these changes, SPDXWORK is no longer a working directory which is<br>
&quot;temporary&quot; replacing WORKDIR, it is now a &quot;temporary&quot; =
directory containing<br>
unpacked source files.<br>
The run.do_patch.XXXX and associated files are now stored in ${WORKDIR}/tem=
p.<br>
<br>
[1] <a href=3D"https://github.com/doubleopen-io/meta-doubleopen/blob/" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/doubleopen-io/meta-dou=
bleopen/blob/</a><br>
e84f0c32663da9c743e4f1802042b733df0e36d7/classes/doubleopen.bbclass#L285<br=
>
<br>
Signed-off-by: Benjamin Robin &lt;<a href=3D"mailto:benjamin.robin@bootlin.=
com" target=3D"_blank">benjamin.robin@bootlin.com</a>&gt;<br></blockquote><=
div><br></div><div>LGTM Thanks.</div><div><br></div><div>Reviewed-by: Joshu=
a Watt &lt;<a href=3D"mailto:JPEWhacker@gmai.com">JPEWhacker@gmai.com</a>&g=
t;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0meta/lib/oe/spdx30_tasks.py |=C2=A0 1 -<br>
=C2=A0meta/lib/oe/spdx_common.py=C2=A0 | 18 +++++-------------<br>
=C2=A02 files changed, 5 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py<br>
index ef12e638ae85..4da9e8bb7e24 100644<br>
--- a/meta/lib/oe/spdx30_tasks.py<br>
+++ b/meta/lib/oe/spdx30_tasks.py<br>
@@ -843,7 +843,6 @@ def create_spdx(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lambda filepath: [oe.spdx30=
.software_SoftwarePurpose.source],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0license_data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ignore_dirs=3D[&quot;.git&q=
uot;],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ignore_top_level_dirs=3D[&quot;t=
emp&quot;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0archive=3DNone,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0build_inputs |=3D files<br>
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py<br>
index 9d1e22629b21..013f23ae7c65 100644<br>
--- a/meta/lib/oe/spdx_common.py<br>
+++ b/meta/lib/oe/spdx_common.py<br>
@@ -169,28 +169,20 @@ def collect_package_providers(d, direct_deps):<br>
<br>
=C2=A0def get_patched_src(d):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 Save patched source of the recipe in SPDX_WORKDIR.<br>
+=C2=A0 =C2=A0 Save patched source of the recipe in SPDXWORK.<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0spdx_workdir =3D d.getVar(&quot;SPDXWORK&quot;)<br>
<br>
-=C2=A0 =C2=A0 # The kernel class functions require it to be on work-shared=
, so we don&#39;t change WORKDIR<br>
+=C2=A0 =C2=A0 # Do not unpack the sources again for the recipe using work-=
shared<br>
=C2=A0 =C2=A0 =C2=A0if not is_work_shared_spdx(d):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 spdx_sysroot_native =3D d.getVar(&quot;STAGING=
_DIR_NATIVE&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0localdata =3D d.createCopy()<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Change the WORKDIR to make do_unpack do_patc=
h run in another dir.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 localdata.setVar(&quot;WORKDIR&quot;, spdx_wor=
kdir)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Restore the original path to recipe&#39;s na=
tive sysroot (it&#39;s relative to WORKDIR).<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 localdata.setVar(&quot;STAGING_DIR_NATIVE&quot=
;, spdx_sysroot_native)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # The changed &#39;WORKDIR&#39; also caused &#=
39;B&#39; changed, create dir &#39;B&#39; for the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # possibly requiring of the following tasks (s=
uch as some recipe&#39;s<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # do_patch required &#39;B&#39; existed).<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.mkdirhier(localdata.getVar(&quot;B&qu=
ot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Change the UNPACKDIR to make do_unpack do_pa=
tch run in another dir.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 localdata.setVar(&quot;UNPACKDIR&quot;, spdx_w=
orkdir)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.build.exec_func(&quot;do_unpack&quot;,=
 localdata)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if localdata.getVar(&quot;SRC_URI&quot;) !=3D =
&quot;&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if localdata.getVar(&quot;SRC_URI&quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if bb.data.inherits_class(&=
quot;dos2unix&quot;, localdata):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.build.exec=
_func(&quot;do_convert_crlf_to_lf&quot;, localdata)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.build.exec_func(&quot;do=
_patch&quot;, localdata)<br>
<br>
-- <br>
2.55.0<br>
<br>
</blockquote></div></div>

--0000000000006e6d67065861b63b--

