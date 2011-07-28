Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QmMTm-00026E-Tv
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 11:02:06 +0200
Received: by wwi18 with SMTP id 18so1895281wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 01:57:51 -0700 (PDT)
Received: by 10.227.195.197 with SMTP id ed5mr1054653wbb.104.1311843471478;
	Thu, 28 Jul 2011 01:57:51 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o19sm640617wbh.43.2011.07.28.01.57.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jul 2011 01:57:50 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201107280947.42048.paul.eggleton@linux.intel.com>
Date: Thu, 28 Jul 2011 10:57:44 +0200
Message-Id: <6A2BE4E7-D30E-4BE1-8EAC-4200EC3A48A5@dominion.thruhere.net>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<4E30FD0C.7040503@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B1A8AF9A65@shsmsx502.ccr.corp.intel.com>
	<201107280947.42048.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: Add basic PowerPC core tune config (bug?)
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
X-List-Received-Date: Thu, 28 Jul 2011 09:02:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 jul. 2011, om 10:47 heeft Paul Eggleton het volgende geschreven:

> On Thursday 28 July 2011 08:48:43 Cui, Dexuan wrote:
>> Saul Wold wrote on 2011-07-28:
>>> On 07/27/2011 10:25 PM, Kumar Gala wrote:
>>>> For some reason when I get to do_rootfs for core-image-sato when =
using
>>>> rpms I run into an issue in that:
>>>>=20
>>>> ${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}}
>>>>=20
>>>> Isn't expanding or taking the assignment in
>>>> meta/conf/machine/include/tune-ppcFOO.inc but just using what it
>>>> found in meta/conf/bitbake.conf
>>>=20
>>> I believe that I am seeing this also with an atom-pc build, where =
the
>>> PACKAGE_EXTRA_ARCHS seems OK, but ends up just being i586 instead of =
a
>>> list of ARCHS that includes core2 (which atom-pc should be).
>>=20
>> Hi, I'm suffering from the exactly same issue... :-(
>> I don't know why PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE} isn't =
expending
>> yet.
>=20
> It seems to me that ??=3D gets confused because the variable name =
needs=20
> expanding. If you change the ${DEFAULTTUNE} reference to core2 in=20
> PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE} ??=3D "${TARGET_ARCH}" it all =
works. I=20
> don't know if that indicates a BitBake bug or whether we should try to =
work=20
> around it.

I think it has to do with when the anonymous python runs. Try comparing =
'bitbake -e' and and 'bitbake -e some-image':

koen@dominion:/OE/tentacle/sources/openembedded-core/meta$ bitbake -e | =
grep PACKAGE_EXTRA_ARCHS\=3D
# PACKAGE_EXTRA_ARCHS=3D${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}}
PACKAGE_EXTRA_ARCHS=3D"arm armv4 armv4t armv5 armv5t armv5-vfp =
armv5t-vfp armv5e armv5te armv5e-vfp armv5te-vfp armv6-vfp armv6t-vfp =
armv7-vfp armv7t2-vfp armv7a-vfp armv7at2-vfp armv7a-vfp-neon =
armv7at2-vfp-neon"

koen@dominion:/OE/tentacle/sources/openembedded-core/meta$ bitbake -e =
efl-nodm-image | grep PACKAGE_EXTRA_ARCHS\=3D
# PACKAGE_EXTRA_ARCHS=3D${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}}
PACKAGE_EXTRA_ARCHS=3D"arm"

regards,

Koen=


