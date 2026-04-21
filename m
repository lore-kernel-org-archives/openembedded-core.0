Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD20F55805
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 04:49:35 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9532.1776746972412545894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 21:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XBdUv0wR;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-652fcd5a6d7so4265750d50.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 21:49:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776746971; cv=none;
        d=google.com; s=arc-20240605;
        b=A0FSuOK9o9pPdsdF26X/GAj8gWcZzadYms2JNPbNwn15z9/Nw+2f9gDzKYebUSE5Gi
         40pzaHxapJ6Tcncp6wnZYw5W9ocqMU4okV5zpchFJ+v9ETn4yRmV5RogHh0+E60odOGm
         wk9D4W9kPccL3XO1Kk4Q28Zg0MXVSc6qFcFI8xeD4Gu7EdS2h9nZ7Ofg7YmBMFgf0/rA
         yuvpTePU21Wo8cCS8V7cBUZJLkIg40o4FO1PbsgXUirYvjl/g0sfomC+C9L8NBlFcZ54
         HeLYRT/B/21I0QbioYC+lfDxRGoqy1ix0GA027PDrAkAnMbkb8YUe4kDIwxGHvZLyUJ+
         PC0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=17o5rK0lxn1UkeLTfzMc8tv80Cx/RoU9JOs+dBUb1uQ=;
        fh=7iCYXJqDgFYhnBX+xQp2sTJEsWY8LJolfkK31Ee9LMY=;
        b=iXnic8rN8xWGvC4GSFOsDCJecy/9jgmivAX2U/2r+LoZgpibi4gIppc0Dmn12exqGy
         I9E0DCrMDF7IARtTqe3rju+rilx0r9/E/yo/6N9nngvM0bPpq/GECQFF3YwkXpbOwELQ
         W2fTeUY/kgr1Yr+hAcjm+hU2Zw0wUK/ZzcdtSMlyaZKB70Qt4xK7I6/fPypNiXmJ9Vlr
         W8dDIPhOJz0UkcNa2LPMEBoluGTl3RfAwgvZ8nqoW+2S164cQvbi/8yUdG2dDCGNvDB7
         7EKyGtdt284k4+yAGqsLeoVgGt0UgGEsnJaf4XsIyaXzf2m3n2j0faP1Wwm/EnzTB0Oc
         GBSw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776746971; x=1777351771; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=17o5rK0lxn1UkeLTfzMc8tv80Cx/RoU9JOs+dBUb1uQ=;
        b=XBdUv0wR0Ewl9Y6alDT7ROd0uNx55FQSyvxB7cQgH2CsXfkxPyOrZo3S/YZH7qmhdg
         eB6FuZWP8BJ3bDAVoittMFb+6QiUPzCr3P9/Zook477i2s7iKrZqjnczbEic2Vj1s3z2
         Ga0lDrUH/Y0A8mZu3sUno9d/h5mPq3yRrmXkicEOViiapFVb3C8QTj4P2Oq1KNcYcIwS
         aFxMTK+VZOQxLD8aRwTnMhD+/bUzj9QKsH5opnLcZeJnFA3sBrqa9u8lYhL8Qu9l13Pg
         qlhvD1e2XVvWZ6U7i1+NwF3JD106F9TNtFEH21DDIa1YaAHx/FM/togmZqkqIrgiftIj
         O//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776746971; x=1777351771;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17o5rK0lxn1UkeLTfzMc8tv80Cx/RoU9JOs+dBUb1uQ=;
        b=ZRlnZ7Oql81g5MOO4EbNsogDqqZuMFAwCdsXrWt6LWMFZRjmIry1xiOTQtr5XWt04n
         k9mMj3eHA5GITc+R3+Oam+CcErOUXopEyPoBwB6mgYdhPXOCvi7onLrGdZ7EoGCujU+t
         Eewpjv8FHM3mWeYr6FB/xkTfYS4PE3WxRAZ2ZKGYjen8eaUEhqElVaqv08hWfe/q3vot
         Y8Lx+j4F1cqzqJAFIGppjDntYfqIxOo2iaId/Yaljo6aEhaqpItdP+50EuIpIUG1PJwX
         XjdPzizpxJIGqIPpGPgZvX2Tf+rSXwfDCD0nzI1QqBGDm7kqS2DgdkWz5cdyblcfhEIS
         BFRg==
X-Gm-Message-State: AOJu0YzvghXDyvSZjnV3EepuNGz29k+uZueAmrRX2TZzEolC68nx+ets
	dQ6Tx7gB2o0ceLHbJH5JQq/bk4bvv8Go/FUyML98PqRcd4B/ad4+WLoRJaLCVr4M3hgrFAA+NKm
	k0+PMaU+e4dFFTP1sLxl7bvc9fT9WCe0=
X-Gm-Gg: AeBDieveomzGWxMnU3skORMdo2PX1BfgQmogC5iKb43Vx0aB1NkCy7f7jEb6et2Je2u
	dqdeQ6u6l2lWKQL3oqF02ZfR7QIpJvEmWqlS9HWD6zBKAEWaHAppMJV5zJaOz65KD2mh6huuhQW
	OVYov3+506HpdXJO2nb4AhzYlgpEx4KXaF0HqjayhWTkzGhqFlvlVoQO5Q7DnRgNRbdqXsLM/XO
	llavd4fYC8KJavgoLBWs3GFO2ZgtG4wEYz62O+ufYVip+IWylpZ2Pxk5PhbqEHsBzCO1R7yQeZZ
	9XqDr4WCOXpkB8/7z3RQv77fdFyhsJS6101QEc0ob0LrZeWoKg5N55Ap2rJGwDjPWx9NvC8JOrA
	3I2EsFQZ9gN/jivSEMXHjLZVyIyfuGfecKRUKh+8YHqFRZRwH4NIAY5gBVNn1JFQkIfoPtlQVMM
	KatZyaLATdvgxsZSU=
X-Received: by 2002:a05:690e:2516:b0:64d:6098:3bdd with SMTP id
 956f58d0204a3-65310a2d043mr11654582d50.39.1776746971333; Mon, 20 Apr 2026
 21:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260417235422.838481-1-bhstalel@gmail.com>
In-Reply-To: <20260417235422.838481-1-bhstalel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Apr 2026 21:49:04 -0700
X-Gm-Features: AQROBzCgxz0CXRKM-O4R62vyeRYMnBO-C9qaP-5MTeSyxcl70PEFDtmYSB8oKkI
Message-ID: <CAMKF1spC171W9yGX2rVKg5FMyUuCpqTsgdX5MjYVm2rdtuLbLA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] image_types: catch exception if no
 CONVERSION_CMD is defined
To: bhstalel@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000150812064ff12492"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 04:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235590

--000000000000150812064ff12492
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Add meta-tegra to layermix and pick a tegra machine e.g.
MACHINE=3D"p3737-0000-p3701-0005"
and then it ends up with

ERROR:
/mnt/b/yoe/master/kas-build/../layers/meta-openembedded/meta-filesystems/re=
cipes-filesystems/images/
meta-filesystems-image-all.bb: No CONVERSION_CMD defined for subtype "tar"
- possibly invalid conversion type name or missing support class
ERROR:
/mnt/b/yoe/master/kas-build/../layers/meta-openembedded/meta-filesystems/re=
cipes-filesystems/images/
meta-filesystems-image-ptest.bb: No CONVERSION_CMD defined for subtype
"tar" - possibly invalid conversion type name or missing support class
ERROR: Parsing halted due to errors, see error messages above

I wonder if CONVERSION_CMD is missing for tar in the original class

On Fri, Apr 17, 2026 at 4:54=E2=80=AFPM BELHADJ SALEM Talel via
lists.openembedded.org <bhstalel=3Dgmail.com@lists.openembedded.org> wrote:

> When new conversion type is defined, BitBake assumes
> that CONVERSION_CMD: is defined for the type, so it gets
> the variable which returns NoneType if it is not defined.
>
> That generates the following exception which may not be clear
> for some:
>
> --
> ERROR: /../techleef-image.bb: Error executing a python function in <code>=
:
>
> The stack trace of python calls that resulted in this exception/failure
> was:
> File: '<code>', lineno: 16, function: <module>
>      0012:__anon_117__.._recipe_populate_sdk_base_bbclass(d)
>      0013:__anon_427__.._recipe_populate_sdk_base_bbclass(d)
>      0014:__anon_131__.._recipe_image_bbclass(d)
>      0015:__anon_187__.._recipe_image_bbclass(d)
>  *** 0016:__anon_535__.._recipe_image_bbclass(d)
>      0017:__anon_44__.._recipe_rootfs_ipk_bbclass(d)
>      0018:__anon_191__.._recipe_siteinfo_bbclass(d)
>      0019:__anon_17__.._recipe_license_image_bbclass(d)
>      0020:__anon_206__.._recipe_image_types_wic_bbclass(d)
> File: '/../image.bbclass', lineno: 501, function:
> __anon_535__.._recipe_image_bbclass
>      0497:                    if original_type not in alltypes:
>      0498:
> rm_tmp_images.add(localdata.expand("${IMAGE_NAME}.${type}"))
>      0499:
>      0500:        for bt in basetypes[t]:
>  *** 0501:            gen_conversion_cmds(bt)
>      0502:
>      0503:        localdata.setVar('type', realt)
>      0504:        if t not in alltypes:
>      0505:
> rm_tmp_images.add(localdata.expand("${IMAGE_NAME}.${type}"))
> File: '/../image.bbclass', lineno: 490, function: gen_conversion_cmds
>      0486:                        type =3D type[8:]
>      0487:                    # Create input image first.
>      0488:                    gen_conversion_cmds(type)
>      0489:                    localdata.setVar('type', type)
>  *** 0490:                    cmd =3D "\t" +
> localdata.getVar("CONVERSION_CMD:" + ctype)
>      0491:                    if cmd not in cmds:
>      0492:                        cmds.append(cmd)
>      0493:                    vardeps.add('CONVERSION_CMD:' + ctype)
>      0494:                    subimage =3D type + "." + ctype
> Exception: TypeError: can only concatenate str (not "NoneType") to str
>
> ERROR: Parsing halted due to errors, see error messages above
> --
>
> Fail with human readable error if no CONVERSION_CMD is defined for
> any defined subtype.
>
> Signed-off-by: Talel BELHAJ SALEM <bhstalel@gmail.com>
> ---
>  meta/classes-recipe/image_types.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes-recipe/image_types.bbclass
> b/meta/classes-recipe/image_types.bbclass
> index e6ef0ce11e..326602d960 100644
> --- a/meta/classes-recipe/image_types.bbclass
> +++ b/meta/classes-recipe/image_types.bbclass
> @@ -44,6 +44,10 @@ def imagetypes_getdepends(d):
>                  deprecated.add(var)
>
>          for ctype in resttypes:
> +            ctype_cmd =3D d.getVar('CONVERSION_CMD:' + ctype)
> +            if not ctype_cmd:
> +                bb.fatal('No CONVERSION_CMD defined for subtype "%s"'
> +                         ' - possibly invalid conversion type name or
> missing support class' % ctype)
>              adddep(d.getVar("CONVERSION_DEPENDS_%s" % ctype), deps)
>              adddep(d.getVar("COMPRESS_DEPENDS_%s" % ctype), deps)
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#235513):
> https://lists.openembedded.org/g/openembedded-core/message/235513
> Mute This Topic: https://lists.openembedded.org/mt/118885182/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000150812064ff12492
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Add meta-tegra to layermix and pick a tegra machine e.g. M=
ACHINE=3D&quot;p3737-0000-p3701-0005&quot;<div>and then it ends up with<div=
><br></div><div>ERROR: /mnt/b/yoe/master/kas-build/../layers/meta-openembed=
ded/meta-filesystems/recipes-filesystems/images/<a href=3D"http://meta-file=
systems-image-all.bb">meta-filesystems-image-all.bb</a>: No CONVERSION_CMD =
defined for subtype &quot;tar&quot; - possibly invalid conversion type name=
 or missing support class<br>ERROR: /mnt/b/yoe/master/kas-build/../layers/m=
eta-openembedded/meta-filesystems/recipes-filesystems/images/<a href=3D"htt=
p://meta-filesystems-image-ptest.bb">meta-filesystems-image-ptest.bb</a>: N=
o CONVERSION_CMD defined for subtype &quot;tar&quot; - possibly invalid con=
version type name or missing support class<br>ERROR: Parsing halted due to =
errors, see error messages above</div></div><div><br></div><div>I wonder if=
 CONVERSION_CMD is missing for tar in the original class</div></div><br><di=
v class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gma=
il_attr">On Fri, Apr 17, 2026 at 4:54=E2=80=AFPM BELHADJ SALEM Talel via <a=
 href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;bhst=
alel=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.=
openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">When new conversion type is defined, BitBake assumes<br>
that CONVERSION_CMD: is defined for the type, so it gets<br>
the variable which returns NoneType if it is not defined.<br>
<br>
That generates the following exception which may not be clear<br>
for some:<br>
<br>
--<br>
ERROR: /../<a href=3D"http://techleef-image.bb" rel=3D"noreferrer" target=
=3D"_blank">techleef-image.bb</a>: Error executing a python function in &lt=
;code&gt;:<br>
<br>
The stack trace of python calls that resulted in this exception/failure was=
:<br>
File: &#39;&lt;code&gt;&#39;, lineno: 16, function: &lt;module&gt;<br>
=C2=A0 =C2=A0 =C2=A00012:__anon_117__.._recipe_populate_sdk_base_bbclass(d)=
<br>
=C2=A0 =C2=A0 =C2=A00013:__anon_427__.._recipe_populate_sdk_base_bbclass(d)=
<br>
=C2=A0 =C2=A0 =C2=A00014:__anon_131__.._recipe_image_bbclass(d)<br>
=C2=A0 =C2=A0 =C2=A00015:__anon_187__.._recipe_image_bbclass(d)<br>
=C2=A0*** 0016:__anon_535__.._recipe_image_bbclass(d)<br>
=C2=A0 =C2=A0 =C2=A00017:__anon_44__.._recipe_rootfs_ipk_bbclass(d)<br>
=C2=A0 =C2=A0 =C2=A00018:__anon_191__.._recipe_siteinfo_bbclass(d)<br>
=C2=A0 =C2=A0 =C2=A00019:__anon_17__.._recipe_license_image_bbclass(d)<br>
=C2=A0 =C2=A0 =C2=A00020:__anon_206__.._recipe_image_types_wic_bbclass(d)<b=
r>
File: &#39;/../image.bbclass&#39;, lineno: 501, function: __anon_535__.._re=
cipe_image_bbclass<br>
=C2=A0 =C2=A0 =C2=A00497:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 if original_type not in alltypes:<br>
=C2=A0 =C2=A0 =C2=A00498:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm_tmp_images.add(localdata.expand(&quot=
;${IMAGE_NAME}.${type}&quot;))<br>
=C2=A0 =C2=A0 =C2=A00499:<br>
=C2=A0 =C2=A0 =C2=A00500:=C2=A0 =C2=A0 =C2=A0 =C2=A0 for bt in basetypes[t]=
:<br>
=C2=A0*** 0501:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_conversion_cmd=
s(bt)<br>
=C2=A0 =C2=A0 =C2=A00502:<br>
=C2=A0 =C2=A0 =C2=A00503:=C2=A0 =C2=A0 =C2=A0 =C2=A0 localdata.setVar(&#39;=
type&#39;, realt)<br>
=C2=A0 =C2=A0 =C2=A00504:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if t not in alltypes:<=
br>
=C2=A0 =C2=A0 =C2=A00505:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm_tmp_i=
mages.add(localdata.expand(&quot;${IMAGE_NAME}.${type}&quot;))<br>
File: &#39;/../image.bbclass&#39;, lineno: 490, function: gen_conversion_cm=
ds<br>
=C2=A0 =C2=A0 =C2=A00486:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D type[8:]<br>
=C2=A0 =C2=A0 =C2=A00487:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 # Create input image first.<br>
=C2=A0 =C2=A0 =C2=A00488:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 gen_conversion_cmds(type)<br>
=C2=A0 =C2=A0 =C2=A00489:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 localdata.setVar(&#39;type&#39;, type)<br>
=C2=A0*** 0490:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cmd =3D &quot;\t&quot; + localdata.getVar(&quot;CONVERSION_CMD:&=
quot; + ctype)<br>
=C2=A0 =C2=A0 =C2=A00491:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 if cmd not in cmds:<br>
=C2=A0 =C2=A0 =C2=A00492:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmds.append(cmd)<br>
=C2=A0 =C2=A0 =C2=A00493:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 vardeps.add(&#39;CONVERSION_CMD:&#39; + ctype)<br>
=C2=A0 =C2=A0 =C2=A00494:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 subimage =3D type + &quot;.&quot; + ctype<br>
Exception: TypeError: can only concatenate str (not &quot;NoneType&quot;) t=
o str<br>
<br>
ERROR: Parsing halted due to errors, see error messages above<br>
--<br>
<br>
Fail with human readable error if no CONVERSION_CMD is defined for<br>
any defined subtype.<br>
<br>
Signed-off-by: Talel BELHAJ SALEM &lt;<a href=3D"mailto:bhstalel@gmail.com"=
 target=3D"_blank">bhstalel@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/image_types.bbclass | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/=
image_types.bbclass<br>
index e6ef0ce11e..326602d960 100644<br>
--- a/meta/classes-recipe/image_types.bbclass<br>
+++ b/meta/classes-recipe/image_types.bbclass<br>
@@ -44,6 +44,10 @@ def imagetypes_getdepends(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deprecated.ad=
d(var)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for ctype in resttypes:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctype_cmd =3D d.getVar(&#39;CONV=
ERSION_CMD:&#39; + ctype)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not ctype_cmd:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&#39;No C=
ONVERSION_CMD defined for subtype &quot;%s&quot;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39; - possibly invalid conversion type name or missing s=
upport class&#39; % ctype)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adddep(d.getVar(&quot;CONVE=
RSION_DEPENDS_%s&quot; % ctype), deps)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adddep(d.getVar(&quot;COMPR=
ESS_DEPENDS_%s&quot; % ctype), deps)<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#235513): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/235513" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/235513</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118885182/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118885182/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000150812064ff12492--

