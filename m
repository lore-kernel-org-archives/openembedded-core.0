Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A413CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 09:10:24 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.4494.1761124217746676800
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 02:10:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EGXV1poL;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b3d50882cc2so1259655766b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 02:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761124216; x=1761729016; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4Q+Rcq1SHJwgro/BdcJ2A+zi2pmLjhaejw0N7giQ0ik=;
        b=EGXV1poLkekKfPrREf+mpvo7imBdG//0GZeXt/3+A//vOH1efwhbJTfffX/7pbvjFi
         qND9WmywI4ZiSHmSIl2elv45GKHMPInIU3JQJRlSjpHWU7XNzcIkHkzlc4T0sghW/pIb
         W0gqfmxcjBIkRKqOk7sSL9EDuPmRRIOxkN/RY7oCD3cFn63AxlmgKerh7PaiA3B+XgkM
         T67QSGHmoFJl+LrLF5dxWhblfy4U0F+44arBpGXJvITJ8JsR+GGnuOXcvoOKXh0AJU/U
         SdfBAFau+IGVvVZF3J9Y+P+CLWDN5EWusd5KVYH/nnVfB0y5WejgDyGjC4VSJ317630b
         QZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761124216; x=1761729016;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Q+Rcq1SHJwgro/BdcJ2A+zi2pmLjhaejw0N7giQ0ik=;
        b=NlioSo6qPYZjZsA5MD964fktizB3Hu1BthfRVNHfA4w2SMyBf9svRA/BEJ7pZHfb8F
         +QDO2SP7c1KwxsfUROZ6V2OecdgkZ+ZbTmxbdYx1kVZZlwJOkirOdYG7RJF7VF833Bmt
         OjKqvUBBhezUOLf5rD7d1IpfGgEHf8XxslMJetnBFVu0qf/T0Oj9xLwW+6vqhqIHKURr
         f6PvvLM4XdaCT4sePoulf3nrHV37TdOm+TrRXT2SnPH5VzlbF274ldiIUFxWe2lQPEn9
         ewLVFC/zt6tSb46/fVMRxSL/rgRByFnPsDcSJMyIvQoYxqilu7F9kRMvYgZv/xvC+RWY
         uBJw==
X-Gm-Message-State: AOJu0Yze0aX1T2E/zy9/OFwuqbLUjrpxLO4y9Vxl8JnQfMr297BESYhy
	3SiGodpmI7AJb51R4lXjeoD4UU4HVQgI6wd3vOApNMVsb3yY9a2Qxp5aoq8Gh6lzY4DJ8D1LV7Y
	3ug9qn1wcEjz+IvVjMJarUUHnY3pZ0cU=
X-Gm-Gg: ASbGnctmuJEF3pzNXZpgC3yGdSMwBtmjEmbcOuQMh/kuO+P0bnO2jBUFtU3fn9LwIKk
	2lqWZpyeSEb2gSLHMYw4SmoyvthcGwFdRH3/jPfnQJJXAmwWeqSHNOV8fgBUF7k4qCDkVs3QzRe
	lBHVRWMzqkc8bm9h+RLwAZJXGk1SiXJfsbMH6OLxoZogIuXJRicwYLBeGST8JgJivyAc7PVnJQY
	V9JQBQcHm9ipbe6BAQ1C7Gwq2XVxme26/aX5kxiKYuy46rbh/g6Frvk0Ins1nCRqCTOfKEt
X-Google-Smtp-Source: AGHT+IFA0KZD6/jar+C4QXqMgnMjlDXKEv7A6OydGE4WNHMTkXdTdIJ/jglZpvnQdec0T/sExN8k1Az+vHoFiCsLYUo=
X-Received: by 2002:a17:907:806:b0:b4b:dd7e:65f2 with SMTP id
 a640c23a62f3a-b6471d457b3mr2302764466b.5.1761124215406; Wed, 22 Oct 2025
 02:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <1870903CFB689BF6.21259@lists.openembedded.org> <1870914A1E4C69D3.17407@lists.openembedded.org>
In-Reply-To: <1870914A1E4C69D3.17407@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 22 Oct 2025 10:10:03 +0100
X-Gm-Features: AS18NWBjzoyQ64G4an_87zlRctkGemvFaECotkQ4kNIWAV7Bu-nLsvThFOlBrJE
Message-ID: <CANPvuR=JGNJ6FcDV_60wo=q6aSUpAiaGkbeDzQwXTjYsDwPRUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] spdx-common: load_spdx_license_data depends on
 the SPDX_LICENSES content
To: quaresma.jose@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="00000000000043d3070641bbaf06"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 09:10:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225181

--00000000000043d3070641bbaf06
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu (ter=C3=A7a, 21/10/2025 =C3=A0(s=
) 18:20):

> Hi,
>
> Please discard this patch as it is not fully functional.
> I will send a v2 after testing it a bit more.
>
> Jose
>
> Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
> gmail.com@lists.openembedded.org> escreveu (ter=C3=A7a, 21/10/2025 =C3=A0=
(s) 18:00):
>
>> If we have changes on SPDX_LICENSES content we ended up building invalid
>> sstate-cache archives.
>> The default value for the SPDX_LICENSES is the file
>> meta/files/spdx-licenses.json but this file
>> don't use the bitbake fetcher and because of this their checksum is not
>> validated.
>> So we need to add this file to the build dependency chain of the SPDX.
>>
>> For example, currently we have bump from 3.24.0 to 3.27.0 on master-next
>> for the file
>> meta/files/spdx-licenses.json. Since the file content is not taken into
>> account, we end
>> up creating invalid sstate-cache artifacts on the autobuilder on
>> master-next builds.
>> This created sstate-cache artifacts will also be available to master
>> branch users
>> that are using the upstream sstate-cache mirror.
>>
>> If someone is using the public mirror but still following the master
>> branch
>> they will encounter something like the following error which this change
>> aims to resolve.
>>
>> | ERROR: initramfs-rootfs-image-1.0-r0 do_create_image_sbom_spdx:
>> http://spdxdocs.org/openembedded-alias/by-doc-hash/57301e8063a8bf2530822=
6271627db2b78675cda9f648c5c6c14a2b9c18f48dc/zlib/UNIHASH/license/3_27_0/Zli=
b
>> not found in
>> /work/build/tmp/deploy/spdx/3.0.1/armv8a/by-spdxid-hash/57/57301e8063a8b=
f25308226271627db2b78675cda9f648c5c6c14a2b9c18f48dc.spdx.json
>>
>> Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
>> ---
>>  meta/classes/spdx-common.bbclass | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/classes/spdx-common.bbclass
>> b/meta/classes/spdx-common.bbclass
>> index ca0416d1c7..69ced76150 100644
>> --- a/meta/classes/spdx-common.bbclass
>> +++ b/meta/classes/spdx-common.bbclass
>> @@ -105,3 +105,4 @@ oe.spdx_common.collect_direct_deps[vardepsexclude] +=
=3D
>> "BB_TASKDEPDATA"
>>  oe.spdx_common.collect_direct_deps[vardeps] +=3D "DEPENDS"
>>  oe.spdx_common.collect_package_providers[vardepsexclude] +=3D
>> "BB_TASKDEPDATA"
>>  oe.spdx_common.get_patched_src[vardepsexclude] +=3D "STAGING_KERNEL_DIR=
"
>> +oe.spdx_common.load_spdx_license_data[file-checksums] +=3D
>> "${SPDX_LICENSES}:True"
>>
>
Unfortunately this change did not work as I expected and I sent a new V2.

Jose


> --
>> 2.51.1.dirty
>>
>>
>>
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225157):
> https://lists.openembedded.org/g/openembedded-core/message/225157
> Mute This Topic: https://lists.openembedded.org/mt/115877012/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000043d3070641bbaf06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma v=
ia <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt=
;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.=
com@lists.openembedded.org</a>&gt; escreveu (ter=C3=A7a, 21/10/2025 =C3=A0(=
s) 18:20):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div>Hi,<br><br>Please discard this patch as it is not fully fu=
nctional.</div><div>I will send a v2 after testing it a bit more.<br><br>Jo=
se</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">Jose Quaresma via <a href=3D"http://lists.openembedded.org" target=3D"_bl=
ank">lists.openembedded.org</a> &lt;quaresma.jose=3D<a href=3D"mailto:gmail=
.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded=
.org</a>&gt; escreveu (ter=C3=A7a, 21/10/2025 =C3=A0(s) 18:00):<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">If we have changes on SPDX_=
LICENSES content we ended up building invalid sstate-cache archives.<br>
The default value for the SPDX_LICENSES is the file meta/files/spdx-license=
s.json but this file<br>
don&#39;t use the bitbake fetcher and because of this their checksum is not=
 validated.<br>
So we need to add this file to the build dependency chain of the SPDX.<br>
<br>
For example, currently we have bump from 3.24.0 to 3.27.0 on master-next fo=
r the file<br>
meta/files/spdx-licenses.json. Since the file content is not taken into acc=
ount, we end<br>
up creating invalid sstate-cache artifacts on the autobuilder on master-nex=
t builds.<br>
This created sstate-cache artifacts will also be available to master branch=
 users<br>
that are using the upstream sstate-cache mirror.<br>
<br>
If someone is using the public mirror but still following the master branch=
<br>
they will encounter something like the following error which this change ai=
ms to resolve.<br>
<br>
| ERROR: initramfs-rootfs-image-1.0-r0 do_create_image_sbom_spdx: <a href=
=3D"http://spdxdocs.org/openembedded-alias/by-doc-hash/57301e8063a8bf253082=
26271627db2b78675cda9f648c5c6c14a2b9c18f48dc/zlib/UNIHASH/license/3_27_0/Zl=
ib" rel=3D"noreferrer" target=3D"_blank">http://spdxdocs.org/openembedded-a=
lias/by-doc-hash/57301e8063a8bf25308226271627db2b78675cda9f648c5c6c14a2b9c1=
8f48dc/zlib/UNIHASH/license/3_27_0/Zlib</a> not found in /work/build/tmp/de=
ploy/spdx/3.0.1/armv8a/by-spdxid-hash/57/57301e8063a8bf25308226271627db2b78=
675cda9f648c5c6c14a2b9c18f48dc.spdx.json<br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@oss.qualco=
mm.com" target=3D"_blank">jose.quaresma@oss.qualcomm.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/spdx-common.bbclass | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bb=
class<br>
index ca0416d1c7..69ced76150 100644<br>
--- a/meta/classes/spdx-common.bbclass<br>
+++ b/meta/classes/spdx-common.bbclass<br>
@@ -105,3 +105,4 @@ oe.spdx_common.collect_direct_deps[vardepsexclude] +=3D=
 &quot;BB_TASKDEPDATA&quot;<br>
=C2=A0oe.spdx_common.collect_direct_deps[vardeps] +=3D &quot;DEPENDS&quot;<=
br>
=C2=A0oe.spdx_common.collect_package_providers[vardepsexclude] +=3D &quot;B=
B_TASKDEPDATA&quot;<br>
=C2=A0oe.spdx_common.get_patched_src[vardepsexclude] +=3D &quot;STAGING_KER=
NEL_DIR&quot;<br>
+oe.spdx_common.load_spdx_license_data[file-checksums] +=3D &quot;${SPDX_LI=
CENSES}:True&quot;<br></blockquote></div></div></blockquote><div><br></div>=
<div>Unfortunately this change did not work as I expected and I sent a new =
V2.</div><div><br></div><div>Jose</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
2.51.1.dirty<br>
<br>
<br>
<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#225157): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/225157" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/225157</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115877012/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115877012/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--00000000000043d3070641bbaf06--

