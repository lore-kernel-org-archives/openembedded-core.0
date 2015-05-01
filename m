Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id DDE9F73DE1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 May 2015 15:58:05 +0000 (UTC)
Received: by qkx62 with SMTP id 62so53051218qkx.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 May 2015 08:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8dUfdg3u5HnSHHKt8k/9vuQtoDyLHOj8QadyXqlJYZA=;
	b=LFgL2Q3Q2/m75OgpDj9Aflp3HP0i8gEc6CiwIaYB772TPVoEwfpYFZPJHLtnYruCmP
	VUXDUoeQfsXAsgljO4tESWR6w6La86anR8zfFWFwwHqNcbWz9oSn6/U9l7M0QLFW9NoJ
	VgPcsuXpWWSdvdslznFNXERKCYyLnyiu4gbtO7Le8AnWPhMg0SSQ9K+xLtGwvhu802Yq
	6VmYd6r2NFeNqO0lE4De33OnXRSpPzMvyqnYkRERXJHvxUqhwAnzFi+PYSzM/ilD+mmL
	hdEcc2ZoU7TQ67D8JV8vQIT8s5BYDVuu7RnTNV3/Qa8lsNwAKsbOaIaFzzadZRLxJchr
	eeLQ==
X-Gm-Message-State: ALoCoQm+lNQ4AEpqgdIyxYxvuZZHtxGk3uxWhlT8sWugv7a8VmpReRYMpLo/dorAMTQ9RD5G2vUU
X-Received: by 10.140.89.37 with SMTP id u34mr11539307qgd.15.1430495886732;
	Fri, 01 May 2015 08:58:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 1 May 2015 08:57:46 -0700 (PDT)
In-Reply-To: <5541F4B9.4080201@windriver.com>
References: <1430297966-25315-1-git-send-email-rongqing.li@windriver.com>
	<1430380974.19130.51.camel@linuxfoundation.org>
	<5541F4B9.4080201@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 May 2015 16:57:46 +0100
Message-ID: <CAJTo0LYH_qarpYL5En9XVJfT=CynFW_6aY-eCDw42Ki0E9i-OA@mail.gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bind: upgrade to 9.10.2
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
X-List-Received-Date: Fri, 01 May 2015 15:58:06 -0000
Content-Type: multipart/alternative; boundary=001a11c117ee2e88500515074764

--001a11c117ee2e88500515074764
Content-Type: text/plain; charset=UTF-8

On 30 April 2015 at 10:24, Rongqing Li <rongqing.li@windriver.com> wrote:

> I can not reproduce it on Ubuntu and Fedora release 21, for x86. mips
>

This is what I see:

| x86_64-poky-linux-gcc  -m64 -march=corei7 -mtune=corei7 -mfpmath=sse
-msse4.2 --sysroot=/data/poky-master/tmp/sysroots/intel-corei7-64  -O2
-pipe -g -feliminate-unused-debug-types -D_GNU_SOURCE
 -I/data/poky-master/tmp/sysroots/intel-corei7-64/usr/lib//include  -Wl,-O1
-Wl,--hash-style=gnu -Wl,--as-needed -o svtest test.o libomapi.a
/data/poky-master/tmp/sysroots/intel-corei7-64/usr/lib//libirs.a
/data/poky-master/tmp/sysroots/intel-corei7-64/usr/lib//libdns.a
/data/poky-master/tmp/sysroots/intel-corei7-64/usr/lib//libisccfg.a
/data/poky-master/tmp/sysroots/intel-corei7-64/usr/lib//libisc.a -lcrypto
|
/data/poky-master/tmp/sysroots/intel-corei7-64/usr/lib//libdns.a(cache.o):
In function `renderstat':
|
/data/poky-master/tmp/work/corei7-64-poky-linux/bind/9.10.2-r0/bind-9.10.2/lib/dns/cache.c:1419:
undefined reference to `xmlTextWriterStartElement'

It appears to be forgetting to link to libxml2.

Ross

--001a11c117ee2e88500515074764
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 April 2015 at 10:24, Rongqing Li <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:rongqing.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);=
border-left-style:solid;padding-left:1ex"><div id=3D":22b" class=3D"" style=
=3D"overflow:hidden">I can not reproduce it on Ubuntu and Fedora release 21=
, for x86. mips<div class=3D""><div id=3D":xx" class=3D"" tabindex=3D"0"></=
div></div></div></blockquote></div><br>This is what I see:</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_e=
xtra">| x86_64-poky-linux-gcc =C2=A0-m64 -march=3Dcorei7 -mtune=3Dcorei7 -m=
fpmath=3Dsse -msse4.2 --sysroot=3D/data/poky-master/tmp/sysroots/intel-core=
i7-64 =C2=A0-O2 -pipe -g -feliminate-unused-debug-types -D_GNU_SOURCE =C2=
=A0-I/data/poky-master/tmp/sysroots/intel-corei7-64/usr/lib//include =C2=A0=
-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o svtest test.o libomapi.a =
/data/poky-master/tmp/sysroots/intel-corei7-64/usr/lib//libirs.a /data/poky=
-master/tmp/sysroots/intel-corei7-64/usr/lib//libdns.a /data/poky-master/tm=
p/sysroots/intel-corei7-64/usr/lib//libisccfg.a /data/poky-master/tmp/sysro=
ots/intel-corei7-64/usr/lib//libisc.a -lcrypto</div><div class=3D"gmail_ext=
ra">| /data/poky-master/tmp/sysroots/intel-corei7-64/usr/lib//libdns.a(cach=
e.o): In function `renderstat&#39;:</div><div class=3D"gmail_extra">| /data=
/poky-master/tmp/work/corei7-64-poky-linux/bind/9.10.2-r0/bind-9.10.2/lib/d=
ns/cache.c:1419: undefined reference to `xmlTextWriterStartElement&#39;</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">It appear=
s to be forgetting to link to libxml2.</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div></div>

--001a11c117ee2e88500515074764--
