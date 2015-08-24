Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 69BCE6AC1E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 07:43:59 +0000 (UTC)
Received: by widdq5 with SMTP id dq5so63574701wid.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 00:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=v0HExs9Ga4oJqlDcx5RaVLc+ZTMUeycuoWnVVo2MGyQ=;
	b=V5Zav6+XUCtQWwrzIyUmT71OqPPnCtFDpV4Y3yjCXpgZMrdUfUwOXTl+YhxFs+XMli
	2slwiRRfBwzWgWVoqDgmxCRP5axd3k0HUdUW6v+YIFs1RJj+e2qqWMgsBRlWqGrIdLny
	pP8ziTVvtmYUp1TWwXrNDNMH8qDhfpvpgE4Ql14RFAinEa+WOn1fq1p0DSIr15haAj2J
	ZwuwspLgB7vWdddikfUa/7x4b+DQSq1x1tv7bKkbG8AdJ0SvTMUqKpBh/D7i9/39rknN
	w+Sv6lD9h8hXl/y7pUPoagJjFbUEaDXXAhVXLnKTSGl+JwEoS/8UsM13sTw27luwKw8n
	MpLQ==
MIME-Version: 1.0
X-Received: by 10.180.223.100 with SMTP id qt4mr18121361wic.34.1440402239755; 
	Mon, 24 Aug 2015 00:43:59 -0700 (PDT)
Received: by 10.28.64.196 with HTTP; Mon, 24 Aug 2015 00:43:59 -0700 (PDT)
In-Reply-To: <55DA9151.5040103@windriver.com>
References: <1439906147-14749-1-git-send-email-Martin.Jansa@gmail.com>
	<55DA9151.5040103@windriver.com>
Date: Mon, 24 Aug 2015 09:43:59 +0200
Message-ID: <CA+chaQf+W3v3jm=RagbhwF9-nq5+Tjzo5qmA6PJ6V7TWGpp4dA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc-package: use ${PN} in INSANE_SKIP
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
X-List-Received-Date: Mon, 24 Aug 2015 07:44:01 -0000
Content-Type: multipart/alternative; boundary=001a11361bded59d75051e09c711

--001a11361bded59d75051e09c711
Content-Type: text/plain; charset=UTF-8

Thanks Robert!

On Mon, Aug 24, 2015 at 5:36 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

>
>
> On 08/18/2015 09:55 PM, Martin Jansa wrote:
>
>> * INSANE_SKIP_${PN}_append_aarch64 is causing following warning in some
>>    setups:
>>    WARNING: Variable key INSANE_SKIP_${PN} () replaces original key
>> INSANE_SKIP_glibc ().
>> * in worst case this will be applied also for glibc-initial package
>>    which is using the same glibc-package.inc, but glibc-initial doesn't
>>    create any packages so we should be fine
>> * someone building for aarch64 should confirm verify that this
>>    INSANE_SKIP is still needed and cannot be fixed properly it was
>>
>
> Hi Martin,
>
> I verified that we still need the patch, otherwise warnings:
>
> MACHINE ?= "qemuarm64"
> require conf/multilib.conf
> MULTILIBS = "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 = "armv7a"
>
> $ bitbake glibc -ccleansstate && bitbake glibc
> WARNING: QA Issue: glibc: found library in wrong location:
> /lib/ld-linux-aarch64.so.1 [libdir]
>
> // Robert
>
>
>    introduced in:
>>      commit aeb6f53dd607ceb0d2265a05c27f751109c73752
>>      Author: Mark Hatle <mark.hatle@windriver.com>
>>      Date:   Thu Dec 18 16:51:13 2014 +0800
>>
>>      glibc-package: aarch64 enable symlink for ABI compliance
>>
>>      aarch64 requires the ld.so to be present in /lib, even if the rest
>>      of the libraries are installed into an alternative directory.
>>
>>      See: https://sourceware.org/glibc/wiki/ABIList
>>
>>      Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>   meta/recipes-core/glibc/glibc-package.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/glibc/glibc-package.inc
>> b/meta/recipes-core/glibc/glibc-package.inc
>> index def0e0c..c72a49e 100644
>> --- a/meta/recipes-core/glibc/glibc-package.inc
>> +++ b/meta/recipes-core/glibc/glibc-package.inc
>> @@ -35,7 +35,7 @@ RPROVIDES_${PN}-pcprofile = "eglibc-pcprofile"
>>   RPROVIDES_${PN}-dbg = "eglibc-dbg"
>>   libc_baselibs = "${base_libdir}/libcrypt*.so.*
>> ${base_libdir}/libcrypt-*.so ${base_libdir}/libc.so.*
>> ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so
>> ${base_libdir}/libmvec-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so
>> ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so
>> ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so
>> ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so
>> ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so
>> ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so
>> ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so
>> ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so
>> ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so
>> ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so
>> ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so
>> ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
>>   libc_baselibs_append_aarch64 = " /lib/ld-linux-aarch64*.so.1"
>> -INSANE_SKIP_glibc_append_aarch64 = " libdir"
>> +INSANE_SKIP_${PN}_append_aarch64 = " libdir"
>>
>>   FILES_${PN} = "${libc_baselibs} ${libexecdir}/*
>> ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig
>> ${sysconfdir}/ld.so.conf', '', d)}"
>>   FILES_ldd = "${bindir}/ldd"
>>
>>

--001a11361bded59d75051e09c711
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Robert!</div><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote">On Mon, Aug 24, 2015 at 5:36 AM, Robert Yang <span dir=
=3D"ltr">&lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank"=
>liezhi.yang@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><span class=3D""><br>
<br>
On 08/18/2015 09:55 PM, Martin Jansa wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
* INSANE_SKIP_${PN}_append_aarch64 is causing following warning in some<br>
=C2=A0 =C2=A0setups:<br>
=C2=A0 =C2=A0WARNING: Variable key INSANE_SKIP_${PN} () replaces original k=
ey INSANE_SKIP_glibc ().<br>
* in worst case this will be applied also for glibc-initial package<br>
=C2=A0 =C2=A0which is using the same glibc-package.inc, but glibc-initial d=
oesn&#39;t<br>
=C2=A0 =C2=A0create any packages so we should be fine<br>
* someone building for aarch64 should confirm verify that this<br>
=C2=A0 =C2=A0INSANE_SKIP is still needed and cannot be fixed properly it wa=
s<br>
</blockquote>
<br></span>
Hi Martin,<br>
<br>
I verified that we still need the patch, otherwise warnings:<br>
<br>
MACHINE ?=3D &quot;qemuarm64&quot;<br>
require conf/multilib.conf<br>
MULTILIBS =3D &quot;multilib:lib32&quot;<br>
DEFAULTTUNE_virtclass-multilib-lib32 =3D &quot;armv7a&quot;<br>
<br>
$ bitbake glibc -ccleansstate &amp;&amp; bitbake glibc<br>
WARNING: QA Issue: glibc: found library in wrong location: /lib/ld-linux-aa=
rch64.so.1 [libdir]<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
// Robert</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0introduced in:<br>
=C2=A0 =C2=A0 =C2=A0commit aeb6f53dd607ceb0d2265a05c27f751109c73752<br>
=C2=A0 =C2=A0 =C2=A0Author: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@win=
driver.com" target=3D"_blank">mark.hatle@windriver.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0Date:=C2=A0 =C2=A0Thu Dec 18 16:51:13 2014 +0800<br>
<br>
=C2=A0 =C2=A0 =C2=A0glibc-package: aarch64 enable symlink for ABI complianc=
e<br>
<br>
=C2=A0 =C2=A0 =C2=A0aarch64 requires the ld.so to be present in /lib, even =
if the rest<br>
=C2=A0 =C2=A0 =C2=A0of the libraries are installed into an alternative dire=
ctory.<br>
<br>
=C2=A0 =C2=A0 =C2=A0See: <a href=3D"https://sourceware.org/glibc/wiki/ABILi=
st" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/glibc/wiki/=
ABIList</a><br>
<br>
=C2=A0 =C2=A0 =C2=A0Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.ha=
tle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:ric=
hard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoun=
dation.org</a>&gt;<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0 meta/recipes-core/glibc/glibc-package.inc | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/=
glibc/glibc-package.inc<br>
index def0e0c..c72a49e 100644<br>
--- a/meta/recipes-core/glibc/glibc-package.inc<br>
+++ b/meta/recipes-core/glibc/glibc-package.inc<br>
@@ -35,7 +35,7 @@ RPROVIDES_${PN}-pcprofile =3D &quot;eglibc-pcprofile&quot=
;<br>
=C2=A0 RPROVIDES_${PN}-dbg =3D &quot;eglibc-dbg&quot;<br>
=C2=A0 libc_baselibs =3D &quot;${base_libdir}/libcrypt*.so.* ${base_libdir}=
/libcrypt-*.so ${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_lib=
dir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/libmvec-*.so ${base=
_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${=
base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/=
libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_=
libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so=
.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libd=
ir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/lib=
nss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*=
.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/lib=
anl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* $=
{base_libdir}/libBrokenLocale-*.so&quot;<br>
=C2=A0 libc_baselibs_append_aarch64 =3D &quot; /lib/ld-linux-aarch64*.so.1&=
quot;<br>
-INSANE_SKIP_glibc_append_aarch64 =3D &quot; libdir&quot;<br>
+INSANE_SKIP_${PN}_append_aarch64 =3D &quot; libdir&quot;<br>
<br>
=C2=A0 FILES_${PN} =3D &quot;${libc_baselibs} ${libexecdir}/* ${@base_condi=
tional(&#39;USE_LDCONFIG&#39;, &#39;1&#39;, &#39;${base_sbindir}/ldconfig $=
{sysconfdir}/ld.so.conf&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0 FILES_ldd =3D &quot;${bindir}/ldd&quot;<br>
<br>
</blockquote>
</div></div></blockquote></div><br></div>

--001a11361bded59d75051e09c711--
