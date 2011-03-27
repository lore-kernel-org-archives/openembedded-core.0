Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q3z1e-0002hU-Qt
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Mar 2011 01:05:39 +0200
Received: by iwn10 with SMTP id 10so3296262iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Mar 2011 16:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=bOCCJ8ah9AByjMfOIuEM/1RR9nGm4VzGlviZD+OHM1o=;
	b=gWGj+ljM8cFBm5Z9RJiHuIJpoYuqpUK3u8vA/okowbyMPEJpS7RZi3GFdSUkDrJ5IU
	oBhBk6cWDAPIZO33FYOGEl1CFM12xfAkK5ID9pZPgRQp8kmmB/3dP0JZLYUPHUcTgWdz
	OL40M0MOHwKBj9gJo5EuYnsfcYz07NiSHPPEc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=CtTRhCVblkRvOuCQ8gi0hP/lVzUKRVzLFYAZUpdT4rnBZ7i/gEDQfRizqCL6mrYP9g
	BKc7RtktgV/PoBc5w/5VNauajr3HEJZu6Sf5/g5Piq5003UrTJF+bvEOG4tRpJIRUPHL
	o9+FToJN783nL7Gf5u2aK6jLx3MtEk41pzvZo=
Received: by 10.43.131.5 with SMTP id ho5mr2587973icc.257.1301267022116; Sun,
	27 Mar 2011 16:03:42 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.42.135.130 with HTTP; Sun, 27 Mar 2011 16:03:22 -0700 (PDT)
In-Reply-To: <20110327200802.GA23980@sakrah.homelinux.org>
References: <20110327200802.GA23980@sakrah.homelinux.org>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 27 Mar 2011 16:03:22 -0700
X-Google-Sender-Auth: qAcSA3CQSs2XiOQ4aarO1Ew5VzM
Message-ID: <AANLkTi=NeEXCqdyiQWaxA=aU96-Osuj+gE-zGRwkPH6-@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: DEPENDS tranlation with BBCLASSEXTEND
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
X-List-Received-Date: Sun, 27 Mar 2011 23:05:39 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Mar 27, 2011 at 1:08 PM, Khem Raj <raj.khem@gmail.com> wrote:
> I observed that if I have
> DEPENDS = "a b" in recipe.bb which has BBCLASSEXTEND = "native"
> then dependecies for recipe-native shows a-native b-native so far so
> good
>
> Now if I want to add a dependency which only is needed for native recipe
> I do
>
> DEPENDS_virtclass-native += "c-native"
>
> what this does is it will ignore a-native and b-native dependencies and
> only adds "c-native" to depends of native recipe
>
> DEPENDS_virtclass-native_append = " c-native"
>
> This does what I wanted i.e. have deps on a-native b-native c-native
>
> I think behavior of += or _append should be similar. Is my understanding
> correct ?

They've never been the same.  += is immediate, _append is delayed.  If
a class, say, native.bbclass, defines the variable with ?=, and you
used += before the inherit, then it will have a value, and the ?=
won't assign.  I assume native.bbclass does it this way today so you
can override the automatic behavior by defining the variable yourself,
but I'll let Richard speak to that decision.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


