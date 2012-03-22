Received: from am1ehsobe006.messaging.microsoft.com ([213.199.154.209]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SAZ4P-0001hw-0G
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 04:52:13 +0100
Received: from mail76-am1-R.bigfish.com (10.3.201.243) by
	AM1EHSOBE005.bigfish.com (10.3.204.25) with Microsoft SMTP Server id
	14.1.225.23; Thu, 22 Mar 2012 03:28:09 +0000
Received: from mail76-am1 (localhost [127.0.0.1])	by mail76-am1-R.bigfish.com
	(Postfix) with ESMTP id 979DE2E0066	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 03:28:08 +0000 (UTC)
X-SpamScore: -10
X-BigFish: VS-10(zz9371I936eK1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail76-am1 (localhost.localdomain [127.0.0.1]) by mail76-am1
	(MessageSwitch) id 1332386886605561_32479;
	Thu, 22 Mar 2012 03:28:06 +0000 (UTC)
Received: from AM1EHSMHS003.bigfish.com (unknown [10.3.201.247])	by
	mail76-am1.bigfish.com (Postfix) with ESMTP id BF2072C0048	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 03:28:05 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS003.bigfish.com
	(10.3.207.103) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 22 Mar 2012 03:28:05 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.230]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Wed, 21 Mar 2012 22:28:10 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] bitbake.conf/sstate.bbclass: Change PATH
	when installing sstate files to avoid issues
Thread-Index: AQHNB4u5blAnmg2J7kS03RUMxVYD55Z1k3eAgABoxQA=
Date: Thu, 22 Mar 2012 03:28:10 +0000
Message-ID: <CAEsOVNdrfvwi-VvbOT-8QKKNoc8id7s87XcEhbUQWTi0YUZ+3g@mail.gmail.com>
References: <1332326683.9740.136.camel@ted>
	<CAEsOVNcy6kwQQ0oank6gO4yOSuUM6NNG0fYk752sQvYWy+9GDA@mail.gmail.com>
	<1332364369.9740.185.camel@ted>
In-Reply-To: <1332364369.9740.185.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH] bitbake.conf/sstate.bbclass: Change PATH when installing sstate files to avoid issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 22 Mar 2012 03:52:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <76ED5F350891B24E84BCA88B8F1145D8@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2012 at 4:12 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-03-21 at 17:54 +0000, McClintock Matthew-B29882 wrote:
>> On Wed, Mar 21, 2012 at 5:44 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > This resolves issues related to pigz-native when installing from sstat=
e that people
>> > have been seeing. It also gives us a way to solve issues like the gzip=
-native race
>> > during sstate package creation covered in Yocto #1774.
>> >
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> > ---
>> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
>> > index 0d16d11..1570654 100644
>> > --- a/meta/classes/sstate.bbclass
>> > +++ b/meta/classes/sstate.bbclass
>> > @@ -153,6 +153,12 @@ def sstate_installpkg(ss, d):
>> > =A0 =A0 =A0 =A0 bb.mkdirhier(dir)
>> > =A0 =A0 =A0 =A0 oe.path.remove(dir)
>> >
>> > + =A0 =A0# We're adding binaries into the sysroots, we don't want to e=
xecute them
>> > + =A0 =A0# whilst they're half installed or being installed so we need=
 to
>> > + =A0 =A0# remove the sysroots from PATH
>> > + =A0 =A0savedpath =3D d.getVar("PATH")
>> > + =A0 =A0d.setVar("PATH", "${ORIGPATH}")
>> > +
>> > =A0 =A0 sstateinst =3D d.expand("${WORKDIR}/sstate-install-%s/" % ss['=
name'])
>> > =A0 =A0 sstatepkg =3D d.getVar('SSTATE_PKG', True) + '_' + ss['name'] =
+ ".tgz"
>> >
>> > @@ -190,6 +196,8 @@ def sstate_installpkg(ss, d):
>> > =A0 =A0 =A0 =A0 # conflict with another writer
>> > =A0 =A0 =A0 =A0 os.remove(fixmefn)
>> >
>> > + =A0 =A0d.setVar("PATH", savedpath)
>> > +
>>
>> So we always use the host tar and gzip here? Isn't there a reason we
>> build tar-native explicitly? Could be fine if it's not needed for
>> sstate-cache...
>
> I had to hit the archives but:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3D577dd4b3e5d4861c31=
824d920fa170ba3a585f63
>
> so yes, there is a good reason we might want to use our tar and I just
> broken our old versions of tar workaround :(. We did check that tar code
> for races and its relatively safe. The gzip situation is of course not
> so safe and we have the open bugs to prove it :(.
>
> So I should probably revert this patch although I'm reluctant since I
> can think of other ways we can break the sysroots which this patch very
> neatly solves.
>
> The only other option would be to explicitly allow tar through some
> linking/PATH magic :/.

Not sure what the best course of action is... we do:

ASSUME_PROVIDED +=3D "${SSTATE_PKG_TARZIPPROG}-native"

which fixes the gzip-native issue by not even building it....

-M=



