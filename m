Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 888F765CAF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 14:21:21 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id k15so699539qaq.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 07:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=notBgriB+y84koNicq4ZNpOql7ZZ6YVvBcyIkyyn+bE=;
	b=COenT5yXXofJjmCKgnPYQzTGfXgeAyL3tv9coLPmLUdFern0pEXRSjLiHeTd1w8nIL
	rpyZErVjfv07unOgHk19i8F7tZSKSiavsSWVqRx4mEwmN7y+hhTnH7LpKpVDlSQFeWNz
	I0bESrpL9AYllwdpShLeVyyRSpD1ZbqQPgEu68o+BMgxQ7Yw8gedpMOVwAtpHwgvYK+n
	LPmklIfwp0OvPmrB2Sf8AeK1oeJ1sfYCID6b1nLIGSuOOnOlb8ky6Crbok1EbY9J5j5p
	xtQ9HWMy135iK4c9IPi4Nm4ynnCVCknTi8RqyjGefVIHTZFKtL8wemgF8pw8/AfSAhVL
	v7LA==
X-Gm-Message-State: ALoCoQl2huVSBwnA0YbB4OSkj+j67G08m/gI9zb3+PiwiAEYv6YK5wWvxwZtfZL6M3D1p0wK4h10
X-Received: by 10.140.96.101 with SMTP id j92mr7498545qge.87.1414074081707;
	Thu, 23 Oct 2014 07:21:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Thu, 23 Oct 2014 07:21:01 -0700 (PDT)
In-Reply-To: <6fe7bbee542ba42ae03304919b3c7abbe63bc8b4.1413879309.git.Chong.Lu@windriver.com>
References: <cover.1413879309.git.Chong.Lu@windriver.com>
	<6fe7bbee542ba42ae03304919b3c7abbe63bc8b4.1413879309.git.Chong.Lu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Oct 2014 15:21:01 +0100
Message-ID: <CAJTo0LYxF2JA+3uaZqrAWPnvNpZkfZRpDvnBg6qg-K04T5_CHg@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kmod: fix debuginfo is missing in shared library
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
X-List-Received-Date: Thu, 23 Oct 2014 14:21:23 -0000
Content-Type: multipart/alternative; boundary=001a113a9d8a53a0f8050617c7ab

--001a113a9d8a53a0f8050617c7ab
Content-Type: text/plain; charset=UTF-8

On 21 October 2014 09:16, Chong Lu <Chong.Lu@windriver.com> wrote:

> -INHIBIT_PACKAGE_STRIP = "${@bb.utils.contains("DISTRO_FEATURES", "ptest",
> "1", "0", d)}"
> +INHIBIT_PACKAGE_STRIP_${PN}-ptest =
> "${@bb.utils.contains("DISTRO_FEATURES", "ptest", "1", "0", d)}"
>

Was this actually tested?

ERROR: runstrip: ''arm-poky-linux-gnueabi-strip' --strip-debug
--remove-section=.comment --remove-section=.note --preserve-dates
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/armv5te-poky-linux-gnueabi/kmod/18+gitAUTOINC+ae58de0fcb-r0/package/usr/lib/kmod/ptest/testsuite/rootfs/test-depmod/detect-loop/lib/modules/4.4.4/kernel/moduleA.ko''
strip command failed

INHIBIT_PACKAGE_STRIP isn't a per-package variable as stripping happens
before the package-splitting.   Moving it to happen after splitting won't
be trivial as you'd need to know what package to put the resultant files
into.  Maybe we need a strip blacklist?

Ross

--001a113a9d8a53a0f8050617c7ab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 October 2014 09:16, Chong Lu <span dir=3D"ltr">&lt;<a href=3D"mailto:=
Chong.Lu@windriver.com" target=3D"_blank">Chong.Lu@windriver.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-lef=
t-style:solid;padding-left:1ex"><div style=3D"overflow:hidden">-INHIBIT_PAC=
KAGE_STRIP =3D &quot;${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quo=
t;ptest&quot;, &quot;1&quot;, &quot;0&quot;, d)}&quot;<br>
+INHIBIT_PACKAGE_STRIP_${PN}-ptest =3D &quot;${@bb.utils.contains(&quot;DIS=
TRO_FEATURES&quot;, &quot;ptest&quot;, &quot;1&quot;, &quot;0&quot;, d)}&qu=
ot;</div></blockquote></div><br>Was this actually tested?</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_e=
xtra">ERROR: runstrip: &#39;&#39;arm-poky-linux-gnueabi-strip&#39; --strip-=
debug --remove-section=3D.comment --remove-section=3D.note --preserve-dates=
 &#39;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/buil=
d/tmp/work/armv5te-poky-linux-gnueabi/kmod/18+gitAUTOINC+ae58de0fcb-r0/pack=
age/usr/lib/kmod/ptest/testsuite/rootfs/test-depmod/detect-loop/lib/modules=
/4.4.4/kernel/moduleA.ko&#39;&#39; strip command failed</div><div><br></div=
><div>INHIBIT_PACKAGE_STRIP isn&#39;t a per-package variable as stripping h=
appens before the package-splitting. =C2=A0 Moving it to happen after split=
ting won&#39;t be trivial as you&#39;d need to know what package to put the=
 resultant files into.=C2=A0 Maybe we need a strip blacklist?</div><div><br=
></div><div>Ross</div></div></div>

--001a113a9d8a53a0f8050617c7ab--
