Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TLAIr-0004qb-Op for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 12:11:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q989w5kv017955;
	Mon, 8 Oct 2012 10:58:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16463-09; Mon,  8 Oct 2012 10:58:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q989vvvi017949
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 8 Oct 2012 10:57:58 +0100
Message-ID: <1349690282.15658.110.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin =?ISO-8859-1?Q?Erts=E5s?= <mertsas@cisco.com>
Date: Mon, 08 Oct 2012 10:58:02 +0100
In-Reply-To: <507270CA.6020501@cisco.com>
References: <1349268675-7808-1-git-send-email-mertsas@cisco.com>
	<507270CA.6020501@cisco.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q989w5kv017955
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] populate_sdk_base.bbclass: Make it possible to overrise the create_shar method of populate_sdk_base.
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
X-List-Received-Date: Mon, 08 Oct 2012 10:11:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-10-08 at 08:20 +0200, Martin Erts=C3=A5s wrote:
> On 10/03/12 14:51, Martin Ertsaas wrote:
> > From: Thomas Kristensen <thkriste@cisco.com>
> >
> > If you wish to change the install/unpack method of the sdk, this can =
now be done by making
> > your own create_shar method, and setting a POPULATE_SDK_CREATE_SHAR_C=
OMMAND variable to your
> > new create_shar function.
> >
> > Signed-off-by: Thomas Kristensen <thkriste@cisco.com>
> > Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
> > ---
> >  meta/classes/populate_sdk_base.bbclass |    4 +++-
> >  1 files changed, 3 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/po=
pulate_sdk_base.bbclass
> > index 1c151d7..53b11a3 100644
> > --- a/meta/classes/populate_sdk_base.bbclass
> > +++ b/meta/classes/populate_sdk_base.bbclass
> > @@ -24,6 +24,8 @@ PID =3D "${@os.getpid()}"
> > =20
> >  EXCLUDE_FROM_WORLD =3D "1"
> > =20
> > +POPULATE_SDK_CREATE_SHAR_COMMAND ?=3D "create_shar"
> > +
> >  python () {
> >      # If we don't do this we try and run the mapping hooks while par=
sing which is slow
> >      # bitbake should really provide something to let us know this...
> > @@ -56,7 +58,7 @@ fakeroot python do_populate_sdk() {
> > =20
> >      bb.build.exec_func("tar_sdk", d)
> > =20
> > -    bb.build.exec_func("create_shar", d)
> > +    bb.build.exec_func(d.getVar("POPULATE_SDK_CREATE_SHAR_COMMAND", =
True), d)
> >  }
> > =20
> >  fakeroot populate_sdk_image() {
> Have anyone had the change to look at this? Would greatly appreciate
> some feedback on this. Might also consider making similar overloads for
> tar_sdk and friends as well if this is something the community wants.

My main feedback would be about the variable name. Something like
"SDK_PACKAGING_FUNC" might better describe what its doing.

This is coming in a bit late to make it into the release but which a
rename, will make it into master in due course.

Cheers,

Richard



