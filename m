Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 088B17235C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 11:58:56 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id i17so1981294qcy.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 03:58:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/tZ1Vu38ywN2XmtTG2I9V8bmTQg/eHb/Ff8j8haZVRg=;
	b=i6fJuXcjAXuTvP8K1BdpU9bm3It4s3gx1u7Ng0sKMeRtXLNFvWENQX2wKoGbjUZFiF
	aenqju4F16xQwRx6yHXFPf9l6v6SRLpdcFEa+mru1HigctfXBJEqYExM5d+Y0ycQ650y
	G0pOAfPFkn2sWrjURikWti0w+QUcDpeuXXU64HKO4QKM4kf6+7gqyfDu3ah8kwYw1bJ8
	fEA/ddfXtKAAvdfvdTCMhuO7zWl9JXD3qLys0HjYhv8fIqreH5YGNz0V+SZ6Ybtoy85i
	hNS/axgoOudZpsXFHKtDrEWHOqw+uDhIKdwwMzmObcqpCPu9CcJwnG0gaf9mgt2FeR+h
	94bw==
X-Gm-Message-State: ALoCoQlFpYSVV3XCsOHweyDf5SaHUK8wK3/I/oRH8oLvbKNmWXIruLNn3pt7kwhNxJXhDTCWH68+
X-Received: by 10.229.176.198 with SMTP id bf6mr7806334qcb.12.1418212737191;
	Wed, 10 Dec 2014 03:58:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Wed, 10 Dec 2014 03:58:36 -0800 (PST)
In-Reply-To: <CACS+7ZTpz5tkDd13in=A1+_Wdcu868Q1_G9MDJt=Tf_EJ-qMGQ@mail.gmail.com>
References: <CACS+7ZTGK6duNi6GQ6tqhmrk3_bNnEbSj=LeEzr60vRP3Dw=OQ@mail.gmail.com>
	<CAJTo0LZewZ17aYpXao81LrmuPdgWho8WEYmYhzQ5=pP-AO-QQQ@mail.gmail.com>
	<CACS+7ZQUcknvEU6M1ioMQKRFHa4k7PO_rRGqEH7KWLU4Jn5f_w@mail.gmail.com>
	<CAJTo0LZtwOuer0QnH5=gLFzjZknBtauSbjhGt2-F5QT4f=tF7A@mail.gmail.com>
	<CACS+7ZSx-yYuC2HXA=OJ=NM+-NmePBtM4VbYKaFnjodHgJ8sig@mail.gmail.com>
	<CAJTo0LZsx0Yswsap_YrKLZNY3E45ZCKdS0asXkQ2iMK7OGbkYw@mail.gmail.com>
	<CACS+7ZTpz5tkDd13in=A1+_Wdcu868Q1_G9MDJt=Tf_EJ-qMGQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Dec 2014 11:58:36 +0000
Message-ID: <CAJTo0LbLnu3xvDWUHM95h=U549NPxbJ7ToA14zcH34QzSjZ=+w@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libsanitizer: Enable GCC sanitizers
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
X-List-Received-Date: Wed, 10 Dec 2014 11:59:04 -0000
Content-Type: multipart/alternative; boundary=001a11c3057e6aa58a0509db62c3

--001a11c3057e6aa58a0509db62c3
Content-Type: text/plain; charset=UTF-8

Hi Dan,

On 13 November 2014 at 23:35, Dan McGregor <danismostlikely@gmail.com>
wrote:

> Looks like I needed to use the same security CFLAGS as gcc-runtime and
> libgcc. There's a new version up on my bitbucket page.
>

I see you're still using anonymous python instead of COMPATIBLE_HOST to
mark what architectures the sanitizers work on, can you change that?

For packagegroups, if my recollection is correct and the problem is that a
packagegroup wants to depend on packages which are architecture-specific, a
common trick is to do something like this:

SANITIZERS="gcc-sanitizer"
SANITIZSERS_mips = ""

RDEPENDS_packagegroup_foo = "${SANITIZERS}"

(see the tools-profile packagegroup which does this heavily)

Ross

--001a11c3057e6aa58a0509db62c3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Dan,</div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On 13 November 2014 at 23:35, Dan M=
cGregor <span dir=3D"ltr">&lt;<a href=3D"mailto:danismostlikely@gmail.com" =
target=3D"_blank">danismostlikely@gmail.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div id=3D":2iq" class=3D"a3s" style=3D"overflow:h=
idden">Looks like I needed to use the same security CFLAGS as gcc-runtime a=
nd<br>
libgcc. There&#39;s a new version up on my bitbucket page.<br></div></block=
quote></div><br>I see you&#39;re still using anonymous python instead of CO=
MPATIBLE_HOST to mark what architectures the sanitizers work on, can you ch=
ange that?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">For packagegroups, if my recollection is correct and the problem is th=
at a packagegroup wants to depend on packages which are architecture-specif=
ic, a common trick is to do something like this:</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">SANITIZERS=3D&quot;gcc-sanitizer=
&quot;</div><div class=3D"gmail_extra">SANITIZSERS_mips =3D &quot;&quot;</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">RDEPENDS=
_packagegroup_foo =3D &quot;${SANITIZERS}&quot;</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">(see the tools-profile packagegro=
up which does this heavily)</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Ross</div></div>

--001a11c3057e6aa58a0509db62c3--
