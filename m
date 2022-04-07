Return-Path: <bernhard.rosenkraenzer.ext@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DEA9C38162
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:15 +0000 (UTC)
Subject: Re: [PATCH] gcc: upgrade 11.2 -> current 12 snapshot
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?QmVybmhhcmQgUm9zZW5rcsOkbnplcg==?=
 <bernhard.rosenkraenzer.ext@huawei.com>
X-Originating-Location: =?utf-8?q?Ostfildern=2C_Baden-W=C3=BCrttemberg=2C_DE?=
 =?utf-8?q?_=2846=2E142=2E91=2E197=29?=
X-Originating-Platform: Linux Chrome 100
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 07 Apr 2022 06:29:14 -0700
References: 
 <ab842b2db53d29b11298382f7c94b8ef903ea1f1.camel@linuxfoundation.org>
In-Reply-To: 
 <ab842b2db53d29b11298382f7c94b8ef903ea1f1.camel@linuxfoundation.org>
Message-ID: <23864.1649338154287208609@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="D1SMSqlADn49ts3Hj2rv"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164108

--D1SMSqlADn49ts3Hj2rv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 7, 2022 at 02:32 PM, Richard Purdie wrote:

>=20
> On Thu, 2022-04-07 at 14:26 +0200, Bernhard Rosenkr=C3=A4nzer via
> lists.openembedded.org wrote:
>=20
>> rename from meta/recipes-devtools/gcc/gcc-cross-canadian_11.2.bb
>> rename to meta/recipes-devtools/gcc/gcc-cross-canadian_12.0.bb
>> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc
>> b/meta/recipes-devtools/gcc/gcc-cross.inc
>> index 3ffa1f0c46..0e8119384b 100644
>> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
>> @@ -47,6 +47,15 @@ ARCH_FLAGS_FOR_TARGET +=3D
>> "-isystem${STAGING_DIR_TARGET}${target_includedir}"
>> do_configure:prepend () {
>> install -d ${RECIPE_SYSROOT}${target_includedir}
>> touch ${RECIPE_SYSROOT}${target_includedir}/limits.h
>> +
>> + if ! echo ${@d.getVar("TARGET_OS")} | grep -qi linux; then
>> + # Building Zephyr with DWARF-5 is problematic because
>> + # its kernel tests use pyelftools, which has incomplete
>> + # DWARF-5 support (even after applying preliminary
>> + # support patches). Use DWARF-4 on Zephyr and FreeRTOS
>> + # for the time being.
>> + sed -i -e 's,Var(dwarf_version) Init(5),Var(dwarf_version) Init(4),'
>> ${S}/gcc/common.opt
>> + fi
>> }
>>=20
>> do_compile () {
>=20
> Unfortunately you can't do that. The gcc-cross is shared amongst all
> targets on
> a given architecture. This will "kind of work" in that other sstate code
> will
> clean it up and rebuild gcc but it isn't as designed and can't merge like
> that
> I'm afraid.

True, didn't think of that. I've backed out this part and sent a new patch.=
 Will address the zephyr problem with an added -gdwarf-4 flag in zephyr con=
figs.

ttyl
bero

--D1SMSqlADn49ts3Hj2rv
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 7, 2022 at 02:32 PM, Richard Purdie wrote:<br />
<blockquote>On Thu, 2022-04-07 at 14:26 +0200, Bernhard Rosenkr&auml;nzer v=
ia<br />lists.openembedded.org wrote:<br />
<blockquote>rename from meta/recipes-devtools/gcc/gcc-cross-canadian_11.2.b=
b<br />rename to meta/recipes-devtools/gcc/gcc-cross-canadian_12.0.bb<br />=
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtool=
s/gcc/gcc-cross.inc<br />index 3ffa1f0c46..0e8119384b 100644<br />--- a/met=
a/recipes-devtools/gcc/gcc-cross.inc<br />+++ b/meta/recipes-devtools/gcc/g=
cc-cross.inc<br />@@ -47,6 +47,15 @@ ARCH_FLAGS_FOR_TARGET +=3D "-isystem${=
STAGING_DIR_TARGET}${target_includedir}"<br />do_configure:prepend () {<br =
/>install -d ${RECIPE_SYSROOT}${target_includedir}<br />touch ${RECIPE_SYSR=
OOT}${target_includedir}/limits.h<br />+<br />+ if ! echo ${@d.getVar("TARG=
ET_OS")} | grep -qi linux; then<br />+ # Building Zephyr with DWARF-5 is pr=
oblematic because<br />+ # its kernel tests use pyelftools, which has incom=
plete<br />+ # DWARF-5 support (even after applying preliminary<br />+ # su=
pport patches). Use DWARF-4 on Zephyr and FreeRTOS<br />+ # for the time be=
ing.<br />+ sed -i -e 's,Var(dwarf_version) Init(5),Var(dwarf_version) Init=
(4),' ${S}/gcc/common.opt<br />+ fi<br />}<br /><br />do_compile () {</bloc=
kquote>
Unfortunately you can't do that. The gcc-cross is shared amongst all target=
s on<br />a given architecture. This will "kind of work" in that other ssta=
te code will<br />clean it up and rebuild gcc but it isn't as designed and =
can't merge like that<br />I'm afraid.</blockquote>
True, didn't think of that. I've backed out this part and sent a new patch.=
 Will address the zephyr problem with an added -gdwarf-4 flag in zephyr con=
figs.<br /><br />ttyl<br />bero

--D1SMSqlADn49ts3Hj2rv--

