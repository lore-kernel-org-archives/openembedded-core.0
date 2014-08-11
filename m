Return-Path: <sujith.h@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id C688470B8F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 10:16:38 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id q108so8351417qgd.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 03:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=sdufN27DEW2+GTLnO9RrEUQTWFZJ28VkhtAnF0mJvlA=;
	b=0SHS+RWpFZL15HOikC24k0lQRBehpaT1zWMQXHza4KkeDg8JJVlF/O9OnXw0OkBSTG
	KJ/42nuRKi18m93LrjILknm+Sx38Halbgxle2fmYqOxHRKCi0uekSnGn1aIA7xjhzgkR
	mTocMmtbCU0EpnCht9yPRqb5nfqOJW5qRFrI0v42/WEEir8KVK2BqDRLlzrq8Ioce1hd
	4EyTpgatqICijtsA/5OVNAopG/73/0dULZ0vcGoTb2U2xKj8KMbtKzHLgHpvEPJkAn9Z
	WVMqRrsy18jEXPCy25lRTI+KTodZkpqJY9xsyrELerrA9j+cfrU2z0hvOImcwUkOci7U
	VvmQ==
X-Received: by 10.140.19.105 with SMTP id 96mr9858089qgg.34.1407752199650;
	Mon, 11 Aug 2014 03:16:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.148 with HTTP; Mon, 11 Aug 2014 03:16:19 -0700 (PDT)
In-Reply-To: <53E512D6.2070103@linux.intel.com>
References: <1407490645-15678-1-git-send-email-sujith.h@gmail.com>
	<53E512D6.2070103@linux.intel.com>
From: sujith h <sujith.h@gmail.com>
Date: Mon, 11 Aug 2014 15:46:19 +0530
Message-ID: <CADyYWLn35BuBN7N=qbyMMS934SiOBeKhWoxDmErPPU8UfdT3oA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] opkg-utils: allow disabling update-alternatives
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
X-List-Received-Date: Mon, 11 Aug 2014 10:16:43 -0000
Content-Type: multipart/alternative; boundary=001a11355c32cac774050057d9a0

--001a11355c32cac774050057d9a0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 8, 2014 at 11:41 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 08/08/2014 02:37 AM, Sujith H wrote:
>
>> From: Sujith H <Sujith_Haridasan@mentor.com>
>>
>> This is needed to deal with the situation where we're using ipk
>> packaging, so
>> opkg-utils must be built regardless of what update-alternatives provider
>> we
>> prefer. The downside to the current implementation is the need to adjust
>> PACKAGECONFIG as well as PREFERRED_PROVIDER, but it is more explicit tha=
t
>> way.
>>
>> Signed-off-by: Christopher Larson <kergoth@gmail.com>
>> Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
>> ---
>>   meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>> b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>> index 693c216..287bf53 100644
>> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>> @@ -19,11 +19,15 @@ TARGET_CC_ARCH +=3D "${LDFLAGS}"
>>   PYTHONRDEPS =3D "python python-shell python-io python-math python-cryp=
t
>> python-logging python-fcntl python-subprocess python-pickle
>> python-compression python-textutils python-stringold"
>>   PYTHONRDEPS_class-native =3D ""
>>
>> -PACKAGECONFIG =3D "python"
>> +PACKAGECONFIG =3D "python update-alternatives"
>>   PACKAGECONFIG[python] =3D ",,,${PYTHONRDEPS}"
>> +PACKAGECONFIG[update-alternatives] =3D ",,,"
>>
>>   do_install() {
>>         oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D} install
>> +        if ${@'true' if 'update-alternatives' not in
>> PACKAGECONFIG.split() else 'false'}; then
>> +            rm -f "${D}${bindir}/update-alternatives"
>> +        fi
>>
> Would @bb.utils.contains() be better here?  I think that is the correct
> thing to use.
>
>
Sure.

> Sau!
>
>    }
>>
>>   PACKAGES =3D+ "update-alternatives-opkg"
>>
>>


--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

--001a11355c32cac774050057d9a0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Fri, Aug 8, 2014 at 11:41 PM, Saul Wold <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com<=
/a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On 0=
8/08/2014 02:37 AM, Sujith H wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Sujith H &lt;<a href=3D"mailto:Sujith_Haridasan@mentor.com" target=3D=
"_blank">Sujith_Haridasan@mentor.com</a>&gt;<br>
<br>
This is needed to deal with the situation where we&#39;re using ipk packagi=
ng, so<br>
opkg-utils must be built regardless of what update-alternatives provider we=
<br>
prefer. The downside to the current implementation is the need to adjust<br=
>
PACKAGECONFIG as well as PREFERRED_PROVIDER, but it is more explicit that w=
ay.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.com" =
target=3D"_blank">kergoth@gmail.com</a>&gt;<br>
Signed-off-by: Sujith H &lt;<a href=3D"mailto:Sujith_Haridasan@mentor.com" =
target=3D"_blank">Sujith_Haridasan@mentor.com</a>&gt;<br>
---<br>
=C2=A0 meta/recipes-devtools/opkg-<u></u>utils/<a href=3D"http://opkg-utils=
_git.bb" target=3D"_blank">opkg-utils_git.bb</a> | 6 +++++-<br>
=C2=A0 1 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/opkg-<u></u>utils/<a href=3D"http://opkg=
-utils_git.bb" target=3D"_blank">opkg-utils_git.bb</a> b/meta/recipes-devto=
ols/opkg-<u></u>utils/<a href=3D"http://opkg-utils_git.bb" target=3D"_blank=
">opkg-utils_git.bb</a><br>


index 693c216..287bf53 100644<br>
--- a/meta/recipes-devtools/opkg-<u></u>utils/<a href=3D"http://opkg-utils_=
git.bb" target=3D"_blank">opkg-utils_git.bb</a><br>
+++ b/meta/recipes-devtools/opkg-<u></u>utils/<a href=3D"http://opkg-utils_=
git.bb" target=3D"_blank">opkg-utils_git.bb</a><br>
@@ -19,11 +19,15 @@ TARGET_CC_ARCH +=3D &quot;${LDFLAGS}&quot;<br>
=C2=A0 PYTHONRDEPS =3D &quot;python python-shell python-io python-math pyth=
on-crypt python-logging python-fcntl python-subprocess python-pickle python=
-compression python-textutils python-stringold&quot;<br>
=C2=A0 PYTHONRDEPS_class-native =3D &quot;&quot;<br>
<br>
-PACKAGECONFIG =3D &quot;python&quot;<br>
+PACKAGECONFIG =3D &quot;python update-alternatives&quot;<br>
=C2=A0 PACKAGECONFIG[python] =3D &quot;,,,${PYTHONRDEPS}&quot;<br>
+PACKAGECONFIG[update-<u></u>alternatives] =3D &quot;,,,&quot;<br>
<br>
=C2=A0 do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D} in=
stall<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@&#39;true&#39; if &#39;update-alternativ=
es&#39; not in PACKAGECONFIG.split() else &#39;false&#39;}; then<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f &quot;${D}${bindir}/update=
-<u></u>alternatives&quot;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
</blockquote></div></div>
Would @bb.utils.contains() be better here? =C2=A0I think that is the correc=
t thing to use.<br>
<br></blockquote><div><br></div><div>Sure. <br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
Sau!<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=C2=A0 }<br>
<br>
=C2=A0 PACKAGES =3D+ &quot;update-alternatives-opkg&quot;<br>
<br>
</blockquote>
</blockquote></div><br><br clear=3D"all"><br>-- <br>=E0=B4=B8=E0=B5=81=E0=
=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=
=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Bangalore<br>&lt;Project&gt;Contributo=
r to KDE project<br><a href=3D"http://fci.wikia.com/wiki/Anti-DRM-Campaign"=
 target=3D"_blank">http://fci.wikia.com/wiki/Anti-DRM-Campaign</a><br>

&lt;Blog&gt; <a href=3D"http://sujithh.info" target=3D"_blank">http://sujit=
hh.info</a><br>
</div></div>

--001a11355c32cac774050057d9a0--
