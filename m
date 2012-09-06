Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T9cHn-000692-4y
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 15:38:23 +0200
Received: by wgbdr1 with SMTP id dr1so1352519wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 06:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=QiPu1EBuTXiZxiE5N3bc+/zCExxKjuA7phpiq7cvD1Q=;
	b=XWUveck2oPOxlhkD/OB+e1AfSEagNdvzyeIjkPqTmDXaRppZ6YWwxWReUG2BhdM4XD
	bQ5Mbe+dqohp8cDNUs5C5ZycM9FIwPnE5GTZR561tPhTBqfgE4OpG5CMOR8oIvvX/OnS
	qkGkP5snxhTj5XlmmGO5jS4aMRUuciBWcN3e1CoUPLac3YwvS9x+dRvHiFFxgAQZg0n0
	jNIMKxGJY/SI3/U/T6pLUwxS0e7rVL8LAi/VSwh+GxgDbDIzZNZD5GP4OX8p7x13r0cC
	sbpFRQi7F7/2NhDY3yhM8WspX2r/eCRuVqjmym7KcKAIaLNbHGC8Nd5LKVdLX5/Ex0EF
	nQMg==
Received: by 10.216.200.201 with SMTP id z51mr1319607wen.0.1346937958728;
	Thu, 06 Sep 2012 06:25:58 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id cu1sm4138809wib.6.2012.09.06.06.25.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 06:25:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LYmPf0g_qv6X+8MefjzfWr4gsr33SaszHsG82PiGg+oEg@mail.gmail.com>
Date: Thu, 6 Sep 2012 15:25:58 +0200
Message-Id: <644855E8-7D63-45DC-B072-B9A9893058F3@dominion.thruhere.net>
References: <CAK18fxEb3gjEEwhvN-du3eJvgUVCbjXU2Ag4kicFFDt6xra6og@mail.gmail.com>
	<CAJTo0LYmPf0g_qv6X+8MefjzfWr4gsr33SaszHsG82PiGg+oEg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQkHwHe4LblTbft/MblodzHm3CN3GAr4PoK/QnMeL9CAERpcImz+C0GRutgVMmmf7VuRTtqd
Subject: Re: [yocto] opengl / libgl / libgles
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 13:38:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 sep. 2012, om 15:04 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> (CCing oe-core, discussion should happen there really)
>=20
> On 6 September 2012 11:00, Andrei Gherzan <andrei@gherzan.ro> wrote:
>> In DISTRO_FEATURES we have opengl. That is pretty vague and generally =
we
>> don't want to have mesa on machines where there is no libgl but only =
gles +
>> egl. For example if we want to compile something that adds a DEPENDS =
based
>> on DISTRO_FEATURE opengl, this dependency will be added even if there =
is no
>> libgl implemented for that specific machine.
>>=20
>> First idea would be that opengl (gl / gles) are machine related. On =
the
>> other hand opengl can be a DISTRO_FEATURE as we have a software
>> implementation - mesa.
>>=20
>> How would you guys see a solution for this? The idea that came into =
my mind
>> was to map opengl to libgl or libgles. Or to both if there is the =
case.
>=20
> (First I must apologise for the uneven flow of this mail - my mornings
> been pretty choppy but hopefully people can see what I'm thinking)
>=20
> I've been thinking about this quite a lot recently, as the current
> setup is broken in some way on most hardware.  There is a bigger
> problem than just distro or machine features - the packaging isn't
> obvious or correct either.
>=20
> First, we need a concrete definition of the "opengl" distro feature.
> I propose just "some form of OpenGL functionality" without any
> implications about what specification is present.
>=20
> Then, machine features for the portions of OpenGL that the hardware
> supports - gl, gles1, gles2.  I'd love to say "gles" means GLESv2 but
> I suspect we're not quite safe from the horrors of hardware that only
> supports GLESv1 yet.
>=20
> We then need more virtual providers for the GL libraries.  Mesa is an
> obvious provider - it provides libgl, libglesv1, libglesv2 and libegl.
> On Raspberry Pi the binary drivers provide libglesv1, glesv2, and
> egl.  As the performance of the software renderer will be terrible,
> unsetting the libgl provider makes a lot of sense.
>=20
> Because there are multiple providers of the GL libraries, and they are
> not all specific to a single machine, every package that provides GL
> packages need to be namespaced.  The Debian-renaming makes this
> trickier but luckily it can be overridden in the recipe, so Mesa
> should be building libgl-mesa, libegl-mesa, and so on.  Every other
> provider of the GL libraries should do this too.
>=20
> Library dependencies are also broken, of course.  A package that links
> to libGL.so.1 shouldn't get a dependency on mesa-dri or whatever was
> installed to provide that library, but a dependency on a virtual
> "libgl" package.  As far as I'm aware this isn't something that the
> automatic shlibs dependency generation handles, but there is plenty of
> prior art for this.

It's not automatic, but you can do something like this:

	=
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=3D23b02134

That recipe ships multiple copies of the libraries to account for =
different silicon revisions (the shader compiler will offload different =
things to the CPU), but we don't want the shlibs code to pickup the =
copies. So for mesa you can do:

	PRIVATE_LIBS_${PN}-dri =3D "libGL.so"
	RPROVIDES_${PN}-dri =3D $magic_python_function(PACKAGE_CONFIG, =
sometthing, something, libgl)

And in the recipes that link to a GL lib you do:

	RDEPENDS_${PN} =3D "libGL"

Which only leaves the DISTRO to sort out the runtime preferred provider, =
which is likely a conf file with a bunch of PACKAGE_CONFIG entries for =
all the machines the DISTRO wants to support.

regards,

Koen=


