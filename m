Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QPFAt-0005tr-Vz
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 16:35:04 +0200
Received: by wwb17 with SMTP id 17so7043718wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2011 07:32:01 -0700 (PDT)
Received: by 10.216.142.13 with SMTP id h13mr180589wej.42.1306333921285;
	Wed, 25 May 2011 07:32:01 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id v2sm329892wer.34.2011.05.25.07.32.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 May 2011 07:32:00 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1306333690.2491.82.camel@elmorro>
Date: Wed, 25 May 2011 16:31:59 +0200
Message-Id: <008416A7-A0B1-47FE-A270-56CD95CDE58A@dominion.thruhere.net>
References: <4DDBDE9D.5000709@linux.intel.com>
	<20110524172330.GC18086@sakrah.homelinux.org>
	<6D7346D0-2F4B-44EC-A04B-2F443B33E544@dominion.thruhere.net>
	<1306260430.2491.2.camel@elmorro>
	<1306333690.2491.82.camel@elmorro>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: adding meta-intel layers breaks parsing, was Re: Updating u-boot for oe-core or meta-yocto
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
X-List-Received-Date: Wed, 25 May 2011 14:35:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 mei 2011, om 16:28 heeft Tom Zanussi het volgende geschreven:

> On Tue, 2011-05-24 at 13:07 -0500, Tom Zanussi wrote:
>> On Tue, 2011-05-24 at 10:51 -0700, Koen Kooi wrote:
>>> Op 24 mei 2011, om 19:23 heeft Khem Raj het volgende geschreven:
>>>=20
>>>> On (24/05/11 09:36), Darren Hart wrote:
>>>>> I've started pulling in the 15 or so patches to u-boot from =
meta-ti. In
>>>>=20
>>>> why ? its a BSP recipe and bsp layer is best place for it IMO =
unless you
>>>> want to have some of those machines in a different layer.
>>>>=20
>>>>> doing so I've come across some questions I'd like you thoughts on.
>>>>> Specifically, where to put these changes. Some points of context:
>>>>>=20
>>>>> 1) oe-core is intended to support emulated machines only
>>>>> 2) oe-core has a "virgin" u-boot recipe (no patches)
>>>>> 3) meta-yocto does not have a u-boot recipe (no bbappend either)
>>>>> 4) meta-ti has it's own u-boot recipe with per-machine patches
>>>>>=20
>>>>> A stated goal was to bring the Yocto Project's u-boot support for =
the
>>>>> Beagleboard in line with that in meta-ti. There are several ways I =
can
>>>>> go about this.
>>>>>=20
>>>>> a) create a bbappend in meta-yocto and duplicate the meta-ti
>>>>>  modifications in bbappend form.
>>>>> b) Modify the oe-core recipe directly
>>>>>=20
>>>>> While a) is the most direct approach to accomplish our goal, it =
requires
>>>>> continual maintenance and duplicates effort. I don't care for this
>>>>> approach. b) has the potential to consolidate all beagleboard =
u-boot
>>>>> recipe work into a single place. It could simplify the meta-ti and
>>>>> eliminate the need for a bbappend in the meta-yocto layer.
>>>>>=20
>>>>> The question of whether bootloaders have a place in oe-core should
>>>>> probably be addressed. While they aren't needed for the emulated
>>>>> machines, they are a highly reusable component for real systems, =
and
>>>>> that seems justify keeping them in oe-core. Does anyone disagree =
with
>>>>> this assessment?
>>>>>=20
>>>>> I propose pulling the necessary changes to u-boot from meta-ti =
into
>>>>> oe-core. My initial scan suggested the beagleboard patches are =
mostly
>>>>> contained to beagle specific source files. I would prefer to pull =
in all
>>>>> the patches for all machines into the SRC_URI, rather than divide =
them
>>>>> up by machine. This reduces complexity considerably. For the =
couple of
>>>>> patches that collide, we would keep those as machine specific.
>>>>>=20
>>>>> As a final part of the work, I would include my beagleboard patch =
status
>>>>> audit in the included patches and continue to work on reducing the
>>>>> patches in the recipe for the beagleboard.
>>>>>=20
>>>>> Thoughts?
>>>>=20
>>>> Well I am in similar boat where I wanted to build atom-pc for =
angstrom
>>>> but I was thinking using meta-intel layer instead of pulling stuff =
out
>>>> and stuffing it elsewhere and certainly not oe-core
>>>=20
>>> Speaking of meta-intel layers, when I add them to bblayer.conf I =
get:
>>>=20
>>> ERROR: Error parsing =
/OE/tentacle/sources/openembedded-core/meta/recipes-kernel/linux/linux-yoc=
to-stable_git.bb: Failure expanding variable FILESEXTRAPATHS, expression =
was =
${FILESEXTRAPATHS}:/OE/tentacle/sources/meta-intel/meta-n450/recipes-kerne=
l/linux/linux-yocto-stable which triggered exception Exception: variable =
FILESEXTRAPATHS references itself!
>>>=20
>>> Same for jasperforest, emenlow, fishriver and crownbay. The only =
intel layer I can add without breaking the parsing step is sugarbay :(
>>>=20
>>=20
>> Must be something recent - I've built several of those successfully =
over
>> the past few days, will take a look though...
>>=20
>=20
> I just finished building all of the above successfully using the =
latest
> (as of yesterday) poky/master and meta-intel/master.
>=20
> Not sure why you're seeing parsing errors, none here...

Did you add all the layers to bblayers.conf? Having one isn't a problem, =
but adding them all seems to trigger the bug.=


