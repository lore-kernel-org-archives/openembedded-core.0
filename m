Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 514E376312
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 15:07:43 +0000 (UTC)
Received: by qgdd90 with SMTP id d90so53171025qgd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 08:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=XQQGjZvXFBPxDbovIXWmHVejtlv26/9IeHtGU4DuUxg=;
	b=FqRNYwfioue01lFdIBKQmtc28tNa1pTdBuFZGRVC0wBAlCYWg2QlToKFMRmoOQ/HT9
	bLLv+1n+FGoyoJzeBJoW7tkaSW/czVraUPiMAkyit+yc6zdNxOV7I91VyH7FhOrOjGl6
	PSPAEcumywvFMjBz8kqyU/PZFoWFiV8MWfLpYR9ikOp0oXOHXhulnhSfhKj621GBCvjF
	+Iv34aOVipLCRTu5xt6O1Y4odtUZ0u69u5HHUDG3ti/1HQsXbEMmFqiHhKyJGeKuThPQ
	Qeievw6hoe6qFbptjvM20Plngdjn2K7OgY/BOWKTndGr2aBsfBVVhAd3XbIrn6l8tqLv
	67eQ==
X-Gm-Message-State: ALoCoQm4Mhy9LtsgR9M9HW3Y8CtpPHEi0MlivPRgCn30djrrgdHdIL/oxkJi1Kn22Lw7skUpMuWp
X-Received: by 10.140.89.100 with SMTP id u91mr78687213qgd.15.1439564863651;
	Fri, 14 Aug 2015 08:07:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Fri, 14 Aug 2015 08:07:24 -0700 (PDT)
In-Reply-To: <ab1937fa04c389c153d2a7ffde76b73e7846e093.1439564102.git.patrick.ohly@intel.com>
References: <cover.1439564102.git.patrick.ohly@intel.com>
	<ab1937fa04c389c153d2a7ffde76b73e7846e093.1439564102.git.patrick.ohly@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Aug 2015 16:07:24 +0100
Message-ID: <CAJTo0Lb_EAc_qUAOUqTJz8ardk-62z=DJqurpz0S7aoE_=yk1g@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] tar-replacement-native: relocate via NATIVE_PACKAGE_PATH_SUFFIX
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
X-List-Received-Date: Fri, 14 Aug 2015 15:07:48 -0000
Content-Type: multipart/alternative; boundary=001a11c1334e5468df051d46d076

--001a11c1334e5468df051d46d076
Content-Type: text/plain; charset=UTF-8

On 14 August 2015 at 15:59, Patrick Ohly <patrick.ohly@intel.com> wrote:

>  EXTRAINSTALL = "do_install_extra"
>  EXTRAINSTALL_class-nativesdk = ""
> +EXTRAINSTALL_class-native = ""
>

As this is presumably meant to be target-only logic, you could refactor
this to:

do_install() {
    autotools_do_install
    ln -s tar ${D}${bindir}/gtar
}

do_install_append_class-target() {
  (contents of do_install_extra)
}

Ross

--001a11c1334e5468df051d46d076
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 August 2015 at 15:59, Patrick Ohly <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2hm" class=
=3D"a3s" style=3D"overflow:hidden">=C2=A0EXTRAINSTALL =3D &quot;do_install_=
extra&quot;<br>
=C2=A0EXTRAINSTALL_class-nativesdk =3D &quot;&quot;<br>
+EXTRAINSTALL_class-native =3D &quot;&quot;</div></blockquote></div><br>As =
this is presumably meant to be target-only logic, you could refactor this t=
o:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">do_=
install() {</div><div class=3D"gmail_extra"><div class=3D"gmail_extra">=C2=
=A0 =C2=A0 autotools_do_install</div><div class=3D"gmail_extra">=C2=A0 =C2=
=A0 ln -s tar ${D}${bindir}/gtar</div></div><div class=3D"gmail_extra">}</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">do_insta=
ll_append_class-target() {</div><div class=3D"gmail_extra">=C2=A0 (contents=
 of do_install_extra)</div><div class=3D"gmail_extra">}</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c1334e5468df051d46d076--
