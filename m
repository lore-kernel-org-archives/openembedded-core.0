Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qa51d-0003JF-HA
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 13:58:17 +0200
Received: by wyb34 with SMTP id 34so2122694wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 04:54:40 -0700 (PDT)
Received: by 10.227.199.19 with SMTP id eq19mr3017130wbb.75.1308916480501;
	Fri, 24 Jun 2011 04:54:40 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ge4sm1953710wbb.30.2011.06.24.04.54.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Jun 2011 04:54:39 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 24 Jun 2011 13:54:34 +0200
Message-Id: <B4FCA010-6920-4DD6-B471-4B2D9E38DFD7@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: Tune files and knobs to turn
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
X-List-Received-Date: Fri, 24 Jun 2011 11:58:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

We discussed tune files a bit during last nights TSC meeting and Khem =
had expressed the need before, so I'd like to get this discussion =
started by using armv7a as an example.

For armv7a capable cores we have the following hardware features:

* armv7a instruction set
* thumb1 instruction set
* thumb2 instruction set
* VFP coprocessor
* optional NEON coprocessor

For the ABI we can choose the following:

* softtp without hw support (e.g. no VFP instructions emitted, slow)
* softfp with hw support (e.g. VFP and/or NEON instructions emitted, =
fast)
* hardfp, emits VFP and/or NEON instructions, slightly faster than =
softfp/hw, incompatible with everything else

And the extra knobs:

* pure thumb1, no arm instructions (limited use)
* thumb1/arm interworking
* pure thumb2,  no arm instructions
* thumb2 interworking (not sure if that's actually usefull, thumb2 has =
complete coverage)

In OE .dev we have the following vars:

TARGET_FPU: switches between hw float and sw float, no reflection in =
package arch
ARM_FP_ABI: switches between softfp and hardfp, will create 'armv7a' or =
'armv7a-hardfp' as package arch
ARM_INSTRUCTION_SET: switches between arm and thumb1, no reflection in =
package arch
THUMB_INTERWORK: turns on interworking, no reflection in package arch

(side note, oe-core/distroless and meta-yocto/poky don't turn set =
TARGET_FPU for armv7a and will generate slow code, angstrom does turn it =
on)

Khem and I would like to start building armv7a (and armv6) in pure =
thumb2 mode but we want to have the variables to turn those knobs make =
sense and be consistent. RP has expressed his desire to sort this all =
out before merging multilib. I'm sure x86/mips/ppc/etc have a similar =
need, so let's get this discussion started.

regards,

Koen=


