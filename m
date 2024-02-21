Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A04FDC48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 14:13:07 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web10.13842.1708524781594452991
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 06:13:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=EJf7kFPZ;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 6D5399C4232;
	Wed, 21 Feb 2024 09:13:00 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 226E6OPkRPVl; Wed, 21 Feb 2024 09:12:59 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 665859C46A9;
	Wed, 21 Feb 2024 09:12:59 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 665859C46A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1708524779; bh=GhH7fzVGGIHoodXootUdkfP0b65uMrMRn74hW3vdE30=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=EJf7kFPZQj3R9fRVNkYMCPNJghdAK3DhnW20DdoiEVY6pFHG1QdMG7LWvgaAbYmLD
	 5JnASo4jl9KB8XpbvfK7ngc7FptoSH/lEkxnxoGRZ2NU4HOmvoN5RBWomWTyrxzLZv
	 TIvjNfkHL9/InVV7JFcVyr9QEFzasU9yvbMUrIJL/I9hwBd803aXInqdNKtwvmb79v
	 epPNR6RPtdRwdJ2Mm1udnVknhLkCsu4iYIcLCSL/k0KMs+R2DT3UTytL+pdFO5GMur
	 Aw53SjHKzsuGlui+ngqsO4fvP3EzyAgTJ20ghY8AiZuSB6eR1tsTrLDBSgCPHAeIsE
	 vf3dvqTu82eKw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id B5uorFqxmNda; Wed, 21 Feb 2024 09:12:59 -0500 (EST)
Received: from [192.168.216.123] (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id C09309C4232;
	Wed, 21 Feb 2024 09:12:58 -0500 (EST)
Message-ID: <ba386157-4ef6-4d83-a1a8-95aff41a92d4@savoirfairelinux.com>
Date: Wed, 21 Feb 2024 15:12:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] devtool: code: Add source mapping for debug source
 files
Content-Language: en-US
To: adrian.freihofer@gmail.com, openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com, mohammed.raza@savoirfairelinux.com
References: <20240219165525.714512-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
 <20240219165525.714512-3-enguerrand.de-ribaucourt@savoirfairelinux.com>
 <4a89e1327bf1595361c98d200f15a36daefca0a6.camel@gmail.com>
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
In-Reply-To: <4a89e1327bf1595361c98d200f15a36daefca0a6.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 14:13:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195975



On 20/02/2024 10:01, adrian.freihofer@gmail.com wrote:
> On Mon, 2024-02-19 at 17:55 +0100, Enguerrand de Ribaucourt wrote:
>> When launching the debug configuration, the source files from the
>> debug
>> rootfs were openened in the editor instead of the local workspace
>> files.
>> We add an exception to properly map them to the file being developed
>> and
>> compiled by the IDE integration. This also more closely matches what
>> the
>> user would expect compared to native development.
>>
>> This is also true for the devtool fallback mode.
>=20
> This looks still wrong to me. If files from the rootfs are openend for
> a recipe which is in the workspace, the SDK is broken and we need to
> understand and fix that. This patch does not solve that, but will make
> it much harder to find the right solution for this issue.
Hi Adrian,

This is affecting essentially the devtool fallback mode. Since it's=20
compiled through devtool, it's using the bitbake packaging information.

Steps to reproduce:
  - devtool modify powertop (autotools recipe, currently fallback)
  - devtool ide-sdk powertop [args...]
  - open the powertop sources workspace
  - run the debug launch configuration
  - initial breakpoint opens the rootfs-dbg main.cpp instead of the=20
current workspace

This probably will get fixed for autotools with your specific class=20
support, but will remain for the fallback mode.

Do we want to keep this source map, but only for the fallback mode? Like=20
you say, it's kinda "cheating" the debug information, but since we are=20
in fallback mode, the devtool packaging is supposed to be using the=20
sources from the workspace, so it's more like "hinting" at the proper=20
source.
>=20
> Adrian
>=20
>>
>> Signed-off-by: Enguerrand de Ribaucourt
>> <enguerrand.de-ribaucourt@savoirfairelinux.com>
>> ---
>>  =C2=A0scripts/lib/devtool/ide_plugins/ide_code.py | 1 +
>>  =C2=A0scripts/lib/devtool/ide_sdk.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
>>  =C2=A02 files changed, 2 insertions(+)
>>
>> diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py
>> b/scripts/lib/devtool/ide_plugins/ide_code.py
>> index b2193130d2e..c063b7d0590 100644
>> --- a/scripts/lib/devtool/ide_plugins/ide_code.py
>> +++ b/scripts/lib/devtool/ide_plugins/ide_code.py
>> @@ -234,6 +234,7 @@ class IdeVSCode(IdeBase):
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if gdb_cross_config.=
image_recipe.rootfs_dbg:
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 launch_config['additionalSOLibSearchPath'] =3D
>> modified_recipe.solib_search_path_str(
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 gdb_cross_config.image_recipe)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sr=
c_file_map[os.path.join("/usr/src/debug",
>> modified_recipe.pn, modified_recipe.pv)] =3D "${workspaceFolder}"
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 src_file_map["/usr/src/debug"] =3D os.path.join(
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 gdb_cross_config.image_recipe.rootfs_dbg, "us=
r",
>> "src", "debug")
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
>> diff --git a/scripts/lib/devtool/ide_sdk.py
>> b/scripts/lib/devtool/ide_sdk.py
>> index 14679744807..f292edbe25c 100755
>> --- a/scripts/lib/devtool/ide_sdk.py
>> +++ b/scripts/lib/devtool/ide_sdk.py
>> @@ -356,6 +356,7 @@ class RecipeModified:
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 'PACKAGE_DEBUG_SPLIT_STYLE')
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.path =3D recipe=
_d.getVar('PATH')
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.pn =3D recipe_d=
.getVar('PN')
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.pv =3D recipe_d.getVa=
r('PV')
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.recipe_sysroot =
=3D os.path.realpath(
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 recipe_d.getVar('RECIPE_SYSROOT'))
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.recipe_sysroot_=
native =3D os.path.realpath(
>=20
Enguerrand de Ribaucourt


