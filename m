Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 63C347391A;
	Fri, 21 Aug 2015 22:06:25 +0000 (UTC)
Received: by ykll84 with SMTP id l84so84380617ykl.0;
	Fri, 21 Aug 2015 15:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=yh3huSsax8H4CtNJ6g6ZMiAAGMCgDDTkZyarmpi8vuU=;
	b=UbtwBr2zOeOSt8YFuPC0+C3ekT8GJVhmDgxWiw1acRVx6pCmOhEnhdcruvCVUR8kkc
	nS22BHWERY09/oyv/bdyG08MQ20mcGwtWNTs6Lv8+R5oDzvoUrlDDAHsVIwd/BOEPA/E
	cSldU+NX6dzdio9jNLoQSVJIviU2uhdoT2eQjoRwOK3AxmNsF3TPLQiH1FAU5AY/oht0
	1VcKUJXxREjuhEQsiBGx4sxNNSHrBx68XLN/VCqrhtGUSlMNlf72rVc6bdt6hzoX5jcs
	coiOdZuI2XZGq2JGhQL8rdn+A+pO1yb6vf4Z1uqE2NnMG22Rtu/4v8Ku09+R1pl4xdTk
	fXxw==
MIME-Version: 1.0
X-Received: by 10.170.219.5 with SMTP id l5mr15185620ykf.105.1440194785810;
	Fri, 21 Aug 2015 15:06:25 -0700 (PDT)
Received: by 10.13.247.68 with HTTP; Fri, 21 Aug 2015 15:06:25 -0700 (PDT)
Date: Fri, 21 Aug 2015 15:06:25 -0700
Message-ID: <CAFeBWL6xGuzEcOR5B1sfEgZR=i-T=EZ-b-TKPT9DGZpCmDPy4g@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	openembedded-core@lists.openembedded.org
Subject: Extensible SDK install errors
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
X-List-Received-Date: Fri, 21 Aug 2015 22:06:29 -0000
Content-Type: multipart/alternative; boundary=001a113a4e7e9da00c051dd97a9d

--001a113a4e7e9da00c051dd97a9d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello, I built the Extensible SDK on Fido (bitbake core-image-minimal -c
populate_sdk_ext).

During the installation I get this permission error:

$ ./poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh
> Enter target directory for SDK (default: /opt/poky/1.8):
> You are about to install the SDK to "/opt/poky/1.8". Proceed[Y/n]?
> Extracting SDK...done
> Setting it up...
> Extracting buildtools...
> ./poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh: line
> 148: /opt/poky/1.8/environment-setup-armv5e-poky-linux-gnueabi: Permissio=
n
> denied
> ./poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh: line
> 151: /opt/poky/1.8/environment-setup-armv5e-poky-linux-gnueabi: Permissio=
n
> denied
> ./poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh: line
> 155: /opt/poky/1.8/environment-setup-armv5e-poky-linux-gnueabi: Permissio=
n
> denied
> mv: cannot move =E2=80=98x86_64-nativesdk-libc.tar.bz2=E2=80=99 to
> =E2=80=98/opt/poky/1.8/layers/poky/x86_64-nativesdk-libc.tar.bz2=E2=80=99=
: Permission denied
> Preparing build system...
> sh: 1: cannot create preparing_build_system.log: Permission denied
> SDK preparation failed: see /opt/poky/1.8/preparing_build_system.log


 It looks like `/opt/poky/1.8/layers/poky` directory belongs to the root
user:

$ ls -l /opt/poky/1.8/layers/
> total 36
> drwxrwxr-x 9 root root 4096 Jun 16 10:25 meta-gnome
> drwxrwxr-x 9 root root 4096 Jun 15 10:44 meta-multimedia
> drwxrwxr-x 11 root root 4096 Jun 15 10:44 meta-networking
> drwxrwxr-x 20 root root 4096 Jun 15 10:44 meta-oe
> drwxrwxr-x 7 root root 4096 Jun 15 10:44 meta-python
> drwxrwxr-x 5 root root 4096 Jun 15 10:44 meta-ruby
> drwxrwxr-x 5 root root 4096 Jun 15 10:44 meta-systemd
> drwxrwxr-x 11 root root 4096 Jun 15 10:44 meta-xfce
> drwxrwxr-x 13 root root 4096 Aug 21 14:46 poky


 I may have missed something obvious. Has anyone seen this?

Thanks!

--001a113a4e7e9da00c051dd97a9d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello, I built the Extensible SDK on Fido (bitbake core-im=
age-minimal -c populate_sdk_ext).<br><div><br>During the installation I get=
 this permission error:<br><br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204=
,204);border-left-style:solid;padding-left:1ex">$ ./<a href=3D"http://poky-=
glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh">poky-glibc-x86=
_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh</a><br> Enter target dir=
ectory for SDK (default: /opt/poky/1.8):<br> You are about to install the S=
DK to &quot;/opt/poky/1.8&quot;. Proceed[Y/n]?<br>Extracting SDK...done<br>=
Setting it up...<br>Extracting buildtools...<br>./<a href=3D"http://poky-gl=
ibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh">poky-glibc-x86_6=
4-core-image-minimal-armv5e-toolchain-ext-1.8.sh</a>: line 148: /opt/poky/1=
.8/environment-setup-armv5e-poky-linux-gnueabi: Permission denied<br>./<a h=
ref=3D"http://poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8=
.sh">poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh</a>: =
line 151: /opt/poky/1.8/environment-setup-armv5e-poky-linux-gnueabi: Permis=
sion denied<br>./<a href=3D"http://poky-glibc-x86_64-core-image-minimal-arm=
v5e-toolchain-ext-1.8.sh">poky-glibc-x86_64-core-image-minimal-armv5e-toolc=
hain-ext-1.8.sh</a>: line 155: /opt/poky/1.8/environment-setup-armv5e-poky-=
linux-gnueabi: Permission denied<br>mv: cannot move =E2=80=98x86_64-natives=
dk-libc.tar.bz2=E2=80=99 to =E2=80=98/opt/poky/1.8/layers/poky/x86_64-nativ=
esdk-libc.tar.bz2=E2=80=99: Permission denied<br>Preparing build system...<=
br>sh: 1: cannot create preparing_build_system.log: Permission denied<br>SD=
K preparation failed: see /opt/poky/1.8/preparing_build_system.log</blockqu=
ote><div><br></div><div>=C2=A0It looks like `/opt/poky/1.8/layers/poky` dir=
ectory belongs to the root user:</div></div><div><br></div><div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:=
1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left=
:1ex">$ ls -l /opt/poky/1.8/layers/<br>total 36<br>drwxrwxr-x 9 root root 4=
096 Jun 16 10:25 meta-gnome<br>drwxrwxr-x 9 root root 4096 Jun 15 10:44 met=
a-multimedia<br>drwxrwxr-x 11 root root 4096 Jun 15 10:44 meta-networking<b=
r>drwxrwxr-x 20 root root 4096 Jun 15 10:44 meta-oe<br>drwxrwxr-x 7 root ro=
ot 4096 Jun 15 10:44 meta-python<br>drwxrwxr-x 5 root root 4096 Jun 15 10:4=
4 meta-ruby<br>drwxrwxr-x 5 root root 4096 Jun 15 10:44 meta-systemd<br>drw=
xrwxr-x 11 root root 4096 Jun 15 10:44 meta-xfce<br>drwxrwxr-x 13 root root=
 4096 Aug 21 14:46 poky</blockquote><div><br></div><div>=C2=A0I may have mi=
ssed something obvious. Has anyone seen this?</div></div><div><br></div><di=
v>Thanks!</div></div>

--001a113a4e7e9da00c051dd97a9d--
