Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R67yu-0002BZ-Rc for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 23:35:56 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8KLapg2003661 for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 22:36:52 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zefasyT-ixpa
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 22:36:51 +0100 (BST)
Received: from [192.168.250.158] ([116.246.20.131]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8KLahmQ003657
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 22:36:47 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 20 Sep 2011 22:30:29 +0100
In-Reply-To: <CABcZANmbortoni+VkAKC947vHLerU2yEo5O__uQoZEPw=1ZR+Q@mail.gmail.com>
References: <E7A9054A5ACABE48B0E540E46E862B0F011F65@NAEMMAIL01.na.leapfrog.com>
	<CABcZANmbortoni+VkAKC947vHLerU2yEo5O__uQoZEPw=1ZR+Q@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316554235.14488.80.camel@ted>
Mime-Version: 1.0
Subject: Re: Correct way of having the PN package depend on
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
X-List-Received-Date: Tue, 20 Sep 2011 21:35:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-20 at 14:00 -0700, Chris Larson wrote:
> On Tue, Sep 20, 2011 at 1:24 PM, Daniel Lazzari <dlazzari@leapfrog.com> wrote:
> >> On 9/20/11 2:03 PM, Daniel Lazzari wrote:
> >> > I noticed a problem with the alsa-utils package where the alsa-utils package does not depend on all of the little extra packages it's supposed to pull in. I'm not sure what the best way to fix this is though. Can anyone give me a little guidance or point me at a recipe that does this correctly already?
> >>
> >> If you are using the RPM backend, I'm currently working on something that may
> > resolve this issue for you.  Hopefully ready today.
> >>
> >> Otherwise, switch to ipk or deb and see if you get the same behavior.
> >
> > I'm using ipk already.
> >
> >> I don't see why this is a problem, personally. If someone wants a recipe's main package to depend on the other packages it emits, they're free to make the recipe do so. But the ${PN} package is not defined to include everything from the recipe, it never has been.
> >
> > I understand that. With the alsa-utils package, the recipe specifically mentions
> > # This are all packages that we need to make. Also, the now empty alsa-utils
> > # ipk depends on them.
> >
> > Right above adding packages such as "alsa-utils-alsamixer" to the PACKAGES variable. I need all of those more specific packages and if I understand correctly, I should be able to get them by just adding the "alsa-utils" package to my custom image.
> 
> Sounds like it's just a recipe bug then, if it claims to do something
> which it doesn't do.

Its defintely a bug in the recipe with the "alsa-utils" package just
being broken. We need to do something like:

ALSAUTILSPKGS = "alsa-utils-x \
                 alsa-utils-y \
                 alsa-utils-z"

PACKAGES += "${ALSAUTILSPKGS}"
RDEPENDS_${PN} += "${ALSAUTILSPKGS}"

which should make the recipe do what it says it should do.

Cheers,

Richard




