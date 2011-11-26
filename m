Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RUQ1p-0004BM-3w
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Nov 2011 22:43:21 +0100
Received: by lahe6 with SMTP id e6so201394lah.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Nov 2011 13:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=m9jmqrj0mlEJcqOcBAFB9jqnJxmCplgLOgXC1QxAT40=;
	b=j9B4NYpAsLDIwHxlKmtSVc8fgyY+HNBzA0GZss7HqEMbmxmoCbdTcRuHCzAt6JZcS+
	BIoUO+5FEdmKJzQyciKB2CNNU8c6AXFGaJ595D2VmK7AcV1MP3k79sLgFK66nuBmjaIm
	g3AKgFR00MGOa93imztfWf+GyvAQxIFse6xpE=
Received: by 10.152.132.39 with SMTP id or7mr23650194lab.14.1322343392059;
	Sat, 26 Nov 2011 13:36:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Sat, 26 Nov 2011 13:36:01 -0800 (PST)
In-Reply-To: <4ED134CF.70706@linux.intel.com>
References: <cover.1322095568.git.sgw@linux.intel.com>
	<f8e475e6907d1ad9bfb93ec4c37a0876bc5ed90f.1322095568.git.sgw@linux.intel.com>
	<CAMKF1srOcDxn+y3JaLrN=PCyeHYdhp45ypSy-g4NUc5=uMGwzQ@mail.gmail.com>
	<4ED134CF.70706@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Nov 2011 13:36:01 -0800
Message-ID: <CAMKF1spYAcXRg3of=P-bjoZmb11HhnaDztomSBMCjPFx=zsGRw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] intltool: remove XML::Parser check
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 26 Nov 2011 21:43:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Saul

On Sat, Nov 26, 2011 at 10:49 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 11/24/2011 11:37 AM, Khem Raj wrote:
>>
>> On Thu, Nov 24, 2011 at 10:29 AM, Saul Wold<sgw@linux.intel.com> =C2=A0w=
rote:
>>>
>>> Add Patch to disable the XML::Parser check in the target
>>> intltool.m4, this check will find the host (not native)
>>> XML::Parser if it's installed possibly causing Host
>>> contamination, but will also fail configuration if XML::Parser
>>> is not installed on the host.
>>>
>>> Since we know that XML::Parser is installed on the image, we don't
>>> really need this check, so comment it out.
>>
>> if it is installed then why does it fail to detect it ?
>>
> Because the recipes that depend on intltool do not inherit perlnative, th=
e
> recipes in question are gconf and shared-mime-info. =C2=A0They depend on
> intltool, but do not need to directly inherit perlnative (at least accord=
ing
> to RP).

why dont they need to inherit perlnative ? If they depend on intltool which
expects that its dependees inherit perlnative. I am just worried where this
may cause issues. There might be other recipes which should need XML parser
and may not get it since we remove the test here.

>
> Sau!
>
>>>
>>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>>> ---
>>> =C2=A0.../intltool-0.40.6/remove-xml-check.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 29
>>> ++++++++++++++++++++
>>> =C2=A0meta/recipes-devtools/intltool/intltool_0.40.6.bb =C2=A0| =C2=A0 =
=C2=A07 +++--
>>> =C2=A02 files changed, 33 insertions(+), 3 deletions(-)
>>> =C2=A0create mode 100644
>>> meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch
>>>
>>> diff --git
>>> a/meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch
>>> b/meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch
>>> new file mode 100644
>>> index 0000000..476d091
>>> --- /dev/null
>>> +++
>>> b/meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch
>>> @@ -0,0 +1,29 @@
>>> +Index: intltool-0.40.6/intltool.m4
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +--- intltool-0.40.6.orig/intltool.m4 =C2=A0 2009-02-14 14:12:28.000000=
000
>>> -0800
>>> ++++ intltool-0.40.6/intltool.m4 =C2=A0 =C2=A0 =C2=A0 =C2=A02011-11-23 =
15:39:34.689561872
>>> -0800
>>> +@@ -122,14 +122,16 @@
>>> + =C2=A0 =C2=A0IT_PERL_VERSION=3D"`$INTLTOOL_PERL -e \"printf '%vd', $^=
V\"`"
>>> + =C2=A0 =C2=A0AC_MSG_RESULT([$IT_PERL_VERSION])
>>> + fi
>>> +-if test "x$2" !=3D "xno-xml"; then
>>> +- =C2=A0 AC_MSG_CHECKING([for XML::Parser])
>>> +- =C2=A0 if `$INTLTOOL_PERL -e "require XML::Parser" 2>/dev/null`; the=
n
>>> +- =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([ok])
>>> +- =C2=A0 else
>>> +- =C2=A0 =C2=A0 =C2=A0 AC_MSG_ERROR([XML::Parser perl module is requir=
ed for intltool])
>>> +- =C2=A0 fi
>>> +-fi
>>> ++
>>> ++# Disable this check since we know XML::Parser is installed
>>> ++#if test "x$2" !=3D "xno-xml"; then
>>> ++# =C2=A0 AC_MSG_CHECKING([for XML::Parser])
>>> ++# =C2=A0 if `$INTLTOOL_PERL -e "require XML::Parser" 2>/dev/null`; th=
en
>>> ++# =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([ok])
>>> ++# =C2=A0 else
>>> ++# =C2=A0 =C2=A0 =C2=A0 AC_MSG_ERROR([XML::Parser perl module is requi=
red for
>>> intltool])
>>> ++# =C2=A0 fi
>>> ++#fi
>>> +
>>> + # Substitute ALL_LINGUAS so we can use it in po/Makefile
>>> + AC_SUBST(ALL_LINGUAS)
>>> diff --git a/meta/recipes-devtools/intltool/intltool_0.40.6.bb
>>> b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
>>> index e9871fc..8180fd8 100644
>>> --- a/meta/recipes-devtools/intltool/intltool_0.40.6.bb
>>> +++ b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
>>> @@ -1,14 +1,15 @@
>>> =C2=A0require intltool.inc
>>> =C2=A0LICENSE=3D"GPLv2"
>>> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7d=
f079bae19f"
>>> -PR =3D "r5"
>>> +PR =3D "r6"
>>>
>>> =C2=A0SRC_URI_append =3D " file://intltool-nowarn-0.40.0.patch \
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${=
NATIVEPATCHES} \
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>>>
>>> -NATIVEPATCHES =3D "file://noperlcheck.patch"
>>> -NATIVEPATCHES_virtclass-native =3D "file://use-nativeperl.patch"
>>> +NATIVEPATCHES =3D "file://noperlcheck.patch \
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://remove=
-xml-check.patch"
>>> +NATIVEPATCHES_virtclass-native =3D "file://use-nativeperl.patch"
>>>
>>> =C2=A0SRC_URI[md5sum] =3D "69bc0353323112f42ad4f9cf351bc3e5"
>>> =C2=A0SRC_URI[sha256sum] =3D
>>> "4d1e5f8561f09c958e303d4faa885079a5e173a61d28437d0013ff5efc9e3b64"
>>> --
>>> 1.7.5.4
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


