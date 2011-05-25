Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QPNEm-0006ol-BQ
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 01:11:37 +0200
Received: by eye27 with SMTP id 27so118827eye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2011 16:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=9YPYWFYEImK8MB7asbz47OyA6vfSQwbbJVkGOhO+Cns=;
	b=rXy3CWCRsKaCElAyBgNCZ3wiUR+YjtjKnMEGN7GaCq0bR/+EH8cyHbOo+mjHjR6XMI
	nsUm1LPeoItdQf+bPlLlGO9N+vkiV8YB2mF3aGRozV/N0nooAc4V04Khl5WP78GNIwZe
	mAyR8WLAmnvnVbZZU7o1gNNEoLSPiRoMn9amE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=jzJUDWQnjGYyWPyQ4harCxW+VHIpa2t8w6RnKXf9BD8jEYYr9fgZlZZIaZ7M2NHFLn
	hUieDkXmsNfiZDdf5yz4J4oM6jl1xO8s0bAdMxqYyow6ToJV53wm2YlRVUCoRBXrPC9M
	xrfCac/nnmro0g/qP3BjjZw+dYtOwKzJJbI2Q=
Received: by 10.14.18.147 with SMTP id l19mr53687eel.140.1306364913155; Wed,
	25 May 2011 16:08:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Wed, 25 May 2011 16:08:03 -0700 (PDT)
In-Reply-To: <1306364520.27470.81.camel@rex>
References: <1306342881.2525.258.camel@phil-desktop>
	<1306364520.27470.81.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 May 2011 16:08:03 -0700
Message-ID: <BANLkTinUDhgtYgShemq_3vNuTHkOuCWdug@mail.gmail.com>
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
X-List-Received-Date: Wed, 25 May 2011 23:11:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2011 at 4:02 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-05-25 at 18:01 +0100, Phil Blundell wrote:
>> By way of displacement activity to avoid actually fixing my perl
>> compilation problem, it occurred to me to investigate why perl was
>> getting dragged into a micro-base-image build in the first place. =C2=A0=
The
>> culprit turns out to be imake, which does:
>>
>> RDEPENDS_${PN} =3D "perl xproto"
>>
>> and is then BBCLASSEXTENDed to imake-native (which in turn is pulled in
>> by way of prelink-native and transfig-native).
>>
>> Now, leaving aside the question of whether it is reasonable for prelink
>> to be depending on transfig, it is clearly wrong for the -native version
>> of imake to be depending on perl. =C2=A0It seems that native.bbclass mak=
es
>> some effort to rewrite plain RDEPENDS to the -native version, but it
>> doesn't apply the same tactics to RDEPENDS_${PN} or any such. =C2=A0(And=
, in
>> fact, rewriting plain RDEPENDS is probably futile since few if any
>> recipes are going to be setting it.)
>>
>> Obviously I can fix this by just setting RDEPENDS_virtclass-native in
>> the recipe, and that's what I've done in my local tree. =C2=A0But I wond=
er if
>> a better solution would be for native.bbclass to be slightly more
>> adventurous about rewriting these things for itself.
>
> I think we need to fix native.bbclass. I dread to think what this is
> doing to the dependency tree at present. We did remove most references
> to RDEPENDS directly so I think that makes this a high priority to fix.
>
> I'd note that the rewriting code is fraught with ordering/expansion
> issues which is why that code plays games with the variables like it
> does.
>
> DEPENDS is horrible and it looks like we needed to do something similar
> for RDEPENDS. Better solutions to the ordering problems would be very
> welcome. It problem was the use of DEPENDS_prepend in places iirc.
>


while we are talking about fixing native.bbclass on a different
tangent. I think overrides is another thing we need to fix
specially libc overrides. When a recipe inherits
native,cross, or nativesdk then we have to change
the libc override to be always libc-glibc (unless one
is building on a box which is running uclibc)

otherwise we end up with slightly different native
packages and sstate can not use them effectively
it keeps rebuilding and refreshing everytime.

> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


