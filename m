Return-Path: <info@sd-kyber.com>
X-Greylist: delayed 906 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 29 Aug 2014 01:42:57 UTC
Received: from relais.videotron.net (relais.videotron.net [24.201.245.25])
	by mail.openembedded.org (Postfix) with ESMTP id D57017120D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 01:42:57 +0000 (UTC)
MIME-version: 1.0
Received: from [192.168.1.151]
	(modemcable250.171-70-69.static.videotron.ca [69.70.171.250])
	by VL-VM-MRA001.ip.videotron.ca
	(Oracle Communications Messaging Exchange Server 7u4-18.01 64bit (built
	Jul 15
	2010)) with ESMTPA id <0NB10097HO2F5120@VL-VM-MRA001.ip.videotron.ca>
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Aug 2014 21:27:52 -0400 (EDT)
From: info@sd-kyber.com
In-reply-to: <20140825154657.GA21358@haswell>
Date: Thu, 28 Aug 2014 21:27:51 -0400
Message-id: <50009FD0-69EF-4A10-962A-5FE6D2428FE0@sd-kyber.com>
References: <D435FD3B-FAF6-4EA2-BADF-95F56CD6775F@sd-kyber.com>
	<53FB5549.3020504@windriver.com> <20140825154657.GA21358@haswell>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1973.6)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [bitbake-devel] *-dbg package...
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
X-List-Received-Date: Fri, 29 Aug 2014 01:42:59 -0000
Content-type: multipart/alternative;
	boundary="Boundary_(ID_DnNM/BIny5KVBAO2uiwhkA)"

--Boundary_(ID_DnNM/BIny5KVBAO2uiwhkA)
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: quoted-printable

Thank you very much for the detailed answer(s) and comments.

My next question would be for some advice where to find more information =
on topics like

- default splitting policy (settings)=20
- flags as INHIBIT_PACKAGE_DEBUG_SPLIT
-  etc=E2=80=A6

May be there is some =E2=80=98obvious logic=E2=80=99 in files splits, =
etc. which would make reading the code easily=E2=80=A6.

So far, I tried to read the manuals, Yocto book=E2=80=A6 It looks like =
those papers are covering well the general ideas and strategies.=20
But as they say - =E2=80=98 the devil is in details=E2=80=99,  =20
And so far, I have hard time to find info on such details=E2=80=A6=20

Once again, thanks for the kind attention to this matter.=20
And my apology that I put the original message within the wrong list.=20

Michael.



> On Aug 25, 2014, at 11:46 AM, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
>=20
> On 14-08-25 10:24:57, Mark Hatle wrote:
>> First this is the wrong list.  The question should have gone to =
oe-core
>> devel, or openembedded-devel lists.  (I have CC'd the first)
>>=20
>> On 8/21/14, 9:59 PM, info@sd-kyber.com <mailto:info@sd-kyber.com> =
wrote:
>>> Hi,
>>> I=E2=80=99m trying to write ( and to use ) a recipe which should =
build a simple  .rpm,
>>> which contains the /usr/lib/libaffinity.so and a  few header files =
within
>>> /usr/include/affinity/* subdir.
>=20
> if you install it right then you should get one rpm with library =
another
> one ${PN}-dev which should contain the headers and all debug info will
> be split out into a rpm of its own ${PN}-dbg, this is standard
> packaging strategy in OE.
>=20
>=20
>>>=20
>>> However, it looks like bitbake is trying / =E2=80=9Cforcing=E2=80=9D =
me to  build a ${PN}-dbg
>>> package=E2=80=A6.:
>=20
> Yes it will, is there any issue with that ?
>=20
>=20
>>>=20
>>> I=E2=80=99m doing the following steps:
>>>=20
>>> 1. recipe:
>>> =E2=80=9C
>>> =E2=80=A6
>>> inherit  cmake pkgconfig
>>>=20
>>> PACKAGES =3D "${PN}"
>=20
> overriding PACKAGES will leave some unpackaged files.
>=20
>>> FILES_${PN} =3D "${libdir}/libaffinity.so /usr/include/affinity/*=E2=80=
=9D
>>> =E2=80=A6
>=20
> I would suggest to use standard packaging split if thats not a big
> issue.
>=20
>>> =E2=80=9C
>>=20
>> Just removing '${PN}-dbg' does not inform the system that you do not =
want
>> debug information to be generated.  There is a set of standard =
routines,
>> performed after do_install, that will generate the debug information =
unless
>> disabled.
>>=20
>> To disable the routines you set:
>>=20
>> INHIBIT_PACKAGE_DEBUG_SPLIT =3D '1'
>> INHIBIT_PACKAGE_STRIP =3D '1'
>>=20
>> There are two settings they can be used separately, but in your case =
you
>> likely want both.
>>=20
>> INHIBIT_PACKAGE_DEBUG_SPLIT =3D '1' disables the files in your =
package from
>> being split into run-time and debug components.
>>=20
>> INHIBIT_PACKAGE_STRIP =3D '1' disabled the system from attempting to =
strip the
>> run-time components of debug information.
>>=20
>> --Mark
>>=20
>>> So, I assume  I=E2=80=99 m asking to build only 1 package.
>>>=20
>>> 2. During the bitbake processing, as the compilation, build,  and =
installation
>>> are over, the  files are copied into the ${D} directory, as =
expected:
>>> =E2=80=9C
>>> michael@localhost image]$ pwd
>>> =
/home/michael/Devlab/poky/build-atmel/tmp/work/cortexa5t2hf-vfp-poky-linux=
-gnueabi/affinityng/0.1-r0/image
>>> [michael@localhost image]$ cd usr
>>> [michael@localhost usr]$ ls -la
>>> total 16
>>> drwxr-xr-x. 4 michael michael 4096 Aug 21 19:57 .
>>> drwxr-xr-x. 3 michael michael 4096 Aug 21 19:57 ..
>>> drwxr-xr-x. 3 michael michael 4096 Aug 21 19:57 include
>>> drwxr-xr-x. 2 michael michael 4096 Aug 21 19:57 lib
>>> =E2=80=9C
>>> So far, everything as expected in accordance with the Yocto =
reference.
>>>=20
>>> 3. According to the manual reference  - "The |do_package| and
>>> |do_packagedata| tasks combine to analyze the files found in the |D|
>>> =
<http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-D=
 =
<http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-D=
>> directory=E2=80=A6=E2=80=9D,
>>> I would expect that the package would be build.
>>> However, the  attempt to build is failing. with the error:
>>> =E2=80=9C=E2=80=A6
>>> ERROR: QA Issue: affinityng: Files/directories were installed but =
not shipped
>>>  /usr/src
>>>  /usr/lib/.debug
>>>  /usr/lib/.debug/libaffinity.so
>>>  /usr/src/debug
>>>  /usr/src/debug/affinityng
>>>  /usr/src/debug/affinityng/0.1-r0
>>>  /usr/src/debug/affinityng/0.1-r0/kernel
>>> =E2=80=A6
>>> =E2=80=9C
>>>=20
>>> 4. Following the reference, I checked the PKGD directory, where the =
files should
>>> be before split=E2=80=A6.
>>> And I noticed that there is the src directory there,  in addition to
>>> directories =E2=80=94 include and lib =E2=80=94 the only ones I was =
expecting to see there.
>>> ( see log below ) .
>>>=20
>>> =E2=80=9C
>>> =
/home/michael/Devlab/poky/build-atmel/tmp/work/cortexa5t2hf-vfp-poky-linux=
-gnueabi/affinityng/0.1-r0/package/usr
>>> =E2=80=A6.
>>> [michael@localhost usr]$ ls -la
>>> total 20
>>> drwxr-xr-x. 5 michael michael 4096 Aug 21 19:57 .
>>> drwxr-xr-x. 3 michael michael 4096 Aug 21 19:57 ..
>>> drwxr-xr-x. 3 michael michael 4096 Aug 21 19:57 include
>>> drwxr-xr-x. 3 michael michael 4096 Aug 21 19:57 lib
>>> drwxr-xr-x. 3 michael michael 4096 Aug 21 19:57 src
>>> [michael@localhost usr]$ pwd
>>> =
/home/michael/Devlab/poky/build-atmel/tmp/work/cortexa5t2hf-vfp-poky-linux=
-gnueabi/affinityng/0.1-r0/package/usr
>>> [michael@localhost usr]$ cd src
>>> [michael@localhost src]$ ls -la
>>> total 12
>>> drwxr-xr-x. 3 michael michael 4096 Aug 21 19:57 .
>>> drwxr-xr-x. 5 michael michael 4096 Aug 21 19:57 ..
>>> drwxr-xr-x. 3 michael michael 4096 Aug 21 19:57 debug
>>> [michael@localhost src]$
>>> =E2=80=9C
>>> 5. It looks like that as result of package split, the  include & lib =
directories
>>> are used properly to build affinityng package, at least it is shown =
in
>>> packages-split properly.
>>> But then ,  the content of the src directory is causing the problem =
with QA.
>>>=20
>>> 6. At the same time, if I ask to build  ${PN}-dbg package in =
addition - both
>>> packages are build, no QA complains, and all src/debug/* are going =
into the -dbg
>>> package=E2=80=A6
>>>=20
>>> I wonder,
>>> - why does the src directory appear within  PKGD/usr? ( If there is =
no such
>>> directory within the ${D} directory...)
>>> - where is the definition for  -dbg package is coming from, and is =
it possible
>>> to disable it?
>>>=20
>>> May be somebody have the answer or suggestion what to check next=E2=80=
=A6.
>>>=20
>>> Thanks for a kind attention to the matter.
>>>=20
>>> Have a great day,
>>> Michael.
>>>=20
>>>=20
>>>=20
>>=20
>> --=20
>> _______________________________________________
>> bitbake-devel mailing list
>> bitbake-devel@lists.openembedded.org =
<mailto:bitbake-devel@lists.openembedded.org>
>> http://lists.openembedded.org/mailman/listinfo/bitbake-devel
> --=20
> _______________________________________________
> bitbake-devel mailing list
> bitbake-devel@lists.openembedded.org =
<mailto:bitbake-devel@lists.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/bitbake-devel =
<http://lists.openembedded.org/mailman/listinfo/bitbake-devel>

--Boundary_(ID_DnNM/BIny5KVBAO2uiwhkA)
Content-type: text/html; charset=utf-8
Content-transfer-encoding: quoted-printable

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D"">Thank you very much for the detailed =
answer(s) and comments.</div><div class=3D""><br class=3D""></div><div =
class=3D"">My next question would be for some advice where to find more =
information on topics like</div><div class=3D""><br class=3D""></div><div =
class=3D"">- default splitting policy (settings)&nbsp;</div><div =
class=3D"">- flags as&nbsp;<span style=3D"color: rgb(0, 249, 0); =
font-family: 'Andale Mono'; background-color: rgb(0, 0, 0);" =
class=3D"">INHIBIT_PACKAGE_DEBUG_SPLIT</span></div><div class=3D"">- =
&nbsp;etc=E2=80=A6</div><div class=3D""><br class=3D""></div><div =
class=3D"">May be there is some =E2=80=98obvious logic=E2=80=99 in files =
splits, etc. which would make reading the code easily=E2=80=A6.</div><div =
class=3D""><br class=3D""></div><div class=3D"">So far, I tried to read =
the manuals, Yocto book=E2=80=A6 It looks like those papers are covering =
well the general ideas and strategies.&nbsp;</div><div class=3D"">But as =
they say - =E2=80=98 the devil is in details=E2=80=99, =
&nbsp;&nbsp;</div><div class=3D"">And so far, I have hard time to find =
info on such details=E2=80=A6&nbsp;</div><div class=3D""><br =
class=3D""></div><div class=3D"">Once again, thanks for the kind =
attention to this matter.&nbsp;</div><div class=3D"">And my apology that =
I put the original message within the wrong list.&nbsp;</div><div =
class=3D""><br class=3D""></div><div class=3D"">Michael.</div><div =
class=3D""><br class=3D""></div><div class=3D""><br class=3D""></div><br =
class=3D""><div class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Aug 25, 2014, at 11:46 AM, Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" class=3D"">raj.khem@gmail.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">On 14-08-25 10:24:57, Mark Hatle =
wrote:</span><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D"">First this is the wrong list. &nbsp;The question should =
have gone to oe-core<br class=3D"">devel, or openembedded-devel lists. =
&nbsp;(I have CC'd the first)<br class=3D""><br class=3D"">On 8/21/14, =
9:59 PM,<span class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"mailto:info@sd-kyber.com" class=3D"">info@sd-kyber.com</a><span =
class=3D"Apple-converted-space">&nbsp;</span>wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D"">Hi,<br class=3D"">I=E2=80=99=
m trying to write ( and to use ) a recipe which should build a simple =
&nbsp;.rpm,<br class=3D"">which contains the /usr/lib/libaffinity.so and =
a &nbsp;few header files within<br class=3D"">/usr/include/affinity/* =
subdir.<br class=3D""></blockquote></blockquote><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">if you install it right then you should get one =
rpm with library another</span><br style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">one ${PN}-dev which should =
contain the headers and all debug info will</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">be split out into a rpm of its own ${PN}-dbg, =
this is standard</span><br style=3D"font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">packaging strategy in =
OE.</span><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D""><blockquote type=3D"cite" class=3D""><br =
class=3D"">However, it looks like bitbake is trying / =E2=80=9Cforcing=E2=80=
=9D me to &nbsp;build a ${PN}-dbg<br class=3D"">package=E2=80=A6.:<br =
class=3D""></blockquote></blockquote><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">Yes it will, is there any issue with that =
?</span><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D""><blockquote type=3D"cite" class=3D""><br class=3D"">I=E2=80=
=99m doing the following steps:<br class=3D""><br class=3D"">1. =
recipe:<br class=3D"">=E2=80=9C<br class=3D"">=E2=80=A6<br =
class=3D"">inherit &nbsp;cmake pkgconfig<br class=3D""><br =
class=3D"">PACKAGES =3D "${PN}"<br =
class=3D""></blockquote></blockquote><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">overriding PACKAGES will leave some unpackaged =
files.</span><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D""><blockquote type=3D"cite" class=3D"">FILES_${PN} =3D =
"${libdir}/libaffinity.so /usr/include/affinity/*=E2=80=9D<br =
class=3D"">=E2=80=A6<br class=3D""></blockquote></blockquote><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">I would suggest to use standard packaging split =
if thats not a big</span><br style=3D"font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">issue.</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><br style=3D"font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><blockquote type=3D"cite"=
 class=3D"">=E2=80=9C<br class=3D""></blockquote><br class=3D"">Just =
removing '${PN}-dbg' does not inform the system that you do not want<br =
class=3D"">debug information to be generated. &nbsp;There is a set of =
standard routines,<br class=3D"">performed after do_install, that will =
generate the debug information unless<br class=3D"">disabled.<br =
class=3D""><br class=3D"">To disable the routines you set:<br =
class=3D""><br class=3D"">INHIBIT_PACKAGE_DEBUG_SPLIT =3D '1'<br =
class=3D"">INHIBIT_PACKAGE_STRIP =3D '1'<br class=3D""><br =
class=3D"">There are two settings they can be used separately, but in =
your case you<br class=3D"">likely want both.<br class=3D""><br =
class=3D"">INHIBIT_PACKAGE_DEBUG_SPLIT =3D '1' disables the files in =
your package from<br class=3D"">being split into run-time and debug =
components.<br class=3D""><br class=3D"">INHIBIT_PACKAGE_STRIP =3D '1' =
disabled the system from attempting to strip the<br class=3D"">run-time =
components of debug information.<br class=3D""><br class=3D"">--Mark<br =
class=3D""><br class=3D""><blockquote type=3D"cite" class=3D"">So, I =
assume &nbsp;I=E2=80=99 m asking to build only 1 package.<br =
class=3D""><br class=3D"">2. During the bitbake processing, as the =
compilation, build, &nbsp;and installation<br class=3D"">are over, the =
&nbsp;files are copied into the ${D} directory, as expected:<br =
class=3D"">=E2=80=9C<br class=3D"">michael@localhost image]$ pwd<br =
class=3D"">/home/michael/Devlab/poky/build-atmel/tmp/work/cortexa5t2hf-vfp=
-poky-linux-gnueabi/affinityng/0.1-r0/image<br =
class=3D"">[michael@localhost image]$ cd usr<br =
class=3D"">[michael@localhost usr]$ ls -la<br class=3D"">total 16<br =
class=3D"">drwxr-xr-x. 4 michael michael 4096 Aug 21 19:57 .<br =
class=3D"">drwxr-xr-x. 3 michael michael 4096 Aug 21 19:57 ..<br =
class=3D"">drwxr-xr-x. 3 michael michael 4096 Aug 21 19:57 include<br =
class=3D"">drwxr-xr-x. 2 michael michael 4096 Aug 21 19:57 lib<br =
class=3D"">=E2=80=9C<br class=3D"">So far, everything as expected in =
accordance with the Yocto reference.<br class=3D""><br class=3D"">3. =
According to the manual reference &nbsp;- "The |do_package| and<br =
class=3D"">|do_packagedata| tasks combine to analyze the files found in =
the |D|<br class=3D"">&lt;<a =
href=3D"http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.htm=
l#var-D" =
class=3D"">http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.=
html#var-D</a>&gt; directory=E2=80=A6=E2=80=9D,<br class=3D"">I would =
expect that the package would be build.<br class=3D"">However, the =
&nbsp;attempt to build is failing. with the error:<br class=3D"">=E2=80=9C=
=E2=80=A6<br class=3D"">ERROR: QA Issue: affinityng: Files/directories =
were installed but not shipped<br class=3D"">&nbsp;/usr/src<br =
class=3D"">&nbsp;/usr/lib/.debug<br =
class=3D"">&nbsp;/usr/lib/.debug/libaffinity.so<br =
class=3D"">&nbsp;/usr/src/debug<br =
class=3D"">&nbsp;/usr/src/debug/affinityng<br =
class=3D"">&nbsp;/usr/src/debug/affinityng/0.1-r0<br =
class=3D"">&nbsp;/usr/src/debug/affinityng/0.1-r0/kernel<br =
class=3D"">=E2=80=A6<br class=3D"">=E2=80=9C<br class=3D""><br =
class=3D"">4. Following the reference, I checked the PKGD directory, =
where the files should<br class=3D"">be before split=E2=80=A6.<br =
class=3D"">And I noticed that there is the src directory there, &nbsp;in =
addition to<br class=3D"">directories =E2=80=94 include and lib =E2=80=94 =
the only ones I was expecting to see there.<br class=3D"">( see log =
below ) .<br class=3D""><br class=3D"">=E2=80=9C<br =
class=3D"">/home/michael/Devlab/poky/build-atmel/tmp/work/cortexa5t2hf-vfp=
-poky-linux-gnueabi/affinityng/0.1-r0/package/usr<br class=3D"">=E2=80=A6.=
<br class=3D"">[michael@localhost usr]$ ls -la<br class=3D"">total 20<br =
class=3D"">drwxr-xr-x. 5 michael michael 4096 Aug 21 19:57 .<br =
class=3D"">drwxr-xr-x. 3 michael michael 4096 Aug 21 19:57 ..<br =
class=3D"">drwxr-xr-x. 3 michael michael 4096 Aug 21 19:57 include<br =
class=3D"">drwxr-xr-x. 3 michael michael 4096 Aug 21 19:57 lib<br =
class=3D"">drwxr-xr-x. 3 michael michael 4096 Aug 21 19:57 src<br =
class=3D"">[michael@localhost usr]$ pwd<br =
class=3D"">/home/michael/Devlab/poky/build-atmel/tmp/work/cortexa5t2hf-vfp=
-poky-linux-gnueabi/affinityng/0.1-r0/package/usr<br =
class=3D"">[michael@localhost usr]$ cd src<br =
class=3D"">[michael@localhost src]$ ls -la<br class=3D"">total 12<br =
class=3D"">drwxr-xr-x. 3 michael michael 4096 Aug 21 19:57 .<br =
class=3D"">drwxr-xr-x. 5 michael michael 4096 Aug 21 19:57 ..<br =
class=3D"">drwxr-xr-x. 3 michael michael 4096 Aug 21 19:57 debug<br =
class=3D"">[michael@localhost src]$<br class=3D"">=E2=80=9C<br =
class=3D"">5. It looks like that as result of package split, the =
&nbsp;include &amp; lib directories<br class=3D"">are used properly to =
build affinityng package, at least it is shown in<br =
class=3D"">packages-split properly.<br class=3D"">But then , &nbsp;the =
content of the src directory is causing the problem with QA.<br =
class=3D""><br class=3D"">6. At the same time, if I ask to build =
&nbsp;${PN}-dbg package in addition - both<br class=3D"">packages are =
build, no QA complains, and all src/debug/* are going into the -dbg<br =
class=3D"">package=E2=80=A6<br class=3D""><br class=3D"">I wonder,<br =
class=3D"">- why does the src directory appear within &nbsp;PKGD/usr? ( =
If there is no such<br class=3D"">directory within the ${D} =
directory...)<br class=3D"">- where is the definition for &nbsp;-dbg =
package is coming from, and is it possible<br class=3D"">to disable =
it?<br class=3D""><br class=3D"">May be somebody have the answer or =
suggestion what to check next=E2=80=A6.<br class=3D""><br =
class=3D"">Thanks for a kind attention to the matter.<br class=3D""><br =
class=3D"">Have a great day,<br class=3D"">Michael.<br class=3D""><br =
class=3D""><br class=3D""><br class=3D""></blockquote><br =
class=3D"">--<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">_______________________________________________<br =
class=3D"">bitbake-devel mailing list<br class=3D""><a =
href=3D"mailto:bitbake-devel@lists.openembedded.org" =
class=3D"">bitbake-devel@lists.openembedded.org</a><br class=3D""><a =
href=3D"http://lists.openembedded.org/mailman/listinfo/bitbake-devel" =
class=3D"">http://lists.openembedded.org/mailman/listinfo/bitbake-devel</a=
><br class=3D""></blockquote><span style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">--<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" =
class=3D"">_______________________________________________</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">bitbake-devel mailing list</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"mailto:bitbake-devel@lists.openembedded.org" style=3D"font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" =
class=3D"">bitbake-devel@lists.openembedded.org</a><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"http://lists.openembedded.org/mailman/listinfo/bitbake-devel" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" =
class=3D"">http://lists.openembedded.org/mailman/listinfo/bitbake-devel</a=
></div></blockquote></div><br class=3D""></body></html>=

--Boundary_(ID_DnNM/BIny5KVBAO2uiwhkA)--
