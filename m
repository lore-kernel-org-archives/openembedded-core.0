Received: from mail-wi0-f174.google.com ([209.85.212.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UUaTH-0006SE-Pp
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 12:29:12 +0200
Received: by mail-wi0-f174.google.com with SMTP id m6so5827671wiv.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2013 03:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=vaa2loa4h4IyV6HroR6dji9uJ7FPQKbvQRkyAZD0my0=;
	b=NWGDSg3dwRMTnUOULJu32N3B7fCvYUWVrv8pEBGKLilIqgrQARub6QRD6JXbTGT1MF
	g/DvofwQbDBDi7jFw9ghseloGcYZu/DXgRuimZZ52QkzugYIzHARlJhsA6zIfKJsqb9W
	iXXuVsfv/3R54m8OTzWVcAvYU9A9baHkzTUOyG0gcKx5suWUoAwTlqrQHXohKwvDPx97
	0BXPuk0nMKIwxn04qld5fQYC7sMS9p07CJu7wuOs61VFc/Km9z3TA7//CvVUOV7CJrOn
	BtMxErXML6kkpBqXFRk47ndQXMCmHUk6QXwA4/h/w8+ytnTM7WQ5i6PDeqarD2aSZ23B
	AEjQ==
X-Received: by 10.180.20.37 with SMTP id k5mr21011445wie.27.1366711890319;
	Tue, 23 Apr 2013 03:11:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.88.162 with HTTP; Tue, 23 Apr 2013 03:11:10 -0700 (PDT)
In-Reply-To: <CAMZjud3BiO_xEAVE6ZmHor=etkWPobLETwYWOFaru3fx1EMBVg@mail.gmail.com>
References: <1366295248-7766-1-git-send-email-bogdan.a.marinescu@intel.com>
	<51700760.7000204@windriver.com>
	<CAMZjud1=D-qSt0tcz57FDPBHj33kOzbZRmqJw7nmdDwGo8xg6A@mail.gmail.com>
	<CAMZjud3BiO_xEAVE6ZmHor=etkWPobLETwYWOFaru3fx1EMBVg@mail.gmail.com>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Tue, 23 Apr 2013 13:11:10 +0300
Message-ID: <CAMZjud2e_UcdZhSFuft-d2ETdkyjuFfsbi_j0UB5s61fM++YRg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Mark Hatle <mark.hatle@windriver.com>
X-Gm-Message-State: ALoCoQkZ1Yogph4M4FJyT+GGRafrDk8KARuIkBlwTqfiConMDsqbp+W1imbAOhLq+H3xudFuLZlF
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
X-List-Received-Date: Tue, 23 Apr 2013 10:29:14 -0000
Content-Type: multipart/alternative; boundary=bcaec53d57b7bbb25204db046838

--bcaec53d57b7bbb25204db046838
Content-Type: text/plain; charset=ISO-8859-1

I've investigated this issue further. /etc/rpm/platform is parsed in
rpmrc.c/rpmPlatform. It is true that the first line of /etc/rpm/platform
does not get added directly to the platform list, being passed to parseCVOG
instead, but after parserCVOG ends, it is added to the platform list
anyway, although indirectly (mireAppend with the result of rpmExpand).
After that, it stays in the platform list and it matched on subsequent
calls to rpmPlatformScore, so it definitely has an impact on the way smart
chooses the platform for a package. So, with all this in mind, where is the
bug here? Is it in the RPM library or we really should not add that first
line to the /etc/rpm/platform file?

Thanks,
Bogdan


On Mon, Apr 22, 2013 at 5:34 PM, Marinescu, Bogdan A <
bogdan.a.marinescu@intel.com> wrote:

> Further investigation reveals the fact that the problem is connected to
> the value returned by "rpm.archscore", which changes with the value of the
> first line of /etc/rpm/platform. I'm testing under qemux86 and editing
> /etc/rpm/platform by hand. I've traced the code to backends/rpm/base.py
> which contains the function getArchScore (which basically calls
> rpm.archscore). With this /etc/rpm/platform:
>
> i586-poky-linux
> core2-.*-linux
> qemux86-.*-linux
> i586-.*-linux
> .......
>
> I get a score of 2 for arch core2 and 1 for i586. If I remove the first
> line (i586-poky-linux) and rerun smart without chaning anything else, I get
> a score of 1 for arch core2 and a score of 3 for i586. So that line
> definiteley matters, which should be a bug, if I understood Mark's e-mails
> correctly.
>
> Thanks,
> Bogdan
>
>
>
> On Mon, Apr 22, 2013 at 3:00 PM, Marinescu, Bogdan A <
> bogdan.a.marinescu@intel.com> wrote:
>
>> On Thu, Apr 18, 2013 at 5:46 PM, Mark Hatle <mark.hatle@windriver.com>wrote:
>>
>>> On 4/18/13 9:27 AM, Bogdan Marinescu wrote:
>>>
>>>> For some platforms (for example emenlow) the RPM installer prefers
>>>> an invalid package architecture (for example i586 over core2) because
>>>> /etc/rpm/platform is not properly generated (for example, i586 is
>>>> listed before core2 in /etc/rpm/platform).
>>>>
>>>> [YOCTO #3864]
>>>>
>>>> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>>>> ---
>>>>   meta/classes/package_rpm.**bbclass |    1 -
>>>>   1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/meta/classes/package_rpm.**bbclass
>>>> b/meta/classes/package_rpm.**bbclass
>>>> index 3a29976..1bee4b1 100644
>>>> --- a/meta/classes/package_rpm.**bbclass
>>>> +++ b/meta/classes/package_rpm.**bbclass
>>>> @@ -276,7 +276,6 @@ package_install_internal_rpm () {
>>>>                 # Setup base system configuration
>>>>                 echo "Note: configuring RPM platform settings"
>>>>                 mkdir -p ${target_rootfs}/etc/rpm/
>>>> -               echo "$INSTALL_PLATFORM_RPM" > ${target_rootfs}/etc/rpm/
>>>> **platform
>>>>
>>>
>>> I think this is wrong.  The /etc/rpm/platform file's first line is
>>> supposed to be the equivalent of: [uname -m]-vendor-os.   While uname -m
>>> doesn't match our tune namings, the concept is the same.  The first line
>>> simply defines the "tune" of the platform, subsequent lines define
>>> alternative names that will run on this system.
>>>
>>> The INSTALL_PLATFORM_RPM value should be the expected value for the
>>> platform as a whole, as it's the default tune value.  (Default tune value
>>> is expected to be the most accurate value.
>>>
>>> Looking at the defect:
>>>
>>> i586-poky-linux
>>> emenlow-.*-linux
>>> core2-.*-linux
>>> i686-.*-linux
>>> i586-.*-linux
>>> i486-.*-linux
>>> i386-.*-linux
>>> x86-.*-linux
>>> noarch-.*-linux.*
>>> any-.*-linux.*
>>> all-.*-linux.*
>>>
>>> The default tune value for that machine was set to i586 by "something".
>>>
>>> INSTALL_PLATFORM_RPM="$(echo ${TARGET_ARCH} | tr -
>>> _)${TARGET_VENDOR}-${TARGET_**OS}"
>>>
>>> ${TARGET_ARCH} is similar to the output of uname -m.  The error is that
>>> this particular BSP should have returned 'core2' as the TARGET_ARCH from
>>> what I can tell.
>>>
>>> Default for TARGET_ARCH is: TARGET_ARCH = "${TUNE_ARCH}"
>>>
>>> So the TUNE_ARCH is being set to i586.  So the end result is..  Is
>>> 'TUNE_ARCH' set to i586 appropriate?  It probably is, because the majority
>>> of the system seems to have a limited set of expected values for
>>> TARGET_ARCH.
>>>
>>> So, perhaps the right fix is instead of using 'TARGET_ARCH' in
>>> INSTALL_PLATFORM_RPM, 'TUNE_PKGARCH_${DEFAULTTUNE}' may be more appropriate.
>>>
>>> I'd suggest trying that.  (But the first line is the system
>>> architecture, following lines are alternative packages that are considered
>>> compatible.)
>>>
>>>
>>>
>>>>                 if [ ! -z "$INSTALL_PLATFORM_EXTRA_RPM" ]; then
>>>>                         for pt in $INSTALL_PLATFORM_EXTRA_RPM ; do
>>>>
>>>>
>>>
>> On my qemux86 image, /etc/rpm/platform looks like this:
>>
>> qemux86-.*-linux
>> i586-.*-linux
>> i486-.*-linux
>>  i386-.*-linux
>> x86-.*-linux
>> noarch-.*-linux.*
>> any-.*-linux.*
>> all-.*-linux.*
>>
>> The first line is not fully expanded and smart seems to make the correct
>> choice of packages in this case.
>>
>> Thanks,
>> Bogdan
>>
>>
>>>
>>> ______________________________**_________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
>>> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**
>>> openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>>>
>>
>>
>

--bcaec53d57b7bbb25204db046838
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve investigated this issue further. /etc/rpm/platfor=
m is parsed in rpmrc.c/rpmPlatform. It is true that the first line of /etc/=
rpm/platform does not get added directly to the platform list, being passed=
 to parseCVOG instead, but after parserCVOG ends, it is added to the platfo=
rm list anyway, although indirectly (mireAppend with the result of rpmExpan=
d). After that, it stays in the platform list and it matched on subsequent =
calls to rpmPlatformScore, so it definitely has an impact on the way smart =
chooses the platform for a package. So, with all this in mind, where is the=
 bug here? Is it in the RPM library or we really should not add that first =
line to the /etc/rpm/platform file?<div>

<br></div><div>Thanks,</div><div>Bogdan</div></div><div class=3D"gmail_extr=
a"><br><br><div class=3D"gmail_quote">On Mon, Apr 22, 2013 at 5:34 PM, Mari=
nescu, Bogdan A <span dir=3D"ltr">&lt;<a href=3D"mailto:bogdan.a.marinescu@=
intel.com" target=3D"_blank">bogdan.a.marinescu@intel.com</a>&gt;</span> wr=
ote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr">Further investigation revea=
ls the fact that the problem is connected to the value returned by &quot;rp=
m.archscore&quot;, which changes with the value of the first line of /etc/r=
pm/platform. I&#39;m testing under qemux86 and editing /etc/rpm/platform by=
 hand. I&#39;ve traced the code to backends/rpm/base.py which contains the =
function getArchScore (which basically calls rpm.archscore). With this /etc=
/rpm/platform:<div>


<br></div><div>i586-poky-linux</div><div>core2-.*-linux</div><div>qemux86-.=
*-linux</div><div>i586-.*-linux</div><div>.......</div><div><br></div><div>=
I get a score of 2 for arch core2 and 1 for i586. If I remove the first lin=
e (i586-poky-linux) and rerun smart without chaning anything else, I get a =
score of 1 for arch core2 and a score of 3 for i586. So that line definitel=
ey matters, which should be a bug, if I understood Mark&#39;s e-mails corre=
ctly.</div>


<div><br></div><div>Thanks,</div><div>Bogdan<br><div><br></div></div></div>=
<div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><br><br>=
<div class=3D"gmail_quote">On Mon, Apr 22, 2013 at 3:00 PM, Marinescu, Bogd=
an A <span dir=3D"ltr">&lt;<a href=3D"mailto:bogdan.a.marinescu@intel.com" =
target=3D"_blank">bogdan.a.marinescu@intel.com</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div>On Thu, Apr 18, 2=
013 at 5:46 PM, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.hat=
le@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&gt;</span>=
 wrote:<br>


</div></div><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div><div=
>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div>On 4/18/13 9:27 AM, Bogdan Marinescu wrote:<br>

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
e.)<div><br>
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
<br></div></blockquote><div><br></div></div></div><div>On my qemux86 image,=
 /etc/rpm/platform looks like this:</div><div><br></div><div><div>qemux86-.=
*-linux</div><div><div>i586-.*-linux</div><div>i486-.*-linux</div>
<div>
i386-.*-linux</div><div>x86-.*-linux</div><div>noarch-.*-linux.*</div><div>=
any-.*-linux.*</div><div>all-.*-linux.*</div><div><br></div></div><div>The =
first line is not fully expanded and smart seems to make the correct choice=
 of packages in this case.</div>



<div><br></div><div>Thanks,</div><div>Bogdan</div></div><div><div>=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">



<div>
<br></div>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
</blockquote></div></div><br></div></div>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--bcaec53d57b7bbb25204db046838--
