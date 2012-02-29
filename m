Received: from smtp25.4emm.com ([69.18.222.26])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1S2cI6-0004LR-Vn
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 06:41:31 +0100
Received: from MBX21.4emm.local ([fe80::a0d4:cb04:3e3c:8690]) by
	HUB25.4emm.local ([fe80::102d:c89a:95eb:bcfb%15]) with mapi id
	14.01.0289.001; Wed, 29 Feb 2012 00:31:58 -0500
From: James Limbouris <james@digitalmatter.com.au>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] initscripts: Make /etc/timestamp consistent
	again.
Thread-Index: AQHM6BAdDCpmIG709kqsEPybLz1tCpZMyKWAgAatY0A=
Date: Wed, 29 Feb 2012 05:31:58 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF337FFD7A@MBX21.4emm.local>
References: <1328890565-8304-1-git-send-email-gary@mlbassoc.com>
	<4F47D76D.50805@linux.intel.com>
In-Reply-To: <4F47D76D.50805@linux.intel.com>
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
X-List-Received-Date: Wed, 29 Feb 2012 05:41:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I think we need to add BUSYBOX_CONFIG_FEATURE_TEST_64 to the busybox defcon=
fig after this patch.
On my build (which had neither BUSYBOX_CONFIG_FEATURE_TEST_64 nor BUSYBOX_C=
ONFIG_EXPR_MATH_SUPPORT_64) I was getting 'out of range' errors.
=A0=A0
Regards=A0
James Limbouris

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Saul Wold
> Sent: Saturday, 25 February 2012 2:31 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH] initscripts: Make /etc/timestamp consisten=
t
> again.
>=20
> On 02/10/2012 08:16 AM, Gary Thomas wrote:
> > Commit cc8695 changed the way timestamps were handled
> > and added some extra munging to be able to compare them
> > reliably.  This change makes the timestamp value the same
> > everywhere and simplifies how the check to set the system
> > clock based on the timestamp is done.
> >
> > Also, if the value stored in /etc/timestamp is newer
> > [at all] than the current system time, set the system clock
> > from the stored value, down to the minute, not just the day.
> >
> > Signed-off-by: Gary Thomas<gary@mlbassoc.com>
> > ---
> >   .../initscripts/initscripts-1.0/bootmisc.sh        |    4 ++--
> >   .../initscripts/initscripts-1.0/save-rtc.sh        |    2 +-
> >   meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
> >   3 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> > index d9e8ffa..20ec0a0 100755
> > --- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> > +++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> > @@ -68,9 +68,9 @@ fi
> >   /etc/init.d/hwclock.sh start
> >   if test -e /etc/timestamp
> >   then
> > -	SYSTEMDATE=3D`date -u +%4Y%2m%2d`
> > +	SYSTEMDATE=3D`date -u +%4Y%2m%2d%2H%2M`
> >   	read TIMESTAMP<  /etc/timestamp
> > -	if [ ${TIMESTAMP#????????}${TIMESTAMP%????????} -gt
> $SYSTEMDATE ]; then
> > +	if [ ${TIMESTAMP} -gt $SYSTEMDATE ]; then
> >   		date -u $TIMESTAMP
> >   		/etc/init.d/hwclock.sh stop
> >   	fi
> > diff --git a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
> b/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
> > index 3d8e850..1f804e2 100644
> > --- a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
> > +++ b/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
> > @@ -10,4 +10,4 @@
> >   ### END INIT INFO
> >
> >   # Update the timestamp
> > -date -u +%2m%2d%2H%2M%4Y>  /etc/timestamp
> > +date -u +%4Y%2m%2d%2H%2M>  /etc/timestamp
> > diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/re=
cipes-
> core/initscripts/initscripts_1.0.bb
> > index 203c605..b56c55c 100644
> > --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> > +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> > @@ -3,7 +3,7 @@ DESCRIPTION =3D "Initscripts provide the basic system
> startup initialization scrip
> >   SECTION =3D "base"
> >   LICENSE =3D "GPLv2"
> >   LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D751419260aa954499f7abaabaa882bbe"
> > -PR =3D "r129"
> > +PR =3D "r130"
> >
> >   INHIBIT_DEFAULT_DEPS =3D "1"
> >
>=20
> Merged into OE-core
>=20
> Thanks
> 	Sau!
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


