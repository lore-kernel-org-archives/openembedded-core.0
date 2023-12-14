Return-Path: <an010@live.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630E0C4167B
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 21:34:42 +0000 (UTC)
Subject: install-buildtools fails #poky
To: openembedded-core@lists.openembedded.org
From: "Aleksandar Nikolic" <an010@live.com>
X-Originating-Location: CH (147.161.250.119)
X-Originating-Platform: Windows Chrome 120
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 14 Dec 2023 13:34:37 -0800
Message-ID: <aQyg.1702589530747273993.VOVe@lists.openembedded.org>
X-Old-Date: Thu, 14 Dec 2023 13:32:10 -0800
Content-Type: multipart/alternative; boundary="BVVYhtmcprmhyrzfPSOY"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 21:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192405
Message-ID: <20231214213437.ifoaU35vHMfxdLIUQpU1eqbe8ScjrnlQLDLb4t84RK4@z>

--BVVYhtmcprmhyrzfPSOY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I was trying to install the buildtools by using the scripts/install-buildto=
ols script, however the call fails. The issue I found seems a bit weird, as=
 IMHO the script would always fail, hence I am not sure whether it's really=
 an issue or I am misusing the script. Anyway, I am using the script from t=
he openembedded-core - OpenEmbedded Core layer ( https://git.openembedded.o=
rg/openembedded-core ) repository, commit=C2=A041390f52 (latest at the time=
 of writing).

The command executed:

>=20
> ./scripts/install-buildtools --debug --without-extended-buildtools
> --directory ./build-tools --base-url
> https://downloads.yoctoproject.org/releases/yocto --release yocto-4.0.14
> --installer-version 4.0.14

The command fails and its output is given in [1].

Now, I dug a bit deeper and found two potential issues (if they are even is=
sues, I am not sure anymore).

1. First one is in here ( https://git.openembedded.org/openembedded-core/tr=
ee/scripts/install-buildtools#n304 ). Basically, while environment variable=
s are read from build-tools/environment-setup-x86_64-pokysdk-linux (see [2]=
 for its content), some of them are read with double quotes (e.g. PATH ) an=
d as such written in os.environ ( here ( https://git.openembedded.org/opene=
mbedded-core/tree/scripts/install-buildtools#n306 ) ), which makes them not=
 correctly used later on. Some come without the double quotes and are fine =
to be used (e.g., PKG_CONFIG_LIBDIR ). A solution to this problem is removi=
ng the double quotes from envvar if present in the envvar, e.g., ENVVAR=3D"=
foo" becomes ENVVAR=3Dfoo and as such is written in os.environ.

2. Another issue I found is related to this line ( https://git.openembedded=
.org/openembedded-core/tree/scripts/install-buildtools#n334 ). If the comma=
nd is called with --directory , as in my case, the function starts_with wil=
l always fail because which_tool will never start with install_dir. The onl=
y case where this is not an issue is in when --directory is omitted, since =
INSTALL_DIR is used in that case and its a full path already. A solution is=
 also simple, we can just check if install_dir is in which_tool , instead o=
f whether which_tool starts with install_dir.

Now my question is am I misunderstanding something or am I misusing the ins=
tall-buildtools script somehow? If this is really an issue I'd be more than=
 happy to provide a patch.

Cheers
Aleksandar

[1]

>=20
> DEBUG: milestone regex: None
> INFO: Fetching buildtools installer
> INFO: Fetching buildtools installer checksum
> DEBUG: checksum regex match: <re.Match object; span=3D(0, 113),
> match=3D'62e811c2f1a91f6d2d5e07ee3031af9bff58c15f515ff5968>
> DEBUG: checksum:
> 62e811c2f1a91f6d2d5e07ee3031af9bff58c15f515ff59688bf39f1f8a4341d
> DEBUG: path: None
> DEBUG: filename: x86_64-buildtools-nativesdk-standalone-4.0.14.sh
> INFO: Checksum success
> INFO: Making installer executable
> DEBUG: os.stat_result(st_mode=3D33252, st_ino=3D2376165, st_dev=3D2080,
> st_nlink=3D1, st_uid=3D1000, st_gid=3D1000, st_size=3D29509071,
> st_atime=3D1702587153, st_mtime=3D1699048064, st_ctime=3D1702587153)
> Build tools installer version 4.0.14
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> You are about to install the SDK to
> "/home/anikolic/git/openembedded-core/build-tools". Proceed [Y/n]? Y
> Extracting SDK...........done
> Setting it up...done
> SDK has been successfully set up and is ready to be used.
> Each time you wish to use the SDK in a new shell session, you need to
> source the environment setup script e.g.
> $ .
> /home/anikolic/git/openembedded-core/build-tools/environment-setup-x86_64=
-pokysdk-linux
>=20
> INFO: Setting up the environment
> DEBUG: export regex: <re.Match object; span=3D(0, 361), match=3D'export
> PATH=3D"/home/anikolic/git/openembedded-core>
> DEBUG: env_var: PATH
> DEBUG: env_val:
> "/home/anikolic/git/openembedded-core/build-tools/sysroots/x86_64-pokysdk=
-linux/usr/bin:/home/anikolic/git/openembedded-core/build-tools/sysroots/x8=
6_64-pokysdk-linux/usr/sbin:/home/anikolic/git/openembedded-core/build-tool=
s/sysroots/x86_64-pokysdk-linux/bin:/home/anikolic/git/openembedded-core/bu=
ild-tools/sysroots/x86_64-pokysdk-linux/sbin:$PATH"
>=20
> DEBUG: export regex: <re.Match object; span=3D(0, 109), match=3D'export
> OECORE_NATIVE_SYSROOT=3D"/home/anikolic/git/>
> DEBUG: env_var: OECORE_NATIVE_SYSROOT
> DEBUG: env_val:
> "/home/anikolic/git/openembedded-core/build-tools/sysroots/x86_64-pokysdk=
-linux"
>=20
> DEBUG: export regex: <re.Match object; span=3D(0, 136), match=3D'export
> GIT_SSL_CAINFO=3D"/home/anikolic/git/openemb>
> DEBUG: env_var: GIT_SSL_CAINFO
> DEBUG: env_val:
> "/home/anikolic/git/openembedded-core/build-tools/sysroots/x86_64-pokysdk=
-linux/etc/ssl/certs/ca-certificates.crt"
>=20
> DEBUG: export regex: <re.Match object; span=3D(0, 135), match=3D'export
> SSL_CERT_FILE=3D"/home/anikolic/git/openembe>
> DEBUG: env_var: SSL_CERT_FILE
> DEBUG: env_val:
> "/home/anikolic/git/openembedded-core/build-tools/sysroots/x86_64-pokysdk=
-linux/etc/ssl/certs/ca-certificates.crt"
>=20
> DEBUG: export regex: <re.Match object; span=3D(0, 140), match=3D'export
> REQUESTS_CA_BUNDLE=3D"/home/anikolic/git/ope>
> DEBUG: env_var: REQUESTS_CA_BUNDLE
> DEBUG: env_val:
> "/home/anikolic/git/openembedded-core/build-tools/sysroots/x86_64-pokysdk=
-linux/etc/ssl/certs/ca-certificates.crt"
>=20
> DEBUG: export regex: <re.Match object; span=3D(0, 136), match=3D'export
> CURL_CA_BUNDLE=3D"/home/anikolic/git/openemb>
> DEBUG: env_var: CURL_CA_BUNDLE
> DEBUG: env_val:
> "/home/anikolic/git/openembedded-core/build-tools/sysroots/x86_64-pokysdk=
-linux/etc/ssl/certs/ca-certificates.crt"
>=20
> DEBUG: export regex: <re.Match object; span=3D(0, 80),
> match=3D'HOST_PKG_PATH=3D$(command -p pkg-config --variable=3D>
> DEBUG: env_var: HOST_PKG_PATH
> DEBUG: env_val: $(command -p pkg-config --variable=3Dpc_path pkg-config
> 2>/dev/null)
> DEBUG: export regex: <re.Match object; span=3D(0, 280), match=3D'export
> PKG_CONFIG_LIBDIR=3D/home/anikolic/git/opene>
> DEBUG: env_var: PKG_CONFIG_LIBDIR
> DEBUG: env_val:
> /home/anikolic/git/openembedded-core/build-tools/sysroots/x86_64-pokysdk-=
linux//usr/lib/pkgconfig:/home/anikolic/git/openembedded-core/build-tools/s=
ysroots/x86_64-pokysdk-linux//usr/share/pkgconfig:${HOST_PKG_PATH:-/usr/lib=
/pkgconfig:/usr/share/pkgconfig}DEBUG:
> export regex: None
> DEBUG: export regex: None
> DEBUG: export regex: None
> DEBUG: export regex: None
> DEBUG: export regex: None
> DEBUG: export regex: None
> DEBUG: export regex: None
> DEBUG: export regex: None
> INFO: Testing installation
> DEBUG: extended regex: None
> DEBUG: install_dir: ./build-tools
> DEBUG: cmd: ['/usr/bin/which', 'tar']
> DEBUG: tool: tar
> DEBUG: proc.args: ['/usr/bin/which', 'tar']
> DEBUG: proc.communicate(): output b''
> DEBUG: proc.communicate(): errors None
> DEBUG: which tar:
> ERROR: Something went wrong: tar not found in ./build-tools
> ERROR: Something went wrong: installation failed
>=20

[2]

>=20
> export
> PATH=3D"/home/anikolic/git/openembedded-core/build-tools/sysroots/x86_64-=
pokysdk-linux/usr/bin:/home/anikolic/git/openembedded-core/build-tools/sysr=
oots/x86_64-pokysdk-linux/usr/sbin:/home/anikolic/git/openembedded-core/bui=
ld-tools/sysroots/x86_64-pokysdk-linux/bin:/home/anikolic/git/openembedded-=
core/build-tools/sysroots/x86_64-pokysdk-linux/sbin:$PATH"
>=20
> export
> OECORE_NATIVE_SYSROOT=3D"/home/anikolic/git/openembedded-core/build-tools=
/sysroots/x86_64-pokysdk-linux"
>=20
> export
> GIT_SSL_CAINFO=3D"/home/anikolic/git/openembedded-core/build-tools/sysroo=
ts/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"
>=20
> export
> SSL_CERT_FILE=3D"/home/anikolic/git/openembedded-core/build-tools/sysroot=
s/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"
>=20
> export
> REQUESTS_CA_BUNDLE=3D"/home/anikolic/git/openembedded-core/build-tools/sy=
sroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"
>=20
> export
> CURL_CA_BUNDLE=3D"/home/anikolic/git/openembedded-core/build-tools/sysroo=
ts/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"
>=20
> HOST_PKG_PATH=3D$(command -p pkg-config --variable=3Dpc_path pkg-config
> 2>/dev/null)
> export
> PKG_CONFIG_LIBDIR=3D/home/anikolic/git/openembedded-core/build-tools/sysr=
oots/x86_64-pokysdk-linux//usr/lib/pkgconfig:/home/anikolic/git/openembedde=
d-core/build-tools/sysroots/x86_64-pokysdk-linux//usr/share/pkgconfig:${HOS=
T_PKG_PATH:-/usr/lib/pkgconfig:/usr/share/pkgconfig}
>=20
> if [ -d "$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
> for envfile in $OECORE_NATIVE_SYSROOT/environment-setup.d/*.sh; do
> . $envfile
> done
> fi
> # We have to unset this else it can confuse oe-selftest and other tools
> # which may also use the overlapping namespace.
> unset OECORE_NATIVE_SYSROOT
>

--BVVYhtmcprmhyrzfPSOY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,<br /><br />I was trying to install the <span style=3D"font-family: cour=
ier_newregular, courier;">buildtools</span> by using the <span style=3D"fon=
t-family: courier_newregular, courier;">scripts/install-buildtools</span> s=
cript, however the call fails. The issue I found seems a bit weird, as IMHO=
 the script would always fail, hence I am not sure whether it's really an i=
ssue or I am misusing the script. Anyway, I am using the script from the <a=
 href=3D"https://git.openembedded.org/openembedded-core" target=3D"_blank" =
rel=3D"nofollow noopener">openembedded-core - OpenEmbedded Core layer</a>&n=
bsp;repository, commit&nbsp;41390f52 (latest at the time of writing).<br />=
<br />The command executed:<br />
<blockquote>./scripts/install-buildtools --debug --without-extended-buildto=
ols --directory ./build-tools --base-url https://downloads.yoctoproject.org=
/releases/yocto --release yocto-4.0.14 --installer-version 4.0.14</blockquo=
te>
The command fails and its output is given in [1].<br /><br />Now, I dug a b=
it deeper and found two potential issues (if they are even issues, I am not=
 sure anymore).<br /><br />1. First one is in <a href=3D"https://git.openem=
bedded.org/openembedded-core/tree/scripts/install-buildtools#n304" target=
=3D"_blank" rel=3D"nofollow noopener">here</a>. Basically, while environmen=
t variables are read from&nbsp;<span style=3D"font-family: courier_newregul=
ar, courier;">build-tools/environment-setup-x86_64-pokysdk-linux</span>&nbs=
p;(see [2] for its content), some of them are read with double quotes (e.g.=
 <span style=3D"font-family: courier_newregular, courier;">PATH</span>) and=
 as such written in <span style=3D"font-family: courier_newregular, courier=
;">os.environ</span> (<a href=3D"https://git.openembedded.org/openembedded-=
core/tree/scripts/install-buildtools#n306" target=3D"_blank" rel=3D"nofollo=
w noopener">here</a>), which makes them not correctly used later on. Some c=
ome without the double quotes and are fine to be used (e.g., <span style=3D=
"font-family: courier_newregular, courier;">PKG_CONFIG_LIBDIR</span>). A so=
lution to this problem is removing the double quotes from envvar if present=
 in the envvar, e.g., <span style=3D"font-family: courier_newregular, couri=
er;">ENVVAR=3D"foo"</span> becomes <span style=3D"font-family: courier_newr=
egular, courier;">ENVVAR=3Dfoo</span> and as such is written in <span style=
=3D"font-family: courier_newregular, courier;">os.environ</span>.<br /><br =
/>2. Another issue I found is related to <a href=3D"https://git.openembedde=
d.org/openembedded-core/tree/scripts/install-buildtools#n334" target=3D"_bl=
ank" rel=3D"nofollow noopener">this line</a>. If the command is called with=
 <span style=3D"font-family: courier_newregular, courier;">--directory</spa=
n>, as in my case, the function <span style=3D"font-family: courier_newregu=
lar, courier;">starts_with</span> will always fail because <span style=3D"f=
ont-family: courier_newregular, courier;">which_tool</span> will never star=
t with <span style=3D"color: #000000; font-family: Menlo, Monaco, Consolas,=
 'Courier New', monospace; font-size: 13.3333px;"><span style=3D"font-famil=
y: courier_newregular, courier;">install_dir</span>.</span>&nbsp;The only c=
ase where this is not an issue is in when <span style=3D"font-family: couri=
er_newregular, courier;">--directory</span> is omitted, since <span style=
=3D"font-family: courier_newregular, courier;">INSTALL_DIR</span> is used i=
n that case and its a full path already. A solution is also simple, we can =
just check if&nbsp;<span style=3D"color: #000000; font-family: courier_newr=
egular, courier; font-size: 13.3333px;">install_dir&nbsp;</span>is in <span=
 style=3D"font-family: courier_newregular, courier;">which_tool<span style=
=3D"font-family: helvetica;">, instead of whether <span style=3D"font-famil=
y: courier_newregular, courier;">which_tool</span> starts with <span style=
=3D"font-family: courier_newregular, courier;">install_dir</span>.</span></=
span><br /><br />Now my question is am I misunderstanding something or am I=
 misusing the <span style=3D"font-family: courier_newregular, courier;">ins=
tall-buildtools</span> script somehow? If this is really an issue I'd be mo=
re than happy to provide a patch.<br /><br />Cheers<br />Aleksandar<br /><b=
r />[1]<br />
<blockquote>
<div>DEBUG: milestone regex: None</div>
<div>INFO: Fetching buildtools installer</div>
<div>INFO: Fetching buildtools installer checksum</div>
<div>DEBUG: checksum regex match: &lt;re.Match object; span=3D(0, 113), mat=
ch=3D'62e811c2f1a91f6d2d5e07ee3031af9bff58c15f515ff5968&gt;</div>
<div>DEBUG: checksum: 62e811c2f1a91f6d2d5e07ee3031af9bff58c15f515ff59688bf3=
9f1f8a4341d</div>
<div>DEBUG: path: None</div>
<div>DEBUG: filename: x86_64-buildtools-nativesdk-standalone-4.0.14.sh</div=
>
<div>INFO: Checksum success</div>
<div>INFO: Making installer executable</div>
<div>DEBUG: os.stat_result(st_mode=3D33252, st_ino=3D2376165, st_dev=3D2080=
, st_nlink=3D1, st_uid=3D1000, st_gid=3D1000, st_size=3D29509071, st_atime=
=3D1702587153, st_mtime=3D1699048064, st_ctime=3D1702587153)</div>
<div>Build tools installer version 4.0.14</div>
<div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div>
<div>You are about to install the SDK to "/home/anikolic/git/openembedded-c=
ore/build-tools". Proceed [Y/n]? Y</div>
<div>Extracting SDK...........done</div>
<div>Setting it up...done</div>
<div>SDK has been successfully set up and is ready to be used.</div>
<div>Each time you wish to use the SDK in a new shell session, you need to =
source the environment setup script e.g.</div>
<div>&nbsp;$ . /home/anikolic/git/openembedded-core/build-tools/environment=
-setup-x86_64-pokysdk-linux</div>
<div>INFO: Setting up the environment</div>
<div>DEBUG: export regex: &lt;re.Match object; span=3D(0, 361), match=3D'ex=
port PATH=3D"/home/anikolic/git/openembedded-core&gt;</div>
<div>DEBUG: env_var: PATH</div>
<div>DEBUG: env_val: "/home/anikolic/git/openembedded-core/build-tools/sysr=
oots/x86_64-pokysdk-linux/usr/bin:/home/anikolic/git/openembedded-core/buil=
d-tools/sysroots/x86_64-pokysdk-linux/usr/sbin:/home/anikolic/git/openembed=
ded-core/build-tools/sysroots/x86_64-pokysdk-linux/bin:/home/anikolic/git/o=
penembedded-core/build-tools/sysroots/x86_64-pokysdk-linux/sbin:$PATH"</div=
>
<div>DEBUG: export regex: &lt;re.Match object; span=3D(0, 109), match=3D'ex=
port OECORE_NATIVE_SYSROOT=3D"/home/anikolic/git/&gt;</div>
<div>DEBUG: env_var: OECORE_NATIVE_SYSROOT</div>
<div>DEBUG: env_val: "/home/anikolic/git/openembedded-core/build-tools/sysr=
oots/x86_64-pokysdk-linux"</div>
<div>DEBUG: export regex: &lt;re.Match object; span=3D(0, 136), match=3D'ex=
port GIT_SSL_CAINFO=3D"/home/anikolic/git/openemb&gt;</div>
<div>DEBUG: env_var: GIT_SSL_CAINFO</div>
<div>DEBUG: env_val: "/home/anikolic/git/openembedded-core/build-tools/sysr=
oots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"</div>
<div>DEBUG: export regex: &lt;re.Match object; span=3D(0, 135), match=3D'ex=
port SSL_CERT_FILE=3D"/home/anikolic/git/openembe&gt;</div>
<div>DEBUG: env_var: SSL_CERT_FILE</div>
<div>DEBUG: env_val: "/home/anikolic/git/openembedded-core/build-tools/sysr=
oots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"</div>
<div>DEBUG: export regex: &lt;re.Match object; span=3D(0, 140), match=3D'ex=
port REQUESTS_CA_BUNDLE=3D"/home/anikolic/git/ope&gt;</div>
<div>DEBUG: env_var: REQUESTS_CA_BUNDLE</div>
<div>DEBUG: env_val: "/home/anikolic/git/openembedded-core/build-tools/sysr=
oots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"</div>
<div>DEBUG: export regex: &lt;re.Match object; span=3D(0, 136), match=3D'ex=
port CURL_CA_BUNDLE=3D"/home/anikolic/git/openemb&gt;</div>
<div>DEBUG: env_var: CURL_CA_BUNDLE</div>
<div>DEBUG: env_val: "/home/anikolic/git/openembedded-core/build-tools/sysr=
oots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"</div>
<div>DEBUG: export regex: &lt;re.Match object; span=3D(0, 80), match=3D'HOS=
T_PKG_PATH=3D$(command -p pkg-config --variable=3D&gt;</div>
<div>DEBUG: env_var: HOST_PKG_PATH</div>
<div>DEBUG: env_val: $(command -p pkg-config --variable=3Dpc_path pkg-confi=
g 2&gt;/dev/null)</div>
<div>DEBUG: export regex: &lt;re.Match object; span=3D(0, 280), match=3D'ex=
port PKG_CONFIG_LIBDIR=3D/home/anikolic/git/opene&gt;</div>
<div>DEBUG: env_var: PKG_CONFIG_LIBDIR</div>
<div>DEBUG: env_val: /home/anikolic/git/openembedded-core/build-tools/sysro=
ots/x86_64-pokysdk-linux//usr/lib/pkgconfig:/home/anikolic/git/openembedded=
-core/build-tools/sysroots/x86_64-pokysdk-linux//usr/share/pkgconfig:${HOST=
_PKG_PATH:-/usr/lib/pkgconfig:/usr/share/pkgconfig}DEBUG: export regex: Non=
e</div>
<div>DEBUG: export regex: None</div>
<div>DEBUG: export regex: None</div>
<div>DEBUG: export regex: None</div>
<div>DEBUG: export regex: None</div>
<div>DEBUG: export regex: None</div>
<div>DEBUG: export regex: None</div>
<div>DEBUG: export regex: None</div>
<div>INFO: Testing installation</div>
<div>DEBUG: extended regex: None</div>
<div>DEBUG: install_dir: ./build-tools</div>
<div>DEBUG: cmd: ['/usr/bin/which', 'tar']</div>
<div>DEBUG: tool: tar</div>
<div>DEBUG: proc.args: ['/usr/bin/which', 'tar']</div>
<div>DEBUG: proc.communicate(): output b''</div>
<div>DEBUG: proc.communicate(): errors None</div>
<div>DEBUG: which tar:</div>
<div>ERROR: Something went wrong: tar not found in ./build-tools</div>
<div>ERROR: Something went wrong: installation failed</div>
</blockquote>
[2]<br />
<blockquote>
<div>
<div>export PATH=3D"/home/anikolic/git/openembedded-core/build-tools/sysroo=
ts/x86_64-pokysdk-linux/usr/bin:/home/anikolic/git/openembedded-core/build-=
tools/sysroots/x86_64-pokysdk-linux/usr/sbin:/home/anikolic/git/openembedde=
d-core/build-tools/sysroots/x86_64-pokysdk-linux/bin:/home/anikolic/git/ope=
nembedded-core/build-tools/sysroots/x86_64-pokysdk-linux/sbin:$PATH"</div>
<div>export OECORE_NATIVE_SYSROOT=3D"/home/anikolic/git/openembedded-core/b=
uild-tools/sysroots/x86_64-pokysdk-linux"</div>
<div>export GIT_SSL_CAINFO=3D"/home/anikolic/git/openembedded-core/build-to=
ols/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"</div>
<div>export SSL_CERT_FILE=3D"/home/anikolic/git/openembedded-core/build-too=
ls/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"</div>
<div>export REQUESTS_CA_BUNDLE=3D"/home/anikolic/git/openembedded-core/buil=
d-tools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"</d=
iv>
<div>export CURL_CA_BUNDLE=3D"/home/anikolic/git/openembedded-core/build-to=
ols/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"</div>
<div>HOST_PKG_PATH=3D$(command -p pkg-config --variable=3Dpc_path pkg-confi=
g 2&gt;/dev/null)</div>
<div>export PKG_CONFIG_LIBDIR=3D/home/anikolic/git/openembedded-core/build-=
tools/sysroots/x86_64-pokysdk-linux//usr/lib/pkgconfig:/home/anikolic/git/o=
penembedded-core/build-tools/sysroots/x86_64-pokysdk-linux//usr/share/pkgco=
nfig:${HOST_PKG_PATH:-/usr/lib/pkgconfig:/usr/share/pkgconfig}</div>
<div>if [ -d "$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; for envfile in $OECORE_NATIVE_SYSROOT/envi=
ronment-setup.d/*.sh; do</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; . $envfile</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; done</div>
<div>fi</div>
<div># We have to unset this else it can confuse oe-selftest and other tool=
s</div>
<div># which may also use the overlapping namespace.</div>
<div>unset OECORE_NATIVE_SYSROOT</div>
</div>
</blockquote>

--BVVYhtmcprmhyrzfPSOY--

