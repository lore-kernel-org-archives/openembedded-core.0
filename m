Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 091B56AC5A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 19:47:43 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id s11so37223969qcv.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Feb 2015 11:47:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=baQ4eahXVcyeRszkYA1IltTT8iNj2QIQA44OOdAnVeE=;
	b=c5oNdJNqJbjEMsQ4LzC7CMHkqgnfRxIwyC8XaSCeOnTC5tGzbP+Bf9sYvoUt2zLtce
	QK1sGCv82LrBfMNGte9elbGz7Ga+j16Ije/9UoPqfL7K0T45j4uL14lDzj0c6WMgeft7
	mjaU0i9LjKwqa7A1WC0YrOQkdi7dIvp89EX31bsfxuhlwDYE4KjVkTX6VYwCQ+LYyVVE
	KXXcS7K9SyLLFCy84zwXUWKofpF3CffA9bGUA7CiTsoTeL4yQz9ymmdhwOtxC3++bAPw
	RUj5Lr03Lt/QVNFK5t0Ji/ulJiVxBeOFrMbDFZh8pTAilq4iH6aqo5WjLjTpY6uHBOXt
	GL5w==
X-Gm-Message-State: ALoCoQmtL4lDaMpTdmA2y4j4e1li2jR19kOgl1rcBb1clkEEALeOEYh/vmPR0KEYQKTSnVpPtIAH
X-Received: by 10.140.21.48 with SMTP id 45mr53279840qgk.87.1422992864308;
	Tue, 03 Feb 2015 11:47:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 3 Feb 2015 11:47:24 -0800 (PST)
In-Reply-To: <1422924455-24732-2-git-send-email-rich.tollerton@ni.com>
References: <1422924455-24732-1-git-send-email-rich.tollerton@ni.com>
	<1422924455-24732-2-git-send-email-rich.tollerton@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Feb 2015 19:47:24 +0000
Message-ID: <CAJTo0LYkdvkjDPqQOAai1xcwoPVdX3PXMdPYRjq_Y09HrY3WBg@mail.gmail.com>
To: Richard Tollerton <rich.tollerton@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/3] staging.bbclass: Install ${datadir}/fonts/ into sysroots
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
X-List-Received-Date: Tue, 03 Feb 2015 19:47:45 -0000
Content-Type: multipart/alternative; boundary=001a11c129943203e1050e34589f

--001a11c129943203e1050e34589f
Content-Type: text/plain; charset=UTF-8

On 3 February 2015 at 00:47, Richard Tollerton <rich.tollerton@ni.com>
wrote:

> font-util installs encoding maps into /usr/share/fonts/X11. This path
> may not exist on the host (many distros install these into
> /usr/share/fonts/util) so they must exist in the sysroot in order for
> e.g. `pkg-config --variable=mapdir fontutil` to work correctly. However,
> currently /usr/share/fonts is explicitly not installed into sysroots, so
> the encoding maps were not getting found.
>
> Fix this by no longer deleting ${datadir}/fonts/ from sysroots.
>

So the rationale for removing ${datadir}/fonts/ from staging is that it
usually contains fonts, which are useless in the sysroot.  Removing this
means that fonts get staged when they're built, which means pointless
copying of data and adds to the build time.  In an image which has many
megabyte of fonts, that's going to be noticeable.

An alternative solution would be to explicitly stage the maps in the
recipes that install them, see eg the tcl recipe that calls
sysroot_stage_dir directly.

Ross

--001a11c129943203e1050e34589f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 February 2015 at 00:47, Richard Tollerton <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:rich.tollerton@ni.com" target=3D"_blank">rich.tollerton@ni.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4oi" cl=
ass=3D"a3s" style=3D"overflow:hidden">font-util installs encoding maps into=
 /usr/share/fonts/X11. This path<br>
may not exist on the host (many distros install these into<br>
/usr/share/fonts/util) so they must exist in the sysroot in order for<br>
e.g. `pkg-config --variable=3Dmapdir fontutil` to work correctly. However,<=
br>
currently /usr/share/fonts is explicitly not installed into sysroots, so<br=
>
the encoding maps were not getting found.<br>
<br>
Fix this by no longer deleting ${datadir}/fonts/ from sysroots.<br></div></=
blockquote></div><br>So the rationale for removing ${datadir}/fonts/ from s=
taging is that it usually contains fonts, which are useless in the sysroot.=
=C2=A0 Removing this means that fonts get staged when they&#39;re built, wh=
ich means pointless copying of data and adds to the build time.=C2=A0 In an=
 image which has many megabyte of fonts, that&#39;s going to be noticeable.=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">An al=
ternative solution would be to explicitly stage the maps in the recipes tha=
t install them, see eg the tcl recipe that calls sysroot_stage_dir directly=
.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross=
</div></div>

--001a11c129943203e1050e34589f--
