Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QPHXU-0007kC-8Z
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 19:06:32 +0200
Received: by vws2 with SMTP id 2so6721427vws.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2011 10:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=JKm/d+m6REso9YdqkBVm+WCBfsdEMdkwxgHDENiDAks=;
	b=hjFElfcWqZqjy+H3BxO4wA0ItgBbdzPwDC+ut4FwupmYImcrFl+Ym0Z1dRel6mCmk+
	Tm6xYGdVsnIAQOmVAeE+zw88Bhg5nGN6SUUlF4SiT3C2cnDOXI3VWMysSZw6PcCXjdtj
	oPo7P0JnzjlvtebXZUTnwwHsWzQXYUGCiSvUs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=LSLEJv/UczPp9omxIZhsQzUQZCRNd9y9scPrPwzDnzmIZyJS4kTaaw/vNJ1zxVViq2
	7wdGqJXZs/5KZowwhwrbioLUWa58Cldpz+R83BvgU4nMMbIsZVHgj91sRQF7/3jIFfSl
	bAwsTQg4vWGnAJvQFD4l4KKjppWlxpTaplCRI=
Received: by 10.52.100.9 with SMTP id eu9mr83312vdb.228.1306343004062; Wed, 25
	May 2011 10:03:24 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.109.202 with HTTP; Wed, 25 May 2011 10:03:04 -0700 (PDT)
In-Reply-To: <1306342881.2525.258.camel@phil-desktop>
References: <1306342881.2525.258.camel@phil-desktop>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 25 May 2011 10:03:04 -0700
X-Google-Sender-Auth: 99HCW0ThiWw5JlgthsqiKey-BI0
Message-ID: <BANLkTimMXC3iLBuNXcqUR8buXxG7rVDLmQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RDEPENDS_${PN} and virtclass-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 May 2011 17:06:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2011 at 10:01 AM, Phil Blundell <pb@pbcl.net> wrote:
> By way of displacement activity to avoid actually fixing my perl
> compilation problem, it occurred to me to investigate why perl was
> getting dragged into a micro-base-image build in the first place. =C2=A0T=
he
> culprit turns out to be imake, which does:
>
> RDEPENDS_${PN} =3D "perl xproto"
>
> and is then BBCLASSEXTENDed to imake-native (which in turn is pulled in
> by way of prelink-native and transfig-native).
>
> Now, leaving aside the question of whether it is reasonable for prelink
> to be depending on transfig, it is clearly wrong for the -native version
> of imake to be depending on perl. =C2=A0It seems that native.bbclass make=
s
> some effort to rewrite plain RDEPENDS to the -native version, but it
> doesn't apply the same tactics to RDEPENDS_${PN} or any such. =C2=A0(And,=
 in
> fact, rewriting plain RDEPENDS is probably futile since few if any
> recipes are going to be setting it.)
>
> Obviously I can fix this by just setting RDEPENDS_virtclass-native in
> the recipe, and that's what I've done in my local tree. =C2=A0But I wonde=
r if
> a better solution would be for native.bbclass to be slightly more
> adventurous about rewriting these things for itself.

Huh, I knew it messed with rdepends, but I would have assumed that it
would alter the package specific vars for all packages in PACKAGES, at
the least..
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


