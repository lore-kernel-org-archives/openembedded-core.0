Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C5AC48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 15:51:48 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.16022.1708617102286280253
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 07:51:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=FaZNtAGf;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 4F4B89C4609;
	Thu, 22 Feb 2024 10:51:41 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id JXSjEJLhP0DP; Thu, 22 Feb 2024 10:51:40 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 0203A9C46A9;
	Thu, 22 Feb 2024 10:51:40 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 0203A9C46A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1708617100; bh=WZtj9RdlEVeqJzUyUUGpXJ6XsoKDxGG18YUun+1+WyU=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=FaZNtAGfAnm77JsvATpfcgSeNkYLj/FAFlNT3QhNF6fA4aTgozQRGgpl4jtQaHWn9
	 M6ViwK0/EsNYEq0yh+fzyVxA7CWSjFW7ryy0KuGghXpZsSE7UCJLuJAl4ZkNoP4w9j
	 bmpaMZzSzGHvrv4szPam7f9V2mnW+wxD6B0eSiUCSynGoukKsPMbhmR3U4HgSOE/qR
	 qeyLvCyzcZStEbOGwGiPQsU6gtFHSK2oHB+uHRuivcds2EGgaGHHxYaonKfwQu1Yay
	 QEqSvaQ/+vyDMBbRJ03i0ONo0X+RsfMwQcrbSkL/Mdye+VKYYdUi8g6xGs6FecimP4
	 7ihaq1W/X2JIg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id j7yweVGVW4ng; Thu, 22 Feb 2024 10:51:39 -0500 (EST)
Received: from [192.168.216.123] (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 9BA709C4609;
	Thu, 22 Feb 2024 10:51:39 -0500 (EST)
Message-ID: <63b2d3cf-e269-48df-b9b0-a2c6e154dfff@savoirfairelinux.com>
Date: Thu, 22 Feb 2024 16:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] devtool: code: Add source mapping for debug source
 files
Content-Language: en-US
To: adrian.freihofer@gmail.com, openembedded-core@lists.openembedded.org
References: <20240219165525.714512-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
 <20240219165525.714512-3-enguerrand.de-ribaucourt@savoirfairelinux.com>
 <4a89e1327bf1595361c98d200f15a36daefca0a6.camel@gmail.com>
 <ba386157-4ef6-4d83-a1a8-95aff41a92d4@savoirfairelinux.com>
 <fd2771f5-f50b-4da9-a90c-204e2356085d@savoirfairelinux.com>
 <0eb9dfcfce7449a97b68e17d29c2e671b4dbc06d.camel@gmail.com>
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
In-Reply-To: <0eb9dfcfce7449a97b68e17d29c2e671b4dbc06d.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 15:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196037



On 22/02/2024 14:00, adrian.freihofer@gmail.com wrote:
> On Wed, 2024-02-21 at 15:56 +0100, Enguerrand de Ribaucourt wrote:
>>
>>
>> On 21/02/2024 15:12, Enguerrand de Ribaucourt wrote:
>>>
>>>
>>> On 20/02/2024 10:01, adrian.freihofer@gmail.com=C2=A0wrote:
>>>> On Mon, 2024-02-19 at 17:55 +0100, Enguerrand de Ribaucourt
>>>> wrote:
>>>>> When launching the debug configuration, the source files from
>>>>> the
>>>>> debug
>>>>> rootfs were openened in the editor instead of the local
>>>>> workspace
>>>>> files.
>>>>> We add an exception to properly map them to the file being
>>>>> developed
>>>>> and
>>>>> compiled by the IDE integration. This also more closely matches
>>>>> what
>>>>> the
>>>>> user would expect compared to native development.
>>>>>
>>>>> This is also true for the devtool fallback mode.
>>>>
>>>> This looks still wrong to me. If files from the rootfs are
>>>> openend for
>>>> a recipe which is in the workspace, the SDK is broken and we need
>>>> to
>>>> understand and fix that. This patch does not solve that, but will
>>>> make
>>>> it much harder to find the right solution for this issue.
>>> Hi Adrian,
>>>
>>> This is affecting essentially the devtool fallback mode. Since it's
>>> compiled through devtool, it's using the bitbake packaging
>>> information.
>>>
>>> Steps to reproduce:
>>>  =C2=A0=C2=A0- devtool modify powertop (autotools recipe, currently f=
allback)
>>>  =C2=A0=C2=A0- devtool ide-sdk powertop [args...]
>>>  =C2=A0=C2=A0- open the powertop sources workspace
>>>  =C2=A0=C2=A0- run the debug launch configuration
>>>  =C2=A0=C2=A0- initial breakpoint opens the rootfs-dbg main.cpp inste=
ad of the
>>> current workspace
>>>
>>> This probably will get fixed for autotools with your specific class
>>> support, but will remain for the fallback mode.
>>>
>>> Do we want to keep this source map, but only for the fallback mode?
>>> Like
>>> you say, it's kinda "cheating" the debug information, but since we
>>> are
>>> in fallback mode, the devtool packaging is supposed to be using the
>>> sources from the workspace, so it's more like "hinting" at the
>>> proper
>>> source.
>> It also affects more meson projects like lighttpd. The "hint" would
>> still be valid given how it's built and deployed now. If you are
>> still
>> working on an alternative tinfoil deploy method, maybe it's not
>> affected.
>=20
> It looks like the devtool deploy-target step is missing. If you debug
> packaged files this would behave like this. It's important to over
> write the packaged files with the not packaged file from the image
> folder. This is what the devtool deploy-target command does. It's
> expected that this just happens, probably there is a bug in the
> dependencies. Could you please try to run it explicit? Something like
> this:
>=20
> - devtool modify powertop (autotools recipe, currently fallback)
> - devtool ide-sdk powertop [args...]
>=20
> - devtool build powertop
> - devtool deploy-target powertop
>=20
> - open the powertop sources workspace
> - run the debug launch configuration
>=20
> I guess this would work as expected. The question is then: Why is the
> deploy not executed?
The deploy-target is actually executed automatically through the launch=20
configuration. I also get the same result if I deploy manually. I=20
believe that the problem is rather how "devtool build" compiles and=20
packages the binary.
>=20
> Adrian
>=20
>=20
>>>>
>>>> Adrian
>>>>
>>>>>
>>>>> Signed-off-by: Enguerrand de Ribaucourt
>>>>> <enguerrand.de-ribaucourt@savoirfairelinux.com>
>>>>> ---
>>>>>  =C2=A0=C2=A0scripts/lib/devtool/ide_plugins/ide_code.py | 1 +
>>>>>  =C2=A0=C2=A0scripts/lib/devtool/ide_sdk.py=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
>>>>>  =C2=A0=C2=A02 files changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py
>>>>> b/scripts/lib/devtool/ide_plugins/ide_code.py
>>>>> index b2193130d2e..c063b7d0590 100644
>>>>> --- a/scripts/lib/devtool/ide_plugins/ide_code.py
>>>>> +++ b/scripts/lib/devtool/ide_plugins/ide_code.py
>>>>> @@ -234,6 +234,7 @@ class IdeVSCode(IdeBase):
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if gdb_cros=
s_config.image_recipe.rootfs_dbg:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 launch_config['additionalSOLibSearchPath'] =3D
>>>>> modified_recipe.solib_search_path_str(
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gdb_cross_config.image_recipe)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 src_file_map[os.path.join("/usr/src/debug",
>>>>> modified_recipe.pn, modified_recipe.pv)] =3D "${workspaceFolder}"
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 src_file_map["/usr/src/debug"] =3D os.path.join(
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gdb_cross_config.image_recipe.rootfs=
_dbg,
>>>>> "usr",
>>>>> "src", "debug")
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
>>>>> diff --git a/scripts/lib/devtool/ide_sdk.py
>>>>> b/scripts/lib/devtool/ide_sdk.py
>>>>> index 14679744807..f292edbe25c 100755
>>>>> --- a/scripts/lib/devtool/ide_sdk.py
>>>>> +++ b/scripts/lib/devtool/ide_sdk.py
>>>>> @@ -356,6 +356,7 @@ class RecipeModified:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 'PACKAGE_DEBUG_SPLIT_STYLE')
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.path =3D=
 recipe_d.getVar('PATH')
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.pn =3D=
 recipe_d.getVar('PN')
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.pv =3D recipe_d.ge=
tVar('PV')
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.recipe=
_sysroot =3D os.path.realpath(
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 recipe_d.getVar('RECIPE_SYSROOT'))
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.recipe=
_sysroot_native =3D os.path.realpath(
>>>>
>>> Enguerrand de Ribaucourt
>>>
>> Enguerrand de Ribaucourt
>=20

Enguerrand de Ribaucourt

