Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 96F876F6CB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 03:35:03 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id ur14so5809714igb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 20:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fFoWy8cjmJMGcGsLXFdTiVi9mBebIWhSR0FbcYL0Uq8=;
	b=k8J8JLsr0WyuYbATVs1G1MFkUy+DFydxMSZ6cSxQ2GSSxu+UHpcaaQ1nN1fYA0n/+u
	yduZYT9TrKVElY7+IwqChtux8Irp3Q1dgiwulgJn78eFHYkPFhbM0BHkRDVduZM/f7aE
	Ilu8m0uOjeW9CXoVIudfy5/WI1g8JMsmP5bD4f5wjQO7m4Fl+D1/pN16UgOdyY8VjRaM
	rwULz2l2UNyvp8Et4FH2opcHM9a2Bqlyn0D/cnvQ3Tyzsgcil9CXMhSkRgGEKzzC1JJZ
	uNIKx1Lfz3LFzM/zsLR81S8+Qp9l5hzvSY7bLFdkR28K21EiWKY0IxuNLXYuuwXBPgBu
	2aHg==
MIME-Version: 1.0
X-Received: by 10.50.43.170 with SMTP id x10mr6500299igl.20.1396409704743;
	Tue, 01 Apr 2014 20:35:04 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Tue, 1 Apr 2014 20:35:04 -0700 (PDT)
In-Reply-To: <533B7788.7000301@windriver.com>
References: <1396275649-32352-1-git-send-email-kai.kang@windriver.com>
	<1396275649-32352-2-git-send-email-kai.kang@windriver.com>
	<533B7788.7000301@windriver.com>
Date: Tue, 1 Apr 2014 20:35:04 -0700
Message-ID: <CAMKF1sqdLkQii66cTnDHqvTHrNfJzAqp_5QV8znGXiDDwr03Ug@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nss: avoid to use the hardcode kernel version
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
X-List-Received-Date: Wed, 02 Apr 2014 03:35:04 -0000
Content-Type: multipart/alternative; boundary=089e01176cad698a6f04f606f877

--089e01176cad698a6f04f606f877
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, April 1, 2014, Kang Kai <Kai.Kang@windriver.com> wrote:

> On 2014=E5=B9=B403=E6=9C=8831=E6=97=A5 22:20, Kai Kang wrote:
>
>> From: Roy Li <rongqing.li@windriver.com>
>>
>> When native package is built, use the uname to return the kernel version=
.
>>
>> When target is built, read kernel version from
>> ${STAGING_KERNEL_DIR}/kernel-abiversion
>> to avoid to use the hardcode kernel version.
>>
>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-support/nss/nss.inc | 15 +++++++++++++--
>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss=
/
>> nss.inc
>> index 404decc..f24da68 100644
>> --- a/meta/recipes-support/nss/nss.inc
>> +++ b/meta/recipes-support/nss/nss.inc
>> @@ -26,6 +26,7 @@ SRC_URI_append_class-target =3D "\
>>   inherit siteinfo
>>   PR =3D "r0"
>>   DEPENDS =3D "sqlite3 nspr zlib nss-native"
>> +DEPENDS_append_class-target +=3D "virtual/kernel"
>>   DEPENDS_class-native =3D "sqlite3-native nspr-native zlib-native"
>>   RDEPENDS_${PN} =3D "perl"
>>   @@ -37,12 +38,24 @@ TARGET_CC_ARCH +=3D "${LDFLAGS}"
>>   do_compile_prepend_class-native() {
>>       export NSPR_INCLUDE_DIR=3D${STAGING_INCDIR_NATIVE}
>>       export NSPR_LIB_DIR=3D${STAGING_LIBDIR_NATIVE}
>> +    export OS_RELEASE=3D`uname -r`
>>   }
>>     do_compile_prepend_class-nativesdk() {
>>       export LDFLAGS=3D""
>>   }
>>   +do_compile_prepend_class-target() {
>> +    export OS_RELEASE=3D`cat ${STAGING_KERNEL_DIR}/kernel-abiversion|se=
d
>> 's/-.*//'`
>> +}
>> +
>> +do_install_prepend_class-native() {
>> +    export OS_RELEASE=3D`uname -r`
>> +}
>> +
>> +do_install_prepend_class-target() {
>> +    export OS_RELEASE=3D`cat ${STAGING_KERNEL_DIR}/kernel-abiversion|se=
d
>> 's/-.*//'`
>> +}
>>   do_compile() {
>>       export CROSS_COMPILE=3D1
>>       export NATIVE_CC=3D"gcc"
>> @@ -57,7 +70,6 @@ do_compile() {
>>       export NSS_USE_SYSTEM_SQLITE=3D1
>>       export NSS_ENABLE_ECC=3D1
>>   -    export OS_RELEASE=3D3.4
>>
>
> How about use var LINUXLIBCVERSION:
>
> export OS_RELEASE=3D"${@d.getVar('LINUXLIBCVERSION', True)}"
>
> it should be the same value with kernel version, right?


No, that's the kernel headers version, if the dependency is on kernel
proper then it won't be the right thing to do since many bsps use different
kernel


>
> --Kai
>
>
>        export OS_TARGET=3DLinux
>>       export OS_ARCH=3DLinux
>>   @@ -97,7 +109,6 @@ do_install() {
>>       export NSS_USE_SYSTEM_SQLITE=3D1
>>       export NSS_ENABLE_ECC=3D1
>>   -    export OS_RELEASE=3D3.4
>>       export OS_TARGET=3DLinux
>>       export OS_ARCH=3DLinux
>>
>>
>
>
> --
> Regards,
> Neil | Kai Kang
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e01176cad698a6f04f606f877
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, April 1, 2014, Kang Kai &lt;<a href=3D"mailto:Kai.Kang@=
windriver.com">Kai.Kang@windriver.com</a>&gt; wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
On 2014=E5=B9=B403=E6=9C=8831=E6=97=A5 22:20, Kai Kang wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Roy Li &lt;<a>rongqing.li@windriver.com</a>&gt;<br>
<br>
When native package is built, use the uname to return the kernel version.<b=
r>
<br>
When target is built, read kernel version from ${STAGING_KERNEL_DIR}/kernel=
-<u></u>abiversion<br>
to avoid to use the hardcode kernel version.<br>
<br>
Signed-off-by: Roy Li &lt;<a>rongqing.li@windriver.com</a>&gt;<br>
Signed-off-by: Kai Kang &lt;<a>kai.kang@windriver.com</a>&gt;<br>
---<br>
=C2=A0 meta/recipes-support/nss/nss.<u></u>inc | 15 +++++++++++++--<br>
=C2=A0 1 file changed, 13 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-support/nss/<u></u>nss.inc b/meta/recipes-support=
/nss/<u></u>nss.inc<br>
index 404decc..f24da68 100644<br>
--- a/meta/recipes-support/nss/<u></u>nss.inc<br>
+++ b/meta/recipes-support/nss/<u></u>nss.inc<br>
@@ -26,6 +26,7 @@ SRC_URI_append_class-target =3D &quot;\<br>
=C2=A0 inherit siteinfo<br>
=C2=A0 PR =3D &quot;r0&quot;<br>
=C2=A0 DEPENDS =3D &quot;sqlite3 nspr zlib nss-native&quot;<br>
+DEPENDS_append_class-target +=3D &quot;virtual/kernel&quot;<br>
=C2=A0 DEPENDS_class-native =3D &quot;sqlite3-native nspr-native zlib-nativ=
e&quot;<br>
=C2=A0 RDEPENDS_${PN} =3D &quot;perl&quot;<br>
=C2=A0 @@ -37,12 +38,24 @@ TARGET_CC_ARCH +=3D &quot;${LDFLAGS}&quot;<br>
=C2=A0 do_compile_prepend_class-<u></u>native() {<br>
=C2=A0 =C2=A0 =C2=A0 export NSPR_INCLUDE_DIR=3D${STAGING_<u></u>INCDIR_NATI=
VE}<br>
=C2=A0 =C2=A0 =C2=A0 export NSPR_LIB_DIR=3D${STAGING_LIBDIR_<u></u>NATIVE}<=
br>
+ =C2=A0 =C2=A0export OS_RELEASE=3D`uname -r`<br>
=C2=A0 }<br>
=C2=A0 =C2=A0 do_compile_prepend_class-<u></u>nativesdk() {<br>
=C2=A0 =C2=A0 =C2=A0 export LDFLAGS=3D&quot;&quot;<br>
=C2=A0 }<br>
=C2=A0 +do_compile_prepend_class-<u></u>target() {<br>
+ =C2=A0 =C2=A0export OS_RELEASE=3D`cat ${STAGING_KERNEL_DIR}/kernel-<u></u=
>abiversion|sed &#39;s/-.*//&#39;`<br>
+}<br>
+<br>
+do_install_prepend_class-<u></u>native() {<br>
+ =C2=A0 =C2=A0export OS_RELEASE=3D`uname -r`<br>
+}<br>
+<br>
+do_install_prepend_class-<u></u>target() {<br>
+ =C2=A0 =C2=A0export OS_RELEASE=3D`cat ${STAGING_KERNEL_DIR}/kernel-<u></u=
>abiversion|sed &#39;s/-.*//&#39;`<br>
+}<br>
=C2=A0 do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 export CROSS_COMPILE=3D1<br>
=C2=A0 =C2=A0 =C2=A0 export NATIVE_CC=3D&quot;gcc&quot;<br>
@@ -57,7 +70,6 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 export NSS_USE_SYSTEM_SQLITE=3D1<br>
=C2=A0 =C2=A0 =C2=A0 export NSS_ENABLE_ECC=3D1<br>
=C2=A0 - =C2=A0 =C2=A0export OS_RELEASE=3D3.4<br>
</blockquote>
<br>
How about use var LINUXLIBCVERSION:<br>
<br>
export OS_RELEASE=3D&quot;${@d.getVar(&#39;<u></u>LINUXLIBCVERSION&#39;, Tr=
ue)}&quot;<br>
<br>
it should be the same value with kernel version, right?</blockquote><div><b=
r></div><div>No, that&#39;s the kernel headers version, if the dependency i=
s on kernel proper then it won&#39;t be the right thing to do since many bs=
ps use different kernel</div>
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
--Kai<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 export OS_TARGET=3DLinux<br>
=C2=A0 =C2=A0 =C2=A0 export OS_ARCH=3DLinux<br>
=C2=A0 @@ -97,7 +109,6 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 export NSS_USE_SYSTEM_SQLITE=3D1<br>
=C2=A0 =C2=A0 =C2=A0 export NSS_ENABLE_ECC=3D1<br>
=C2=A0 - =C2=A0 =C2=A0export OS_RELEASE=3D3.4<br>
=C2=A0 =C2=A0 =C2=A0 export OS_TARGET=3DLinux<br>
=C2=A0 =C2=A0 =C2=A0 export OS_ARCH=3DLinux<br>
=C2=A0 <br>
</blockquote>
<br>
<br>
-- <br>
Regards,<br>
Neil | Kai Kang<br>
<br>
-- <br>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a>Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/<u></u>mailman/listinfo/o=
penembedded-<u></u>core</a><br>
</blockquote>

--089e01176cad698a6f04f606f877--
