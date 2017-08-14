Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3E6A17845D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 10:56:16 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id m88so37162310iod.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 03:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k6VesFLxvDk0caCyeISlCO6a//HUfo/1Bat0Ezif63M=;
	b=bzABXOUwk+B7KaU0CF0CCrgfvpAKXGqbsMQ52a8EzUIG/1pLAoj5gW2YsApa/TKdgN
	ebPOJjXXXftWBZPGXg+1fX7E4XHv3+0c2iv5umun7ZE7rcj+KrL0kE9hXgsfQ2qDyN7/
	tjxBoakS323m1f7kBheMpOe1ubbKtytrHA5sAc6xwjZqxCiKpJqnQAFZAYkZg5b1YwKM
	yJ2fc7KEUqvqWQWuWtqXnEjZJy01Ecfb8WYaYvEJF++RYBqzXx42nzX/8JnjdeRvQeiA
	4mKq+N+7nAVSWsvzya60IIZty4+DIX8VllGzzV+Yb3yUotu2QesWJBdEQPPOi0PYxrPz
	NtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k6VesFLxvDk0caCyeISlCO6a//HUfo/1Bat0Ezif63M=;
	b=LEPGO+vRUmorgJcdXUF2NkmnbuRQ8YMKJtbzQqscTVAaiWFW8NjW0O56eub4C6asij
	mdfOcMtPvStvzRX0z/1K4BQCBlwjYSc3alqJihulzxNMHOo49suoe19pnUNpFR7PMo2y
	S4LYdKoNEYmQAVPhtV+Ow2yEIojEHCIAPEgiZsweQp8jYx2jkYF1+Wl4+0Z6L+Sb/C+O
	gxqCyqefuFVKhAeMkGYtIg92SkaYHupEmoVQED7Z3SiDKzhThtVbCFQvosyk3vr39zRt
	EfgWs3zLA2GbRW/GuCDfFQxkBcn+B5w70l0D1Upq2VqfLt9pCGx/B5LLkCyGsJrb0FUJ
	8/TA==
X-Gm-Message-State: AIVw112/iQtRqgEouQ3X972HK0c2nca1PnQr66RUbKbKYMw/vk1bAe3T
	q5xPUXlovSXnB1XQoDsdYMkCoMS026jgclI=
X-Received: by 10.107.173.206 with SMTP id m75mr20894027ioo.152.1502708178327; 
	Mon, 14 Aug 2017 03:56:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.141.19 with HTTP; Mon, 14 Aug 2017 03:55:47 -0700 (PDT)
In-Reply-To: <1502707098.13978.3.camel@linuxfoundation.org>
References: <CAHiDW_EycsMUfCykDicgHuVzykCT0YYQHE9EY8i6yFqJsbbSJQ@mail.gmail.com>
	<1502707098.13978.3.camel@linuxfoundation.org>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 14 Aug 2017 13:55:47 +0300
Message-ID: <CAHiDW_GXRzkW14wT1o_v27WS1m72+bW5U55yZWjMSm2wKX4uNA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: native sysroot race with rpmbuild
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
X-List-Received-Date: Mon, 14 Aug 2017 10:56:17 -0000
Content-Type: multipart/alternative; boundary="001a11449a762bb3520556b48344"

--001a11449a762bb3520556b48344
Content-Type: text/plain; charset="UTF-8"

On 14 August 2017 at 13:38, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2017-08-14 at 11:33 +0300, Jussi Kukkonen wrote:
> > I'm seeing lots of this failure in my last build:
> >
> > | DEBUG: PKGWRITEDIR: /mnt/extra-ssd/tmp/work/all-poky-linux/adwaita-
> > icon-theme/3.24.0-r0/deploy-rpms/noarch
> > | DEBUG: SITE files ['endian-little', 'bit-32', 'common-linux',
> > 'common-glibc', 'allarch-linux', 'common']
> > | DEBUG: Executing shell function BUILDSPEC
> > | /mnt/extra-ssd/tmp/work/all-poky-linux/adwaita-icon-theme/3.24.0-
> > r0/recipe-sysroot-native/usr/bin/rpmbuild: error while loading shared
> > libraries: libdw.so.1: cannot open shared object file: No such file
> > or directory
> > | WARNING: exit code 127 from a shell command.
> > | DEBUG: Python function do_package_rpm finished
> > | DEBUG: Python function do_package_write_rpm finished
> > | ERROR: Function failed: BUILDSPEC (log file is located at
> > /mnt/extra-ssd/tmp/work/all-poky-linux/adwaita-icon-theme/3.24.0-
> > r0/temp/log.do_package_write_rpm.21827)
> > ERROR: Task (/home/jku/src/poky/meta/recipes-gnome/gnome/adwaita-
> > icon-theme_3.24.0.bb:do_package_write_rpm) failed with exit code '1'
> >
> > * libdw.so.1 isn't found when rpmbuild runs
> > * seems to be a race as the library is there when I check (and
> > building again works)
> > * Seems to mostly happen with allarch recipes (maybe they're just
> > fast enough): sysvinit-inittab, adwaita, xcursor-transparent-theme,
> > iso-codes
> >
> > Any ideas?
>
> Could you tar up /mnt/extra-ssd/tmp/work/all-poky-linux/adwaita-icon-
> theme/3.24.0-r0/temp/log* and share somewhere please?


Adwaita I had lost already but I've put the logs for failing
packagegroup-core-x11-sato here:
https://github.com/jku/packagegroup-core-x11-sato-logs

There's this in the log:
| NOTE: rpm-native exists in sysroot, skipping

>
> Not sure what is going on there, it seems odd :( What other tasks were
> running when this happened?

I was building core-image-sato so possibly many things.

>
> I had a go at reproducing this locally but couldn't.

It seemed to happen to lots of recipes but I can't reproduce afterwards
either.

Jussi

--001a11449a762bb3520556b48344
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 14 August 2017 at 13:38, Richard Purdie &lt;<a href=3D"=
mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.o=
rg</a>&gt; wrote:<br>&gt;<br>&gt; On Mon, 2017-08-14 at 11:33 +0300, Jussi =
Kukkonen wrote:<br>&gt; &gt; I&#39;m seeing lots of this failure in my last=
 build:<br>&gt; &gt;<br>&gt; &gt; | DEBUG: PKGWRITEDIR: /mnt/extra-ssd/tmp/=
work/all-poky-linux/adwaita-<br>&gt; &gt; icon-theme/3.24.0-r0/deploy-rpms/=
noarch<br>&gt; &gt; | DEBUG: SITE files [&#39;endian-little&#39;, &#39;bit-=
32&#39;, &#39;common-linux&#39;,<br>&gt; &gt; &#39;common-glibc&#39;, &#39;=
allarch-linux&#39;, &#39;common&#39;]<br>&gt; &gt; | DEBUG: Executing shell=
 function BUILDSPEC<br>&gt; &gt; | /mnt/extra-ssd/tmp/work/all-poky-linux/a=
dwaita-icon-theme/3.24.0-<br>&gt; &gt; r0/recipe-sysroot-native/usr/bin/rpm=
build: error while loading shared<br>&gt; &gt; libraries: libdw.so.1: canno=
t open shared object file: No such file<br>&gt; &gt; or directory<br>&gt; &=
gt; | WARNING: exit code 127 from a shell command.<br>&gt; &gt; | DEBUG: Py=
thon function do_package_rpm finished<br>&gt; &gt; | DEBUG: Python function=
 do_package_write_rpm finished<br>&gt; &gt; | ERROR: Function failed: BUILD=
SPEC (log file is located at<br>&gt; &gt; /mnt/extra-ssd/tmp/work/all-poky-=
linux/adwaita-icon-theme/3.24.0-<br>&gt; &gt; r0/temp/log.do_package_write_=
rpm.21827)<br>&gt; &gt; ERROR: Task (/home/jku/src/poky/meta/recipes-gnome/=
gnome/adwaita-<br>&gt; &gt; icon-theme_3.24.0.bb:do_package_write_rpm) fail=
ed with exit code &#39;1&#39;<br>&gt; &gt;<br>&gt; &gt; * libdw.so.1 isn&#3=
9;t found when rpmbuild runs<br>&gt; &gt; * seems to be a race as the libra=
ry is there when I check (and<br>&gt; &gt; building again works)<br>&gt; &g=
t; * Seems to mostly happen with allarch recipes (maybe they&#39;re just<br=
>&gt; &gt; fast enough): sysvinit-inittab, adwaita, xcursor-transparent-the=
me,<br>&gt; &gt; iso-codes<br>&gt; &gt;<br>&gt; &gt; Any ideas?<br>&gt;<br>=
&gt; Could you tar up /mnt/extra-ssd/tmp/work/all-poky-linux/adwaita-icon-<=
br>&gt; theme/3.24.0-r0/temp/log* and share somewhere please?<br><br><br>Ad=
waita I had lost already but I&#39;ve put the logs for failing packagegroup=
-core-x11-sato here:<br><a href=3D"https://github.com/jku/packagegroup-core=
-x11-sato-logs">https://github.com/jku/packagegroup-core-x11-sato-logs</a><=
br>=C2=A0<div>There&#39;s this in the log:<br>| NOTE: rpm-native exists in =
sysroot, skipping<br><br>&gt;<br>&gt; Not sure what is going on there, it s=
eems odd :( What other tasks were<br>&gt; running when this happened?</div>=
<div><br></div><div>I was building core-image-sato so possibly many things.=
<br><br></div><div>&gt;<br>&gt; I had a go at reproducing this locally but =
couldn&#39;t.<br><br></div><div>It seemed to happen to lots of recipes but =
I can&#39;t reproduce afterwards either.</div><div><br></div><div>Jussi</di=
v></div>

--001a11449a762bb3520556b48344--
