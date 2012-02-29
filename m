Received: from smtp21.4emm.com ([69.18.222.6])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1S2dG8-0005V2-6R
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 07:43:32 +0100
Received: from MBX21.4emm.local ([fe80::a0d4:cb04:3e3c:8690]) by
	HUB21.4emm.local ([::1]) with mapi id 14.01.0289.001; Wed, 29 Feb 2012
	01:34:02 -0500
From: James Limbouris <james@digitalmatter.com.au>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] initscripts: Make /etc/timestamp consistent
	again.
Thread-Index: AQHM6BAdDCpmIG709kqsEPybLz1tCpZMyKWAgAatY0CAABGVcA==
Date: Wed, 29 Feb 2012 06:34:02 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF337FFDC8@MBX21.4emm.local>
References: <1328890565-8304-1-git-send-email-gary@mlbassoc.com>
	<4F47D76D.50805@linux.intel.com> 
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: Re: [PATCH] initscripts: Make /etc/timestamp consistent again.
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
X-List-Received-Date: Wed, 29 Feb 2012 06:43:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Also, CONFIG_FEATURE_DATE_COMPAT=3Dy has to be removed - it mungs the YYYYM=
Mddhhmm string into hhmmYYYYMMdd !

> -----Original Message-----
> From: James Limbouris
> Sent: Wednesday, 29 February 2012 1:32 PM
> To: Patches and discussions about the oe-core layer
> Subject: RE: [OE-core] [PATCH] initscripts: Make /etc/timestamp consisten=
t
> again.
>=20
> Hi,
>=20
> I think we need to add BUSYBOX_CONFIG_FEATURE_TEST_64 to the
> busybox defconfig after this patch.
> On my build (which had neither BUSYBOX_CONFIG_FEATURE_TEST_64 nor
> BUSYBOX_CONFIG_EXPR_MATH_SUPPORT_64) I was getting 'out of range'
> errors.
>=20
> Regards
> James Limbouris
>=20
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On
> Behalf
> > Of Saul Wold
> > Sent: Saturday, 25 February 2012 2:31 AM
> > To: Patches and discussions about the oe-core layer
> > Subject: Re: [OE-core] [PATCH] initscripts: Make /etc/timestamp consist=
ent
> > again.
> >
> > On 02/10/2012 08:16 AM, Gary Thomas wrote:
> > > Commit cc8695 changed the way timestamps were handled
> > > and added some extra munging to be able to compare them
> > > reliably.  This change makes the timestamp value the same
> > > everywhere and simplifies how the check to set the system
> > > clock based on the timestamp is done.
> > >
> > > Also, if the value stored in /etc/timestamp is newer
> > > [at all] than the current system time, set the system clock
> > > from the stored value, down to the minute, not just the day.
> > >
> > > Signed-off-by: Gary Thomas<gary@mlbassoc.com>
> > > ---
> > >   .../initscripts/initscripts-1.0/bootmisc.sh        |    4 ++--
> > >   .../initscripts/initscripts-1.0/save-rtc.sh        |    2 +-
> > >   meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
> > >   3 files changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.s=
h
> > b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> > > index d9e8ffa..20ec0a0 100755
> > > --- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> > > +++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> > > @@ -68,9 +68,9 @@ fi
> > >   /etc/init.d/hwclock.sh start
> > >   if test -e /etc/timestamp
> > >   then
> > > -	SYSTEMDATE=3D`date -u +%4Y%2m%2d`
> > > +	SYSTEMDATE=3D`date -u +%4Y%2m%2d%2H%2M`
> > >   	read TIMESTAMP<  /etc/timestamp
> > > -	if [ ${TIMESTAMP#????????}${TIMESTAMP%????????} -gt
> > $SYSTEMDATE ]; then
> > > +	if [ ${TIMESTAMP} -gt $SYSTEMDATE ]; then
> > >   		date -u $TIMESTAMP
> > >   		/etc/init.d/hwclock.sh stop
> > >   	fi
> > > diff --git a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.s=
h
> > b/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
> > > index 3d8e850..1f804e2 100644
> > > --- a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
> > > +++ b/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
> > > @@ -10,4 +10,4 @@
> > >   ### END INIT INFO
> > >
> > >   # Update the timestamp
> > > -date -u +%2m%2d%2H%2M%4Y>  /etc/timestamp
> > > +date -u +%4Y%2m%2d%2H%2M>  /etc/timestamp
> > > diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb
> b/meta/recipes-
> > core/initscripts/initscripts_1.0.bb
> > > index 203c605..b56c55c 100644
> > > --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> > > +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> > > @@ -3,7 +3,7 @@ DESCRIPTION =3D "Initscripts provide the basic system
> > startup initialization scrip
> > >   SECTION =3D "base"
> > >   LICENSE =3D "GPLv2"
> > >   LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3D751419260aa954499f7abaabaa882bbe"
> > > -PR =3D "r129"
> > > +PR =3D "r130"
> > >
> > >   INHIBIT_DEFAULT_DEPS =3D "1"
> > >
> >
> > Merged into OE-core
> >
> > Thanks
> > 	Sau!
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


