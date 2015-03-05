Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4DC2965C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 11:48:06 +0000 (UTC)
Received: by qgdz107 with SMTP id z107so4620490qgd.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2015 03:48:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+f1ac8rHgS6gZAe2Ilxhhhj3QFUdxpyycPZsAJTuRm8=;
	b=AlzOeGUv0eiBJpfB60zs9ENlrQINJXf/EC0D8jDcz3LzTqIWpL6t4Iht/wobjXYOYq
	Gb44KZyOf2fP5ykU/rpiZxRXPAZ22QrLf/QyW2eR2yaTwDp6CSgkfRwm50jF1diiH/AU
	7i6Ul6G1RC79bU4cnqT+CyfaYFwlSJxpzfKbfJ8VgShjaIryItRJJlI6/QD+zAKPovua
	ZWH2EVdxAeFt6imFUpg+pp+M0L2Z7hvmN78feIq7I5HC2iNR1hod95+bWHeJ2EZjRq9o
	feE2k3PnzVVeD1bwt3iZ9R4AqxdtSGLr9AtW0sqDdCjVAxsYDJUBoWwhNeqQbKI7zIhk
	iCkQ==
X-Gm-Message-State: ALoCoQnCDcapIPL8jBZ+S4eDRRW2/OK8sx2FWWWOXhuICdwBaGakP9FQSO9o/FYr7wyhCwa+qDSn
X-Received: by 10.140.165.76 with SMTP id l73mr11963383qhl.16.1425556087577;
	Thu, 05 Mar 2015 03:48:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Thu, 5 Mar 2015 03:47:47 -0800 (PST)
In-Reply-To: <1425548285-16530-1-git-send-email-B40290@freescale.com>
References: <1425548285-16530-1-git-send-email-B40290@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Mar 2015 11:47:47 +0000
Message-ID: <CAJTo0Lb-=hZ_jUXkXY85H0PvcQHw_N4uiHJ8Vm-5d=-UbdVHwA@mail.gmail.com>
To: Chunrong Guo <B40290@freescale.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot.inc: fix rename image error
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
X-List-Received-Date: Thu, 05 Mar 2015 11:48:10 -0000
Content-Type: multipart/alternative; boundary=001a1134ef8c3538370510892491

--001a1134ef8c3538370510892491
Content-Type: text/plain; charset=UTF-8

On 5 March 2015 at 09:38, Chunrong Guo <B40290@freescale.com> wrote:

> -            for type in in ${UBOOT_CONFIG}; do
> +            for type in ${UBOOT_CONFIG}; do
>                  if [ "${type}"x = "in"x ]
>                  then
>                      continue
>                  fi
>

The if "${type}x" = "inx" check demonstrates that the in was repeated for a
reason, which you've just broken.

Of course all of that isn't required as a simple test demonstrates:

$ UBOOT_CONFIG=""
~
$ for type in ${UBOOT_CONFIG}; do echo x$type; done
~
$

You can remove the "typex = inx" tests as if UBOOT_CONFIG isn't set the
loop won't be entered.

Ross

--001a1134ef8c3538370510892491
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 March 2015 at 09:38, Chunrong Guo <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:B40290@freescale.com" target=3D"_blank">B40290@freescale.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-lef=
t-style:solid;padding-left:1ex"><div id=3D":1z2" class=3D"" style=3D"overfl=
ow:hidden">-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for type in in ${UBOO=
T_CONFIG}; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for type in ${UBOOT_CONFIG}; do<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${=
type}&quot;x =3D &quot;in&quot;x ]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0continue<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi</div></blo=
ckquote></div><br>The if &quot;${type}x&quot; =3D &quot;inx&quot; check dem=
onstrates that the in was repeated for a reason, which you&#39;ve just brok=
en.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Of=
 course all of that isn&#39;t required as a simple test demonstrates:</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=
=3D"gmail_extra">$ UBOOT_CONFIG=3D&quot;&quot;</div><div class=3D"gmail_ext=
ra">~</div><div class=3D"gmail_extra">$ for type in ${UBOOT_CONFIG}; do ech=
o x$type; done</div><div class=3D"gmail_extra">~</div><div class=3D"gmail_e=
xtra">$</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">You can remove the &quot;typex =3D inx&quot; tests as if UBOOT_CONFIG isn=
&#39;t set the loop won&#39;t be entered.</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div></div>

--001a1134ef8c3538370510892491--
