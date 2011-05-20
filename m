Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QNUdn-0004cN-Id
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 20:41:39 +0200
Received: by vws2 with SMTP id 2so3328930vws.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 11:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=I3pPJou+D+CYg5wi5R3Q4VDKy9rWNxk/OjXU36SRvuM=;
	b=hjUquIZv0VfN45AoQlMtbQGWU8+9aVZ9AqXhkRjN9QmXXWJ1yk3tEjiRaIYhHMxilX
	3KZ+ObkngfzkrBoVy0d+9hWAoa1grUNlEyD7V36C+ODwSRhCNcfI0i0QMswMfBwJs3fw
	E4E6ordzEjIiBuz1j9K7rvA/Sr8R+M1WTwfV4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	b=m+cJRV3amuShd7liDTGBMlfsak6wZChOQJZ6MNv89jFBVWK7l5yUTjVK3UTWfZZSxw
	1hYoD5MYDtv9tfb032ZLSWgbKGl84neTEru5GYdGa5mgtUgcCvszXhCRIxb1kstodCWU
	+AgZ8J7z2sTfWQXy/6r3nCbMDFtABzqK2AiYs=
Received: by 10.52.74.34 with SMTP id q2mr1918340vdv.114.1305916722165; Fri,
	20 May 2011 11:38:42 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.183.162 with HTTP; Fri, 20 May 2011 11:38:07 -0700 (PDT)
In-Reply-To: <1305916191.3424.674.camel@rex>
References: <cover.1305752660.git.chris_larson@mentor.com>
	<b7564c32452e9ce33d9790465b986471ef5a3cba.1305752660.git.chris_larson@mentor.com>
	<1305914753.3424.670.camel@rex>
	<BANLkTinNWWa326y1rS8eWNkXrYYaSqTh8Q@mail.gmail.com>
	<1305916191.3424.674.camel@rex>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 20 May 2011 11:38:07 -0700
X-Google-Sender-Auth: U8MiJ8STWWQVKGrI0ctxILbaWOU
Message-ID: <BANLkTi=rRriYbQHgu1rkdz5YLzY0Sy=SgQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 4/5] image.bbclass: switch to OE's IMAGE_FEATURES
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
X-List-Received-Date: Fri, 20 May 2011 18:41:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 20, 2011 at 11:29 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Yes please :)
>
>> >> --- a/meta/classes/image.bbclass
>> >> +++ b/meta/classes/image.bbclass
>> >> @@ -11,8 +11,45 @@ INHIBIT_DEFAULT_DEPS =3D "1"
>> >>
>> >> =C2=A0# "export IMAGE_BASENAME" not supported at this time
>> >> =C2=A0IMAGE_BASENAME[export] =3D "1"
>> >> -export PACKAGE_INSTALL ?=3D "${IMAGE_INSTALL}"
>> >> -PACKAGE_INSTALL_ATTEMPTONLY ?=3D ""
>> >> +
>> >> +PACKAGE_INSTALL =3D "${@' '.join(oe.packagegroup.required_packages('=
${IMAGE_FEATURES}'.split(), d))}"
>> >> +PACKAGE_INSTALL_ATTEMPTONLY =3D "${@' '.join(oe.packagegroup.optiona=
l_packages('${IMAGE_FEATURES}'.split(), d))}"
>> >> +RDEPENDS +=3D "${@' '.join(oe.packagegroup.active_packages('${IMAGE_=
FEATURES}'.split(), d))}"
>> >
>> > I also noticed this patch changes things so PACKAGE_INSTALL_ATTEMPTONL=
Y
>> > is used for the dev/doc/dbg packages. I'm not sure its a major issue b=
ut
>> > it is a change in behaviour and I'd have expected it in the commit
>> > message.
>>
>> Ah, that's my mistake then, I didn't realize the behavior was
>> different in the current implementation. I just figured some packages
>> might not have dev/doc/dbg, so it should be nonfatal to miss them. We
>> may also need to make sure rpm/deb both handle attemptonly properly,
>> as upstream's did not. I'll add this to the commit message, unless you
>> think they shouldn't be optional? I'm inclined to prefer it this way,
>> as, iirc, the depchain stuff uses recommends rather than depends.
>> (though i may be remembering wrong?)
>
> I just checked and all the rootfs package backends have code which looks
> like it makes that work. I'm fine with the behaviour change as long as
> we document it.
>
> FWIW, I merged the other patches in the series since they were not
> directly related.

Thanks, I'll resend this commit shortly.  Aside: can anyone think of a
better name than PACKAGE_GROUP for defining named groups of packages?
I rather dislike it, but can't think of anything better. PACKAGES is
clearly already used, and isn't sufficiently explicit.  PACKAGESET or
something could work, but I don't know that it's an improvement..
maybe this is best, but I thought I'd ask. I'm terrible at naming just
about everything, projects included (*cough* OE *cough*) :)
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


