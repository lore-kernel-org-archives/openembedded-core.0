Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B97417312D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 19:24:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Apr 2017 12:24:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,250,1488873600"; 
	d="scan'208,217";a="1123402086"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
	by orsmga001.jf.intel.com with ESMTP; 25 Apr 2017 12:24:09 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.213]) by
	ORSMSX101.amr.corp.intel.com ([169.254.8.57]) with mapi id
	14.03.0319.002; Tue, 25 Apr 2017 12:24:08 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH 0/4] Reproducible binaries
Thread-Index: AQHSve/H0RnFKsoUjUy3r4mWvWsL7aHW3z0A//+V67M=
Date: Tue, 25 Apr 2017 19:24:08 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B61194BE74@ORSMSX112.amr.corp.intel.com>
References: <1493144048-12455-1-git-send-email-juro.bystricky@intel.com>,
	<CA+chaQfX1iYsYwqx4CMKuADmW75_VZStzZpdE-hw=ahtsDvdwg@mail.gmail.com>
In-Reply-To: <CA+chaQfX1iYsYwqx4CMKuADmW75_VZStzZpdE-hw=ahtsDvdwg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.139]
MIME-Version: 1.0
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Reproducible binaries
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
X-List-Received-Date: Tue, 25 Apr 2017 19:24:09 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_6E51916E4A1F32428260031F4C7CD2B61194BE74ORSMSX112amrcor_"

--_000_6E51916E4A1F32428260031F4C7CD2B61194BE74ORSMSX112amrcor_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The idea is that both builds have reproducible timestamps. So there may be =
different ways to determine the best way to get the stamp. My rationale was=
 that if the builds are from two different commits, the difference should b=
e reflected in the timestamp.  But I agree that two different commits
may in principle result in the same binary image. But without the last comm=
it you would end up with different binaries anyway, as the timestamp is usu=
ally taken from the time of the build.
________________________________
From: Martin Jansa [martin.jansa@gmail.com]
Sent: Tuesday, April 25, 2017 11:36 AM
To: Bystricky, Juro
Cc: Patches and discussions about the oe-core layer; jurobystricky@hotmail.=
com
Subject: Re: [OE-core] [PATCH 0/4] Reproducible binaries

Is using the last commit really that useful?

I would like to be able to compare 2 subsequent builds (ideally performed o=
n 2 different hosts with some small modification in metadata layers) and th=
e binaries not affected by those small metadata modifications should be the=
 same - which is not the case if we feed them with the top commit date.

The real world use-case is that we're doing daily official builds (which do=
n't use sstate for some bad reasons) and just comparing files-in-image.txt =
file from buildhistory shows that almost all binaries are different every d=
ay (just their size fluctuating +- 2 bytes from the linker mangling) and wh=
en something goes wrong, it's hard to find "the significant diff" when it's=
 always all different even when the 2nd build only had very small change in=
 image recipe.

On Tue, Apr 25, 2017 at 8:14 PM, Juro Bystricky <juro.bystricky@intel.com<m=
ailto:juro.bystricky@intel.com>> wrote:
This patch set contains several patches aimed to achieve reproducible binar=
ies.
Building reproducible binaries may remove certain intentional
randomness intended for increased security. Hence, it is reasonable
to expect there will be cases where this is not desirable.
The user can select his/her preferences via the variable
BUILD_REPRODUCIBLE_BINARIES. The variable defaults to "0" (do not
build reproducible binaries) in order to minimize any potential
regressions. (Once the reproducible binaries code is mature enough,
it can be set to "1".)

The patch set is rather simple, targeting the "low hanging fruit".
For debian packages we get a lot of binary identical packages simply by
exporting SOURCE_DATE_EPOCH.
For rootfs we get much fewer differences by modified prelinking and by
ensuring various timestamps are reproducible.


Juro Bystricky (4):
  bitbake.conf: new variable BUILD_REPRODUCIBLE_BINARIES
  base.bbclass: initial support for binary reproducibility
  image-preling.bbclass: support binary reproducibility
  rootfs-postcommands.bbclass: support binary reproducibility

 meta/classes/base.bbclass                | 82 ++++++++++++++++++++++++++++=
++++
 meta/classes/image-prelink.bbclass       |  9 +++-
 meta/classes/rootfs-postcommands.bbclass | 18 ++++++-
 meta/conf/bitbake.conf                   |  3 ++
 4 files changed, 109 insertions(+), 3 deletions(-)

--
2.7.4

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org<mailto:Openembedded-core@lists.ope=
nembedded.org>
http://lists.openembedded.org/mailman/listinfo/openembedded-core


--_000_6E51916E4A1F32428260031F4C7CD2B61194BE74ORSMSX112amrcor_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" id=3D"owaParaStyle">P {margin-top:0;margin-bottom:=
0;}</style>
</head>
<body fpstyle=3D"1" ocsi=3D"0">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">The idea is that both builds have reproducible timestamps. So there =
may be different ways to determine the best way to get the stamp. My ration=
ale was that if the builds are from
 two different commits, the difference should be reflected in the timestamp=
.&nbsp; But I agree that two different commits<br>
may in principle result in the same binary image. But without the last comm=
it you would end up with different binaries anyway, as the timestamp is usu=
ally taken from the time of the build.<br>
<div style=3D"font-family: Times New Roman; color: #000000; font-size: 16px=
">
<hr tabindex=3D"-1">
<div id=3D"divRpF588021" style=3D"direction: ltr;"><font size=3D"2" color=
=3D"#000000" face=3D"Tahoma"><b>From:</b> Martin Jansa [martin.jansa@gmail.=
com]<br>
<b>Sent:</b> Tuesday, April 25, 2017 11:36 AM<br>
<b>To:</b> Bystricky, Juro<br>
<b>Cc:</b> Patches and discussions about the oe-core layer; jurobystricky@h=
otmail.com<br>
<b>Subject:</b> Re: [OE-core] [PATCH 0/4] Reproducible binaries<br>
</font><br>
</div>
<div></div>
<div>
<div dir=3D"ltr">Is using the last commit really that useful?
<div><br>
</div>
<div>I would like to be able to compare 2 subsequent builds (ideally perfor=
med on 2 different hosts with some small modification in metadata layers) a=
nd the binaries not affected by those small metadata modifications should b=
e the same - which is not the case
 if we feed them with the top commit date.</div>
<div><br>
</div>
<div>The real world use-case is that we're doing daily official builds (whi=
ch don't use sstate for some bad reasons) and just comparing files-in-image=
.txt file from buildhistory shows that almost all binaries are different ev=
ery day (just their size fluctuating
 &#43;- 2 bytes from the linker mangling) and when something goes wrong, it=
's hard to find &quot;the significant diff&quot; when it's always all diffe=
rent even when the 2nd build only had very small change in image recipe.</d=
iv>
</div>
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">On Tue, Apr 25, 2017 at 8:14 PM, Juro Bystricky =
<span dir=3D"ltr">
&lt;<a href=3D"mailto:juro.bystricky@intel.com" target=3D"_blank">juro.byst=
ricky@intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex; border-left:1=
px #ccc solid; padding-left:1ex">
This patch set contains several patches aimed to achieve reproducible binar=
ies.<br>
Building reproducible binaries may remove certain intentional<br>
randomness intended for increased security. Hence, it is reasonable<br>
to expect there will be cases where this is not desirable.<br>
The user can select his/her preferences via the variable<br>
BUILD_REPRODUCIBLE_BINARIES. The variable defaults to &quot;0&quot; (do not=
<br>
build reproducible binaries) in order to minimize any potential<br>
regressions. (Once the reproducible binaries code is mature enough,<br>
it can be set to &quot;1&quot;.)<br>
<br>
The patch set is rather simple, targeting the &quot;low hanging fruit&quot;=
.<br>
For debian packages we get a lot of binary identical packages simply by<br>
exporting SOURCE_DATE_EPOCH.<br>
For rootfs we get much fewer differences by modified prelinking and by<br>
ensuring various timestamps are reproducible.<br>
<br>
<br>
Juro Bystricky (4):<br>
&nbsp; bitbake.conf: new variable BUILD_REPRODUCIBLE_BINARIES<br>
&nbsp; base.bbclass: initial support for binary reproducibility<br>
&nbsp; image-preling.bbclass: support binary reproducibility<br>
&nbsp; rootfs-postcommands.bbclass: support binary reproducibility<br>
<br>
&nbsp;meta/classes/base.bbclass&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | 82 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;<wbr>&#43;&#43;<br>
&nbsp;meta/classes/image-prelink.<wbr>bbclass&nbsp; &nbsp; &nbsp; &nbsp;|&n=
bsp; 9 &#43;&#43;&#43;-<br>
&nbsp;meta/classes/rootfs-<wbr>postcommands.bbclass | 18 &#43;&#43;&#43;&#4=
3;&#43;&#43;-<br>
&nbsp;meta/conf/bitbake.conf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;|&nbsp; 3 &#43;&#43;<br>
&nbsp;4 files changed, 109 insertions(&#43;), 3 deletions(-)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote>
</div>
<br>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_6E51916E4A1F32428260031F4C7CD2B61194BE74ORSMSX112amrcor_--
