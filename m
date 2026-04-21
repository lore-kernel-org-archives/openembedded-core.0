Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5576EF327AA
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 06:19:17 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12582.1776752353544243687
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 23:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hQ7DpMPb;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bhstalel@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8aca4efb81cso10940556d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 23:19:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776752352; cv=none;
        d=google.com; s=arc-20240605;
        b=bkL2y/E0UP0+QanDRj/uB7kbduEb4JDg+YQR8AHTQt9/BaSrUgmMag3+tv3ZKz2xiC
         WHKI9TfmH2mKJegTnZ5IzVt404Q09lxsRc91mAnjp64y25LgijNpRi2lpTwlU5DsIcD/
         5LeKdJa4f8Q3gEHmWP0BQdpYjxf4YeabE6opSc2Bv8NTwij1wMbwC2q8a2dr6TIvWS5D
         LuoSFVLojFQNJqnwWog6Biy40PHFlQh0JEL4j0gMrI/UAO430CC659mqrS9z29ACimia
         OERTps5gX2j0XpQPQiPW4W2Q/hkUVM53R3LIKyNGLZSqmcCF0S1LUosY8LSJ+5yIYmT3
         uvcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K7d1cGExHW43h7tb0FYtUxlG7ET5wvNBNIksmXlcTHo=;
        fh=T1qaykboICSXVBYVwcN7slxyuUQU9RUtVWEpyK22iOM=;
        b=darLX0oovUhi4ck2bLGsp7GZ8CP3xVcVzyrPlfLC/0KMIjDHuzYajwqqF8MmHWQEmU
         EgwDPgQ+qb5MJjxuUJqZ1CdRyyll49+Drplu5dy1x072991Y2jAiT8brg9a5XVaLGnrW
         nWjIuXckwIwNXPlEJtzNG4qn4HWdPS6vXYHYtOJ7ItNfCiem7F3Rd7bH8SmgzWv+HHEU
         n9EsQSvZsTDGS6pO9eu59hSWAFavHAiShe1Q1B0RkWfQ3ZbPW8sKJfrUsf5YJHKaHVl5
         VjmxgnJyd4/uSmsOJWMbnrDn4jCOVB4CFMNHDTwlnO+yOuoYBoz0SD/rH/550ASQ5CPU
         giKw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776752352; x=1777357152; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K7d1cGExHW43h7tb0FYtUxlG7ET5wvNBNIksmXlcTHo=;
        b=hQ7DpMPbqTINPh5wisvSTt+T6u8w7MxU9/P6aytO1liy+ZLx8LHiumeI0CXReXcRPG
         srua0+kCOCi1YA/eGiR+SIEx13fQqL1Xi7pS1DrVj5HlLf4FSiilVkPVBifqVwYk4Mqk
         dqRCmHShVTVXWHQWmucTtyXepLKb1cGSQyIlzikHlhXZsjPGaMbzJhZaXLKTQERovFeu
         eo7bFBG+2TlD2cRV/hOyI0nGxT/rjFg8ypuB132L8Q6maxOXydFIWM1BmD57iJ2ZIsch
         E6Q+TcSbl8edhJsUROcLr6stF27QpABOsK2Qhvgz98Fp6Il/hxOzHqgjnL9XMjRIJ9en
         LQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776752352; x=1777357152;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7d1cGExHW43h7tb0FYtUxlG7ET5wvNBNIksmXlcTHo=;
        b=pfTTfc/bxEUjyUIpro86h7xG7bd5xVyD9nFaM30hUowPtIE9Mu5phrRUyzV+RGEupP
         Zgh60Jm8xgG1Sm3/iDxc/uhSUp6NP2LGxT7URBbfEBrtYkdec2taxW5GEVcaB//MhHsu
         HRX/9/v2TlSg877m5MN6SRXJDmab+LgRWgpcFm6J3rXeWhzBUdk7YVlPuYtXdQfNKWog
         UMqnZPcTHkfowP0b3E8xl9Az0iNncJ6DSNnFzkiwyGRRiDy/0sliyxNAgspix1izClsW
         cKwnAi4znnexyYzTMNY5FwjAVVrKeY863QOksC966l8u4X0O/8KfJRk7QsGW+lx54mOr
         hWcg==
X-Gm-Message-State: AOJu0Yyk2f5YQBgciFEoNFOkpwZPwZh6hSJ3w//Uym0/yCmsmcfftybm
	XtVAPeAYbFE/DxFdBJXQgRuatHhTs1cXnmJLKTszpYpbthp4B9aPs+dse6/WQRXSEBLlxxaTLCm
	ar40L9+FfksWptR2/gWhbKb5aUuG2t4o=
X-Gm-Gg: AeBDievEGM4gDIQK7ZbVVO9u4S+Zf6Z6UptZ4AtPv+dYLNwkRjT1XFC633o+hrRQVKs
	aCI49wD8qPb0+iMdJg8UNtrzEmugql3tV9KNUcmSaWl1b9ZpGEgS0kEWj4tRHSwqyOj7q4sPu4Q
	y4F10Lx5HlFRlohEYpFRvtbLm6VOYuJigOnPX+9Vao6ebDHkCfh4wckzJQ96qOA5oMbReDIxz59
	WDHJ3wENU13v/BcAhjPZgAfyylAHI/psKHiCFte0L+MKPW7XzgJN0N4WNb52x940FHWTlEUd0IV
	8ACoBF2HWQZjxM4LDR7VzfBgeko5A11JYbQZABEvFWxjElbLBdkxLnI8sZ7arw==
X-Received: by 2002:a05:6214:c8b:b0:89c:d639:e7be with SMTP id
 6a1803df08f44-8b028162c61mr187362936d6.5.1776752352419; Mon, 20 Apr 2026
 23:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260417235422.838481-1-bhstalel@gmail.com> <CAMKF1spC171W9yGX2rVKg5FMyUuCpqTsgdX5MjYVm2rdtuLbLA@mail.gmail.com>
In-Reply-To: <CAMKF1spC171W9yGX2rVKg5FMyUuCpqTsgdX5MjYVm2rdtuLbLA@mail.gmail.com>
From: Talel BELHADJ SALEM <bhstalel@gmail.com>
Date: Tue, 21 Apr 2026 07:19:01 +0100
X-Gm-Features: AQROBzBELUCe8HjXnGu2F27c3WwyG2svGsQ9nQX7WTsFe6twW8uwr3UOaYZdcuw
Message-ID: <CAOgG7m3OQtY3=ozcT8=K79bP5iDyhFNnRQGAh=4N9_1Ocv3tyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] image_types: catch exception if no
 CONVERSION_CMD is defined
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d1e541064ff26435"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 06:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235599

--000000000000d1e541064ff26435
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have quickly checked meta-tegra and they have full image type:
tegraflash.tar and they treat it as full type with IMAGE_CMD:tegraflash.tar

The problem is that BitBake splits every entry in IMAGE_FSTYPES with "."
and takes the first as base type and the rest as conversion types

and "tar" is not a CONVERSION_CMD, actually, in the original types class,
it is an IMAGE_CMD:tar, so BitBake won't find the conversion type for tar

I also checked the IMAGE_CMD:tegraflash.tar and they ended up calling tar
directly, so they did not intend to use tar as conversion type at all.

Now I wonder how it worked before ?

The quick fix for tegra is to replace "." with "_" or "-" to avoid
splitting "tar" into a subtype

I will analyze this more later after work.

Kind Regards
Talel

On Tue, Apr 21, 2026 at 5:49=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:

> Add meta-tegra to layermix and pick a tegra machine e.g.
> MACHINE=3D"p3737-0000-p3701-0005"
> and then it ends up with
>
> ERROR:
> /mnt/b/yoe/master/kas-build/../layers/meta-openembedded/meta-filesystems/=
recipes-filesystems/images/
> meta-filesystems-image-all.bb: No CONVERSION_CMD defined for subtype
> "tar" - possibly invalid conversion type name or missing support class
> ERROR:
> /mnt/b/yoe/master/kas-build/../layers/meta-openembedded/meta-filesystems/=
recipes-filesystems/images/
> meta-filesystems-image-ptest.bb: No CONVERSION_CMD defined for subtype
> "tar" - possibly invalid conversion type name or missing support class
> ERROR: Parsing halted due to errors, see error messages above
>
> I wonder if CONVERSION_CMD is missing for tar in the original class
>
> On Fri, Apr 17, 2026 at 4:54=E2=80=AFPM BELHADJ SALEM Talel via
> lists.openembedded.org <bhstalel=3Dgmail.com@lists.openembedded.org> wrot=
e:
>
>> When new conversion type is defined, BitBake assumes
>> that CONVERSION_CMD: is defined for the type, so it gets
>> the variable which returns NoneType if it is not defined.
>>
>> That generates the following exception which may not be clear
>> for some:
>>
>> --
>> ERROR: /../techleef-image.bb: Error executing a python function in
>> <code>:
>>
>> The stack trace of python calls that resulted in this exception/failure
>> was:
>> File: '<code>', lineno: 16, function: <module>
>>      0012:__anon_117__.._recipe_populate_sdk_base_bbclass(d)
>>      0013:__anon_427__.._recipe_populate_sdk_base_bbclass(d)
>>      0014:__anon_131__.._recipe_image_bbclass(d)
>>      0015:__anon_187__.._recipe_image_bbclass(d)
>>  *** 0016:__anon_535__.._recipe_image_bbclass(d)
>>      0017:__anon_44__.._recipe_rootfs_ipk_bbclass(d)
>>      0018:__anon_191__.._recipe_siteinfo_bbclass(d)
>>      0019:__anon_17__.._recipe_license_image_bbclass(d)
>>      0020:__anon_206__.._recipe_image_types_wic_bbclass(d)
>> File: '/../image.bbclass', lineno: 501, function:
>> __anon_535__.._recipe_image_bbclass
>>      0497:                    if original_type not in alltypes:
>>      0498:
>> rm_tmp_images.add(localdata.expand("${IMAGE_NAME}.${type}"))
>>      0499:
>>      0500:        for bt in basetypes[t]:
>>  *** 0501:            gen_conversion_cmds(bt)
>>      0502:
>>      0503:        localdata.setVar('type', realt)
>>      0504:        if t not in alltypes:
>>      0505:
>> rm_tmp_images.add(localdata.expand("${IMAGE_NAME}.${type}"))
>> File: '/../image.bbclass', lineno: 490, function: gen_conversion_cmds
>>      0486:                        type =3D type[8:]
>>      0487:                    # Create input image first.
>>      0488:                    gen_conversion_cmds(type)
>>      0489:                    localdata.setVar('type', type)
>>  *** 0490:                    cmd =3D "\t" +
>> localdata.getVar("CONVERSION_CMD:" + ctype)
>>      0491:                    if cmd not in cmds:
>>      0492:                        cmds.append(cmd)
>>      0493:                    vardeps.add('CONVERSION_CMD:' + ctype)
>>      0494:                    subimage =3D type + "." + ctype
>> Exception: TypeError: can only concatenate str (not "NoneType") to str
>>
>> ERROR: Parsing halted due to errors, see error messages above
>> --
>>
>> Fail with human readable error if no CONVERSION_CMD is defined for
>> any defined subtype.
>>
>> Signed-off-by: Talel BELHAJ SALEM <bhstalel@gmail.com>
>> ---
>>  meta/classes-recipe/image_types.bbclass | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/classes-recipe/image_types.bbclass
>> b/meta/classes-recipe/image_types.bbclass
>> index e6ef0ce11e..326602d960 100644
>> --- a/meta/classes-recipe/image_types.bbclass
>> +++ b/meta/classes-recipe/image_types.bbclass
>> @@ -44,6 +44,10 @@ def imagetypes_getdepends(d):
>>                  deprecated.add(var)
>>
>>          for ctype in resttypes:
>> +            ctype_cmd =3D d.getVar('CONVERSION_CMD:' + ctype)
>> +            if not ctype_cmd:
>> +                bb.fatal('No CONVERSION_CMD defined for subtype "%s"'
>> +                         ' - possibly invalid conversion type name or
>> missing support class' % ctype)
>>              adddep(d.getVar("CONVERSION_DEPENDS_%s" % ctype), deps)
>>              adddep(d.getVar("COMPRESS_DEPENDS_%s" % ctype), deps)
>>
>> --
>> 2.43.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#235513):
>> https://lists.openembedded.org/g/openembedded-core/message/235513
>> Mute This Topic: https://lists.openembedded.org/mt/118885182/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000d1e541064ff26435
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have quickly checked meta-tegra and they have=C2=A0full =
image type: tegraflash.tar and they=C2=A0treat it as full type with IMAGE_C=
MD:tegraflash.tar<div><br></div><div>The problem is that BitBake splits eve=
ry entry in IMAGE_FSTYPES with &quot;.&quot; and takes the first as base ty=
pe and the rest as conversion types</div><div><br></div><div>and &quot;tar&=
quot; is not a CONVERSION_CMD, actually, in the original types class, it is=
 an IMAGE_CMD:tar, so BitBake won&#39;t find the conversion type for tar</d=
iv><div><br></div><div>I also checked the IMAGE_CMD:tegraflash.tar and they=
 ended up calling tar directly, so they did not intend to use tar as conver=
sion type at all.</div><div><br></div><div>Now I wonder how it worked befor=
e ?</div><div><br></div><div>The quick fix for tegra is to replace &quot;.&=
quot; with &quot;_&quot; or &quot;-&quot; to avoid splitting &quot;tar&quot=
; into a subtype</div><div><br></div><div>I will analyze this more later af=
ter work.</div><div><br></div><div>Kind Regards</div><div>Talel</div></div>=
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Apr 21, 2026 at 5:49=E2=80=AFAM Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Add meta=
-tegra to layermix and pick a tegra machine e.g. MACHINE=3D&quot;p3737-0000=
-p3701-0005&quot;<div>and then it ends up with<div><br></div><div>ERROR: /m=
nt/b/yoe/master/kas-build/../layers/meta-openembedded/meta-filesystems/reci=
pes-filesystems/images/<a href=3D"http://meta-filesystems-image-all.bb" tar=
get=3D"_blank">meta-filesystems-image-all.bb</a>: No CONVERSION_CMD defined=
 for subtype &quot;tar&quot; - possibly invalid conversion type name or mis=
sing support class<br>ERROR: /mnt/b/yoe/master/kas-build/../layers/meta-ope=
nembedded/meta-filesystems/recipes-filesystems/images/<a href=3D"http://met=
a-filesystems-image-ptest.bb" target=3D"_blank">meta-filesystems-image-ptes=
t.bb</a>: No CONVERSION_CMD defined for subtype &quot;tar&quot; - possibly =
invalid conversion type name or missing support class<br>ERROR: Parsing hal=
ted due to errors, see error messages above</div></div><div><br></div><div>=
I wonder if CONVERSION_CMD is missing for tar in the original class</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Fri, Apr 17, 2026 at 4:54=E2=80=AFPM BELHADJ SALEM Talel via <a href=3D"ht=
tp://lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &=
lt;bhstalel=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D=
"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">When new conversion type is define=
d, BitBake assumes<br>
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
</blockquote></div>

--000000000000d1e541064ff26435--

