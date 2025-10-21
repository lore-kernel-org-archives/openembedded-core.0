Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73385CCD184
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 17:20:06 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.18819.1761067201447652988
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 10:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P5TTzQk4;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so1113264166b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 10:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761067200; x=1761672000; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VzpI5BMt2K2T9incoiniUoFohOc/DiSTsINMe2n3hkE=;
        b=P5TTzQk4li+Ih/w742t0DFIVMaoZ7mWFEvr5gw1g62uMLlGBQ2jNU7h5CT+3IPalEI
         QQidJIQcwJVbY2AJM060+rfDSeHXpyEPyQ3FQO2q1y0024N8ufzngHIE6IH/HyCMntGV
         dkNgbTYETYtccBOdXMKPpAU7SnB0ODehoD1+UApai/EyfbVRXkmUrDmMY1xZ11kTFLf8
         JMz6YNXEa+Bb54ukhppkFTwuwICwg899sq9fjeSt2rNqzqLCPpF9qyWJaisUtKScHnPi
         WIYMmRF0nVbW2xss9hUlr1Q2IczwZKQcXy41fxO9DekH2SypbGKpphnyAtx6YYaDKawK
         M17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761067200; x=1761672000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzpI5BMt2K2T9incoiniUoFohOc/DiSTsINMe2n3hkE=;
        b=eh9yBC/U7VbijXJ4R0YZi8sW059LwjBJl11H/hbvI2q4gEDa94fq0nNliJ7SUMRFth
         LLwUzvp806Lktm6MKXJOcxCySPvxNMpxhQi4OyrTwzeLiqkVKDSbgKy+Z9VAlC8ZpuaL
         blhf7gbRSkadKlvpZxvulhuZeoxaHMD7jPKSVKpKmDPK+jgyGb8nomn1gHAxvQ73d+Tp
         tEaFCPm6TVpi6VGypw/PdA0TniZMSD97sZlz9POQyl5GaM+Csl2Rijozn9u5dKS1H3AQ
         mTixyljKvdvVEtkOO6bH+9VRiHZ2TmFkjjvhvzRNL1sJ0QpCD8V3NOH4ArgmfwR3i+rR
         4/zQ==
X-Gm-Message-State: AOJu0YwNp+8matEt29vsdhEjjXpKJ3wyxhHfKPtVMRnsx08NwzpgCtB8
	WfhYkEvf6Wtbi2P4P/POYaVEHKSo82C40xORcLgWcB1xpZSq6ufNGNsS+WphJlJJfFR30Sc2Q93
	RtDRPNVFq4989hiiX3wG4gXw1cb1Wmfo=
X-Gm-Gg: ASbGncubSSXHxa0SPetjHILgC2CBVKIxPJ/N7VSmLApmYQKnc2+8MtXbVR8kUfDpdZ2
	zQKvtwLzOxjCMRqDejUX4sDa551Z9Sn6R5uNF0K+Qf10CSMhwKMlXUxk6RPRzV8jXIM8QuGA4jX
	tGev5hJ4S1UYhUkVcZO5J/fEVNyd7kDI1vELMd7S13Xj8mi+00rNdmG20C4KyMbQjWwe56JlDkD
	3U69kuO53MzkHgn6mbTA9cHOCznf6vd4C7m3JhJ0k8lwc7VQ21Iq4527ScPX805D2ONPNWf
X-Google-Smtp-Source: AGHT+IGxNhY2s8xoPPaWfipXBNE0Gl7DklOe7wPTcbe0Xs79kROaNwCAxEiNG3vuZn+zX5o/8TfuU92qYtqiGIv5pb8=
X-Received: by 2002:a17:907:3ccb:b0:aff:fe6:78f0 with SMTP id
 a640c23a62f3a-b64764e4b6bmr2187724566b.54.1761067199646; Tue, 21 Oct 2025
 10:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <1870903CFB689BF6.21259@lists.openembedded.org>
In-Reply-To: <1870903CFB689BF6.21259@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 21 Oct 2025 18:19:48 +0100
X-Gm-Features: AS18NWB58kZ2UUXHeilukbucxK2m6VQZJ0MhCEvGkZakc4hfhUGxWcc1Ztyc9zY
Message-ID: <CANPvuRkyia3sBZjbyzF4hsHD_GXStcVip9GriA_-9utPpKYAbQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] spdx-common: load_spdx_license_data depends on
 the SPDX_LICENSES content
To: quaresma.jose@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="000000000000dc4f5c0641ae68f7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 17:20:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225157

--000000000000dc4f5c0641ae68f7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Please discard this patch as it is not fully functional.
I will send a v2 after testing it a bit more.

Jose

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu (ter=C3=A7a, 21/10/2025 =C3=A0(s=
) 18:00):

> If we have changes on SPDX_LICENSES content we ended up building invalid
> sstate-cache archives.
> The default value for the SPDX_LICENSES is the file
> meta/files/spdx-licenses.json but this file
> don't use the bitbake fetcher and because of this their checksum is not
> validated.
> So we need to add this file to the build dependency chain of the SPDX.
>
> For example, currently we have bump from 3.24.0 to 3.27.0 on master-next
> for the file
> meta/files/spdx-licenses.json. Since the file content is not taken into
> account, we end
> up creating invalid sstate-cache artifacts on the autobuilder on
> master-next builds.
> This created sstate-cache artifacts will also be available to master
> branch users
> that are using the upstream sstate-cache mirror.
>
> If someone is using the public mirror but still following the master bran=
ch
> they will encounter something like the following error which this change
> aims to resolve.
>
> | ERROR: initramfs-rootfs-image-1.0-r0 do_create_image_sbom_spdx:
> http://spdxdocs.org/openembedded-alias/by-doc-hash/57301e8063a8bf25308226=
271627db2b78675cda9f648c5c6c14a2b9c18f48dc/zlib/UNIHASH/license/3_27_0/Zlib
> not found in
> /work/build/tmp/deploy/spdx/3.0.1/armv8a/by-spdxid-hash/57/57301e8063a8bf=
25308226271627db2b78675cda9f648c5c6c14a2b9c18f48dc.spdx.json
>
> Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
> ---
>  meta/classes/spdx-common.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/spdx-common.bbclass
> b/meta/classes/spdx-common.bbclass
> index ca0416d1c7..69ced76150 100644
> --- a/meta/classes/spdx-common.bbclass
> +++ b/meta/classes/spdx-common.bbclass
> @@ -105,3 +105,4 @@ oe.spdx_common.collect_direct_deps[vardepsexclude] +=
=3D
> "BB_TASKDEPDATA"
>  oe.spdx_common.collect_direct_deps[vardeps] +=3D "DEPENDS"
>  oe.spdx_common.collect_package_providers[vardepsexclude] +=3D
> "BB_TASKDEPDATA"
>  oe.spdx_common.get_patched_src[vardepsexclude] +=3D "STAGING_KERNEL_DIR"
> +oe.spdx_common.load_spdx_license_data[file-checksums] +=3D
> "${SPDX_LICENSES}:True"
> --
> 2.51.1.dirty
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225154):
> https://lists.openembedded.org/g/openembedded-core/message/225154
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

--000000000000dc4f5c0641ae68f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br><br>Please discard this patch as it is not ful=
ly functional.</div><div>I will send a v2 after testing it a bit more.<br><=
br>Jose</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">Jose Quaresma via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;quaresma.jose=3D<a href=3D"ma=
ilto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>=
&gt; escreveu (ter=C3=A7a, 21/10/2025 =C3=A0(s) 18:00):<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">If we have changes on SPDX_LICENSES=
 content we ended up building invalid sstate-cache archives.<br>
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
CENSES}:True&quot;<br>
-- <br>
2.51.1.dirty<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#225154): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/225154" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/225154</a><br>
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

--000000000000dc4f5c0641ae68f7--

