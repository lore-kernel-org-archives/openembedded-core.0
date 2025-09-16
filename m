Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192E7CAC592
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 03:51:11 +0000 (UTC)
Subject: Re: [PATCH v2 2/8] distro/include: Add debug_build.inc when DEBUG_BUILD is enabled
To: openembedded-core@lists.openembedded.org
From: "hongxu" <hongxu.jia@eng.windriver.com>
X-Originating-Location: US (128.224.246.2)
X-Originating-Platform: Linux Chrome 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 15 Sep 2025 20:51:05 -0700
References: <DB5PR02MB102139D0B56D4D14DDAC711ECEF14A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB102139D0B56D4D14DDAC711ECEF14A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Message-ID: <20091.1757994665184735903@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="RfhdeKYSbmdzRIQGQlUc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 03:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223514

--RfhdeKYSbmdzRIQGQlUc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 05:25 PM, Peter Kjellerstedt wrote:

>=20
>=20
>> -----Original Message-----
>> From: openembedded-core@... <openembedded-core@...> On Behalf Of hongxu
>> via
>> lists.openembedded.org
>> Sent: den 15 september 2025 08:17
>> To: openembedded-core@...
>> Cc: randy.macleod@...; Peter Kjellerstedt <peter.kjellerstedt@...>
>> Subject: [OE-core] [PATCH v2 2/8] distro/include: Add debug_build.inc wh=
en
>> DEBUG_BUILD is enabled
>>=20
>> Add a new include file debug_build.inc to override SELECTED_OPTIMIZATION
>> and BUILD_OPTIMIZATION when DEBUG_BUILD is enabled
>>=20
>> Add separate variables FULL_OPTLEVEL, DEBUG_OPTLEVEL and BUILD_OPTLEVEL
>> for the optimization level, and override it for specific recipe other
>> than original remove and append DEBUG_OPTIMIZATION and BUILD_OPTIMIZATIO=
N
>>=20
>> Update the documentation for FULL_OPTIMIZATION and DEBUG_OPTIMIZATION
>>=20
>> Require the include file when DEBUG_BUILD is enabled
>>=20
>> Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@...>
>> Signed-off-by: Hongxu Jia <hongxu.jia@...>
>> ---
>> meta/conf/bitbake.conf | 15 +++++++++------
>> meta/conf/distro/include/debug_build.inc | 8 ++++++++
>> meta/conf/documentation.conf | 8 +++++---
>> 3 files changed, 22 insertions(+), 9 deletions(-)
>> create mode 100644 meta/conf/distro/include/debug_build.inc
>>=20
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 8e90c7bbc85..91dc51cd61d 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -658,13 +658,14 @@ DEBUG_PREFIX_MAP ?=3D "\
>> "
>> DEBUG_LEVELFLAG ?=3D "-g"
>>=20
>> -FULL_OPTIMIZATION =3D "-O2 ${DEBUG_LEVELFLAG}"
>> -DEBUG_OPTIMIZATION =3D "-Og ${DEBUG_LEVELFLAG}"
>> -SELECTED_OPTIMIZATION =3D "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD',
>> 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
>> -SELECTED_OPTIMIZATION[vardeps] +=3D "FULL_OPTIMIZATION DEBUG_OPTIMIZATI=
ON
>> DEBUG_BUILD"
>> +FULL_OPTLEVEL ?=3D "-O2"
>> +FULL_OPTIMIZATION =3D "${FULL_OPTLEVEL} ${DEBUG_LEVELFLAG}"
>> +SELECTED_OPTIMIZATION =3D "${FULL_OPTIMIZATION}"
>> +SELECTED_OPTIMIZATION[vardeps] +=3D "FULL_OPTIMIZATION DEBUG_LEVELFLAG
>> FULL_OPTLEVEL"
>=20
> The vardeps is no longer needed.

Copy

>=20
>=20
>> # compiler flags for native/nativesdk
>> -BUILD_OPTIMIZATION =3D "${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g', '-=
O2',
>> d)}"
>> -BUILD_OPTIMIZATION[vardeps] +=3D "DEBUG_BUILD"
>> +BUILD_OPTLEVEL ?=3D "-O2"
>> +BUILD_OPTIMIZATION =3D "${BUILD_OPTLEVEL}"
>> +BUILD_OPTIMIZATION[vardeps] +=3D "BUILD_OPTLEVEL"
>=20
> The vardeps is no longer needed.

Copy

>=20
>=20
>> ##################################################################
>> # Reproducibility
>> @@ -831,6 +832,8 @@ include conf/licenses.conf
>> require conf/sanity.conf
>> include conf/bblock.conf
>>=20
>> +require ${@oe.utils.vartrue('DEBUG_BUILD',
>> 'conf/distro/include/debug_build.inc', '', d)}
>> +
>> ##################################################################
>> # Weak variables (usually to retain backwards compatibility)
>> ##################################################################
>> diff --git a/meta/conf/distro/include/debug_build.inc
>> b/meta/conf/distro/include/debug_build.inc
>> new file mode 100644
>> index 00000000000..af947a80e8b
>> --- /dev/null
>> +++ b/meta/conf/distro/include/debug_build.inc
>> @@ -0,0 +1,8 @@
>> +# Override SELECTED_OPTIMIZATION and BUILD_OPTIMIZATION when DEBUG_BUIL=
D
>> is enabled.
>> +DEBUG_OPTLEVEL ?=3D "-Og"
>> +DEBUG_OPTIMIZATION =3D "${DEBUG_OPTLEVEL} ${DEBUG_LEVELFLAG}"
>> +SELECTED_OPTIMIZATION =3D "${DEBUG_OPTIMIZATION}"
>> +SELECTED_OPTIMIZATION[vardeps] +=3D "DEBUG_OPTIMIZATION DEBUG_OPTLEVEL"
>=20
> The vardeps is no longer needed.

Copy

>=20
>=20
>> +# compiler flags for native/nativesdk
>> +BUILD_OPTLEVEL =3D "-Og"
>> +BUILD_OPTIMIZATION =3D "${BUILD_OPTLEVEL} -g"
>> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
>> index 741130a3921..824c4fb3801 100644
>> --- a/meta/conf/documentation.conf
>> +++ b/meta/conf/documentation.conf
>> @@ -129,8 +129,9 @@ CVE_CHECK_LAYER_INCLUDELIST[doc] =3D "Defines which
>> layers to include during cve-c
>> D[doc] =3D "The destination directory."
>> DATE[doc] =3D "The date the build was started using YMD format."
>> DATETIME[doc] =3D "The date and time the build was started."
>> -DEBUG_BUILD[doc] =3D "Specifies to build packages with debugging
>> information. This influences the value of the SELECTED_OPTIMIZATION
>> variable."
>> -DEBUG_OPTIMIZATION[doc] =3D "The options to pass in TARGET_CFLAGS and
>> CFLAGS when compiling a system for debugging. This variable defaults to
>> '-Og ${DEBUG_LEVELFLAG}'."
>> +DEBUG_BUILD[doc] =3D "Specifies to build packages with debugging
>> information. This influences the value of the SELECTED_OPTIMIZATION
>> variable and add include file conf/distro/include/debug_build.inc"
>=20
> Change "add include file" to "includes".

Copy

V3 incoming

//Hongxu

>=20
>=20
>=20
>> +DEBUG_OPTLEVEL[doc] =3D "The toolchain optimization level flags for
>> debugging. This variable defaults to '-Og'"
>> +DEBUG_OPTIMIZATION[doc] =3D "The options to pass in TARGET_CFLAGS and
>> CFLAGS when compiling a system for debugging. This variable defaults to
>> '${DEBUG_OPTLEVEL} ${DEBUG_LEVELFLAG}'."
>> DEFAULT_PREFERENCE[doc] =3D "Specifies a weak bias for recipe selection
>> priority."
>> DEPENDS[doc] =3D "Lists a recipe's build-time dependencies (i.e. other
>> recipe files)."
>> DEPLOY_DIR[doc] =3D "Points to the general area that the OpenEmbedded bu=
ild
>> system uses to place images, packages, SDKs and other output files that
>> are ready to be used outside of the build system."
>> @@ -178,7 +179,8 @@ FILESPATH[doc] =3D "The default set of directories t=
he
>> OpenEmbedded build system u
>> FILESYSTEM_PERMS_TABLES[doc] =3D "Allows you to define your own file
>> permissions settings table as part of your configuration for the packagi=
ng
>> process."
>> FONT_EXTRA_RDEPENDS[doc] =3D "When a recipe inherits the fontcache class=
,
>> this variable specifies runtime dependencies for font packages. This
>> variable defaults to 'fontconfig-utils'."
>> FONT_PACKAGES[doc] =3D "When a recipe inherits the fontcache class, this
>> variable identifies packages containing font files that need to be cache=
d
>> by Fontconfig."
>> -FULL_OPTIMIZATION[doc] =3D "The options to pass in TARGET_CFLAGS and CF=
LAGS
>> when compiling an optimized system. This variable defaults to '-O2
>> ${DEBUG_LEVELFLAG}'."
>> +FULL_OPTLEVEL[doc] =3D "The toolchain optimization level flags. This
>> variable defaults to '-O2'"
>> +FULL_OPTIMIZATION[doc] =3D "The options to pass in TARGET_CFLAGS and CF=
LAGS
>> when compiling an optimized system. This variable defaults to
>> '${FULL_OPTLEVEL} ${DEBUG_LEVELFLAG}'."
>>=20
>> #G
>>=20
>> --
>> 2.34.1
>=20
>

--RfhdeKYSbmdzRIQGQlUc
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Mon, Sep 15, 2025 at 05:25 PM, Peter Kjellerstedt wrote:</div>
<div>
<blockquote>
<blockquote>-----Original Message-----<br />From: openembedded-core@... &lt=
;openembedded-core@...&gt; On Behalf Of hongxu via<br />lists.openembedded.=
org<br />Sent: den 15 september 2025 08:17<br />To: openembedded-core@...<b=
r />Cc: randy.macleod@...; Peter Kjellerstedt &lt;peter.kjellerstedt@...&gt=
;<br />Subject: [OE-core] [PATCH v2 2/8] distro/include: Add debug_build.in=
c when DEBUG_BUILD is enabled<br /><br />Add a new include file debug_build=
.inc to override SELECTED_OPTIMIZATION<br />and BUILD_OPTIMIZATION when DEB=
UG_BUILD is enabled<br /><br />Add separate variables FULL_OPTLEVEL, DEBUG_=
OPTLEVEL and BUILD_OPTLEVEL<br />for the optimization level, and override i=
t for specific recipe other<br />than original remove and append DEBUG_OPTI=
MIZATION and BUILD_OPTIMIZATION<br /><br />Update the documentation for FUL=
L_OPTIMIZATION and DEBUG_OPTIMIZATION<br /><br />Require the include file w=
hen DEBUG_BUILD is enabled<br /><br />Suggested-by: Peter Kjellerstedt &lt;=
peter.kjellerstedt@...&gt;<br />Signed-off-by: Hongxu Jia &lt;hongxu.jia@..=
.&gt;<br />---<br />meta/conf/bitbake.conf | 15 +++++++++------<br />meta/c=
onf/distro/include/debug_build.inc | 8 ++++++++<br />meta/conf/documentatio=
n.conf | 8 +++++---<br />3 files changed, 22 insertions(+), 9 deletions(-)<=
br />create mode 100644 meta/conf/distro/include/debug_build.inc<br /><br /=
>diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br />index 8e=
90c7bbc85..91dc51cd61d 100644<br />--- a/meta/conf/bitbake.conf<br />+++ b/=
meta/conf/bitbake.conf<br />@@ -658,13 +658,14 @@ DEBUG_PREFIX_MAP ?=3D "\<=
br />"<br />DEBUG_LEVELFLAG ?=3D "-g"<br /><br />-FULL_OPTIMIZATION =3D "-O=
2 ${DEBUG_LEVELFLAG}"<br />-DEBUG_OPTIMIZATION =3D "-Og ${DEBUG_LEVELFLAG}"=
<br />-SELECTED_OPTIMIZATION =3D "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD=
', 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}" -SELECTED_OPTIMIZATION[=
vardeps] +=3D "FULL_OPTIMIZATION DEBUG_OPTIMIZATION DEBUG_BUILD"<br />+FULL=
_OPTLEVEL ?=3D "-O2"<br />+FULL_OPTIMIZATION =3D "${FULL_OPTLEVEL} ${DEBUG_=
LEVELFLAG}"<br />+SELECTED_OPTIMIZATION =3D "${FULL_OPTIMIZATION}"<br />+SE=
LECTED_OPTIMIZATION[vardeps] +=3D "FULL_OPTIMIZATION DEBUG_LEVELFLAG FULL_O=
PTLEVEL"</blockquote>
The vardeps is no longer needed.</blockquote>
Copy<br />
<blockquote>
<blockquote># compiler flags for native/nativesdk<br />-BUILD_OPTIMIZATION =
=3D "${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g', '-O2', d)}"<br />-BUILD_O=
PTIMIZATION[vardeps] +=3D "DEBUG_BUILD"<br />+BUILD_OPTLEVEL ?=3D "-O2"<br =
/>+BUILD_OPTIMIZATION =3D "${BUILD_OPTLEVEL}"<br />+BUILD_OPTIMIZATION[vard=
eps] +=3D "BUILD_OPTLEVEL"</blockquote>
The vardeps is no longer needed.</blockquote>
Copy<br />
<blockquote>
<blockquote>###############################################################=
###<br /># Reproducibility<br />@@ -831,6 +832,8 @@ include conf/licenses.c=
onf<br />require conf/sanity.conf<br />include conf/bblock.conf<br /><br />=
+require ${@oe.utils.vartrue('DEBUG_BUILD', 'conf/distro/include/debug_buil=
d.inc', '', d)}<br />+<br />###############################################=
###################<br /># Weak variables (usually to retain backwards comp=
atibility)<br />###########################################################=
#######<br />diff --git a/meta/conf/distro/include/debug_build.inc b/meta/c=
onf/distro/include/debug_build.inc<br />new file mode 100644<br />index 000=
00000000..af947a80e8b<br />--- /dev/null<br />+++ b/meta/conf/distro/includ=
e/debug_build.inc<br />@@ -0,0 +1,8 @@<br />+# Override SELECTED_OPTIMIZATI=
ON and BUILD_OPTIMIZATION when DEBUG_BUILD is enabled.<br />+DEBUG_OPTLEVEL=
 ?=3D "-Og"<br />+DEBUG_OPTIMIZATION =3D "${DEBUG_OPTLEVEL} ${DEBUG_LEVELFL=
AG}"<br />+SELECTED_OPTIMIZATION =3D "${DEBUG_OPTIMIZATION}"<br />+SELECTED=
_OPTIMIZATION[vardeps] +=3D "DEBUG_OPTIMIZATION DEBUG_OPTLEVEL"</blockquote=
>
The vardeps is no longer needed.</blockquote>
Copy<br />
<blockquote>
<blockquote>+# compiler flags for native/nativesdk<br />+BUILD_OPTLEVEL =3D=
 "-Og"<br />+BUILD_OPTIMIZATION =3D "${BUILD_OPTLEVEL} -g"<br />diff --git =
a/meta/conf/documentation.conf b/meta/conf/documentation.conf<br />index 74=
1130a3921..824c4fb3801 100644<br />--- a/meta/conf/documentation.conf<br />=
+++ b/meta/conf/documentation.conf<br />@@ -129,8 +129,9 @@ CVE_CHECK_LAYER=
_INCLUDELIST[doc] =3D "Defines which layers to include during cve-c<br />D[=
doc] =3D "The destination directory."<br />DATE[doc] =3D "The date the buil=
d was started using YMD format."<br />DATETIME[doc] =3D "The date and time =
the build was started."<br />-DEBUG_BUILD[doc] =3D "Specifies to build pack=
ages with debugging information. This influences the value of the SELECTED_=
OPTIMIZATION variable."<br />-DEBUG_OPTIMIZATION[doc] =3D "The options to p=
ass in TARGET_CFLAGS and CFLAGS when compiling a system for debugging. This=
 variable defaults to '-Og ${DEBUG_LEVELFLAG}'."<br />+DEBUG_BUILD[doc] =3D=
 "Specifies to build packages with debugging information. This influences t=
he value of the SELECTED_OPTIMIZATION variable and add include file conf/di=
stro/include/debug_build.inc"</blockquote>
Change "add include file" to "includes".</blockquote>
Copy</div>
<div>&nbsp;</div>
<div>V3 incoming</div>
<div>&nbsp;</div>
<div>//Hongxu<br />
<blockquote><br />
<blockquote>+DEBUG_OPTLEVEL[doc] =3D "The toolchain optimization level flag=
s for debugging. This variable defaults to '-Og'"<br />+DEBUG_OPTIMIZATION[=
doc] =3D "The options to pass in TARGET_CFLAGS and CFLAGS when compiling a =
system for debugging. This variable defaults to '${DEBUG_OPTLEVEL} ${DEBUG_=
LEVELFLAG}'."<br />DEFAULT_PREFERENCE[doc] =3D "Specifies a weak bias for r=
ecipe selection priority."<br />DEPENDS[doc] =3D "Lists a recipe's build-ti=
me dependencies (i.e. other recipe files)."<br />DEPLOY_DIR[doc] =3D "Point=
s to the general area that the OpenEmbedded build system uses to place imag=
es, packages, SDKs and other output files that are ready to be used outside=
 of the build system."<br />@@ -178,7 +179,8 @@ FILESPATH[doc] =3D "The def=
ault set of directories the OpenEmbedded build system u<br />FILESYSTEM_PER=
MS_TABLES[doc] =3D "Allows you to define your own file permissions settings=
 table as part of your configuration for the packaging process."<br />FONT_=
EXTRA_RDEPENDS[doc] =3D "When a recipe inherits the fontcache class, this v=
ariable specifies runtime dependencies for font packages. This variable def=
aults to 'fontconfig-utils'."<br />FONT_PACKAGES[doc] =3D "When a recipe in=
herits the fontcache class, this variable identifies packages containing fo=
nt files that need to be cached by Fontconfig."<br />-FULL_OPTIMIZATION[doc=
] =3D "The options to pass in TARGET_CFLAGS and CFLAGS when compiling an op=
timized system. This variable defaults to '-O2 ${DEBUG_LEVELFLAG}'."<br />+=
FULL_OPTLEVEL[doc] =3D "The toolchain optimization level flags. This variab=
le defaults to '-O2'"<br />+FULL_OPTIMIZATION[doc] =3D "The options to pass=
 in TARGET_CFLAGS and CFLAGS when compiling an optimized system. This varia=
ble defaults to '${FULL_OPTLEVEL} ${DEBUG_LEVELFLAG}'."<br /><br />#G<br />=
<br />--<br />2.34.1</blockquote>
</blockquote>
</div>

--RfhdeKYSbmdzRIQGQlUc--

