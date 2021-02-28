Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.4100.1614497640385817199
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Feb 2021 23:34:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=JbmTM0C5;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [100.115.92.199] (cpe-68-201-52-49.elp.res.rr.com [68.201.52.49])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3905720B6C40;
	Sat, 27 Feb 2021 23:33:58 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3905720B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1614497639;
	bh=nWJJCGtoeCd4Wge1L6eneEfyRpWBt+8RZnAJhTctRAk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=JbmTM0C548yqr3v4Xc6oYlIJirzCoI7Kauqp/ao46gF98TnCevUabzL1cP8SaOvMw
	 Y7Jxo45YAMQgr3MdmCRYZ2ypNOz2sGI5io1c3T07GiqLWJclE/MvSEfviPLKS5ssE3
	 rtOV7mwg9/ibIa2K0V5AmkHnxFOMRr8ygME4CLh4=
Subject: Re: [OE-core][gatesgarth]Mongodb segfault on gatesgarth
To: jaewon <jaewon@xilinx.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "raj.khem@gmail.com" <raj.khem@gmail.com>,
 "mark.hatle@kernel.crashing.org" <mark.hatle@kernel.crashing.org>
References: <1662DDF3DEBE137F.7109@lists.openembedded.org>
 <1666819431BA8376.24730@lists.openembedded.org>
 <DEC7F172-E76A-49FB-8085-C080D976DB75@xilinx.com>
From: "Alejandro Hernandez Samaniego" <alhe@linux.microsoft.com>
Message-ID: <be8a7cdf-51d3-3179-24f5-e5afc5743e53@linux.microsoft.com>
Date: Sun, 28 Feb 2021 00:35:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <DEC7F172-E76A-49FB-8085-C080D976DB75@xilinx.com>
Content-Type: multipart/alternative;
 boundary="------------5A65CC6BFD6A136F2E7CAA81"
Content-Language: en-US

--------------5A65CC6BFD6A136F2E7CAA81
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hey Jaewon,

Once you're able to build with debugging symbols you'll see the segfault=
=20
comes at load time from libunwind, you could either build mongodb=20
without tcmalloc support (PACKAGECONFIG), or you can add=20
-DNO_TCMALLOC_SAMPLES to CPPFLAGS for gperftools, if that works out for=20
you send a patch to meta-oe.

Alejandro

On 2/26/21 3:17 PM, jaewon wrote:
>
> Turns out this mongodb segfault is not unique to gatesgarth, I =C2=A0see=
 it=20
> using master as well
>
> Anyone know of this issue?
>
> Thanks,
>
> Jaewon
>
> *From: *<openembedded-core@lists.openembedded.org> on behalf of=20
> "jaewon via lists.openembedded.org"=20
> <jaewon=3Dxilinx.com@lists.openembedded.org>
> *Reply-To: *Jaewon Lee <JAEWON@xilinx.com>
> *Date: *Tuesday, February 23, 2021 at 2:40 PM
> *To: *"openembedded-core@lists.openembedded.org"=20
> <openembedded-core@lists.openembedded.org>
> *Cc: *"raj.khem@gmail.com" <raj.khem@gmail.com>,=20
> "mark.hatle@kernel.crashing.org" <mark.hatle@kernel.crashing.org>
> *Subject: *Re: [OE-core][gatesgarth]Mongodb segfault on gatesgarth
>
> Hi,
>
> Still struggling with this issue,
>
> To summarize the steps that I took to see the mongodb segfault issue,
>
> Here are the steps I took,
>
> Download poky (gatesgarth)
>
> git clonehttps://git.yoctoproject.org/git/poky=20
> <https://git.yoctoproject.org/git/poky>-b gatesgarth
>
> openembedded (gatesgarth)
>
> git clonehttps://github.com/openembedded/meta-openembedded.git=20
> <https://github.com/openembedded/meta-openembedded.git>-b gatesgarth
>
> Add meta-oe layers to bblayers
>
> Add mongodb to IMAGE_INSTALL
>
> Build and runqemu =C2=A0core-image-minimal using qemuarm64
>
> After just these steps I am seeing segfault.
>
> Anyone know about this issue/what could possibly be the issue?
>
> If not, would also appreciate any pointers on debugging this issues,
>
> For debugging:
>
> Added the following to local.conf, (referenced=20
> this:https://developer.ridgerun.com/wiki/index.php?title=3DPreparing_Yoc=
to_Development_Environment_for_Debugging=20
> <https://developer.ridgerun.com/wiki/index.php?title=3DPreparing_Yocto_D=
evelopment_Environment_for_Debugging>)
>
> IMAGE_INSTALL_append =3D " mongodb mongodb-dbg"
>
> EXTRA_IMAGE_FEATURES +=3D " tools-debug"
>
> PACKAGE_DEBUG_SPLIT_STYLE =3D 'debug-file-directory'
>
> #Specifies to build packages with debugging information
>
> DEBUG_BUILD =3D "1"
>
> # Do not remove debug symbols
>
> INHIBIT_PACKAGE_STRIP =3D "1"
>
> # OPTIONAL: Do not split debug symbols in a separate file
>
> INHIBIT_PACKAGE_DEBUG_SPLIT=3D "1"
>
> Then using gdb on mongod, I get:
>
> Reading symbols frommongod...
>
> (No debugging symbols found inmongod)
>
> Noticed nothing is in the -dbg pkgs of mongod, =C2=A0(without=20
> =E2=80=9CPACKAGE_DEBUG_SPLIT_STYLE =3D 'debug-file-directory'=E2=80=9D, =
debug files are=20
> here: /usr/bin/.debug/mongod, but=C2=A0/usr/bin/.debug/mongod.debug is=
=20
> where gdb is expecting it, if I copy it as such I get the CRC mismatch=
=20
> issue below)
>
> Removed the following from the local.conf and added the following to=20
> mongod recipe:
>
> +120INHIBIT_PACKAGE_STRIP =3D "1"
>
> +121INHIBIT_PACKAGE_DEBUG_STRIP =3D "1"
>
> +122DEBUG_BUILD =3D "1"
>
> Now I see =C2=A0under mongodb-dbg:
>
> usr/lib/debug/usr/bin/mongod.debug
>
> but when running gdb I see
>
> warning: the debug information found in=20
> "/usr/lib/debug//usr/bin/mongod.debug" does not match=20
> "/usr/bin/mongod" (CRC mismatch).
>
> (No debugging symbols found inmongod)
>
> Tried the same experiment in zeus, I get,
>
> Reading symbols frommongod...
>
> Reading symbols from/usr/bin/.debug/mongod...
>
> BFD: error: /usr/bin/.debug/mongod(.debug_info) is too large=20
> (0x4d617681 bytes)
>
> warning: Can't read data for section '.debug_info' in file=20
> '/usr/bin/.debug/mongod'
>
> (No debugging symbols found in /usr/bin/.debug/mongod)
>
> Am I missing something here?
>
> Any pointers would be much appreciated!
>
> Thanks,
>
> Jaewon
>
> *From: *<openembedded-core@lists.openembedded.org> on behalf of=20
> "jaewon via lists.openembedded.org"=20
> <jaewon=3Dxilinx.com@lists.openembedded.org>
> *Reply-To: *Jaewon Lee <JAEWON@xilinx.com>
> *Date: *Thursday, February 11, 2021 at 6:07 PM
> *To: *"openembedded-core@lists.openembedded.org"=20
> <openembedded-core@lists.openembedded.org>
> *Subject: *[OE-core][gatesgarth]Mongodb segfault on gatesgarth
>
> Hello all,
>
> Im seeing a segfault running mongod, tested on pure upstream poky and=20
> openembedded layers (gatesgarth branch)
>
> Any known issues here on mongod in gatesgarth?
>
>
> Not a perfect test by any means but also tried mongodb version from=20
> zeus release where it was working and same issue.
>
> hoping to maybe get some pointers in the right direction to pinpoint=20
> issue, also having some trouble setting up debug environment correctly,
>
> Keep getting either =E2=80=98no debug symbols found=E2=80=99 or, =C2=A0=
=E2=80=98the debug info=20
> found in /usr/bin/.debug/mongod.debug does not match /usr/bin/mongod=20
> (CRC mismatch)=E2=80=99
>
> With what I think are all the correct flags setup to debug..
>
> INHIBIT_PACKAGE_STRIP =3D "1"
>
> INHIBIT_PACKAGE_DEBUG_STRIP =3D "1"
>
> INHIBIT_SYSROOT_STRIP =3D "1"
>
> DEBUG_BUILD =3D "1"
>
> PACKAGE_DEBUG_SPLIT_STYLE =3D 'debug-file-directory'
>
> Adding mongodb-dbg,=C2=A0=C2=A0 adding tools-debug
>
> Any pointers would be much appreciated!
>
> Thanks,
>
> Jaewon
>
>
>=20
>

--------------5A65CC6BFD6A136F2E7CAA81
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body>
    <p>Hey Jaewon,</p>
    <p>Once you're able to build with debugging symbols you'll see the
      segfault comes at load time from libunwind, you could either build
      mongodb without tcmalloc support (PACKAGECONFIG), or you can add
      -DNO_TCMALLOC_SAMPLES to CPPFLAGS for gperftools, if that works
      out for you send a patch to meta-oe.<br>
    </p>
    <p>Alejandro<br>
    </p>
    <div class=3D"moz-cite-prefix">On 2/26/21 3:17 PM, jaewon wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:DEC7F172-E76A-49FB-8085-C080D976DB75@xilinx.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUT=
F-8">
      <meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered
        medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Menlo;
	panose-1:2 11 6 9 3 8 4 2 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}p.p1, li.p1, div.p1
	{mso-style-name:p1;
	margin:0in;
	font-size:8.5pt;
	font-family:Menlo;
	color:black;}p.p2, li.p2, div.p2
	{mso-style-name:p2;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}span.s3
	{mso-style-name:s3;}span.apple-converted-space
	{mso-style-name:apple-converted-space;}span.s1
	{mso-style-name:s1;}span.s2
	{mso-style-name:s2;}span.apple-tab-span
	{mso-style-name:apple-tab-span;}span.EmailStyle26
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}div.WordSection1
	{page:WordSection1;}</style>
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal">Turns out this mongodb segfault is not
          unique to gatesgarth, I =C2=A0see it using master as well<o:p></=
o:p></p>
        <p class=3D"MsoNormal">Anyone know of this issue?<o:p></o:p></p>
        <p class=3D"MsoNormal"><o:p>=C2=A0</o:p></p>
        <p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
        <p class=3D"MsoNormal">Jaewon<o:p></o:p></p>
        <p class=3D"MsoNormal"><o:p>=C2=A0</o:p></p>
        <div style=3D"border:none;border-top:solid #B5C4DF
          1.0pt;padding:3.0pt 0in 0in 0in">
          <p class=3D"MsoNormal" style=3D"margin-left:.5in"><b><span
                style=3D"font-size:12.0pt;color:black">From:
              </span></b><span style=3D"font-size:12.0pt;color:black"><a c=
lass=3D"moz-txt-link-rfc2396E" href=3D"mailto:openembedded-core@lists.opene=
mbedded.org">&lt;openembedded-core@lists.openembedded.org&gt;</a>
              on behalf of "jaewon via lists.openembedded.org"
              <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:jaewon=3Dx=
ilinx.com@lists.openembedded.org">&lt;jaewon=3Dxilinx.com@lists.openembedde=
d.org&gt;</a><br>
              <b>Reply-To: </b>Jaewon Lee <a class=3D"moz-txt-link-rfc2396=
E" href=3D"mailto:JAEWON@xilinx.com">&lt;JAEWON@xilinx.com&gt;</a><br>
              <b>Date: </b>Tuesday, February 23, 2021 at 2:40 PM<br>
              <b>To: </b><a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:openembedded-core@lists.openembedded.org">"openembedded-core@lists.openemb=
edded.org"</a>
              <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:openembedd=
ed-core@lists.openembedded.org">&lt;openembedded-core@lists.openembedded.or=
g&gt;</a><br>
              <b>Cc: </b><a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:raj.khem@gmail.com">"raj.khem@gmail.com"</a>
              <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:raj.khem@g=
mail.com">&lt;raj.khem@gmail.com&gt;</a>,
              <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:mark.hatle=
@kernel.crashing.org">"mark.hatle@kernel.crashing.org"</a>
              <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:mark.hatle=
@kernel.crashing.org">&lt;mark.hatle@kernel.crashing.org&gt;</a><br>
              <b>Subject: </b>Re: [OE-core][gatesgarth]Mongodb segfault
              on gatesgarth<o:p></o:p></span></p>
        </div>
        <div>
          <p class=3D"MsoNormal" style=3D"margin-left:.5in"><o:p>=C2=A0</o=
:p></p>
        </div>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in">Hi,<o:p></o:p></=
p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0<o:p></o:p=
></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in">Still struggling
          with this issue, <o:p>
          </o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in">To summarize the
          steps that I took <span style=3D"color:black">
            to see the mongodb segfault issue,<span
              class=3D"apple-converted-space">=C2=A0</span></span><o:p></o=
:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">=C2=A0</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">Here are the steps I took,</span><o:=
p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">Download poky (gatesgarth)<span
              class=3D"apple-converted-space">=C2=A0</span></span><o:p></o=
:p></p>
        <p class=3D"p1" style=3D"margin-left:.5in;font-variant-caps:
          normal;orphans: auto;text-align:start;widows:
          auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width:
          0px;word-spacing:0px">
          <span class=3D"s1">git clone</span><span
            class=3D"apple-converted-space">=C2=A0</span><span class=3D"s1=
"><a
              href=3D"https://git.yoctoproject.org/git/poky"
              moz-do-not-send=3D"true">https://git.yoctoproject.org/git/po=
ky</a></span><span
            class=3D"apple-converted-space">=C2=A0</span><span class=3D"s1=
">-b
            gatesgarth</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">openembedded (gatesgarth)</span><o:p=
></o:p></p>
        <p class=3D"p1" style=3D"margin-left:.5in;font-variant-caps:
          normal;orphans: auto;text-align:start;widows:
          auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width:
          0px;word-spacing:0px">
          <span class=3D"s1">git clone</span><span
            class=3D"apple-converted-space">=C2=A0</span><span class=3D"s1=
"><a
              href=3D"https://github.com/openembedded/meta-openembedded.gi=
t"
              moz-do-not-send=3D"true">https://github.com/openembedded/met=
a-openembedded.git</a></span><span
            class=3D"apple-converted-space">=C2=A0</span><span class=3D"s1=
">-b
            gatesgarth</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">Add meta-oe layers to bblayers</span=
><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">Add mongodb to IMAGE_INSTALL</span><=
o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">=C2=A0</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">Build and runqemu
            =C2=A0core-image-minimal using qemuarm64</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">After just these steps I am seeing
            segfault.</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0<o:p></o:p=
></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in">Anyone know abou=
t
          this issue/what could possibly be the issue?<o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0<o:p></o:p=
></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0<o:p></o:p=
></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0<o:p></o:p=
></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in">If not, would al=
so
          appreciate any pointers on debugging this issues,
          <o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0<o:p></o:p=
></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in"><span
            style=3D"color:black">For debugging:</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">=C2=A0</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">Added the following to local.conf,
            (referenced this:<span class=3D"apple-converted-space">=C2=A0<=
/span><a
href=3D"https://developer.ridgerun.com/wiki/index.php?title=3DPreparing_Yo=
cto_Development_Environment_for_Debugging"
              moz-do-not-send=3D"true">https://developer.ridgerun.com/wiki=
/index.php?title=3DPreparing_Yocto_Development_Environment_for_Debugging</a=
>)</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">=C2=A0</span><o:p></o:p></p>
        <p class=3D"p1" style=3D"margin-left:1.0in;font-variant-caps:
          normal;orphans: auto;text-align:start;widows:
          auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width:
          0px;word-spacing:0px">
          <span class=3D"s1">IMAGE_INSTALL_append =3D " mongodb mongodb-db=
g"</span><o:p></o:p></p>
        <p class=3D"p1" style=3D"margin-left:1.0in;font-variant-caps:
          normal;orphans: auto;text-align:start;widows:
          auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width:
          0px;word-spacing:0px">
          <span class=3D"s1">EXTRA_IMAGE_FEATURES +=3D " tools-debug"</spa=
n><o:p></o:p></p>
        <p class=3D"p1" style=3D"margin-left:1.0in;font-variant-caps:
          normal;orphans: auto;text-align:start;widows:
          auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width:
          0px;word-spacing:0px">
          <span class=3D"s1">PACKAGE_DEBUG_SPLIT_STYLE =3D
            'debug-file-directory'</span><o:p></o:p></p>
        <p class=3D"p1" style=3D"margin-left:1.0in;font-variant-caps:
          normal;orphans: auto;text-align:start;widows:
          auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width:
          0px;word-spacing:0px">
          =C2=A0<o:p></o:p></p>
        <p class=3D"p1" style=3D"margin-left:1.0in;font-variant-caps:
          normal;orphans: auto;text-align:start;widows:
          auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width:
          0px;word-spacing:0px">
          <span class=3D"s1">#Specifies to build packages with debugging
            information</span><o:p></o:p></p>
        <p class=3D"p1" style=3D"margin-left:1.0in;font-variant-caps:
          normal;orphans: auto;text-align:start;widows:
          auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width:
          0px;word-spacing:0px">
          <span class=3D"s1">DEBUG_BUILD =3D "1"</span><o:p></o:p></p>
        <p class=3D"p1" style=3D"margin-left:1.0in;font-variant-caps:
          normal;orphans: auto;text-align:start;widows:
          auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width:
          0px;word-spacing:0px">
          <span class=3D"s1"># Do not remove debug symbols</span><o:p></o:=
p></p>
        <p class=3D"p1" style=3D"margin-left:1.0in;font-variant-caps:
          normal;orphans: auto;text-align:start;widows:
          auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width:
          0px;word-spacing:0px">
          <span class=3D"s1">INHIBIT_PACKAGE_STRIP =3D "1"</span><o:p></o:=
p></p>
        <p class=3D"p1" style=3D"margin-left:1.0in;font-variant-caps:
          normal;orphans: auto;text-align:start;widows:
          auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width:
          0px;word-spacing:0px">
          <span class=3D"s1"># OPTIONAL: Do not split debug symbols in a
            separate file</span><o:p></o:p></p>
        <p class=3D"p1" style=3D"margin-left:1.0in;font-variant-caps:
          normal;orphans: auto;text-align:start;widows:
          auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width:
          0px;word-spacing:0px">
          <span class=3D"s1">INHIBIT_PACKAGE_DEBUG_SPLIT=3D "1"</span><o:p=
></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">=C2=A0</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">Then using gdb on mongod, I get:<spa=
n
              class=3D"apple-converted-space">=C2=A0</span></span><o:p></o=
:p></p>
        <p class=3D"p1" style=3D"margin-left:1.0in;font-variant-caps:
          normal;orphans: auto;text-align:start;widows:
          auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width:
          0px;word-spacing:0px">
          <span class=3D"s1">Reading symbols from</span><span
            class=3D"apple-converted-space">=C2=A0</span><span class=3D"s2=
"><span
              style=3D"color:#2FB41D">mongod</span></span><span class=3D"s=
1">...</span><o:p></o:p></p>
        <p class=3D"p1" style=3D"margin-left:1.0in;font-variant-caps:
          normal;orphans: auto;text-align:start;widows:
          auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width:
          0px;word-spacing:0px">
          <span class=3D"s1">(No debugging symbols found in</span><span
            class=3D"apple-converted-space">=C2=A0</span><span class=3D"s2=
"><span
              style=3D"color:#2FB41D">mongod</span></span><span class=3D"s=
1">)</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">=C2=A0</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">Noticed nothing is in the -dbg pkgs
            of mongod, =C2=A0(without =E2=80=9C<span class=3D"s1">PACKAGE_=
DEBUG_SPLIT_STYLE
              =3D 'debug-file-directory'=E2=80=9D, debug files are here:
              /usr/bin/.debug/mongod, but</span><span
              class=3D"apple-converted-space">=C2=A0</span></span><span
style=3D"font-size:11.5pt;font-family:&quot;Arial&quot;,sans-serif;color:#=
1D1C1D;background:white">=C2=A0/usr/bin/.debug/mongod.debug
            is where gdb is expecting it, if I copy it as such I get the
            CRC mismatch issue below)</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">=C2=A0</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">Removed the following from the
            local.conf and added the following to mongod recipe:</span><o:=
p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">=C2=A0</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:1.0in;caret-color:
          rgb(0, 0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span
style=3D"font-size:8.5pt;font-family:Menlo;color:#4E7702;background:#4E770=
2">+<span
              class=3D"apple-converted-space">=C2=A0</span></span><span
            style=3D"font-size:8.5pt;font-family:Menlo;color:#D4D618">120<=
span
              class=3D"apple-converted-space">=C2=A0</span></span><span
            style=3D"font-size:8.5pt;font-family:Menlo;color:black">INHIBI=
T_PACKAGE_STRIP
            =3D "1"</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:1.0in;caret-color:
          rgb(0, 0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span
style=3D"font-size:8.5pt;font-family:Menlo;color:#4E7702;background:#4E770=
2">+<span
              class=3D"apple-converted-space">=C2=A0</span></span><span
            style=3D"font-size:8.5pt;font-family:Menlo;color:#D4D618">121<=
span
              class=3D"apple-converted-space">=C2=A0</span></span><span
            style=3D"font-size:8.5pt;font-family:Menlo;color:black">INHIBI=
T_PACKAGE_DEBUG_STRIP
            =3D "1"</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:1.0in;caret-color:
          rgb(0, 0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span
style=3D"font-size:8.5pt;font-family:Menlo;color:#4E7702;background:#4E770=
2">+<span
              class=3D"apple-converted-space">=C2=A0</span></span><span
            style=3D"font-size:8.5pt;font-family:Menlo;color:#D4D618">122<=
span
              class=3D"apple-converted-space">=C2=A0</span></span><span
            style=3D"font-size:8.5pt;font-family:Menlo;color:black">DEBUG_=
BUILD
            =3D "1"</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">=C2=A0</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">Now I see =C2=A0under mongodb-dbg:<s=
pan
              class=3D"apple-converted-space">=C2=A0</span></span><o:p></o=
:p></p>
        <p class=3D"p1" style=3D"margin-left:1.0in;font-variant-caps:
          normal;orphans: auto;text-align:start;widows:
          auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width:
          0px;word-spacing:0px">
          <span class=3D"s1">usr/lib/debug/usr/bin/mongod.debug</span><spa=
n
            class=3D"apple-converted-space">=C2=A0</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">=C2=A0</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">but when running gdb I see<span
              class=3D"apple-converted-space">=C2=A0</span></span><o:p></o=
:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">=C2=A0</span><o:p></o:p></p>
        <p class=3D"p1" style=3D"margin-left:1.0in;font-variant-caps:
          normal;orphans: auto;text-align:start;widows:
          auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width:
          0px;word-spacing:0px">
          <span class=3D"s1">warning: the debug information found in
            "/usr/lib/debug//usr/bin/mongod.debug" does not match
            "/usr/bin/mongod" (CRC mismatch).</span><o:p></o:p></p>
        <p class=3D"p1" style=3D"margin-left:1.0in;font-variant-caps:
          normal;orphans: auto;text-align:start;widows:
          auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width:
          0px;word-spacing:0px">
          <span class=3D"s1">(No debugging symbols found in</span><span
            class=3D"apple-converted-space">=C2=A0</span><span class=3D"s2=
"><span
              style=3D"color:#2FB41D">mongod</span></span><span class=3D"s=
1">)</span><o:p></o:p></p>
        <p class=3D"p1" style=3D"margin-left:.5in;font-variant-caps:
          normal;orphans: auto;text-align:start;widows:
          auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width:
          0px;word-spacing:0px">
          <span class=3D"s1">=C2=A0</span><o:p></o:p></p>
        <p class=3D"p1" style=3D"margin-left:.5in;font-variant-caps:
          normal;orphans: auto;text-align:start;widows:
          auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width:
          0px;word-spacing:0px">
          =C2=A0<o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">Tried the same experiment in zeus, I
            get,</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">=C2=A0</span><o:p></o:p></p>
        <p class=3D"p1" style=3D"margin-left:1.0in;font-variant-caps:
          normal;orphans: auto;text-align:start;widows:
          auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width:
          0px;word-spacing:0px">
          <span class=3D"s1">Reading symbols from</span><span
            class=3D"apple-converted-space">=C2=A0</span><span class=3D"s2=
"><span
              style=3D"color:#2FB41D">mongod</span></span><span class=3D"s=
1">...</span><o:p></o:p></p>
        <p class=3D"p1" style=3D"margin-left:1.0in;font-variant-caps:
          normal;orphans: auto;text-align:start;widows:
          auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width:
          0px;word-spacing:0px">
          <span class=3D"apple-tab-span">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0</span><span
            class=3D"apple-converted-space">=C2=A0</span><span class=3D"s1=
">Reading
            symbols from</span><span class=3D"apple-converted-space">=C2=
=A0</span><span
            class=3D"s2"><span style=3D"color:#2FB41D">/usr/bin/.debug/mon=
god</span></span><span
            class=3D"s1">...</span><o:p></o:p></p>
        <p class=3D"p1" style=3D"margin-left:1.0in;font-variant-caps:
          normal;orphans: auto;text-align:start;widows:
          auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width:
          0px;word-spacing:0px">
          <span class=3D"s1">BFD: error:
            /usr/bin/.debug/mongod(.debug_info) is too large (0x4d617681
            bytes)</span><o:p></o:p></p>
        <p class=3D"p2"
style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-=
left:1.0in;font-variant-caps:
          normal;orphans: auto;text-align:start;widows:
          auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width:
          0px;word-spacing:0px">
          <span style=3D"font-size:8.5pt;font-family:Menlo;color:black">=
=C2=A0</span><o:p></o:p></p>
        <p class=3D"p1" style=3D"margin-left:1.0in;font-variant-caps:
          normal;orphans: auto;text-align:start;widows:
          auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width:
          0px;word-spacing:0px">
          <span class=3D"s1">warning: Can't read data for section
            '.debug_info' in file '/usr/bin/.debug/mongod'</span><o:p></o:=
p></p>
        <p class=3D"p1" style=3D"margin-left:1.0in;font-variant-caps:
          normal;orphans: auto;text-align:start;widows:
          auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width:
          0px;word-spacing:0px">
          <span class=3D"s1">(No debugging symbols found in
            /usr/bin/.debug/mongod)</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">=C2=A0</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in;caret-color: rgb(=
0,
          0, 0);font-variant-caps: normal;orphans:
          auto;text-align:start;widows: auto;-webkit-text-size-adjust:
          auto;-webkit-text-stroke-width: 0px;word-spacing:0px">
          <span style=3D"color:black">Am I missing something here?</span><=
o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in"><span
            style=3D"color:black">Any pointers would be much appreciated!<=
/span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in"><span
            style=3D"color:black">=C2=A0</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in"><span
            style=3D"color:black">Thanks,</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in"><span
            style=3D"color:black">Jaewon=C2=A0</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0<o:p></o:p=
></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0<o:p></o:p=
></p>
        <p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0<o:p></o:p=
></p>
        <div style=3D"border:none;border-top:solid #B5C4DF
          1.0pt;padding:3.0pt 0in 0in 0in">
          <p class=3D"MsoNormal" style=3D"margin-left:1.0in"><b><span
                style=3D"font-size:12.0pt;color:black">From:
              </span></b><span style=3D"font-size:12.0pt;color:black"><a c=
lass=3D"moz-txt-link-rfc2396E" href=3D"mailto:openembedded-core@lists.opene=
mbedded.org">&lt;openembedded-core@lists.openembedded.org&gt;</a>
              on behalf of "jaewon via lists.openembedded.org"
              <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:jaewon=3Dx=
ilinx.com@lists.openembedded.org">&lt;jaewon=3Dxilinx.com@lists.openembedde=
d.org&gt;</a><br>
              <b>Reply-To: </b>Jaewon Lee <a class=3D"moz-txt-link-rfc2396=
E" href=3D"mailto:JAEWON@xilinx.com">&lt;JAEWON@xilinx.com&gt;</a><br>
              <b>Date: </b>Thursday, February 11, 2021 at 6:07 PM<br>
              <b>To: </b><a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:openembedded-core@lists.openembedded.org">"openembedded-core@lists.openemb=
edded.org"</a>
              <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:openembedd=
ed-core@lists.openembedded.org">&lt;openembedded-core@lists.openembedded.or=
g&gt;</a><br>
              <b>Subject: </b>[OE-core][gatesgarth]Mongodb segfault on
              gatesgarth</span><o:p></o:p></p>
        </div>
        <div>
          <p class=3D"MsoNormal" style=3D"margin-left:1.0in">=C2=A0<o:p></=
o:p></p>
        </div>
        <p class=3D"MsoNormal" style=3D"margin-left:1.0in">Hello all,<o:p>=
</o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:1.0in">=C2=A0<o:p></o:=
p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:1.0in">Im seeing a
          segfault running mongod, tested on pure upstream poky and
          openembedded layers (gatesgarth branch)<o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:1.0in">Any known issue=
s
          here on mongod in gatesgarth?
          <o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:1.0in"><br>
          Not a perfect test by any means but also tried mongodb version
          from zeus release where it was working and same issue.<o:p></o:p=
></p>
        <p class=3D"MsoNormal" style=3D"margin-left:1.0in">hoping to maybe
          get some pointers in the right direction to pinpoint issue,
          also having some trouble setting up debug environment
          correctly,
          <o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:1.0in">Keep getting
          either =E2=80=98no debug symbols found=E2=80=99 or, =C2=A0=E2=80=
=
=98the debug info found in
          /usr/bin/.debug/mongod.debug does not match /usr/bin/mongod
          (CRC mismatch)=E2=80=99<o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:1.0in">With what I thi=
nk
          are all the correct flags setup to debug..
          <o:p></o:p></p>
        <p class=3D"p1" style=3D"margin-left:1.0in"><span class=3D"s3">INH=
IBIT_PACKAGE_STRIP
            =3D "1"</span><o:p></o:p></p>
        <p class=3D"p1" style=3D"margin-left:1.0in"><span class=3D"s3">INH=
IBIT_PACKAGE_DEBUG_STRIP
            =3D "1"</span><o:p></o:p></p>
        <p class=3D"p1" style=3D"margin-left:1.0in"><span class=3D"s3">INH=
IBIT_SYSROOT_STRIP
            =3D "1"</span><o:p></o:p></p>
        <p class=3D"p1" style=3D"margin-left:1.0in"><span class=3D"s3">DEB=
UG_BUILD
            =3D "1"</span><o:p></o:p></p>
        <p class=3D"p1" style=3D"margin-left:1.0in"><span class=3D"s3">=C2=
=
=A0</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:1.0in"><span
            style=3D"font-size:8.5pt;font-family:Menlo;color:black">PACKAG=
E_DEBUG_SPLIT_STYLE
            =3D
          </span><span
            style=3D"font-size:8.5pt;font-family:Menlo;color:#F300F5">'deb=
ug-file-directory'</span><o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:1.0in">Adding
          mongodb-dbg,=C2=A0=C2=A0 adding tools-debug<o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:1.0in">=C2=A0<o:p></o:=
p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:1.0in">Any pointers
          would be much appreciated!<o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:1.0in">=C2=A0<o:p></o:=
p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:1.0in">Thanks,<o:p></o=
:p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:1.0in">Jaewon<o:p></o:=
p></p>
        <p class=3D"MsoNormal" style=3D"margin-left:1.0in">=C2=A0<o:p></o:=
p></p>
      </div>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">


</pre>
    </blockquote>
  </body>
</html>

--------------5A65CC6BFD6A136F2E7CAA81--
