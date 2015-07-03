Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id EE35C75D39
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 09:38:51 +0000 (UTC)
Received: by qkei195 with SMTP id i195so69411648qke.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jul 2015 02:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KwIyVTk+9DjDniBPC/Xg31LltmQwexYJUJnzAtjiLso=;
	b=JQLYX0b83aH2vkmRQ2k93eCYQ9Tmh3UQE9gt4iO0x1PaDFER0xzvJHHRFlKjWQQvIE
	4DKxnHMd7BIkImUGX8zyt1zNo+La7oDOr80IUOl/fgoAci257VY25Y129knUi3mRJc4M
	vMF5cbufAGcy6nPkGhzK651Zx7gj/XKfHCnOGyhlqlPBP0PdIjd3wmpu/qztwSKs52sj
	nUqP5araCj7fnKVXjN0F9gSvuSYxmeyl6aGN528inLmuBlUEVQd6SJD1mUMmcumM18Jr
	OoM1znA3/0eiNlAV0C+UKsR9eYwcMBXqNU6fj5dN7Kn5K9odURJsdGfNeFyJlPoU6Q3P
	CXGA==
X-Gm-Message-State: ALoCoQn+2cShbTtQ49e3lHVDchf6dW4OEZ/snMAcOgDngk4rMLpNQWFLfb3Fiv9e74zuTs2cHS7q
X-Received: by 10.140.235.19 with SMTP id g19mr52017475qhc.52.1435916331213;
	Fri, 03 Jul 2015 02:38:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 3 Jul 2015 02:38:31 -0700 (PDT)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AAF11F7414@ALA-MBB.corp.ad.wrs.com>
References: <1435737141-31961-1-git-send-email-jackie.huang@windriver.com>
	<CAJTo0LacneDbjFJR+uPQs__cqx+FVwXEuyCXe5zVui+Gu9tbpg@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AAF11F6D32@ALA-MBB.corp.ad.wrs.com>
	<20150703090405.GA2436@jama>
	<CAJTo0Lbdq1=ZgX5VQApdvhDfX1uF3MkT0sD_MXfQr3coN18t1A@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AAF11F7414@ALA-MBB.corp.ad.wrs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 3 Jul 2015 10:38:31 +0100
Message-ID: <CAJTo0LZDcTfLFE8wsCU04m0LR1mNOb-Q1zjO2d8hRTQfTmvuHw@mail.gmail.com>
To: "Huang, Jie (Wind River)" <jackie.huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xorg-proto-common: allow the empty package
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
X-List-Received-Date: Fri, 03 Jul 2015 09:38:53 -0000
Content-Type: multipart/alternative; boundary=001a11376dacd97cbc0519f5528d

--001a11376dacd97cbc0519f5528d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 3 July 2015 at 10:34, Huang, Jie (Wind River) <jackie.huang@windriver.co=
m
> wrote:

> I see your point, I think we can make the empty PN rdepends on PN-dev(but
> the dev-deps QA check need to be skipped),
>
> then when user try to add PN, PN-dev will also be installed, so it=E2=80=
=99s not
> an useless empty package.
>

bigreqsproto is development headers.  Therefore its in the bigreqsproto-dev
package.  This is not hard to understand, nor should we start filling the
feeds up with empty packages just to please users who can't verify the
package names.

Didn't we have this discussion a few months ago?  There are some recipes
where PN not existing is unusual (avahi was a good example, and I had a
partial branch to fix that), but for recipes which entirely consist of
development files, there only being a development package is reasonable and
predictable.

(If I *had* to do this, I'd have RPROVIDES_${PN}-dev +=3D ${PN})

> I see that openssh has similar situation, PN is allowed empty, but it
> rdepends on =E2=80=9C${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen=E2=80=9D=
.
>
That's a different use case entirely: pulling in the entire SSH suite in a
single package whilst still allowing resource-constrained or secure systems
to pull in only the parts they want.

Ross

--001a11376dacd97cbc0519f5528d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 July 2015 at 10:34, Huang, Jie (Wind River) <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:jackie.huang@windriver.com" target=3D"_blank">jackie.huang@wi=
ndriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p><spa=
n style=3D"color:black">I see your point, I think we can make the empty PN =
rdepends on PN-dev(but the dev-deps QA check need to be skipped),
<u></u><u></u></span></p>
<p><span style=3D"color:black">then when user try to add PN, PN-dev will al=
so be installed, so it=E2=80=99s not an useless empty package.</span></p></=
blockquote><div><br></div><div>bigreqsproto is development headers.=C2=A0 T=
herefore its in the bigreqsproto-dev package.=C2=A0 This is not hard to und=
erstand, nor should we start filling the feeds up with empty packages just =
to please users who can&#39;t verify the package names.</div><div><br></div=
><div>Didn&#39;t we have this discussion a few months ago?=C2=A0 There are =
some recipes where PN not existing is unusual (avahi was a good example, an=
d I had a partial branch to fix that), but for recipes which entirely consi=
st of development files, there only being a development package is reasonab=
le and predictable.</div><div><br></div><div>(If I *had* to do this, I&#39;=
d have RPROVIDES_${PN}-dev +=3D ${PN})</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<p><span style=3D"color:black">I see that openssh has similar situation, PN=
 is allowed empty, but it rdepends on =E2=80=9C${PN}-scp ${PN}-ssh ${PN}-ss=
hd ${PN}-keygen=E2=80=9D.</span></p></blockquote></div>That&#39;s a differe=
nt use case entirely: pulling in the entire SSH suite in a single package w=
hilst still allowing resource-constrained or secure systems to pull in only=
 the parts they want.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a11376dacd97cbc0519f5528d--
