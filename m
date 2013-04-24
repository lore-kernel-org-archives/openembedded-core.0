Received: from mail-wi0-f182.google.com ([209.85.212.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UUyNe-0000sA-RO
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 14:01:01 +0200
Received: by mail-wi0-f182.google.com with SMTP id m6so2028912wiv.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2013 04:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=UB3gDHS5JXISOBwTzwdIpkwyqpIcK/UohdDhN9iJtXw=;
	b=VvH3w7Jfxa1piT6uVQ4eVb81VGZtBdNCyftYMsjL4PVYfDpGfxJrFgGQnj0qxcy+ii
	2R+AMQm0a6tcDB+OtWigTOr+Gg0lP2uVdmjYFODEE1BtWErJjUudtVyBB54lkJbuiAXL
	q+ACVT3Lgk9u3MVBrB46KM1eLkL4GTE9/z6E2ijORkm30wXHYP2FBVa8QZhBQd5V9vGx
	YG+OiQSmwpq0qgROLFRIFh7jqGbgQXZ8rLN7/gGGXuhLzSljj5wIB/ifH/bpqlEh4KTG
	AkZXUt+3pn+eGoIfavooPdtax0bMZS8vT6hHz24CGBPjXEC1r3dF8fQ1ecDtyIePAkvD
	3j1w==
X-Received: by 10.180.39.207 with SMTP id r15mr29802352wik.16.1366803796464;
	Wed, 24 Apr 2013 04:43:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.88.162 with HTTP; Wed, 24 Apr 2013 04:42:56 -0700 (PDT)
In-Reply-To: <51769DE6.4050407@windriver.com>
References: <1366724273-6680-1-git-send-email-bogdan.a.marinescu@intel.com>
	<51769DE6.4050407@windriver.com>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Wed, 24 Apr 2013 14:42:56 +0300
Message-ID: <CAMZjud30MbusyJ3XvmXhcAEmDNM413ORBbEeviTYUxpf5dPVpA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Gm-Message-State: ALoCoQlD0ZmdMohaC482DA4tXcFhdtz9nuVIDYvXe9r1iAPKUE+thSILkD7A7FPKqOXAyKbn+PXZ
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: change arch scoring items
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Apr 2013 12:01:14 -0000
Content-Type: multipart/alternative; boundary=001a11c23f30c428fe04db19ce4e

--001a11c23f30c428fe04db19ce4e
Content-Type: text/plain; charset=ISO-8859-1

I've sent v2 of this patch with the suggested changes.

Thanks,
Bogdan


On Tue, Apr 23, 2013 at 5:42 PM, Mark Hatle <mark.hatle@windriver.com>wrote:

> On 4/23/13 8:37 AM, Bogdan Marinescu wrote:
>
>> Don't add the first line of /etc/rpm/platform to the list of patterns
>> to match when computing an arch score, use it just for getting
>> information about the platform (cpu/vendor/os).
>>
>> [YOCTO #3864]
>>
>> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>> ---
>>   .../rpm/rpm/rpm-platform-file-**fix.patch            |   28
>> ++++++++++++++++++++
>>   meta/recipes-devtools/rpm/rpm_**5.4.9.bb <http://rpm_5.4.9.bb>
>>     |    3 ++-
>>   2 files changed, 30 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-devtools/rpm/rpm/**
>> rpm-platform-file-fix.patch
>>
>> diff --git a/meta/recipes-devtools/rpm/**rpm/rpm-platform-file-fix.**patch
>> b/meta/recipes-devtools/rpm/**rpm/rpm-platform-file-fix.**patch
>> new file mode 100644
>> index 0000000..3e14d4d
>> --- /dev/null
>> +++ b/meta/recipes-devtools/rpm/**rpm/rpm-platform-file-fix.**patch
>> @@ -0,0 +1,28 @@
>> +Don't add the first line of /etc/rpm/platform to the list of patterns
>> +to match when computing an arch score, use it just for getting
>> +information about the platform (cpu/vendor/os). Fixes #3864.
>> +
>> +Upstream-Status: Inappropriate [embedded specific]
>> +
>> +diff --git a/lib/rpmrc.c b/lib/rpmrc.c
>> +index e676601..e433faa 100644
>> +--- a/lib/rpmrc.c
>> ++++ b/lib/rpmrc.c
>> +@@ -510,17 +510,6 @@ static rpmRC rpmPlatform(const char * platform)
>> + #endif
>> +       }
>> +
>>
>
> The change below should be fine, and does address both of my concerns.
>  (it slightly changes /etc/rpm/platform behavior, but I don't think it does
> so in a way that will confuse anyone.)
>
> I do suggest the patch be reworked though to conform with the upstream
> guidelines for "local vendor patches"  Replace the following with:
>
>
>  +-#if defined(RPM_VENDOR_OPENPKG) /* explicit-platform */
>> +-      /* do not use vendor and GNU attribution */
>> +-      p = rpmExpand("%{_host_cpu}-%{_**host_os}", NULL);
>> +-#else
>> +-      p = rpmExpand("%{_host_cpu}-%{_**host_vendor}-%{_host_os}",
>> +-              (cvog && *cvog->gnu ? "-" : NULL),
>> +-              (cvog ? cvog->gnu : NULL), NULL);
>> +-#endif
>> +-      xx = mireAppend(RPMMIRE_STRCMP, 0, p, NULL, &mi_re, &mi_nre);
>> +-      p = _free(p);
>> +-
>>
>
> #if !defined(RPM_VENDOR_POKY) /* Skip the explicit-platform */
>  #if defined(RPM_VENDOR_OPENPKG) /* explicit-platform */
>
>         /* do not use vendor and GNU attribution */
>         p = rpmExpand("%{_host_cpu}-%{_**host_os}", NULL);
>  #else
>
>         p = rpmExpand("%{_host_cpu}-%{_**host_vendor}-%{_host_os}",
>                 (cvog && *cvog->gnu ? "-" : NULL),
>                 (cvog ? cvog->gnu : NULL), NULL);
>  #endif
>
>         xx = mireAppend(RPMMIRE_STRCMP, 0, p, NULL, &mi_re, &mi_nre);
>         p = _free(p);
> #endif
>
> (And yes, at some point we really should change from VENDOR_POKY to
> VENDOR_OE or similar.. but that is the existing setting.. so we should use
> it for now.)
>
>
>  +       init_platform++;
>> +     }
>> +     rc = (init_platform ? RPMRC_OK : RPMRC_FAIL);
>> diff --git a/meta/recipes-devtools/rpm/rp**m_5.4.9.bb<http://rpm_5.4.9.bb>b/meta/recipes-devtools/rpm/
>> rp**m_5.4.9.bb <http://rpm_5.4.9.bb>
>> index 7d2cba4..112d11d 100644
>> --- a/meta/recipes-devtools/rpm/rp**m_5.4.9.bb <http://rpm_5.4.9.bb>
>> +++ b/meta/recipes-devtools/rpm/rp**m_5.4.9.bb <http://rpm_5.4.9.bb>
>> @@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
>>   LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=**
>> 2d5025d4aa3495befef8f17206a5b0**a1"
>>
>>   DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
>> -PR = "r62"
>> +PR = "r63"
>>
>>   # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is
>> needed
>>   # in order to extract the distribution SRPM into a format we can
>> extract...
>> @@ -86,6 +86,7 @@ SRC_URI = "http://www.rpm5.org/files/**
>> rpm/rpm-5.4/rpm-5.4.9-0.**20120508.src.rpm;ex<http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex>
>>            file://rpm-platform2.patch \
>>            file://rpm-remove-sykcparse-**decl.patch \
>>            file://debugedit-segv.patch \
>> +     file://rpm-platform-file-fix.**patch \
>>           "
>>
>>   # Uncomment the following line to enable platform score debugging
>>
>>
>
> ______________________________**_________________
> Openembedded-core mailing list
> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>

--001a11c23f30c428fe04db19ce4e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve sent v2 of this patch with the suggested changes.=
<div><br></div><div>Thanks,</div><div>Bogdan</div></div><div class=3D"gmail=
_extra"><br><br><div class=3D"gmail_quote">On Tue, Apr 23, 2013 at 5:42 PM,=
 Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.hatle@windriver.co=
m" target=3D"_blank">mark.hatle@windriver.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On 4=
/23/13 8:37 AM, Bogdan Marinescu wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Don&#39;t add the first line of /etc/rpm/platform to the list of patterns<b=
r>
to match when computing an arch score, use it just for getting<br>
information about the platform (cpu/vendor/os).<br>
<br>
[YOCTO #3864]<br>
<br>
Signed-off-by: Bogdan Marinescu &lt;<a href=3D"mailto:bogdan.a.marinescu@in=
tel.com" target=3D"_blank">bogdan.a.marinescu@intel.com</a>&gt;<br>
---<br>
=A0 .../rpm/rpm/rpm-platform-file-<u></u>fix.patch =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 28 ++++++++++++++++++++<br>
=A0 meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.9.bb" target=3D"_bl=
ank">rpm_<u></u>5.4.9.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A03 ++-<br>
=A0 2 files changed, 30 insertions(+), 1 deletion(-)<br>
=A0 create mode 100644 meta/recipes-devtools/rpm/rpm/<u></u>rpm-platform-fi=
le-fix.patch<br>
<br>
diff --git a/meta/recipes-devtools/rpm/<u></u>rpm/rpm-platform-file-fix.<u>=
</u>patch b/meta/recipes-devtools/rpm/<u></u>rpm/rpm-platform-file-fix.<u><=
/u>patch<br>
new file mode 100644<br>
index 0000000..3e14d4d<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rpm/<u></u>rpm/rpm-platform-file-fix.<u></u>pat=
ch<br>
@@ -0,0 +1,28 @@<br>
+Don&#39;t add the first line of /etc/rpm/platform to the list of patterns<=
br>
+to match when computing an arch score, use it just for getting<br>
+information about the platform (cpu/vendor/os). Fixes #3864.<br>
+<br>
+Upstream-Status: Inappropriate [embedded specific]<br>
+<br>
+diff --git a/lib/rpmrc.c b/lib/rpmrc.c<br>
+index e676601..e433faa 100644<br>
+--- a/lib/rpmrc.c<br>
++++ b/lib/rpmrc.c<br>
+@@ -510,17 +510,6 @@ static rpmRC rpmPlatform(const char * platform)<br>
+ #endif<br>
+ =A0 =A0 =A0 }<br>
+<br>
</blockquote>
<br></div></div>
The change below should be fine, and does address both of my concerns. =A0(=
it slightly changes /etc/rpm/platform behavior, but I don&#39;t think it do=
es so in a way that will confuse anyone.)<br>
<br>
I do suggest the patch be reworked though to conform with the upstream guid=
elines for &quot;local vendor patches&quot; =A0Replace the following with:<=
div class=3D"im"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+-#if defined(RPM_VENDOR_OPENPKG) /* explicit-platform */<br>
+- =A0 =A0 =A0/* do not use vendor and GNU attribution */<br>
+- =A0 =A0 =A0p =3D rpmExpand(&quot;%{_host_cpu}-%{_<u></u>host_os}&quot;, =
NULL);<br>
+-#else<br>
+- =A0 =A0 =A0p =3D rpmExpand(&quot;%{_host_cpu}-%{_<u></u>host_vendor}-%{_=
host_os}&quot;,<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0(cvog &amp;&amp; *cvog-&gt;gnu ? &quot;-&quot=
; : NULL),<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0(cvog ? cvog-&gt;gnu : NULL), NULL);<br>
+-#endif<br>
+- =A0 =A0 =A0xx =3D mireAppend(RPMMIRE_STRCMP, 0, p, NULL, &amp;mi_re, &am=
p;mi_nre);<br>
+- =A0 =A0 =A0p =3D _free(p);<br>
+- =A0 =A0 =A0<br>
</blockquote>
<br></div>
#if !defined(RPM_VENDOR_POKY) /* Skip the explicit-platform */<br>
=A0#if defined(RPM_VENDOR_OPENPKG) /* explicit-platform */<div class=3D"im"=
><br>
=A0 =A0 =A0 =A0 /* do not use vendor and GNU attribution */<br></div><div c=
lass=3D"im">
=A0 =A0 =A0 =A0 p =3D rpmExpand(&quot;%{_host_cpu}-%{_<u></u>host_os}&quot;=
, NULL);<br></div>
=A0#else<div class=3D"im"><br>
=A0 =A0 =A0 =A0 p =3D rpmExpand(&quot;%{_host_cpu}-%{_<u></u>host_vendor}-%=
{_host_os}&quot;,<br></div><div class=3D"im">
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (cvog &amp;&amp; *cvog-&gt;gnu ? &quot;-&qu=
ot; : NULL),<br></div><div class=3D"im">
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (cvog ? cvog-&gt;gnu : NULL), NULL);<br></d=
iv>
=A0#endif<div class=3D"im"><br>
=A0 =A0 =A0 =A0 xx =3D mireAppend(RPMMIRE_STRCMP, 0, p, NULL, &amp;mi_re, &=
amp;mi_nre);<br></div>
=A0 =A0 =A0 =A0 p =3D _free(p);<br>
#endif<br>
<br>
(And yes, at some point we really should change from VENDOR_POKY to VENDOR_=
OE or similar.. but that is the existing setting.. so we should use it for =
now.)<div class=3D"im"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+ =A0 =A0 =A0 init_platform++;<br>
+ =A0 =A0 }<br>
+ =A0 =A0 rc =3D (init_platform ? RPMRC_OK : RPMRC_FAIL);<br>
diff --git a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.9.bb" targ=
et=3D"_blank">rp<u></u>m_5.4.9.bb</a> b/meta/recipes-devtools/rpm/<a href=
=3D"http://rpm_5.4.9.bb" target=3D"_blank">rp<u></u>m_5.4.9.bb</a><br>
index 7d2cba4..112d11d 100644<br>
--- a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.9.bb" target=3D"_=
blank">rp<u></u>m_5.4.9.bb</a><br>
+++ b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.9.bb" target=3D"_=
blank">rp<u></u>m_5.4.9.bb</a><br>
@@ -43,7 +43,7 @@ LICENSE =3D &quot;LGPLv2.1&quot;<br>
=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING.LIB;md5=3D<u></u>2d5025d4aa34=
95befef8f17206a5b0<u></u>a1&quot;<br>
<br>
=A0 DEPENDS =3D &quot;libpcre attr acl popt ossp-uuid file bison-native&quo=
t;<br>
-PR =3D &quot;r62&quot;<br>
+PR =3D &quot;r63&quot;<br>
<br>
=A0 # rpm2cpio is a shell script, which is part of the rpm src.rpm. =A0It i=
s needed<br>
=A0 # in order to extract the distribution SRPM into a format we can extrac=
t...<br>
@@ -86,6 +86,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.rpm5.org/files/rp=
m/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex" target=3D"_blank">http://www.rpm=
5.org/files/<u></u>rpm/rpm-5.4/rpm-5.4.9-0.<u></u>20120508.src.rpm;ex</a><b=
r>


=A0 =A0 =A0 =A0 =A0 =A0file://rpm-platform2.patch \<br>
=A0 =A0 =A0 =A0 =A0 =A0file://rpm-remove-sykcparse-<u></u>decl.patch \<br>
=A0 =A0 =A0 =A0 =A0 =A0file://debugedit-segv.patch \<br>
+ =A0 =A0 file://rpm-platform-file-fix.<u></u>patch \<br>
=A0 =A0 =A0 =A0 =A0 &quot;<br>
<br>
=A0 # Uncomment the following line to enable platform score debugging<br>
<br>
</blockquote>
<br>
<br></div>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
</blockquote></div><br></div>

--001a11c23f30c428fe04db19ce4e--
