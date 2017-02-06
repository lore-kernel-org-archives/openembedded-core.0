Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 730E271979
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 15:59:47 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id w20so103849067qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2017 07:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Z1H/1u3iKNTG6SOzRQf8Y2sDI06sRVOh0uDi/yNqEfU=;
	b=ILcOMszh2J3acT9skLr+K2KZvP0z2EjIx1TdmE62eTw6ZicCKDPy3pkD1TP/u7vp8e
	dLGUzcshdBYbSOUiIK7CqJb+EwyL0jP2trXJKA1t1UqWpDuV8Fl/KEWdWdJaEKXztqfD
	nuPrC393m4ruHV+cAcuNIGBBOthDqMSMeGqa+l+KFIc1ZgblgjAbKQH//zpefDuDbPb2
	vXGrh1BLoIT1EyPLxrC+pgBuucuPCtLZbKs0d30wWXRzPJjwhdDntlUNzJCGoaUHxxO4
	95+tqK+Ld8Pt/CxLVlQjpezpc6an8heqpHp66JMhpkV81LB0XRQoCde+J0amdwUhUKB4
	1Miw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Z1H/1u3iKNTG6SOzRQf8Y2sDI06sRVOh0uDi/yNqEfU=;
	b=pPk7WZlBJNFUN0xz5bKFN+SHd7OQKkOdgct+kfKvNt5j38G7fhsIAEyAfMKexLA+ey
	iPZgKLXxvGBJPhaAce1tpMbdQRiy9JN+kCqg3uEMSfRadbkJ+j1rzTQbEuHujqZLiEOf
	0CsQJmSvvH0DEAHsJu2OCs4ijHKl2FGVJ2/4e7yDgnmeDSZOS1hbOmFOLMHAzueIqO8W
	0e6ZtSJbOEqI5fbVHbfnZSLMJCvBTDVwTmB1kea7a3ElZgZVWAbj+ziX+y+vICcu8N6y
	jG1GF/e7uu8CmrPTQCqfohT9jXUTGoktFZ/+fMxkH+QozVPfaWz+xfovlOv4GmOplG2Z
	4xdQ==
X-Gm-Message-State: AMke39kBPeIFry7yZH5YKCfE7DVcmRm7aH2wQ7m9sICcmVeASCfCPQCN6decF4PpnIZwHsFKG3w/5w+heFrZDTW1
X-Received: by 10.200.45.247 with SMTP id q52mr10738774qta.197.1486396788310; 
	Mon, 06 Feb 2017 07:59:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 6 Feb 2017 07:59:27 -0800 (PST)
In-Reply-To: <5895A819.8040509@topic.nl>
References: <5895A819.8040509@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Feb 2017 15:59:27 +0000
Message-ID: <CAJTo0LYRFiXcW6VxbW6ea=QCbg_X1H3rXmQek+TkKKNp6yCBQg@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [morty] Python cyclic dependencies
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
X-List-Received-Date: Mon, 06 Feb 2017 15:59:49 -0000
Content-Type: multipart/alternative; boundary=001a1139cdf09019d50547deb803

--001a1139cdf09019d50547deb803
Content-Type: text/plain; charset=UTF-8

On 4 February 2017 at 10:08, Mike Looijmans <mike.looijmans@topic.nl> wrote:

> RDEPENDS_${PN}-re="${PN}-core"
> RDEPENDS_${PN}-lang="${PN}-core"
> RDEPENDS_${PN}-core="${PN}-lang ${PN}-re"
>
> And this is what creates that cycle. Either core depends on lang, or vice
> versa, but not both (or they should simply be one and the same package)
>
> I'd be happy to provide a patch either way...
>

I'd be tempted to say squash them into core, and add RPROVIDES for
compatibility.  Obviously nobody needs to save the few hundred kb you'd
remove by allowing the parts to be installed independently.

Ross

--001a1139cdf09019d50547deb803
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 February 2017 at 10:08, Mike Looijmans <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mike.looijmans@topic.nl" target=3D"_blank">mike.looijmans@topic.=
nl</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":mx" =
class=3D"a3s aXjCH m15a09e5ffc7b3f60">RDEPENDS_${PN}-re=3D&quot;${PN}-core&=
quot;<br>
RDEPENDS_${PN}-lang=3D&quot;${PN}-cor<wbr>e&quot;<br>
RDEPENDS_${PN}-core=3D&quot;${PN}-lan<wbr>g ${PN}-re&quot;<br>
<br>
And this is what creates that cycle. Either core depends on lang, or vice v=
ersa, but not both (or they should simply be one and the same package)<br>
<br>
I&#39;d be happy to provide a patch either way...</div></blockquote></div><=
br>I&#39;d be tempted to say squash them into core, and add RPROVIDES for c=
ompatibility.=C2=A0 Obviously nobody needs to save the few hundred kb you&#=
39;d remove by allowing the parts to be installed independently.</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div><div c=
lass=3D"gmail_extra"><br></div></div>

--001a1139cdf09019d50547deb803--
