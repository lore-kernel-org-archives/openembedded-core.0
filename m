Return-Path: <diego.abelenda@domo-safety.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1lp0012.outbound.protection.outlook.com [213.199.154.12])
	by mail.openembedded.org (Postfix) with ESMTP id 4FB717029A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 14:24:16 +0000 (UTC)
Received: from Arika (128.179.67.139) by
	AMSPR06MB101.eurprd06.prod.outlook.com (10.242.90.146) with Microsoft
	SMTP Server (TLS) id 15.0.985.8; Fri, 11 Jul 2014 14:24:16 +0000
Date: Fri, 11 Jul 2014 16:24:04 +0200
From: Abelenda Diego <diego.abelenda@domo-safety.com>
CC: <openembedded-core@lists.openembedded.org>
Message-ID: <20140711162404.2b839c40@Arika>
In-Reply-To: <20140711152256.7c5ad7b8@Arika>
References: <20140711152256.7c5ad7b8@Arika>
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Originating-IP: [128.179.67.139]
X-ClientProxiedBy: DB4PR06CA0012.eurprd06.prod.outlook.com (25.160.40.140) To
	AMSPR06MB101.eurprd06.prod.outlook.com (10.242.90.146)
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 02698DF457
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(6009001)(24454002)(189002)(51704005)(199002)(105586002)(42186005)(23726002)(21056001)(110136001)(50466002)(107046002)(31966008)(87286001)(77156001)(99396002)(95666004)(77096002)(102836001)(106356001)(79102001)(85306003)(19580395003)(77982001)(101416001)(92726001)(83322001)(76176999)(62966002)(33716001)(86362001)(93916002)(104166001)(81542001)(92566001)(87976001)(81342001)(83072002)(46102001)(66066001)(1671002)(47776003)(50226001)(64706001)(20776003)(19580405001)(85852003)(89996001)(88136002)(33646001)(50986999)(4396001)(74662001)(46406003)(59246002);
	DIR:OUT; SFP:; SCL:1; SRVR:AMSPR06MB101; H:Arika; FPR:; MLV:sfv;
	PTR:InfoNoRecords; MX:1; LANG:en; 
X-OriginatorOrg: domo-safety.com
Subject: Re: [PATCH] Try to make urandom more random using the proper seed.
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
X-List-Received-Date: Fri, 11 Jul 2014 14:24:19 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

Sorry for the mess...

At least consider it as my way to tell that I think the iniscripts options
should be reviewed.

=46rom what I see in /etc/init.d/rc, the script will not be started at runlev=
els
0 6 due to lines 146-161 :
	if [ $previous !=3D N ] && [ $previous !=3D S ]
	then
		#
		# Find start script in previous runlevel and
		# stop script in this runlevel.
		#
		suffix=3D${i#/etc/rc$runlevel.d/S[0-9][0-9]}
		stop=3D/etc/rc$runlevel.d/K[0-9][0-9]$suffix
		previous_start=3D/etc/rc$previous.d/S[0-9][0-9]$suffix
		#
		# If there is a start script in the previous level
		# and _no_ stop script in this level, we don't
		# have to re-start the service.
		#
		[ -f $previous_start ] && [ ! -f $stop ] && continue
	fi

If the script is still run please explain to me why, I do not understand...

Best regards,
Diego Abelenda

On Fri, 11 Jul 2014 15:22:56 +0200
Abelenda Diego <diego.abelenda@domo-safety.com> wrote:

> From 963a99512475b6bc402d2339fa4e4765960e4c26 Mon Sep 17 00:00:00 2001
> From: Diego <diego.abelenda@domo-safety.com>
> Date: Fri, 11 Jul 2014 14:30:56 +0200
> Subject: [PATCH] Try to make urandom more random using the proper seed.
>=20
> If we follow the syntax here we think that previously, at shutdown, the s=
eed
> file was created after urandom was re-seeded with its state at boot. This
> might make the state of urandom pretty similar to its state at last reboo=
t.
> Even if it might not be the case since the /etc/init.d/rc script tells us
> that it stops services in reboot and shutdown runlevels.
>=20
> If this patch does not makes the initscript called with argument start at
> boot and stop at shutdown, it will at least make things less confusing and
> give the correct names for the /etc/rc?.d/ links. But from what I underst=
and,
> the initscript will not be called at all at shutdown because of the double
> start pervention in /etc/init.d/rc.
>=20
> ---
>  meta/recipes-core/initscripts/initscripts_1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb
> b/meta/recipes-core/initscripts/initscripts_1.0.  bb index 531b2b6..b266b=
a6
> 100644 --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -104,7 +104,7 @@ do_install () {
>  #
>     update-rc.d -r ${D} rmnologin.sh start 99 2 3 4 5 .=20
>     update-rc.d -r ${D} sendsigs start 20 0 6 .=20
> -   update-rc.d -r ${D} urandom start 30 S 0 6 .
> +   update-rc.d -r ${D} urandom start 30 S . stop 30 0 6 .
>     update-rc.d -r ${D} umountnfs.sh start 31 0 6 .=20
>     update-rc.d -r ${D} umountfs start 40 0 6 .=20
>     update-rc.d -r ${D} reboot start 90 6 .=20


