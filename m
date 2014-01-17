Return-Path: <peter.kjellerstedt@axis.com>
Received: from anubis.se.axis.com (anubis.se.axis.com [195.60.68.12])
	by mail.openembedded.org (Postfix) with ESMTP id 1C3596AA18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 13:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id 888B019F5B;
	Fri, 17 Jan 2014 14:54:02 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at anubis.se.axis.com
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4UF5eWmXYPU6; Fri, 17 Jan 2014 14:54:00 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by anubis.se.axis.com (Postfix) with ESMTP id 305F119E97;
	Fri, 17 Jan 2014 14:54:00 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 18814A57;
	Fri, 17 Jan 2014 14:54:00 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 0C730446;
	Fri, 17 Jan 2014 14:54:00 +0100 (CET)
Received: from xmail3.se.axis.com (xmail3.se.axis.com [10.0.5.75])
	by thoth.se.axis.com (Postfix) with ESMTP id 0A6EF3404E;
	Fri, 17 Jan 2014 14:54:00 +0100 (CET)
Received: from xmail3.se.axis.com ([10.0.5.75]) by xmail3.se.axis.com
	([10.0.5.75]) with mapi; Fri, 17 Jan 2014 14:54:00 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "OE Core (openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>, Bruce Ashfield
	<bruce.ashfield@gmail.com>, Koen Kooi <koen@dominion.thruhere.net>, Phil
	Blundell <pb@pbcl.net>
Date: Fri, 17 Jan 2014 14:53:59 +0100
Thread-Topic: [OE-core] RFC: Maintain backwards compatibility or not for
	module-base.bbclass
Thread-Index: Ac8S6nlEDsP6h3/NRve1cKwtUJgZDgAmJ2Hg
Message-ID: <A612847CFE53224C91B23E3A5B48BAC7A5548F20DF@xmail3.se.axis.com>
References: <A612847CFE53224C91B23E3A5B48BAC7A5548F1DCE@xmail3.se.axis.com>
	<CADkTA4N45TUxbnEd8RD8B2v7BQbY2fOR5UWMfa53c9CCQEZCSA@mail.gmail.com>
In-Reply-To: <CADkTA4N45TUxbnEd8RD8B2v7BQbY2fOR5UWMfa53c9CCQEZCSA@mail.gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, sv-SE
MIME-Version: 1.0
Subject: Re: RFC: Maintain backwards compatibility or not for module-base.bbclass
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
X-List-Received-Date: Fri, 17 Jan 2014 13:54:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I will aggregate my responses to Koen, Bruce and Phil below.

> -----Original Message-----
> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
> Sent: den 16 januari 2014 20:19
> To: Peter Kjellerstedt
> Cc: OE Core (openembedded-core@lists.openembedded.org); Phil Blundell
> Subject: Re: [OE-core] RFC: Maintain backwards compatibility or not for
> module-base.bbclass
>=20
> Op 16 jan. 2014, om 14:58 heeft Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> het volgende geschreven:
>=20
> > Background: Back in September, Richard made a commit to
> > linux-libc-headers.inc describing why one should not fork the
> > linux-libc-headers recipe:
> >
> > http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3Dbabbf7a46ac=
aefd9b36031483cafce053f607e66
> >
> > As a result I created a local bbclass for our layer called
> > kernel-headers, which provides a recipe with kernel headers
> > that match the actually used version of the Linux kernel.
> > This was needed for packages that need to access hardware
> > specific features that are not present in the generic kernel
> > headers provided by linux-libc-headers.
> >
> > My intention for this class was that it should be generic
> > enough to be able to upstream it to OE Core.
> >
> > Now, the other day a colleague of mine had a build failure due
> > to this class. It turned out that even though the class adds a
> > dependency on virtual/kernel and then uses the files that are
> > installed to ${STAGING_KERNEL_DIR} when running oe_runmake
> > headers_install, the command could fail because the
> > ${STAGING_KERNEL_DIR}/scripts was not populated. After asking
> > Richard about this, I learned that this is due to problems
> > with the sstate cache and not knowing whether a 32 bit host or
> > a 64 bit host was used to generate the files. Thus I also
> > learned that the scripts are actually built as a result of
> > building modules.
> >
> > Since I did not want my class to depend on modules having been
> > built, I looked into modules.bbclass and modules-base.bbclass.
> > There I found the function do_make_scripts() which is
> > responsible for building  the kernel scripts. However, the
> > current setup doesn't lend itself very well to use the
> > modules-base.bbclass for something other than modules.
> >
> > My idea then was to break this part out into a separate class,
> > kernel-scripts, which I did. You can find both the
> > kernel-scripts and kernel-headers classes here:
> >
> > http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dpkj/ker=
nel-headers
> >
> > When I showed this to Richard he noted that my change was not
> > backwards compatible (as I no longer provide the
> > do_make_scripts() function from the module-base.bbclass).
> > However, there is nothing besides module.bbclass in OE Core
> > and meta-oe that use the module-base.bbclass.
>=20
> Can't do_make_script run as an sstate post function?

I think that is exactly what the reverted change Bruce mentions=20
below did.

> regards,
>=20
> Koen

> -----Original Message-----
> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
> Sent: den 16 januari 2014 19:41
> To: Peter Kjellerstedt
> Cc: OE Core (openembedded-core@lists.openembedded.org); Phil Blundell
> Subject: Re: [OE-core] RFC: Maintain backwards compatibility or not for
> module-base.bbclass
>=20
> On Thu, Jan 16, 2014 at 8:58 AM, Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
> > Anyway, I made a modified version that does maintain backwards
> > compatibility for module-base.bbclass here:
> >
> > http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dpkj/ker=
nel-headers-backwards-compatible
> >
> > This time Richard complained about the extra class
> > (kernel-scripts-base.bbclass), and noted that there was no
> > way to win... He then suggested that I take the question of
> > whether we need to maintain backwards compatibility for
> > modules-base.bbclass to the mailing list.
>=20
> FWIW: I agree that have to many small, single purpose
> kernel-*.bbclasses is a pain, since it provides granularity, but=20
> more opportunity for varying behaviour during kernel builds.
>=20
> I have uses of the module-base.bbclass and an expectation that it=20
> will generate the scripts, largely around the SDK and some custom=20
> kernel recipes. So they only inherit module.bbclass, and would be=20
> impacted if that functionality was changed to require another inherit.

As long as they inherit module (and not add task dependencies on=20
do_make_scripts) they should not be affected. It is only if you=20
inherit module-base directly and expect the do_make_scripts()=20
function to exist that you are affected.

> Speaking of that, we through something like this late last year=20
> with automatically restoring the scripts into the sysroot, which=20
> ended up being reverted:
>=20
> see b2c948d56241ff7cdea2e9e68b740f305c72f5ca in oe-core
>=20
> At least the module (and your scripts) class avoid the sstate=20
> problems and compiler dependencies that we hit with that solution.

Interesting. It looks like it would have been a good solution=20
if it had worked...=20

> What are the alternatives to more classes, isn't this something=20
> that could be a .inc routine ? And modules simply includes it, and=20
> you can do the same .. but I suppose a .inc versus a class inherit=20
> is largely semantics in the difference.

Tbh, I think keeping it as a class makes it more straight forward.
And class or include file is merely semantics.

> bottom line, my rambling says that backwards compatibility matters=20
> here, and that if we can avoid a new class, that would also be a=20
> good thing.

But I think that it should be easy enough for any external party=20
to adopt to the new class if they do indeed have a direct=20
dependency on module-base and expecting to find do_make_scripts()=20
there. It is not like we would change it in the middle of Dora=20
anyway. Thus I advocate for the change above on the kernel-headers=20
branch that does not maintain backwards compatibility.

> Cheers,
>=20
> Bruce

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Phil Blundell
> Sent: den 16 januari 2014 22:39
> To: Peter Kjellerstedt
> Cc: OE Core (openembedded-core@lists.openembedded.org)
> Subject: Re: [OE-core] RFC: Maintain backwards compatibility or not for
> module-base.bbclass
>=20
> On Thu, 2014-01-16 at 14:58 +0100, Peter Kjellerstedt wrote:
> > So, here I am now. I do not know who else use the
> > do_make_scripts() function from module-base.bbclass and in what
> > way, and whether restructuring the functionality into the new
> > kernel-scripts.bbclass without maintaining backwards
> > compatibility would be a problem. If you know anything about
> > this, please let me know.
>=20
> I'm not entirely clear why you couldn't maintain compatibility=20
> by moving the task in question to a new class but keeping its=20
> name the same (i.e. refrain from renaming "do_make_scripts" to=20
> "do_kernel_scripts") and having module-base.bbclass simply=20
> inherit the newly-added class.  That seems like it ought to be=20
> fairly straightforward and uncontroversial.

Well, that is basically what my backwards compatible branch above=20
does. However, it introduces two new classes since it needs to=20
maintain the split between where the addtask is done and the=20
actual function.

> That said, though, I don't think there is any pressing need to=20
> maintain backwards compatibility around module-base.bbclass.  In=20
> fact, I think it would probably be fine for module-base.bbclass=20
> to simply go away altogether and have its functionality subsumed=20
> into module.bbclass; the split between those two classes is=20
> mostly a relic of yesteryear and I can't think of any good=20
> purpose that it serves nowadays.  So I would be happy enough to=20
> see that (and the tangly mess that is the kernel classes in=20
> general) cleaned up irrespective of what happens with
> do_make_scripts.

I won't argue with that. However, I do not feel that I am=20
comfortable enough about these classes to do it. I had a quick=20
look around in OE core, and I believe you are right. The number=20
of references to "module-base" were limited, and in most cases=20
it should just be a matter of replacing them with "module".

> p.

//Peter


