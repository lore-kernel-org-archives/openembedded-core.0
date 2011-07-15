Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QhkWa-0000re-MI
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 17:42:07 +0200
Received: by ywa12 with SMTP id 12so605335ywa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 08:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=6ozFF3mZCRPZZpY5icXzl2aHJbjCdZ90HJjwYAwocCY=;
	b=TqLVfQvkruaX06iIAa9lxjOC0a9vpbWSiGvWkZb7bOFjoDi/3VYFBb21fxRlXtha3A
	MI9ZXMTst7HC6SLl13inzALT0039kAD0i8Gyzo88xNPOIBAEfmN3z5oIprFS7psUeL5J
	Ut+EDjK9XHLpccekbLLXEl7FpDhKwVADHa5Rk=
MIME-Version: 1.0
Received: by 10.90.12.31 with SMTP id 31mr3630257agl.81.1310744218514; Fri, 15
	Jul 2011 08:36:58 -0700 (PDT)
Received: by 10.91.164.38 with HTTP; Fri, 15 Jul 2011 08:36:58 -0700 (PDT)
In-Reply-To: <1310742175.30326.1.camel@phil-desktop>
References: <1310736077.3805.37.camel@phil-desktop>
	<CADkTA4OYB0mch1SRSgidwGfZiWBeBuaWKH1BU1NgF9jPVa1Niw@mail.gmail.com>
	<1310742175.30326.1.camel@phil-desktop>
Date: Fri, 15 Jul 2011 11:36:58 -0400
Message-ID: <CADkTA4MoCmtKypORoGvShciAgiFsOJFLmSiAQiVdAxLAYKkyHQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernels
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
X-List-Received-Date: Fri, 15 Jul 2011 15:42:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 15, 2011 at 11:02 AM, Phil Blundell <philb@gnu.org> wrote:
> On Fri, 2011-07-15 at 09:51 -0400, Bruce Ashfield wrote:
>> On Fri, Jul 15, 2011 at 9:21 AM, Phil Blundell <pb@pbcl.net> wrote:
>> > The other day I was working on a BSP layer for a fairly generic i586
>> > system and I was struck by the fact that we don't appear to have any
>> > vanilla kernel recipes in oe-core. =A0I had sort of expected that, to =
get
>> > a standard bzImage out, I would just need to ship an appropriate
>> > defconfig in my layer and everything else would "just work".
>>
>> Hmm. Perhaps it isn't documented clearly enough as such, but the linux-y=
octo
>> kernel base can work in this mode, since that was a design goal of
>> 1.0.
>>
>> You pick a branch, throw in a config fragment (or defconfig if you reall=
y
>> want) =A0and build. The base branches in the tree are generic enough to
>> sort a range of boards out of the box, and should form a base.
>
> Okay, cool. =A0I'll give it a go and see how I get on.
>
> Is there a description anywhere of what the functional differences are
> between the code in linux-yocto git and the upstream kernel.org tree?

It varies, and the variables are many, so I can answer this in several ways=
.

Here's some bullet points to save anyone from reading an essay:

 - The ultimate source is obviously the upstream kernel. The goal is
no patches, or
   are the very least, no changes that are carried for a significant
amount of time.
   This typically holds for BSPs, drivers, bug fixes, etc. But sometimes no=
t for
   features or other out of tree projects that haven't made it as
viable upstream
   features (yet .. or ever).

   So all that says is that "We aren't trying to vary it wildly, but
create an infrastructure
   where interesting projects can be tried out, and to allow others to
vary it wildly if they
   want"

 - The linux-yocto tree, once a branch is checked out and a build is
started, is just
    like any other kernel tree. There are plenty of other examples of
trees with multiple
    branches for containing and controlling development. The
difference here could be
    that the branch is found and checked out by the build process
(that's the more
    'complex' mode, but you can just build 'whatever branch the repo
is on' as well)

 - To see the actual differences from the upstream base, there are tags and=
 the
   branches themselves, which all facilitate using git to dump logs
and changes from
   the merge base of the core branches (i.e. yocto/base).

  - The features you'll find in the tree change by kernel version
(since some projects
    may lag their updates and hence miss a tree or two), timing of the main=
line
    kernel, the invasiveness of a feature or simply what is being
worked on by some
    yocto (or other) developers!

Hope that helps,

Bruce



>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


