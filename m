Return-Path: <n.merinov@inango-systems.com>
Received: from main-1.inango.com (main-1.inango-systems.com [5.189.174.2])
	by mail.openembedded.org (Postfix) with ESMTP id 47A3578242
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 16:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by main-1.inango.com (Postfix) with ESMTP id 0443E4C26E8;
	Fri,  6 Oct 2017 18:11:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.inango-systems.com
Received: from main-1.inango.com ([127.0.0.1])
	by localhost (main-1.inango.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F4xnwSadZ7HN; Fri,  6 Oct 2017 18:11:36 +0200 (CEST)
Received: from android-11d52582e3eff2d9.lan (97.9-157-90.telenet.ru
	[90.157.9.97])
	by main-1.inango.com (Postfix) with ESMTPSA id 559BC4C1453;
	Fri,  6 Oct 2017 18:11:36 +0200 (CEST)
Date: Fri, 06 Oct 2017 21:11:33 +0500
User-Agent: K-9 Mail for Android
In-Reply-To: <CAMKF1soz2yx3pcSXdV4Ym3geuxCUj+=Tb4RW0wJ6MTsdDDQF6w@mail.gmail.com>
References: <20171005080227.20685-1-n.merinov@inango-systems.com>
	<CAMKF1soz2yx3pcSXdV4Ym3geuxCUj+=Tb4RW0wJ6MTsdDDQF6w@mail.gmail.com>
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
From: Nikolai Merinov <n.merinov@inango-systems.com>
Message-ID: <E6158B0A-C810-4CA2-B66E-CD337A13929D@inango-systems.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cross.bbclass: Remove usage of host flags for cross-compilation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Oct 2017 16:11:39 -0000
Content-Type: multipart/alternative;
	boundary="----BCYH70O5NVL15RBJ5N2SHGHOFSXYAI"
Content-Transfer-Encoding: 7bit

------BCYH70O5NVL15RBJ5N2SHGHOFSXYAI
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

So, it will be better to keep TARGET_LDFLAGS empty by default?

6 =D0=BE=D0=BA=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2017 =D0=B3=2E 18:55:02 GMT+0=
5:00, Khem Raj <raj=2Ekhem@gmail=2Ecom> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>On Thu, Oct 5, 2017 at 1:02 AM, Nikolay Merinov
><n=2Emerinov@inango-systems=2Ecom> wrote:
>> BUILD_* flags can't be used as TARGET_* flags even for "cross"
>packages=2E
>>
>> gcc-cross buils leaks config=2Elog's through "gcc-stashed-builddir" and
>> TARGET_* flags to libgcc cross-build through "gcc/libgcc=2Emvars" file
>> on "gcc-stashed-builddir"=2E This means that if BUILD_CFLAGS contains
>> host-specific flags like "-isystem/usr/include" libgcc build will
>> fail "do_qa_configure" and "do_package_qa" checks=2E
>>
>> Remove host-related flags from TARGET_* flags for gcc-cross build=2E
>>
>> Signed-off-by: Nikolay Merinov <n=2Emerinov@inango-systems=2Ecom>
>> ---
>>  meta/classes/cross=2Ebbclass | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/classes/cross=2Ebbclass b/meta/classes/cross=2Ebbclas=
s
>> index 4887317a9a=2E=2E29d4424829 100644
>> --- a/meta/classes/cross=2Ebbclass
>> +++ b/meta/classes/cross=2Ebbclass
>> @@ -28,10 +28,10 @@ MULTIMACH_TARGET_SYS =3D
>"${BUILD_ARCH}${BUILD_VENDOR}-${BUILD_OS}"
>>  export PKG_CONFIG_DIR =3D "${exec_prefix}/lib/pkgconfig"
>>  export PKG_CONFIG_SYSROOT_DIR =3D ""
>>
>> -TARGET_CPPFLAGS =3D "${BUILD_CPPFLAGS}"
>> -TARGET_CFLAGS =3D "${BUILD_CFLAGS}"
>> -TARGET_CXXFLAGS =3D "${BUILD_CXXFLAGS}"
>> -TARGET_LDFLAGS =3D "${BUILD_LDFLAGS}"
>> +TARGET_CPPFLAGS =3D ""
>> +TARGET_CFLAGS =3D ""
>> +TARGET_CXXFLAGS =3D ""
>> +TARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
>>
>
>I think using TARGET_LINK_HASH_STYLE could create target specific
>dependency on cross packages, which might not be an issue for gcc but
>could be issue for other cross packages=2E
>
>>  CPPFLAGS =3D "${BUILD_CPPFLAGS}"
>>  CFLAGS =3D "${BUILD_CFLAGS}"
>> --
>> 2=2E14=2E2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists=2Eopenembedded=2Eorg
>> http://lists=2Eopenembedded=2Eorg/mailman/listinfo/openembedded-core

--=20
Nikolay Merinov
Team Leader, 3-rd Party Group
n=2Emerinov@inango-systems=2Ecom
T +7 343 298 0147 C +7 912 229 2564
inango=2Ecom

------BCYH70O5NVL15RBJ5N2SHGHOFSXYAI
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body>So, it will be better to keep TARGET_LDFLAGS empty=
 by default?<br><br><div class=3D"gmail_quote">6 =D0=BE=D0=BA=D1=82=D1=8F=
=D0=B1=D1=80=D1=8F 2017 =D0=B3=2E 18:55:02 GMT+05:00, Khem Raj &lt;raj=2Ekh=
em@gmail=2Ecom&gt; =D0=BF=D0=B8=D1=88=D0=B5=D1=82:<blockquote class=3D"gmai=
l_quote" style=3D"margin: 0pt 0pt 0pt 0=2E8ex; border-left: 1px solid rgb(2=
04, 204, 204); padding-left: 1ex;">
<pre class=3D"k9mail">On Thu, Oct 5, 2017 at 1:02 AM, Nikolay Merinov<br /=
>&lt;n=2Emerinov@inango-systems=2Ecom&gt; wrote:<br /><blockquote class=3D"=
gmail_quote" style=3D"margin: 0pt 0pt 1ex 0=2E8ex; border-left: 1px solid #=
729fcf; padding-left: 1ex;"> BUILD_* flags can't be used as TARGET_* flags =
even for &quot;cross&quot; packages=2E<br /><br /> gcc-cross buils leaks co=
nfig=2Elog's through &quot;gcc-stashed-builddir&quot; and<br /> TARGET_* fl=
ags to libgcc cross-build through &quot;gcc/libgcc=2Emvars&quot; file<br />=
 on &quot;gcc-stashed-builddir&quot;=2E This means that if BUILD_CFLAGS con=
tains<br /> host-specific flags like &quot;-isystem/usr/include&quot; libgc=
c build will<br /> fail &quot;do_qa_configure&quot; and &quot;do_package_qa=
&quot; checks=2E<br /><br /> Remove host-related flags from TARGET_* flags =
for gcc-cross build=2E<br /><br /> Signed-off-by: Nikolay Merinov &lt;n=2Em=
erinov@inango-systems=2Ecom&gt;<br /> ---<br />  meta/classes/cross=2Ebbcla=
ss | 8 ++++----<br />  1 file changed, 4 insertions(+), 4 deletions(-)<br /=
><br /> diff --git a/meta/classes/cross=2Ebbclass b/meta/classes/cross=2Ebb=
class<br /> index 4887317a9a=2E=2E29d4424829 100644<br /> --- a/meta/classe=
s/cross=2Ebbclass<br /> +++ b/meta/classes/cross=2Ebbclass<br /> @@ -28,10 =
+28,10 @@ MULTIMACH_TARGET_SYS =3D &quot;${BUILD_ARCH}${BUILD_VENDOR}-${BUI=
LD_OS}&quot;<br />  export PKG_CONFIG_DIR =3D &quot;${exec_prefix}/lib/pkgc=
onfig&quot;<br />  export PKG_CONFIG_SYSROOT_DIR =3D &quot;&quot;<br /><br =
/> -TARGET_CPPFLAGS =3D &quot;${BUILD_CPPFLAGS}&quot;<br /> -TARGET_CFLAGS =
=3D &quot;${BUILD_CFLAGS}&quot;<br /> -TARGET_CXXFLAGS =3D &quot;${BUILD_CX=
XFLAGS}&quot;<br /> -TARGET_LDFLAGS =3D &quot;${BUILD_LDFLAGS}&quot;<br /> =
+TARGET_CPPFLAGS =3D &quot;&quot;<br /> +TARGET_CFLAGS =3D &quot;&quot;<br =
/> +TARGET_CXXFLAGS =3D &quot;&quot;<br /> +TARGET_LDFLAGS =3D &quot;-Wl,-O=
1 ${TARGET_LINK_HASH_STYLE}&quot;</blockquote><br /><br />I think using TAR=
GET_LINK_HASH_STYLE could create target specific<br />dependency on cross p=
ackages, which might not be an issue for gcc but<br />could be issue for ot=
her cross packages=2E<br /><br /><blockquote class=3D"gmail_quote" style=3D=
"margin: 0pt 0pt 1ex 0=2E8ex; border-left: 1px solid #729fcf; padding-left:=
 1ex;">  CPPFLAGS =3D &quot;${BUILD_CPPFLAGS}&quot;<br />  CFLAGS =3D &quot=
;${BUILD_CFLAGS}&quot;<br /> --<br /> 2=2E14=2E2<br /><br /> --<br /><hr />=
<br /> Openembedded-core mailing list<br /> Openembedded-core@lists=2Eopene=
mbedded=2Eorg<br /> <a href=3D"http://lists=2Eopenembedded=2Eorg/mailman/li=
stinfo/openembedded-core">http://lists=2Eopenembedded=2Eorg/mailman/listinf=
o/openembedded-core</a><br /></blockquote></pre></blockquote></div><br>
-- <br>
Nikolay Merinov<br>
Team Leader, 3-rd Party Group<br>
n=2Emerinov@inango-systems=2Ecom<br>
T +7 343 298 0147 C +7 912 229 2564<br>
<a href=3D"http://inango=2Ecom">inango=2Ecom</a></body></html>

------BCYH70O5NVL15RBJ5N2SHGHOFSXYAI--
