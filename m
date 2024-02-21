Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC75C48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 14:57:07 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.14820.1708527418578012963
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 06:56:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=O4whr1ux;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 88C249C10F6;
	Wed, 21 Feb 2024 09:56:57 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id HAHECHjH9_Nw; Wed, 21 Feb 2024 09:56:56 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 66BA99C4694;
	Wed, 21 Feb 2024 09:56:56 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 66BA99C4694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1708527416; bh=DuDdI0d8ycTfSTbykM8YP8+ki1fpkxjeJ/iJHo/dczg=;
	h=Message-ID:Date:MIME-Version:From:To;
	b=O4whr1uxCzrPhvmy0etZowWCK6vs0M61wRi7KibGsHEWr+ehwYp5tNQcKJNl8VB/a
	 6kxUjYJ1htXV2M92rpeCVKLGIFZNzMWr1+FVnRzMjNYLqskzD39NLatZPRG/v23f7B
	 +8mN82N1tJVH10gWCr3eXvRZEvitloBCdraKAT6eG7aCYt9t5a31sw0SwFhaJzlw0M
	 3jUPtxwYkxJ3odwKmLjg0/u9lqKzAe58Bh5gC7QVrHHTkMqWQrh20k1W46irJwoqiY
	 KjgpCY1lOibLn/ZnXv3RanY91wcWE1EwWCbTKJ6XmGHYqTlj1G6seZzaI5K4chiicj
	 oS+Tc/qoyHftQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id b0GKvmrmT5Qg; Wed, 21 Feb 2024 09:56:56 -0500 (EST)
Received: from [192.168.216.123] (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id CEDEC9C10F6;
	Wed, 21 Feb 2024 09:56:55 -0500 (EST)
Message-ID: <fd2771f5-f50b-4da9-a90c-204e2356085d@savoirfairelinux.com>
Date: Wed, 21 Feb 2024 15:56:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] devtool: code: Add source mapping for debug source
 files
Content-Language: en-US
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
To: adrian.freihofer@gmail.com, openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com, mohammed.raza@savoirfairelinux.com
References: <20240219165525.714512-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
 <20240219165525.714512-3-enguerrand.de-ribaucourt@savoirfairelinux.com>
 <4a89e1327bf1595361c98d200f15a36daefca0a6.camel@gmail.com>
 <ba386157-4ef6-4d83-a1a8-95aff41a92d4@savoirfairelinux.com>
In-Reply-To: <ba386157-4ef6-4d83-a1a8-95aff41a92d4@savoirfairelinux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 14:57:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195978



On 21/02/2024 15:12, Enguerrand de Ribaucourt wrote:
>=20
>=20
> On 20/02/2024 10:01, adrian.freihofer@gmail.com wrote:
>> On Mon, 2024-02-19 at 17:55 +0100, Enguerrand de Ribaucourt wrote:
>>> When launching the debug configuration, the source files from the
>>> debug
>>> rootfs were openened in the editor instead of the local workspace
>>> files.
>>> We add an exception to properly map them to the file being developed
>>> and
>>> compiled by the IDE integration. This also more closely matches what
>>> the
>>> user would expect compared to native development.
>>>
>>> This is also true for the devtool fallback mode.
>>
>> This looks still wrong to me. If files from the rootfs are openend for
>> a recipe which is in the workspace, the SDK is broken and we need to
>> understand and fix that. This patch does not solve that, but will make
>> it much harder to find the right solution for this issue.
> Hi Adrian,
>=20
> This is affecting essentially the devtool fallback mode. Since it's=20
> compiled through devtool, it's using the bitbake packaging information.
>=20
> Steps to reproduce:
>  =C2=A0- devtool modify powertop (autotools recipe, currently fallback)
>  =C2=A0- devtool ide-sdk powertop [args...]
>  =C2=A0- open the powertop sources workspace
>  =C2=A0- run the debug launch configuration
>  =C2=A0- initial breakpoint opens the rootfs-dbg main.cpp instead of th=
e=20
> current workspace
>=20
> This probably will get fixed for autotools with your specific class=20
> support, but will remain for the fallback mode.
>=20
> Do we want to keep this source map, but only for the fallback mode? Lik=
e=20
> you say, it's kinda "cheating" the debug information, but since we are=20
> in fallback mode, the devtool packaging is supposed to be using the=20
> sources from the workspace, so it's more like "hinting" at the proper=20
> source.
It also affects more meson projects like lighttpd. The "hint" would=20
still be valid given how it's built and deployed now. If you are still=20
working on an alternative tinfoil deploy method, maybe it's not affected.
>>
>> Adrian
>>
>>>
>>> Signed-off-by: Enguerrand de Ribaucourt
>>> <enguerrand.de-ribaucourt@savoirfairelinux.com>
>>> ---
>>> =C2=A0=C2=A0scripts/lib/devtool/ide_plugins/ide_code.py | 1 +
>>> =C2=A0=C2=A0scripts/lib/devtool/ide_sdk.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
>>> =C2=A0=C2=A02 files changed, 2 insertions(+)
>>>
>>> diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py
>>> b/scripts/lib/devtool/ide_plugins/ide_code.py
>>> index b2193130d2e..c063b7d0590 100644
>>> --- a/scripts/lib/devtool/ide_plugins/ide_code.py
>>> +++ b/scripts/lib/devtool/ide_plugins/ide_code.py
>>> @@ -234,6 +234,7 @@ class IdeVSCode(IdeBase):
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if gdb_cross_c=
onfig.image_recipe.rootfs_dbg:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 launch_config['additionalSOLibSearchPath'] =3D
>>> modified_recipe.solib_search_path_str(
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gdb_cross_config.image_recipe)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
rc_file_map[os.path.join("/usr/src/debug",
>>> modified_recipe.pn, modified_recipe.pv)] =3D "${workspaceFolder}"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 src_file_map["/usr/src/debug"] =3D os.path.join(
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gdb_cross_config.image_recipe.rootfs_db=
g, "usr",
>>> "src", "debug")
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
>>> diff --git a/scripts/lib/devtool/ide_sdk.py
>>> b/scripts/lib/devtool/ide_sdk.py
>>> index 14679744807..f292edbe25c 100755
>>> --- a/scripts/lib/devtool/ide_sdk.py
>>> +++ b/scripts/lib/devtool/ide_sdk.py
>>> @@ -356,6 +356,7 @@ class RecipeModified:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 'PACKAGE_DEBUG_SPLIT_STYLE')
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.path =3D =
recipe_d.getVar('PATH')
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.pn =3D re=
cipe_d.getVar('PN')
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.pv =3D recipe_d.getV=
ar('PV')
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.recipe_sy=
sroot =3D os.path.realpath(
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 recipe_d.getVar('RECIPE_SYSROOT'))
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.recipe_sy=
sroot_native =3D os.path.realpath(
>>
> Enguerrand de Ribaucourt
>=20
Enguerrand de Ribaucourt

