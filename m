Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1UK53w-0001FX-LY
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 11:55:36 +0100
Received: from mail156-ch1-R.bigfish.com (10.43.68.232) by
	CH1EHSOBE009.bigfish.com (10.43.70.59) with Microsoft SMTP Server id
	14.1.225.23; Mon, 25 Mar 2013 10:38:38 +0000
Received: from mail156-ch1 (localhost [127.0.0.1])	by
	mail156-ch1-R.bigfish.com (Postfix) with ESMTP id 29EC7601C4	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 10:38:38 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -5
X-BigFish: VS-5(zzbb2dI98dI9371I936eI542I1432Izz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275dhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ahbe9i1155h)
Received: from mail156-ch1 (localhost.localdomain [127.0.0.1]) by mail156-ch1
	(MessageSwitch) id 1364207916319740_24926;
	Mon, 25 Mar 2013 10:38:36 +0000 (UTC)
Received: from CH1EHSMHS037.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.231])	by mail156-ch1.bigfish.com (Postfix) with ESMTP id
	4BC92320069	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 10:38:36 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS037.bigfish.com
	(10.43.69.246) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 25 Mar 2013 10:38:33 +0000
Received: from 039-SN2MPN1-022.039d.mgd.msft.net ([169.254.2.152]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0328.011; Mon, 25 Mar 2013 10:38:33 +0000
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [oe-core v2] rpm: split out run-postinsts
Thread-Index: AQHOJdfxZ2VRj56XLEqOOIbp7P4LApix6UGAgAAJywCABEQ+IA==
Date: Mon, 25 Mar 2013 10:38:32 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A01487E80@039-SN2MPN1-022.039d.mgd.msft.net>
References: <1363831511-800-1-git-send-email-zhenhua.luo@freescale.com>
	<1363969789.3097.16.camel@ted> <514C8F34.7060503@windriver.com>
In-Reply-To: <514C8F34.7060503@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.134]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [oe-core v2] rpm: split out run-postinsts
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
X-List-Received-Date: Mon, 25 Mar 2013 10:55:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Mark Hatle
> Sent: Saturday, March 23, 2013 1:05 AM
>=20
> On 3/22/13 11:29 AM, Richard Purdie wrote:
> > On Thu, 2013-03-21 at 10:05 +0800, Zhenhua Luo wrote:
> >> Split out run-postinsts script into separated package, sometimes only
> the postinsts script is required to run all postinsts scripts in
> /etc/rpm-postinsts/ instead of the whole rpm package.
> >>
> >> @@ -223,9 +223,11 @@ FILES_${PN} =3D  "${bindir}/rpm \
> >>   		${libdir}/rpm/bin/wget \
> >>   		/var/lib/rpm \
> >>   		/var/cache/rpm \
> >> -		${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
> \
> >>   		"
> >>
> >> +FILES_${PN}-postinsts =3D
> "${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts \
> >> +                "
> >> +
> >>   FILES_${PN}-dbg +=3D "${libdir}/rpm/.debug \
> >>   		${libdir}/rpm/bin/.debug \
> >>   		"
> >
> > Don't we need to depend on this package somewhere so that it gets
> > installed?
>=20
> I think it should be required from the rootfs_rpm.bbclass in some way.
[Luo Zhenhua-B19537] Is following the right way to include the rpm-postinst=
s into rootfs or any better idea? Below patch is verified to be working.=20

--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -35,6 +35,8 @@ opkglibdir =3D "${localstatedir}/lib/opkg"
 RPMOPTS=3D"--dbpath ${rpmlibdir}"
 RPM=3D"rpm ${RPMOPTS}"
=20
+IMAGE_INSTALL +=3D "rpm-postinsts"
+
 # RPM doesn't work with multiple rootfs generation at once due to collisio=
ns in the use of files=20
 # in ${DEPLOY_DIR_RPM}. This can be removed if package_update_index_rpm ca=
n be called concurrently
 do_rootfs[lockfiles] +=3D "${DEPLOY_DIR_RPM}/rpm.lock"


Best Regards,

Zhenhua



