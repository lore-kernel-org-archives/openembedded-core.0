Return-Path: <steffen.olsen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EEA5C48BC4
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 12:35:45 +0000 (UTC)
Subject: Dbus EXTRA_OECONF
To: openembedded-core@lists.openembedded.org
From: "Steffen Olsen" <steffen.olsen@gmail.com>
X-Originating-Location: =?UTF-8?B?TGlsbGVzdHLDuG0sIFZpa2VuLCBOTw==?= (195.159.183.44)
X-Originating-Platform: Mac Safari 17.2
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 20 Feb 2024 04:35:37 -0800
Message-ID: <PsPw.1708432537487658267.ZIry@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="sMRep9DFxUzxcNMxrzD3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 12:35:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195914

--sMRep9DFxUzxcNMxrzD3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

We are currently in the process of examining a memory leak in systemd, whic=
h has led us to investigate how dbus is built for our targets (we are curre=
ntly using Kirkstone).

When kirkstone was introduced, there was made a couple of changes in how db=
us is built (oe-core cfecef ( https://git.openembedded.org/openembedded-cor=
e/commit/meta/recipes-core/dbus?h=3Dkirkstone&id=3Dcfecef4e6925865961858d0f=
e5ffc7794c71cd3b ) ). It seems like the dbus-test and dbus recipes were mer=
ged, which ultimately changed how (normal) dbus is built. Especially intere=
sting is the changes on EXTRA_OECONF where the following flags are enabled =
for the "ordinary" dbus recipe

* --enable-tests
* --enable-checks
* --enable-asserts

In dunfell, it seems dbus is built using '--disable-tests'

As far as I can understand, these flags are now enabled for "production bui=
ld of dbus". We definitely see a link between the mentioned systemd memory =
leak and the introduction of these flags (especially the '--enable-tests').=
 Our question is really about whether these flags should be enabled when bi=
tbaking production dbus? When building dbus with the current recipe we do g=
et the following result in the dbus log.do_configure log file

>=20
> NOTE: building with unit tests increases the size of the installed librar=
y
> and renders it insecure

>=20
> NOTE: building with assertions increases library size and decreases
> performance.

Further, from official dbus maintainers we have the following in the NEWS (=
 https://gitlab.freedesktop.org/dbus/dbus/-/blob/16232bdd339cb8bf4ef9e7d51c=
e1bcafa574155a/NEWS#L39 ) describing that production builds should be compi=
led with checks but without assertions. To have some comparison we have tri=
ed looking into what other distros do when building dbus, and as far as we =
can see, at least debian does not set these flags (some are set in dbg pack=
ages).

Obviously, we can make a bbappend or something similar to cater for our nee=
ds, but we are wondering if this recipe is correct as it stands at the mome=
nt. We would appreciate any input on the matter.

br

Jomar and Steffen

--sMRep9DFxUzxcNMxrzD3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<br />Hi,&nbsp;<br /><br />We are currently in the process of examining a m=
emory leak in systemd, which has led us to investigate how dbus is built fo=
r our targets (we are currently using Kirkstone).&nbsp;<br /><br />When kir=
kstone was introduced, there was made a couple of changes in how dbus is bu=
ilt (oe-core&nbsp;<a style=3D"color: blue; font-family: monospace; font-siz=
e: 12px;" href=3D"https://git.openembedded.org/openembedded-core/commit/met=
a/recipes-core/dbus?h=3Dkirkstone&amp;id=3Dcfecef4e6925865961858d0fe5ffc779=
4c71cd3b">cfecef</a>). It seems like the dbus-test and dbus recipes were me=
rged, which ultimately changed how (normal) dbus is built. Especially inter=
esting is the changes on EXTRA_OECONF where the following flags are enabled=
 for the "ordinary" dbus recipe&nbsp;<br />
<ul>
<li><span style=3D"caret-color: #008000; color: #000000; font-family: monos=
pace; font-size: 13.333333px; white-space: pre;">--enable-tests</span></li>
<li><span style=3D"caret-color: #008000; color: #000000; font-family: monos=
pace; font-size: 13.333333px; white-space: pre;"><span style=3D"font-size: =
13.333333px;">--enable-checks</span></span></li>
<li><span style=3D"caret-color: #008000; color: #000000; font-family: monos=
pace; font-size: 13.333333px; white-space: pre;"><span style=3D"font-size: =
13.333333px;"><span style=3D"font-size: 13.333333px;">--enable-asserts</spa=
n></span></span></li>
</ul>
In dunfell, it seems dbus is built using '--disable-tests'<br />&nbsp;<br /=
>As far as I can understand, these flags are now enabled for "production bu=
ild of dbus". We definitely see a link between the mentioned systemd memory=
 leak and the introduction of these flags (especially the '--enable-tests')=
. Our question is really about whether these flags should be enabled when b=
itbaking production dbus? When building dbus with the current recipe we do =
get the following result in the dbus log.do_configure log file<br /><span s=
tyle=3D"white-space: pre-wrap; color: #1d1c1d; font-family: Monaco, Menlo, =
Consolas, 'Courier New', monospace; font-size: 12px; font-variant-ligatures=
: none; orphans: 2; widows: 2; background-color: rgba(29, 28, 29, 0.04); te=
xt-decoration-thickness: initial; text-decoration-style: initial; text-deco=
ration-color: initial;"><br /></span>
<blockquote><span style=3D"caret-color: #1d1c1d; color: #1d1c1d; font-famil=
y: Monaco, Menlo, Consolas, 'Courier New', monospace; font-size: 12px; orph=
ans: 2; white-space: pre-wrap; widows: 2; background-color: rgba(29, 28, 29=
, 0.04);">NOTE: building with unit tests increases the size of the installe=
d library and renders it insecure</span></blockquote>
<blockquote><span style=3D"color: #1d1c1d; font-family: Monaco, Menlo, Cons=
olas, 'Courier New', monospace; font-size: 12px; orphans: 2; white-space: p=
re-wrap; widows: 2; background-color: rgba(29, 28, 29, 0.04);">NOTE: buildi=
ng with assertions increases library size and decreases performance.</span>=
&nbsp;</blockquote>
Further, from official dbus maintainers we have the following in the&nbsp;<=
a href=3D"https://gitlab.freedesktop.org/dbus/dbus/-/blob/16232bdd339cb8bf4=
ef9e7d51ce1bcafa574155a/NEWS#L39">NEWS</a>&nbsp;describing that production =
builds should be compiled with checks but without assertions. To have some =
comparison we have tried looking into what other distros do when building d=
bus, and as far as we can see, at least debian does not set these flags (so=
me are set in dbg packages).&nbsp;<br /><br />Obviously, we can make a bbap=
pend or something similar to cater for our needs, but we are wondering if t=
his recipe is correct as it stands at the moment. We would appreciate any i=
nput on the matter.<br /><br />br<br /><br />Jomar and Steffen

--sMRep9DFxUzxcNMxrzD3--

