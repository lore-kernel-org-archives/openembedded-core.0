Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.parkin@gmail.com>) id 1Qe1pU-0003qy-0A
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 11:22:04 +0200
Received: by vxa37 with SMTP id 37so4563207vxa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2011 02:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=oz36F/J+DUX5Zl76MrjIH17+yeudjBuRHOWzxIP3Imw=;
	b=Wcw/wytsEJBQYB6a7mQrsVcdpU7LUuM86GJ2GswEUk+75wILX8/mykW3i9ysJr1lio
	iYaSfkiemxNQkIUBOZHYR+HjbKMrXxGXCdMGUYZCVjvtjvmDLQQaomAhBEYDebowCFGm
	72widliWneRVsGoc0Tnli/1YBcp95ymWxn3AQ=
MIME-Version: 1.0
Received: by 10.220.74.134 with SMTP id u6mr2694798vcj.99.1309857494498; Tue,
	05 Jul 2011 02:18:14 -0700 (PDT)
Received: by 10.220.186.140 with HTTP; Tue, 5 Jul 2011 02:18:14 -0700 (PDT)
In-Reply-To: <1309472850.20015.475.camel@rex>
References: <20110630172627.GC2871@raven.pace.internal>
	<1309472850.20015.475.camel@rex>
Date: Tue, 5 Jul 2011 10:18:14 +0100
Message-ID: <CACzvQma1nK7A3Z35kN7MuBJMzq=u8C1+szqpOwB6fMo_X08W-A@mail.gmail.com>
From: Tom Parkin <tom.parkin@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Adding an external toolchain to oe-core
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
X-List-Received-Date: Tue, 05 Jul 2011 09:22:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Thanks for your feedback.  I've added specific comments inline below
-- but basically, ACK to the idea of submitting the updated CSL
mips-4.2 recipes for inclusion.  I think some of the specifics
discussed below will be clearer when you see the patches.

I have an upcoming demo in the pipeline which is demanding most of my
attention at the moment, but I will endeavor to get a patchset
submitted for early review this week.

On 30 June 2011 23:27, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> If you are willing, I'd like to propose we drop the old 2008q3 .bb files
> and replace them with ones from the toolchain you've worked with so its
> a working example.

That sounds like a good idea.  I would caution that the recipes we've
developed to date are merely "more working" than the 2008q3 versions,
but I think they still represent a better starting place for new
external toolchains.

> I'd then like to find ways to allow this to work "out the box" rather
> than needing as much hacking to OE-Core such as the TARGET_OS change.

Again, I agree.

Since looking at the mips 4.2 CSL toolchain I've gone on to try the
same integration process with a few toolchains we have from silicon
vendors -- this is my actual goal, as our projects typically have to
make use of vendor-provided toolchains for support reasons.

My experience from this process suggests that each new toolchain
requires a new quota of recipe hacks across the stack.  The nature of
the hacks depends on whether the specific kernel header / libc
combination included in the toolchain gels well with the selection of
packages in oe-core at the time.

So I think any effort to support a new pre-built toolchain will
require some effort on the part of the developer.  But anything that
makes external toolchain support easier across the board would be
useful.

>> The CSL MIPS toolchain provides locale information out of the box, so
>> we modified the toolchain recipe to suit by setting
>> GLIBC_INTERNAL_USE_BINARY_LOCALE to "precompiled". =A0You have to also
>> set ENABLE_BINARY_LOCALE_GENERATION to "0" in local.conf to prevent
>> this setting getting overridden, though!
>
> Ouch, we should find a way for the local.conf setting not to be needed.

Yes.  I'll look into how we can fix this properly.

>> To allow us to do this without tclibc-glibc.inc overriding the setting
>> of TARGET_OS we had to change the assignment of TARGET_OS in
>> tclibc-glibc.inc (to use "?=3D" rather than "=3D").
>
> This is probably going to be the hardest issue to fix. I would like to
> find a way to do it but that variable is tricky to handle for various
> reasons...

It's not clear to me whether the correct approach is:

 * to subtly abuse the variables as described previously and then fix
up the side-effects
or:
 * to modify oe-core to give it a more flexible rendering of the
arch/target/libc triplet.

FWIW, with the hacks we added to support the CSL toolchain we have
been able to add support for a couple of other MIPS toolchains without
issue, so perhaps the approach we followed was appropriate.

>> In order to have the rest of OE recognise our new target prefix, we
>> had to modify two lookup tables: one in siteinfo.bbclass, and one in
>> insane.bbclass.
>
> I wonder if we can use some wildcards or some other mechanism to avoid
> that.

Quite possibly -- I'm sure more experienced bitbake/oe devs would be
able to give pointers once we post patches.

>> # Step 5: fix up packages which depend on features CSL doesn't have
> Its certainly useful to document these but since they're
> version/toolchain specific, I think these are less interesting from an
> OE-Core perspective.

Agreed.  It is probably useful to document the types of issue one
might expect to face in supporting a new external toolchain, but the
specifics of the changes will vary from toolchain to toolchain as
discussed.

> Could you get away with using more recent kernel headers or does that
> cause issues within the toolchain? I guess that ultimately depends what
> kernel version you're using for your target too.

It's really a case of what features your libc supports since that's
what userspace is linking against at runtime.  In some cases one can
make use of kernel functionality that libc doesn't know about by means
of direct syscall()s in code, but that's pretty ugly.

As a rule I'm more comfortable to take the toolchain as-is, sanitised
kernel headers and all.

>> # Step 6: endianness specification
> Did you do this by changing TOOLCHAIN_OPTIONS or TARGET_CC_ARCH out of
> interest?

We did this by means of appending -EL to CXX and LD in the toolchain
recipe.  We then added bit of hackery in siteinfo_get_endianess() to
look at CLAGS for the "mips" case to decide whether the target is
little or big endian...

Thanks,
Tom
--=20
Tom Parkin
www.thesecretdogproject.com
Morality, like art, means drawing a line someplace /Wilde/


