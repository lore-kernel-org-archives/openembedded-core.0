Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UUFhn-0007a9-Mj
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 14:18:57 +0200
Received: by mail-we0-f175.google.com with SMTP id t11so6358248wey.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2013 05:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=UKtBAWJyA/DchDp2241ef0zEaFvsBcN+KBa9ewDKDDU=;
	b=IQvJbJEhnIL1FGvLu+hqpLVKwIeVxcAemkkJevBWlbxf+XzJi39AIvcCXgbCz+v4Tn
	Ufn8h6VjBz7qrM26Bapb+UzI1K1FywJtTJFfvtOMToPTN0h327pm5KXqNCoMy9lzRYLr
	1kjR6H1J35gj2UmFf6Cf/jQG/SBPpQXkws7TuD6sMucBiRTGsCw+GPRc+9Gjh5CRmX1c
	HcLBKhBgwxXnruc/D/OaSISMN552hLKGf6hGpNUrI2Br2rgaoui7u1BLEpWycnI28Xyv
	o1j+wY/2HMscLGT1ZOnBvoRyPUHteS/iffnrlcaqOfaakvuCE9ZDFGTqAIK6qnTTPcaJ
	loAw==
X-Received: by 10.194.93.133 with SMTP id cu5mr51813423wjb.56.1366632064672;
	Mon, 22 Apr 2013 05:01:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.88.162 with HTTP; Mon, 22 Apr 2013 05:00:44 -0700 (PDT)
In-Reply-To: <51700760.7000204@windriver.com>
References: <1366295248-7766-1-git-send-email-bogdan.a.marinescu@intel.com>
	<51700760.7000204@windriver.com>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Mon, 22 Apr 2013 15:00:44 +0300
Message-ID: <CAMZjud1=D-qSt0tcz57FDPBHj33kOzbZRmqJw7nmdDwGo8xg6A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQn6Q1zFhrPBIDcrKVkfUIgXNnOmPBfnSlw9wJB+8zS/im8dt/eAg8MwSAyUvwFTmJFEuE16
Subject: Re: [PATCH] package_rpm.bbclass: fix /etc/rpm/platform generation
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
X-List-Received-Date: Mon, 22 Apr 2013 12:19:02 -0000
Content-Type: multipart/alternative; boundary=047d7bae46a4c1249504daf1d21d

--047d7bae46a4c1249504daf1d21d
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Apr 18, 2013 at 5:46 PM, Mark Hatle <mark.hatle@windriver.com>wrote:

> On 4/18/13 9:27 AM, Bogdan Marinescu wrote:
>
>> For some platforms (for example emenlow) the RPM installer prefers
>> an invalid package architecture (for example i586 over core2) because
>> /etc/rpm/platform is not properly generated (for example, i586 is
>> listed before core2 in /etc/rpm/platform).
>>
>> [YOCTO #3864]
>>
>> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>> ---
>>   meta/classes/package_rpm.**bbclass |    1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/meta/classes/package_rpm.**bbclass
>> b/meta/classes/package_rpm.**bbclass
>> index 3a29976..1bee4b1 100644
>> --- a/meta/classes/package_rpm.**bbclass
>> +++ b/meta/classes/package_rpm.**bbclass
>> @@ -276,7 +276,6 @@ package_install_internal_rpm () {
>>                 # Setup base system configuration
>>                 echo "Note: configuring RPM platform settings"
>>                 mkdir -p ${target_rootfs}/etc/rpm/
>> -               echo "$INSTALL_PLATFORM_RPM" > ${target_rootfs}/etc/rpm/*
>> *platform
>>
>
> I think this is wrong.  The /etc/rpm/platform file's first line is
> supposed to be the equivalent of: [uname -m]-vendor-os.   While uname -m
> doesn't match our tune namings, the concept is the same.  The first line
> simply defines the "tune" of the platform, subsequent lines define
> alternative names that will run on this system.
>
> The INSTALL_PLATFORM_RPM value should be the expected value for the
> platform as a whole, as it's the default tune value.  (Default tune value
> is expected to be the most accurate value.
>
> Looking at the defect:
>
> i586-poky-linux
> emenlow-.*-linux
> core2-.*-linux
> i686-.*-linux
> i586-.*-linux
> i486-.*-linux
> i386-.*-linux
> x86-.*-linux
> noarch-.*-linux.*
> any-.*-linux.*
> all-.*-linux.*
>
> The default tune value for that machine was set to i586 by "something".
>
> INSTALL_PLATFORM_RPM="$(echo ${TARGET_ARCH} | tr -
> _)${TARGET_VENDOR}-${TARGET_**OS}"
>
> ${TARGET_ARCH} is similar to the output of uname -m.  The error is that
> this particular BSP should have returned 'core2' as the TARGET_ARCH from
> what I can tell.
>
> Default for TARGET_ARCH is: TARGET_ARCH = "${TUNE_ARCH}"
>
> So the TUNE_ARCH is being set to i586.  So the end result is..  Is
> 'TUNE_ARCH' set to i586 appropriate?  It probably is, because the majority
> of the system seems to have a limited set of expected values for
> TARGET_ARCH.
>
> So, perhaps the right fix is instead of using 'TARGET_ARCH' in
> INSTALL_PLATFORM_RPM, 'TUNE_PKGARCH_${DEFAULTTUNE}' may be more appropriate.
>
> I'd suggest trying that.  (But the first line is the system architecture,
> following lines are alternative packages that are considered compatible.)
>
>
>
>>                 if [ ! -z "$INSTALL_PLATFORM_EXTRA_RPM" ]; then
>>                         for pt in $INSTALL_PLATFORM_EXTRA_RPM ; do
>>
>>
>
On my qemux86 image, /etc/rpm/platform looks like this:

qemux86-.*-linux
i586-.*-linux
i486-.*-linux
i386-.*-linux
x86-.*-linux
noarch-.*-linux.*
any-.*-linux.*
all-.*-linux.*

The first line is not fully expanded and smart seems to make the correct
choice of packages in this case.

Thanks,
Bogdan


>
> ______________________________**_________________
> Openembedded-core mailing list
> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>

--047d7bae46a4c1249504daf1d21d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, Apr 18, 2013 at 5:46 PM, Mark Hatle <span dir=3D"l=
tr">&lt;<a href=3D"mailto:mark.hatle@windriver.com" target=3D"_blank">mark.=
hatle@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><di=
v class=3D"gmail_quote">

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im">On 4/18/13 9:27 AM, Bogdan Marinescu wro=
te:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
For some platforms (for example emenlow) the RPM installer prefers<br>
an invalid package architecture (for example i586 over core2) because<br>
/etc/rpm/platform is not properly generated (for example, i586 is<br>
listed before core2 in /etc/rpm/platform).<br>
<br>
[YOCTO #3864]<br>
<br>
Signed-off-by: Bogdan Marinescu &lt;<a href=3D"mailto:bogdan.a.marinescu@in=
tel.com" target=3D"_blank">bogdan.a.marinescu@intel.com</a>&gt;<br>
---<br>
=A0 meta/classes/package_rpm.<u></u>bbclass | =A0 =A01 -<br>
=A0 1 file changed, 1 deletion(-)<br>
<br>
diff --git a/meta/classes/package_rpm.<u></u>bbclass b/meta/classes/package=
_rpm.<u></u>bbclass<br>
index 3a29976..1bee4b1 100644<br>
--- a/meta/classes/package_rpm.<u></u>bbclass<br>
+++ b/meta/classes/package_rpm.<u></u>bbclass<br>
@@ -276,7 +276,6 @@ package_install_internal_rpm () {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 # Setup base system configuration<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;Note: configuring RPM platform s=
ettings&quot;<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mkdir -p ${target_rootfs}/etc/rpm/<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;$INSTALL_PLATFORM_RPM&quot; &gt; $=
{target_rootfs}/etc/rpm/<u></u>platform<br>
</blockquote>
<br></div>
I think this is wrong. =A0The /etc/rpm/platform file&#39;s first line is su=
pposed to be the equivalent of: [uname -m]-vendor-os. =A0 While uname -m do=
esn&#39;t match our tune namings, the concept is the same. =A0The first lin=
e simply defines the &quot;tune&quot; of the platform, subsequent lines def=
ine alternative names that will run on this system.<br>


<br>
The INSTALL_PLATFORM_RPM value should be the expected value for the platfor=
m as a whole, as it&#39;s the default tune value. =A0(Default tune value is=
 expected to be the most accurate value.<br>
<br>
Looking at the defect:<br>
<br>
i586-poky-linux<br>
emenlow-.*-linux<br>
core2-.*-linux<br>
i686-.*-linux<br>
i586-.*-linux<br>
i486-.*-linux<br>
i386-.*-linux<br>
x86-.*-linux<br>
noarch-.*-linux.*<br>
any-.*-linux.*<br>
all-.*-linux.*<br>
<br>
The default tune value for that machine was set to i586 by &quot;something&=
quot;.<br>
<br>
INSTALL_PLATFORM_RPM=3D&quot;$(echo ${TARGET_ARCH} | tr - _)${TARGET_VENDOR=
}-${TARGET_<u></u>OS}&quot;<br>
<br>
${TARGET_ARCH} is similar to the output of uname -m. =A0The error is that t=
his particular BSP should have returned &#39;core2&#39; as the TARGET_ARCH =
from what I can tell.<br>
<br>
Default for TARGET_ARCH is: TARGET_ARCH =3D &quot;${TUNE_ARCH}&quot;<br>
<br>
So the TUNE_ARCH is being set to i586. =A0So the end result is.. =A0Is &#39=
;TUNE_ARCH&#39; set to i586 appropriate? =A0It probably is, because the maj=
ority of the system seems to have a limited set of expected values for TARG=
ET_ARCH.<br>


<br>
So, perhaps the right fix is instead of using &#39;TARGET_ARCH&#39; in INST=
ALL_PLATFORM_RPM, &#39;TUNE_PKGARCH_${DEFAULTTUNE}&#39; may be more appropr=
iate.<br>
<br>
I&#39;d suggest trying that. =A0(But the first line is the system architect=
ure, following lines are alternative packages that are considered compatibl=
e.)<div class=3D"im"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if [ ! -z &quot;$INSTALL_PLATFORM_EXTRA_RPM=
&quot; ]; then<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for pt in $INSTALL_PLATFORM=
_EXTRA_RPM ; do<br>
<br>
</blockquote>
<br></div></blockquote><div><br></div><div style>On my qemux86 image, /etc/=
rpm/platform looks like this:</div><div style><br></div><div style><div>qem=
ux86-.*-linux</div><div>i586-.*-linux</div><div>i486-.*-linux</div><div>

i386-.*-linux</div><div>x86-.*-linux</div><div>noarch-.*-linux.*</div><div>=
any-.*-linux.*</div><div>all-.*-linux.*</div><div><br></div><div style>The =
first line is not fully expanded and smart seems to make the correct choice=
 of packages in this case.</div>

<div style><br></div><div style>Thanks,</div><div style>Bogdan</div></div><=
div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-=
style:solid;padding-left:1ex">

<div class=3D"im">
<br></div>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
</blockquote></div><br></div></div>

--047d7bae46a4c1249504daf1d21d--
