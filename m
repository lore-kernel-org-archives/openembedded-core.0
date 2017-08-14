Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5FBE47840E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 08:33:44 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id m88so36395078iod.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 01:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=YP678GSAcvs/OrxCGTjVlLK2/tRmwM/xa9LGKCqJn2E=;
	b=CZTX4wC1M1XfTjyIrVOi9lty2ADIfexKnohWsYYgROMyT6/hQpIzEfzT4Wc0BvwTlC
	ZwfVdpIR6zfV7GMqxuGWv8RhQy39BlhcWL6FAfHMhcNOrzz01XVWz0GdorqpYZe9CvxZ
	Z361SDJGepbLQDpyhgzKl49Qn32bwHwO9yyFTp2+UKhxs594nVljpjp0JXgrYeSA2UD7
	XGNN6Rf6itsH2iAvizc2L0sZIwNDePnFBf9iUibNpGnBywYXq2+MgvHHpoxkX9vNY0WG
	gIlu8tfgZuxdei9o86JHm7w0Au6HZ9GHM0yxRHBVKBqN5uxGXJCTpSZhFbVK2psWOVuB
	3ltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=YP678GSAcvs/OrxCGTjVlLK2/tRmwM/xa9LGKCqJn2E=;
	b=l6RbjfhE+3i2Qd0k7QhsDj8cipJEiTZzLizp0TAfTupjlvvZnH5wisI/gCuUDZGu35
	Xh9rzo7LYJ3cai1WcNR2KgWsyNto/YAqZAOPZWawl7KbmfHBuftmNy7yIT2QmtbEdo8d
	LjoIz4V0ZjuC5ZNopnOOfKFYcxx8dHUh3P7cbekT3RxwBw9w+zCQpQhOSIrD3KpHrl0O
	cdFXGnINjzQfFp5/csF+SlLAmq0EfdQ7gKCiOYX+Of8W4t7pTZeynQkJ7IEk1EboAftL
	+KUH6Zj1cQ04GtCQtfdzkPnlMM5hJGasBCiM8R8c9Emhs1lK9YmACnx86FMAy78NW08i
	XnlA==
X-Gm-Message-State: AHYfb5h3UJUCdLvV0PZx2/bpF0gDXxmi7exBJP1tndLn03xpxOyhABhf
	fNwQNsp8Fi9iYwr6m+zFG8uIDX/2aezxeoM=
X-Received: by 10.107.25.137 with SMTP id 131mr18151307ioz.153.1502699626005; 
	Mon, 14 Aug 2017 01:33:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.141.19 with HTTP; Mon, 14 Aug 2017 01:33:15 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 14 Aug 2017 11:33:15 +0300
Message-ID: <CAHiDW_EycsMUfCykDicgHuVzykCT0YYQHE9EY8i6yFqJsbbSJQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: native sysroot race with rpmbuild
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
X-List-Received-Date: Mon, 14 Aug 2017 08:33:45 -0000
Content-Type: multipart/alternative; boundary="001a113fd62e699b5c0556b28547"

--001a113fd62e699b5c0556b28547
Content-Type: text/plain; charset="UTF-8"

I'm seeing lots of this failure in my last build:

| DEBUG: PKGWRITEDIR:
/mnt/extra-ssd/tmp/work/all-poky-linux/adwaita-icon-theme/3.24.0-r0/deploy-rpms/noarch
| DEBUG: SITE files ['endian-little', 'bit-32', 'common-linux',
'common-glibc', 'allarch-linux', 'common']
| DEBUG: Executing shell function BUILDSPEC
|
/mnt/extra-ssd/tmp/work/all-poky-linux/adwaita-icon-theme/3.24.0-r0/recipe-sysroot-native/usr/bin/rpmbuild:
error while loading shared libraries: libdw.so.1: cannot open shared object
file: No such file or directory
| WARNING: exit code 127 from a shell command.
| DEBUG: Python function do_package_rpm finished
| DEBUG: Python function do_package_write_rpm finished
| ERROR: Function failed: BUILDSPEC (log file is located at
/mnt/extra-ssd/tmp/work/all-poky-linux/adwaita-icon-theme/3.24.0-r0/temp/log.do_package_write_rpm.21827)
ERROR: Task
(/home/jku/src/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.24.0.bb:do_package_write_rpm)
failed with exit code '1'

* libdw.so.1 isn't found when rpmbuild runs
* seems to be a race as the library is there when I check (and building
again works)
* Seems to mostly happen with allarch recipes (maybe they're just fast
enough): sysvinit-inittab, adwaita, xcursor-transparent-theme, iso-codes

Any ideas?

Jussi

--001a113fd62e699b5c0556b28547
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m seeing lots of this failure in my last build:<div>=
<br></div><div><div>| DEBUG: PKGWRITEDIR: /mnt/extra-ssd/tmp/work/all-poky-=
linux/adwaita-icon-theme/3.24.0-r0/deploy-rpms/noarch</div><div>| DEBUG: SI=
TE files [&#39;endian-little&#39;, &#39;bit-32&#39;, &#39;common-linux&#39;=
, &#39;common-glibc&#39;, &#39;allarch-linux&#39;, &#39;common&#39;]</div><=
div>| DEBUG: Executing shell function BUILDSPEC</div><div>| /mnt/extra-ssd/=
tmp/work/all-poky-linux/adwaita-icon-theme/3.24.0-r0/recipe-sysroot-native/=
usr/bin/rpmbuild: error while loading shared libraries: libdw.so.1: cannot =
open shared object file: No such file or directory</div><div>| WARNING: exi=
t code 127 from a shell command.</div><div>| DEBUG: Python function do_pack=
age_rpm finished</div><div>| DEBUG: Python function do_package_write_rpm fi=
nished</div><div>| ERROR: Function failed: BUILDSPEC (log file is located a=
t /mnt/extra-ssd/tmp/work/all-poky-linux/adwaita-icon-theme/3.24.0-r0/temp/=
log.do_package_write_rpm.21827)</div><div>ERROR: Task (/home/jku/src/poky/m=
eta/recipes-gnome/gnome/adwaita-icon-theme_3.24.0.bb:do_package_write_rpm) =
failed with exit code &#39;1&#39;</div></div><div><br></div><div>* libdw.so=
.1 isn&#39;t found when rpmbuild runs</div><div>* seems to be a race as the=
 library is there when I check (and building again works)</div><div>* Seems=
 to mostly happen with allarch recipes (maybe they&#39;re just fast enough)=
: sysvinit-inittab, adwaita, xcursor-transparent-theme, iso-codes</div><div=
><br></div><div>Any ideas?</div><div><br></div><div>Jussi</div></div>

--001a113fd62e699b5c0556b28547--
