Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SoG04-0005ow-1B
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 17:35:48 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:45067 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SoFpH-0003qS-4s for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 11:24:39 -0400
Date: Mon, 9 Jul 2012 11:24:27 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAK18fxFo2YtoGNQEtLNh8cVPvxKebGYYKQSEVCPxXmWsTfU3Gg@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1207091120520.1353@oneiric>
References: <alpine.DEB.2.02.1207071435090.25344@oneiric>
	<CAK18fxFo2YtoGNQEtLNh8cVPvxKebGYYKQSEVCPxXmWsTfU3Gg@mail.gmail.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: setting EXTRA_IMAGE_FEATURES explicitly in .bb file can screw things up
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
X-List-Received-Date: Mon, 09 Jul 2012 15:35:48 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1605556598-1341847469=:1353"

--8323329-1605556598-1341847469=:1353
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 9 Jul 2012, Andrei Gherzan wrote:

> On Sat, Jul 7, 2012 at 9:52 PM, Robert P. J. Day <rpjday@crashcourse.ca> =
wrote:
>
>       =A0 a while back, i whined about the inconsistent usage of
>       EXTRA_IMAGE_FEATURES, like this as a snippet:
>
>       meta/recipes-sato/images/core-image-sato-sdk.bb:EXTRA_IMAGE_FEATURE=
S +=3D "tools-debug tools-profile tools-testapps
>       debug-tweaks"
>       meta/recipes-rt/images/core-image-rt-sdk.bb:EXTRA_IMAGE_FEATURES +=
=3D "tools-debug tools-profile tools-testapps
>       debug-tweaks"
>       meta/recipes-extended/images/core-image-lsb-sdk.bb:EXTRA_IMAGE_FEAT=
URES =3D "tools-debug tools-profile tools-testapps
>       debug-tweaks"
>
>       notice the mixing of "+=3D" and "=3D", which seems messy. =A0then i=
 ran
>       across this in core-image-lsb-sdk.bb:
>
>       IMAGE_FEATURES +=3D "apps-console-core tools-sdk dev-pkgs ssh-serve=
r-openssh"
>       EXTRA_IMAGE_FEATURES =3D "tools-debug tools-profile tools-testapps =
debug-tweaks"
>
>       =A0 that *can't* be right, can it? =A0the explicit setting of
>       EXTRA_IMAGE_FEATURES in that recipe file will override any such
>       setting in one's local.conf file, won't it? =A0and that's how the
>       current manual *advises* how to add more features through your
>       local.conf.
>
>       =A0 i tested this target with a standard local.conf, and checked th=
e
>       environment to see:
>
>       ... snip ...
>       IMAGE_FEATURES=3D"apps-console-core debug-tweaks tools-sdk
>       tools-testapps dev-pkgs tools-profile tools-debug ssh-server-openss=
h"
>
>       which looks fine according to the .bb file.
>
>       =A0 but if i add the following to my local.conf file (as the manual
>       suggests i do to add another feature):
>
>       EXTRA_IMAGE_FEATURES =3D "nfs-server"
>
>       i see *no* difference in the environment. =A0hasn't the setting in =
the
>       .bb file overridden the one in my local.conf?
>
>       =A0 i *can* get nfs-server added to my list of features with
>       (predictably):
>
>       IMAGE_FEATURES +=3D "nfs-server"
>
>       but that doesn't strike me as a proper solution and will certainly
>       come as an unpleasant surprise to someone eventually. =A0thoughts?
>
>
> I agree that there is a problem with this image. Anyway the best way
> to debug a scenario like this is to use bitbake -e and grep on the
> thing you are interested in. I=A0tried=A0to add a feature to local conf
> and, as i expected,=A0EXTRA_IMAGE_FEATURES ended up overwritten by
> recipe.=A0
>
> So IMHO the=A0EXTRA_IMAGE_FEATURES variable in the image should be
> merged in the IMAGE_FEATURES above. I don't see the meaning of it.=A0

  yup, that was precisely the point i was making.  so given the
potential for confusion, what should be the "best practise" here?
based on my sketchy understanding, it seems the proper approach would
be to let recipe files use IMAGE_FEATURES exclusively, while
specifically reserving EXTRA_IMAGE_FEATURES for the developer's
local.conf file, and avoid the current unpleasant mixing.

  thoughts?

rday

--=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--8323329-1605556598-1341847469=:1353--
