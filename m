Return-Path: <net147@gmail.com>
Received: from mail-ve0-f175.google.com (mail-ve0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 66CAB60420
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 01:36:44 +0000 (UTC)
Received: by mail-ve0-f175.google.com with SMTP id cz11so1008915veb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 18:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Yx8smifDuFyR6Eh1+nPfx4tTA0ekhkYEDc8x2FlzWTI=;
	b=FB7o/KkCQHnfcFnnwfQr8xoh031ESEhuJkNOVDFjjAE3tTLpe2XEmeOAKZuHOvBTIe
	DD4YPNK56sB2UHJrM7Zx+7S69JLTmqcC17MJrwdf7BEEYzBm3R7liwJcLZ82cm89+ORA
	FXr+6gcWi1NE6ibaAyJfpjX5ov2l40EcyhWSTalXRh+UNjDWMy0Sqa0VDdEhp1q79Vex
	vsSXv2+o2ZvhrIQAJeDmTZANkL/glFlhrKdHRrvQvIuPt97IAq4nPwJeCcDc0ZV3sNIs
	iWPsnyXVs6p/G6ClZuOAiHQ91hn8eX0vl4CdDhRx5wd6PkbbAVuJT9CkxMByGTcZcT7p
	350w==
MIME-Version: 1.0
X-Received: by 10.52.171.135 with SMTP id au7mr1666998vdc.126.1369186604413;
	Tue, 21 May 2013 18:36:44 -0700 (PDT)
Received: by 10.58.34.132 with HTTP; Tue, 21 May 2013 18:36:43 -0700 (PDT)
In-Reply-To: <519BFE3C.5060009@linux.intel.com>
References: <1369108489-13634-1-git-send-email-net147@gmail.com>
	<519BFE3C.5060009@linux.intel.com>
Date: Wed, 22 May 2013 11:36:43 +1000
Message-ID: <CANwerB1LsAf2jXcUVX1RYxG3SgwUc5rPTDm+hHUumPNCrZVtNg@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] base-files: add /run directory from FHS 3 draft specification
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
X-List-Received-Date: Wed, 22 May 2013 01:36:44 -0000
Content-Type: multipart/alternative; boundary=089e0160cdf62ffaa404dd449901

--089e0160cdf62ffaa404dd449901
Content-Type: text/plain; charset=UTF-8

On 22 May 2013 09:07, Saul Wold <sgw@linux.intel.com> wrote:

> On 05/20/2013 08:54 PM, Jonathan Liu wrote:
>
>> This adds the /run directory from the Filesystem Hierarchy Standard 3.0
>> Draft [1] and refactors the filesystem as follows:
>> - Remove creation of /var/volatile/run
>> - Remove creation of /var/volatile/lock
>> - Remove symbolic link from /var/run to /var/volatile/run
>> - Remove symbolic link from /var/lock to /var/volatile/lock
>> - Add symbolic link from /var/run to /run
>> - Add symbolic link from /var/lock -> /run/lock
>> - Add /run to /etc/fstab for sysvinit compatibility
>>
>>
> It seems that systemd or some program may still be using
> /var/volatile/run, I booted a systemd and non-systemd boot and the systemd
> had a /var/volatile/run dir.
>
> This was with your 204 system update
>
Fixed. It was creating it in systemd init.


>
> One more nit below.
>
> diff --git a/meta/recipes-core/dbus/dbus.**inc
>> b/meta/recipes-core/dbus/dbus.**inc
>> index 2be5bda..45dcf0d 100644
>> --- a/meta/recipes-core/dbus/dbus.**inc
>> +++ b/meta/recipes-core/dbus/dbus.**inc
>> @@ -12,7 +12,7 @@ DEPENDS_class-nativesdk = "nativesdk-expat
>> virtual/nativesdk-libintl"
>>   RDEPENDS_dbus = "${@base_contains('DISTRO_**FEATURES', 'ptest',
>> 'dbus-ptest-ptest', '', d)}"
>>   RDEPENDS_class-native = ""
>>
>> -INC_PR = "r6"
>> +INC_PR = "r7"
>>
>>   SRC_URI = "http://dbus.freedesktop.org/**releases/dbus/dbus-${PV}.tar.*
>> *gz <http://dbus.freedesktop.org/releases/dbus/dbus-$%7BPV%7D.tar.gz> \
>>              file://tmpdir.patch; \
>> @@ -101,9 +101,9 @@ do_install() {
>>              > ${D}${sysconfdir}/default/**volatiles/99_dbus
>>
>>
>> -       mkdir -p ${D}${localstatedir}/run/dbus
>> ${D}${localstatedir}/lib/dbus
>> +       mkdir -p ${D}${localstatedir}/lib/dbus
>>
>> -       chown messagebus:messagebus ${D}${localstatedir}/run/dbus
>> ${D}${localstatedir}/lib/dbus
>> +       chown messagebus:messagebus ${D}${localstatedir}/lib/dbus
>>
>>         chown root:messagebus ${D}${libexecdir}/dbus-daemon-**
>> launch-helper
>>         chmod 4755 ${D}${libexecdir}/dbus-daemon-**launch-helper
>> @@ -113,6 +113,9 @@ do_install() {
>>
>>         # Remove empty testexec directory as we don't build tests
>>         rm -rf ${D}${libdir}/dbus-1.0/test
>> +
>> +       # Remove /var/run/dbus as it is created on startup
>> +       rm -rf ${D}${localstatedir}/run
>>
>
> A nit in the comment.
> Your removing more than /var/run/dbus here, can you fix the comment.
>
Fixed.

>
> Sau!
>
>
I have submitted V3 patch for your review.

Regards,
Jonathan

--089e0160cdf62ffaa404dd449901
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
On 22 May 2013 09:07, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw=
@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On 05/20/2013 08:54 PM, Jonathan Liu wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
This adds the /run directory from the Filesystem Hierarchy Standard 3.0<br>
Draft [1] and refactors the filesystem as follows:<br>
- Remove creation of /var/volatile/run<br>
- Remove creation of /var/volatile/lock<br>
- Remove symbolic link from /var/run to /var/volatile/run<br>
- Remove symbolic link from /var/lock to /var/volatile/lock<br>
- Add symbolic link from /var/run to /run<br>
- Add symbolic link from /var/lock -&gt; /run/lock<br>
- Add /run to /etc/fstab for sysvinit compatibility<br>
<br>
</blockquote>
<br></div>
It seems that systemd or some program may still be using /var/volatile/run,=
 I booted a systemd and non-systemd boot and the systemd had a /var/volatil=
e/run dir.<br>
<br>
This was with your 204 system update<br></blockquote><div style>Fixed. It w=
as creating it in systemd init.</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">

<br>
One more nit below.<div><div class=3D"h5"><br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
diff --git a/meta/recipes-core/dbus/dbus.<u></u>inc b/meta/recipes-core/dbu=
s/dbus.<u></u>inc<br>
index 2be5bda..45dcf0d 100644<br>
--- a/meta/recipes-core/dbus/dbus.<u></u>inc<br>
+++ b/meta/recipes-core/dbus/dbus.<u></u>inc<br>
@@ -12,7 +12,7 @@ DEPENDS_class-nativesdk =3D &quot;nativesdk-expat virtual=
/nativesdk-libintl&quot;<br>
=C2=A0 RDEPENDS_dbus =3D &quot;${@base_contains(&#39;DISTRO_<u></u>FEATURES=
&#39;, &#39;ptest&#39;, &#39;dbus-ptest-ptest&#39;, &#39;&#39;, d)}&quot;<b=
r>
=C2=A0 RDEPENDS_class-native =3D &quot;&quot;<br>
<br>
-INC_PR =3D &quot;r6&quot;<br>
+INC_PR =3D &quot;r7&quot;<br>
<br>
=C2=A0 SRC_URI =3D &quot;<a href=3D"http://dbus.freedesktop.org/releases/db=
us/dbus-$%7BPV%7D.tar.gz" target=3D"_blank">http://dbus.freedesktop.org/<u>=
</u>releases/dbus/dbus-${PV}.tar.<u></u>gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://tmpdir.patch; \<br>
@@ -101,9 +101,9 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; ${D}${sysconfdir}/defa=
ult/<u></u>volatiles/99_dbus<br>
<br>
<br>
- =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}${localstatedir}/run/dbus ${D}${localst=
atedir}/lib/dbus<br>
+ =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}${localstatedir}/lib/dbus<br>
<br>
- =C2=A0 =C2=A0 =C2=A0 chown messagebus:messagebus ${D}${localstatedir}/run=
/dbus ${D}${localstatedir}/lib/dbus<br>
+ =C2=A0 =C2=A0 =C2=A0 chown messagebus:messagebus ${D}${localstatedir}/lib=
/dbus<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 chown root:messagebus ${D}${libexecdir}/dbus-da=
emon-<u></u>launch-helper<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 chmod 4755 ${D}${libexecdir}/dbus-daemon-<u></u=
>launch-helper<br>
@@ -113,6 +113,9 @@ do_install() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove empty testexec directory as we don&#39=
;t build tests<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${libdir}/dbus-1.0/test<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 # Remove /var/run/dbus as it is created on startup<b=
r>
+ =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${localstatedir}/run<br>
</blockquote>
<br></div></div>
A nit in the comment.<br>
Your removing more than /var/run/dbus here, can you fix the comment.<br></b=
lockquote><div style>Fixed.=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Sau!<div class=3D"HOEnZb"><div class=3D"h5"><br></div></div></blockquote><d=
iv><br></div><div style>I have submitted V3 patch for your review.</div><di=
v style><br></div><div style>Regards,</div><div style>Jonathan=C2=A0</div><=
/div>
</div></div>

--089e0160cdf62ffaa404dd449901--
