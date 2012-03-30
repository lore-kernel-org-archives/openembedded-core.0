Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SDk9a-0008Ba-Bz
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 00:18:42 +0200
Received: by qao25 with SMTP id 25so803640qao.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 15:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=skBmqB5Rkg2fFrSYqwfpH5kJLvDG5+fZLomLUnX9aSs=;
	b=E0QFM79VDBuyzGTB7wOn44Y2g7kvRDKP21Zd4CQjXPcVhvKEZVLbPIO6GLhQOho7z/
	CQzG5j9fdfNSxCUhS6Juv+7ABc+akZik/u0VrQiGeu1pAmoLDn5p4pmKeXLv7aRFTlME
	eeIU6303eNrysqjyjtj5oS3DqUXX4n4cwetxuIuS6shSe18Un2BsVwfo5BK6GfYRozx0
	UgR3m2YR7N3rKzcEac/lfQdJfp5tnPF6l0obG7Wsvgv02qDrpg7BfxyQExqDLECSjl86
	jHRbBuKsXXXbAGIO9wswQrtd7MHQUnf5JAe71Jb/zSDIDiFCBe96ypNtBa4bjrKWV/gM
	1APg==
Received: by 10.229.136.68 with SMTP id q4mr35373qct.85.1333145377169; Fri, 30
	Mar 2012 15:09:37 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.158.11 with HTTP; Fri, 30 Mar 2012 15:09:16 -0700 (PDT)
In-Reply-To: <4F762DE1.5070006@windriver.com>
References: <CABcZANnPwgsCz=f8_UhM3TZsBotBZ26FYp5Fbxjq_kYqqBs3cQ@mail.gmail.com>
	<4F762DE1.5070006@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 30 Mar 2012 15:09:16 -0700
X-Google-Sender-Auth: ZvkW3cw30OmMo5VhUVhIkGZYhmY
Message-ID: <CABcZANmEdxCg+rh8utC4Qw+6K1oC=KKZvPY9M0CDvDCatSt4zg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] One shared state reuse solution
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
X-List-Received-Date: Fri, 30 Mar 2012 22:18:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 30, 2012 at 3:04 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
>
> We've worked on a similar problem in the past. =C2=A0In specific cases we=
've
> added a checksum of the host's glibc to the mix. =C2=A0The problem we wer=
e
> solving was in glibc uprevs during the RHEL 4 world.. new APIs would arri=
ve
> and things would break -- or workaround would break.
>
> Have you considered adding that to the mix in an attempt to help determin=
e
> compatible host distributions?

It's been discussed in the past, but the problem is, as far as I know,
glibc isn't the only build host dependency we have. It's the most
visible, since glibc versioned symbols are the first place one
generally sees this sort of failure, but I think the safe bet is to
operate based upon the distro name/version, to avoid any potential
other compatibility issues with other host libraries that get linked
against. It'd be nice to ensure that glibc is the only dependency, at
which point that sort of approach would be more reliable, but I don't
think we're there yet (please correct me if I'm wrong here).

> I do like the idea of directory based sstate cache. =C2=A0It can more eas=
ily
> identify what the components belong to. =C2=A0(I wouldn't mind some type =
of
> hierarchy for the target stuff as well, but so far I'm not sure exactly i=
t
> would look like or trigger off of.)
>
> However, shy of directory based.. adjusting the generated checksum in som=
e
> way should be enough -- the downside is how do you detect compatible host=
s
> or not.. =C2=A0You may have to generate multiple checksums and look for b=
est
> matches, which I suspect is also new code.

What we had before this was just injection of the lsb_release
identifier/release into the native/cross signatures via vardeps, but
as you say, dealing with compatible hosts is non-trivial. I'm
certainly open to that sort of approach, but as you say, I think
there's other value to this approach, and seems a bit less confusing
:) Thanks for the comments, it's certainly a non-trivial problem to
solve.
--=20
Christopher Larson


