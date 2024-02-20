Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA58C48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 09:27:44 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.9742.1708421261860988008
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 01:27:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=XPxSY6Di;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 8EC449C08DE;
	Tue, 20 Feb 2024 04:27:40 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id MH9G-nFtcr3m; Tue, 20 Feb 2024 04:27:38 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A53499C162B;
	Tue, 20 Feb 2024 04:27:38 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com A53499C162B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1708421258; bh=r61fq2oA8Sm1Cje5SlQCn/vkimcr4J09UwOwa+wAEy8=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=XPxSY6DibVuZ/a3m/LLowG3c2MbOskzbU5q0HzYJCZXGExnL6GtLzlEO8SogKpaSk
	 UyQO9F5j7TYdNk2bqjJQeMtRMxQumP0OQbmEiStmfhg72JzUXXJjRwjmc2JCdc01PU
	 /VeX4lZU4p3qPWfwag1Co6hpDXqF2aXK8k8gWjA+qImOl1dISuXqLEb7ZyA9698yBz
	 Sg95VtECaCvXTdMJgyp6WuVCwKcs5NZpfVoEuOeXxGvjtYZMAHbBAvJLe2qm2+1Roq
	 7JU15b+QNos5T5+JPBdwfY8NHiqk1fB5HS+Q8bLECHrkyVJTC5x3c4qIAIT0dEmEN2
	 NKZ63KaPLixyQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id v9cw0sp_Jqge; Tue, 20 Feb 2024 04:27:38 -0500 (EST)
Received: from [192.168.216.123] (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 394B19C08DE;
	Tue, 20 Feb 2024 04:27:38 -0500 (EST)
Message-ID: <050cee25-f4f0-49d0-a203-3dc861c51b94@savoirfairelinux.com>
Date: Tue, 20 Feb 2024 10:27:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] devtool: code: Provide a generic C++ configuration
Content-Language: en-US
To: adrian.freihofer@gmail.com, openembedded-core@lists.openembedded.org
References: <20240219165525.714512-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
 <20240219165525.714512-6-enguerrand.de-ribaucourt@savoirfairelinux.com>
 <0c41985baaadd58d4550bb03ccbba88ad2f410d2.camel@gmail.com>
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
In-Reply-To: <0c41985baaadd58d4550bb03ccbba88ad2f410d2.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 09:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195910

Hi Adrian,

Thanks for your review.

Yes it doesn't makes a lot of sense to keep this patch compared to the=20
specific support you are working on. It was especially useful for=20
recipes using plain oe_runmake or CC/CXX outside of a class. But we=20
can't distinguish these recipes from others classes like python/bash=20
that would not make use of this C++ configuration.

I'll drop this patch and try to figure out if I can also fix the=20
debugging configuration without a source map (PATH v2 3/5). It would=20
rather indicate that the wrong binary is being deployed for some workspac=
es.

On 20/02/2024 10:20, adrian.freihofer@gmail.com wrote:
> Hi Enguerrand
>=20
> I would really like to stay on the path with tests. This patch changes
> code which is covered by tests without tests. Lets develop the
> autotools support as a separate patch series.
>=20
> There are three parts needed:
> - Extend the cpp-example with autotools support (already on my branch)
> - What your patch does
> - Extend the oe-selftest suite to cover also the autotools support.
>=20
> On Mon, 2024-02-19 at 17:55 +0100, Enguerrand de Ribaucourt wrote:
>> By default, the cpptools VSCode extension will use the host's headers
>> and flags for linting. This results in a lot of include errors and
>> misleading definitions. Even though this generic configuration
>> doesn't
>> include all the depenendencies, it is a proper fallback for recipe
>> classes we do not accurately cover, with at least the right sysroot.
>>
>> Additionally, ide-sdk automatically detects and provides a
>> launch.json
>> configuration for autotools recipes so we should recommend the C++
>> extensions for them.
>>
>> Recipes which use C/C++ without a build system are not covered by
>> this
>> patch.
>>
>> Signed-off-by: Enguerrand de Ribaucourt
>> <enguerrand.de-ribaucourt@savoirfairelinux.com>
>> ---
>>  =C2=A0scripts/lib/devtool/ide_plugins/__init__.py |=C2=A0 3 +++
>>  =C2=A0scripts/lib/devtool/ide_plugins/ide_code.py | 27 +++++++++++++-=
-----
>> --
>>  =C2=A0scripts/lib/devtool/ide_sdk.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++++
>>  =C2=A03 files changed, 25 insertions(+), 10 deletions(-)
>>
>> diff --git a/scripts/lib/devtool/ide_plugins/__init__.py
>> b/scripts/lib/devtool/ide_plugins/__init__.py
>> index 3371b242640..59e90663908 100644
>> --- a/scripts/lib/devtool/ide_plugins/__init__.py
>> +++ b/scripts/lib/devtool/ide_plugins/__init__.py
>> @@ -21,6 +21,7 @@ class BuildTool(Enum):
>>  =C2=A0=C2=A0=C2=A0=C2=A0 UNDEFINED =3D auto()
>>  =C2=A0=C2=A0=C2=A0=C2=A0 CMAKE =3D auto()
>>  =C2=A0=C2=A0=C2=A0=C2=A0 MESON =3D auto()
>> +=C2=A0=C2=A0=C2=A0 AUTOTOOLS =3D auto()
>>  =20
>>  =C2=A0=C2=A0=C2=A0=C2=A0 @property
>>  =C2=A0=C2=A0=C2=A0=C2=A0 def is_c_ccp(self):
>> @@ -28,6 +29,8 @@ class BuildTool(Enum):
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return True
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if self is BuildTool=
.MESON:
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return True
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if self is BuildTool.AUTOT=
OOLS:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn True
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return False
>>  =20
>>  =20
>> diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py
>> b/scripts/lib/devtool/ide_plugins/ide_code.py
>> index 7b683c74086..0942fde8196 100644
>> --- a/scripts/lib/devtool/ide_plugins/ide_code.py
>> +++ b/scripts/lib/devtool/ide_plugins/ide_code.py
>> @@ -157,31 +157,35 @@ class IdeVSCode(IdeBase):
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IdeBase.update_json_=
file(
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 self.dot_code_dir(modified_recipe), settings_file,
>> settings_dict)
>>  =20
>> -=C2=A0=C2=A0=C2=A0 def __vscode_extensions_cmake(self, modified_recip=
e,
>> recommendations):
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if modified_recipe.build_t=
ool is not BuildTool.CMAKE:
>> +=C2=A0=C2=A0=C2=A0 def __vscode_extensions_generic(self, modified_rec=
ipe,
>> recommendations):
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not modified_recipe.bui=
ld_tool.is_c_ccp:
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 recommendations +=3D=
 [
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "t=
wxs.cmake",
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "m=
s-vscode.cmake-tools",
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "ms-vscode.cpptools",
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "ms-vscode.cpptools-extension-pack",
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "ms-vscode.cpptools-themes"
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ]
>>  =20
>> +=C2=A0=C2=A0=C2=A0 def __vscode_extensions_cmake(self, modified_recip=
e,
>> recommendations):
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if modified_recipe.build_t=
ool is not BuildTool.CMAKE:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 recommendations +=3D [
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "t=
wxs.cmake",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "m=
s-vscode.cmake-tools"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ]
>> +
>>  =C2=A0=C2=A0=C2=A0=C2=A0 def __vscode_extensions_meson(self, modified=
_recipe,
>> recommendations):
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if modified_recipe.b=
uild_tool is not BuildTool.MESON:
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 recommendations +=3D=
 [
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'm=
esonbuild.mesonbuild',
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "m=
s-vscode.cpptools",
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "m=
s-vscode.cpptools-extension-pack",
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "m=
s-vscode.cpptools-themes"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'm=
esonbuild.mesonbuild'
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ]
>>  =20
>>  =C2=A0=C2=A0=C2=A0=C2=A0 def vscode_extensions(self, modified_recipe)=
:
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 recommendations =3D =
[]
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.__vscode_extens=
ions_cmake(modified_recipe,
>> recommendations)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.__vscode_extens=
ions_meson(modified_recipe,
>> recommendations)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.__vscode_extensions_g=
eneric(modified_recipe,
>> recommendations)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 extensions_file =3D =
'extensions.json'
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IdeBase.update_json_=
file(
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 self.dot_code_dir(modified_recipe), extensions_file,
>> {"recommendations": recommendations})
>> @@ -194,8 +198,11 @@ class IdeVSCode(IdeBase):
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 properties_dict["configurationProvider"] =3D "ms-
>> vscode.cmake-tools"
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif modified_recipe=
.build_tool is BuildTool.MESON:
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 properties_dict["configurationProvider"] =3D
>> "mesonbuild.mesonbuild"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:=C2=A0 # no C/C++ bui=
ld
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn
>=20
> else return is still required.
>=20
> Adrian
>=20
>=20
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif modified_recipe.build=
_tool.is_c_ccp:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # =
Provide a generic linting configuration
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # =
We provide a C++ configuration with the proper sysroot
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr=
operties_dict["compilerPath"] =3D
>> os.path.join(modified_recipe.staging_bindir_toolchain,
>> modified_recipe.cxx.split()[0])
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr=
operties_dict["compilerArgs"] =3D
>> modified_recipe.cxx.split()[1:]
>>  =20
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties_dicts =3D=
 {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "configurations": [
>> diff --git a/scripts/lib/devtool/ide_sdk.py
>> b/scripts/lib/devtool/ide_sdk.py
>> index f292edbe25c..6313daa8700 100755
>> --- a/scripts/lib/devtool/ide_sdk.py
>> +++ b/scripts/lib/devtool/ide_sdk.py
>> @@ -345,6 +345,7 @@ class RecipeModified:
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.base_libdir =3D=
 recipe_d.getVar('base_libdir')
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.bblayers =3D re=
cipe_d.getVar('BBLAYERS').split()
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.bpn =3D recipe_=
d.getVar('BPN')
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.cxx =3D recipe_d.getV=
ar('CXX')
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.d =3D recipe_d.=
getVar('D')
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.fakerootcmd =3D=
 recipe_d.getVar('FAKEROOTCMD')
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.fakerootenv =3D=
 recipe_d.getVar('FAKEROOTENV')
>> @@ -361,6 +362,8 @@ class RecipeModified:
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 recipe_d.getVar('RECIPE_SYSROOT'))
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.recipe_sysroot_=
native =3D os.path.realpath(
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 recipe_d.getVar('RECIPE_SYSROOT_NATIVE'))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.staging_bindir_toolch=
ain =3D os.path.realpath(
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
cipe_d.getVar('STAGING_BINDIR_TOOLCHAIN'))
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.staging_incdir =
=3D os.path.realpath(
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 recipe_d.getVar('STAGING_INCDIR'))
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.strip_cmd =3D r=
ecipe_d.getVar('STRIP')
>> @@ -380,6 +383,8 @@ class RecipeModified:
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 self.extra_oemeson =3D recipe_d.getVar('EXTRA_OEMESON')
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 self.meson_cross_file =3D
>> recipe_d.getVar('MESON_CROSS_FILE')
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 self.build_tool =3D BuildTool.MESON
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif bb.data.inherits_clas=
s('autotools', recipe_d):
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 se=
lf.build_tool =3D BuildTool.AUTOTOOLS
>>  =20
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Recipe ID is the i=
dentifier for IDE config sections
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.recipe_id =3D s=
elf.bpn + "-" + self.package_arch
>=20

--=20
Savoir-faire Linux
Enguerrand de Ribaucourt
Consultant en logiciel libre / Ing=C3=A9nieur syst=C3=A8mes embarqu=C3=A9=
s | Rennes, Fr
Bureau
(+33) 9 72 46 89 80 (606#)
Site web <https://www.savoirfairelinux.com/>=C2=A0|=C2=A0Blog
<https://blog.savoirfairelinux.com/fr-ca/>=C2=A0|=C2=A0Jami <https://jami=
.net/>

Messages de confidentialit=C3=A9 :=C2=A0Ce courriel (de m=C3=AAme que les=
 fichiers
joints) est strictement r=C3=A9serv=C3=A9 =C3=A0 l'usage de la personne o=
u de l'entit=C3=A9
=C3=A0 qui il est adress=C3=A9 et peut contenir de l'information privil=C3=
=A9gi=C3=A9e et
confidentielle. Toute divulgation, distribution ou copie de ce courriel
est strictement prohib=C3=A9e. Si vous avez re=C3=A7u ce courriel par err=
eur,
veuillez nous en aviser sur-le-champ, d=C3=A9truire toutes les copies et =
le
supprimer de votre syst=C3=A8me informatique.


