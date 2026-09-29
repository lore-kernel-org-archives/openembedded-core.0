Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F4ECA5FA7
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 16:49:52 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.955.1790700590007316350
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 09:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LX40Ggsi;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so25186035e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 09:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790700588; x=1791305388; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0Jd3u3CSs5PaUv6HNbTwLrUrfjfZ7dg+VaBdROIyRdQ=;
        b=LX40Ggsi2T35vs0TdAfxq4SdnNZW/hodE4S4xXHy1XqvBWZluMMuo5N+UTza920ya5
         fJesd5TcGJR1y4svQ9nig96cFdPcFKkgLSgwQSvURBEJCeXk9aebmqlWWdle10/4AhKj
         hSJ+CmNh/Xn36J996KID+xpdw0tjlbplgoD00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700588; x=1791305388;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Jd3u3CSs5PaUv6HNbTwLrUrfjfZ7dg+VaBdROIyRdQ=;
        b=EokBFsogK6QQSL1ajTy1PsSaHD6HiNT1D86b3vXXXEwXzwo1OXj8UD7/cxkkn0KmmQ
         AGvlmO435WCbRnhu0OguDR8qB3ojri6UIRAxqIp13oYgqDm/d9cVq9cqWWUJthbfTnHM
         sv1pDH7PR10CnR9TlTvfMxtorwXzkw0fC6oraUA242HIh21RqamM8FCwjSDmMn6cmxd/
         gNj0MiXZ28LlgBw6JcGqEeKPQatFgakgmYBPdhZbG37aMmZBkvqco/oX/hg9XhHTu4e1
         P5f9R9HXk3KfoYhP5XthhRLC+HtpUXwlrWavn3+eUscuN+CLm/EdNBV1fjEtVXyQd/1g
         FfOA==
X-Forwarded-Encrypted: i=1; AKwUvBzwZND09lluC2r4Xzy19XyHb58iYEFsWgtLyOtbzYampGFXLKLa256gW+MQG0NKe+lo5a/oQLSKqsv7kmfn/x7ZPw==@lists.openembedded.org
X-Gm-Message-State: AFuF++myT4OLN3mId9bNIvdQK3EEi/xMqNQ8K3YM9kexWrwpJ79LE2tY
	KJNZ252YPDnlHggdGoCUUNz3kR8l8ERINsMv3KWWtSjd7+Ogx5AfHNZhsOGaErkbxio=
X-Gm-Gg: AYBFou3bdfiCtw9M3+k/kcOBxfzZlU1heFU4WTdKWze5A/StbLNmsjeLmEOgJJiGOuR
	bcFtUHKZMrJkDawYkESULek5jggH2R5k6BIA222V9POyX/MIWUWRgb7nhQdAVqaHgeNjSj/LxRw
	yUA+LIC80upSSwN5s/ruEcwfAqEsKmY/RtBXT57BCummjTS5xkjqVrYqmfRt0vHriRYyiuM4lH5
	jcidusvLsrTgycMPa4L4i5IfxXehMZ423eb3DQ4iyokgT0gIyUcD8JHMS+IiXYANkEeildSbrwF
	XoCMrMCbViYDlOYlekcFVvXnSzK9Qy0e2QKZ/7FozSBrHHx9TelBbZCaPtpuhrWOx0b8aR+Th+6
	vh6Xbj4SN21UZKIVEdajcBmpZ+n4/XJpkQmti+U46ekvd277nFImcAZDp+9JCxtM+2eXoJTwn8b
	7+ZdGBgBn7XgImIifROsAt6YyGxrRGun15rl35ujk12ez1n7NHxVzdIQxWp/usWJS68Vl/6QAhN
	+aJMFeiAUSVmTnlgi8/4+TiPmxb4x6zvIE1/Nyx3N91qHMJzpELdW3SAye3DDqPENZa+HmM
X-Received: by 2002:a05:600c:3550:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-49ffd408357mr164089395e9.34.1790700588055;
        Tue, 29 Sep 2026 09:49:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c2fb:8115:9b9:553a? ([2001:8b0:aba:5f3c:c2fb:8115:9b9:553a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a014924d9dsm623995e9.3.2026.09.29.09.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:49:46 -0700 (PDT)
Message-ID: <ead8d2cc390637ec9ea43c4561e4647f4be9d479.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gdb: Upgrade 17.2 -> 18.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jaipaul.cheernam@est.tech, openembedded-core@lists.openembedded.org
Date: Tue, 29 Sep 2026 17:49:45 +0100
In-Reply-To: <18D9D86F8320E53B.2723932@lists.openembedded.org>
References: <20260929093506.88396-1-jaipaul.cheernam@est.tech>
		 <e97ebd18e97df989e06522e09735e185e2fbb6c6.camel@linuxfoundation.org>
		 <fd2d10b8-5d64-42ab-aeb2-64e320e33851@est.tech>
	 <18D9D86F8320E53B.2723932@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 16:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246883

On Tue, 2026-09-29 at 17:44 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> On Tue, 2026-09-29 at 17:56 +0200, Jaipaul Cheernam via lists.openembedde=
d.org wrote:
> >=20
> > On 2026-09-29 14:08, Richard Purdie wrote:
> > > On Tue, 2026-09-29 at 11:35 +0200, Jaipaul Cheernam via
> > > lists.openembedded.org wrote:
> > > > NEWS:
> > > > https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dblob=
_plain;f=3Dgdb/NEWS;hb=3Dgdb-18.1-release
> > > >=20
> > > > - Refresh existing patches
> > > >=20
> > > > Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> > > I think this triggered:
> > >=20
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/478=
5
> > >=20
> > Hi Richard,
> >=20
> > I tried different combinations(with musl and without) locally on my
> > machine (ubuntu 24) and no issues found.
> >=20
> > Could this is be host contamination or sstate issue ?
> >=20
> > Can you retrigger autobuilder again ?
>=20
> No, I'm not doing that. A better question is could we look at
> config.log from the failing build. We can and it says:
>=20
> configure:29766: gcc=C2=A0 -o conftest -isystem/srv/pokybuild/yocto-worke=
r/musl-qemux86-64/build/build/tmp/work/x86_64-linux/gdb-cross-x86_64/18.1/r=
ecipe-sysroot-native/usr/include -O2 -pipe=C2=A0=C2=A0=C2=A0=C2=A0 -isystem=
/srv/pokybuil
> d/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86_64-linux/gdb-cros=
s-x86_64/18.1/recipe-sysroot-native/usr/include -I/srv/pokybuild/yocto-work=
er/musl-qemux86-64/build/build/tmp/work/x86_64-linux/gdb-cross-
> x86_64/18.1/recipe-sysroot-native/usr/include=C2=A0 -L/srv/pokybuild/yoct=
o-worker/musl-qemux86-64/build/build/tmp/work/x86_64-linux/gdb-cross-x86_64=
/18.1/recipe-sysroot-native/usr/lib=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -L/srv/p
> okybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86_64-linux/g=
db-cross-x86_64/18.1/recipe-sysroot-native/lib=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Wl,--enable-new-dtags=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Wl,-rpath-lin=
k,/srv
> /pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86_64-linux=
/gdb-cross-x86_64/18.1/recipe-sysroot-native/usr/lib=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Wl,-rpath-link,/srv/pokyb=
uild/yocto-worker/musl-qemux86-64/b
> uild/build/tmp/work/x86_64-linux/gdb-cross-x86_64/18.1/recipe-sysroot-nat=
ive/lib=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -Wl,-rpath,/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/=
work/x86_64-linux/gdb-cross-x86_64/
> 18.1/recipe-sysroot-native/usr/lib=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Wl,-rpath,/srv/pokybuild/yocto-worker/musl-=
qemux86-64/build/build/tmp/work/x86_64-linux/gdb-cross-x86_64/18.1/recipe-s=
ysroot-native/lib=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Wl,-O1 -Wl,--allow-shli=
b-undefined -Wl,--dynamic-linker=3D/srv/pokybuild/yocto-worker/musl-qemux86=
-64/build/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.=
2 -pthread conftest.c -lncurse
> sw -latomic -lm=C2=A0 >&5
> configure:29766: $? =3D 0
> configure:29766: ./conftest
> ./conftest: error while loading shared libraries: libatomic.so.1: cannot =
open shared object file: No such file or directory
> configure:29766: $? =3D 127
>=20
> which gives at least some hint as to what the issue may be...

https://valkyrie.yocto.io/pub/shared-failure-data/config.log-gdb

Cheers,

Richard

