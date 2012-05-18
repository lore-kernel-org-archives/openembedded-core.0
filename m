Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SVEnr-0005wE-Fp
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 06:28:35 +0200
Received: by werg55 with SMTP id g55so1728432wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 21:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=mgpLlG2a/wS9aZvtiIiiwNGwrIU5wVusPYFEVqOXKgQ=;
	b=Aw4ZNRrmTV+Irs3z7+FtzJESH+I8SNr/g3JJNsMM2vuvaX2sjT77WM7fx92ZGF5pJg
	T4WQwu4XKOg+GGD6z70MFTWgR160R+nj+kPmHZiH7t/Hi+CWqNr0YVzbughzrSbXzZGn
	/HoGHKx7ko6GP9jnPTzor3qGATwsIO+rgpOLLbC+GEcPdy6LVDK8Hj8nwlTM+gm6nAyu
	3J15rKLLNI8bwDbfafdV/w1zqPw2RCYm1fhcLj76k2EQevnJ4sc82VvX11Gc9PQn16uh
	QEI/h5V/xAW9eUWjolo86cLSZtMfwkDc2d0ejUshetsjRHbAxOeHfgdGnv9EJwjp14HW
	Dxww==
Received: by 10.216.140.102 with SMTP id d80mr6229368wej.80.1337314712134;
	Thu, 17 May 2012 21:18:32 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.181.16 with HTTP; Thu, 17 May 2012 21:18:11 -0700 (PDT)
In-Reply-To: <20120516115848.4348b984@wrlaptop>
References: <20120515140110.2ba5a1be@wrlaptop>
	<CAKSdS8K64oTpq4asBcL9k4BgCe6BOEAwX3exQyq4GoTHtAxW9w@mail.gmail.com>
	<4FB32EA1.3060601@linux.intel.com> <20120516115848.4348b984@wrlaptop>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 17 May 2012 21:18:11 -0700
X-Google-Sender-Auth: il44Aeu928il0IJucXa5C8XHmbI
Message-ID: <CABcZANnXuL8O6Kh0vKh4Puy0NSzt8r7ee5vr=_OkaWQGV6=C3g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: FOO_subtract, the logical antidote to FOO_append.
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
X-List-Received-Date: Fri, 18 May 2012 04:28:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 16, 2012 at 9:58 AM, Peter Seebach
<peter.seebach@windriver.com> wrote:
> On Wed, 16 May 2012 07:35:45 +0300
> Saul Wold <sgw@linux.intel.com> wrote:
>
>> My understanding is that a _subtract is fraught with danger, there
>> all sorts of ordering implications.
>
> Yes.
>
> But consider, if you will, the specific case of
> DISTRO_FEATURES_LIBC_DEFAULT, and a libc which is just like eglibc
> except that it lacks RPC.
>
> Anything I do that isn't processed at the tail end of everything,
> around the point where _appends are processed, will be unable to
> cleanly obtain "the value that would have been set by default if
> nothing else happened", and then remove a word from it. =C2=A0I can't set=
 a
> value in advance, because if I do the ?=3D won't fire and none of those
> words will get set. =C2=A0I can't necessarily set a value later.
>
> Overrides won't work either, because overrides also destroy the
> existing values.
>
> It seems to me that for a subtraction to work, it *must* be the very
> last thing done.
>
> Basically, the purpose of suggesting this as a formal behavior defined
> to be The Very Last Thing is to minimize the complexity of the ordering
> implications. =C2=A0You get exactly what you would have gotten otherwise,
> with these words removed.

I agree. I think this is the only sane option for implementing this
given bitbake's current behavior. Clearly a -=3D would be extremely
problematic, and would have clear complications with variable
expansion, as we discussed on IRC. I'd be interested in seeing a
prototype implementation of this, to experiment with it and see how
viable it is.
--=20
Christopher Larson


