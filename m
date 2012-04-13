Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SIdFC-0004so-GM
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 11:56:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 84E59315B1B5;
	Fri, 13 Apr 2012 11:47:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 3H4CodZHs2Jh; Fri, 13 Apr 2012 11:47:16 +0200 (CEST)
Received: from [172.22.22.61] (drms-590c5060.pool.mediaWays.net [89.12.80.96])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 6A119315B1B3;
	Fri, 13 Apr 2012 11:47:16 +0200 (CEST)
Message-ID: <4F87F622.3070302@opendreambox.org>
Date: Fri, 13 Apr 2012 11:47:14 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Kang Kai <Kai.Kang@windriver.com>
References: <4F87233E.2030604@opendreambox.org>
	<4F878641.1010207@windriver.com>
In-Reply-To: <4F878641.1010207@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: cleanup-workdir
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
X-List-Received-Date: Fri, 13 Apr 2012 09:56:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 13.04.2012 03:49, Kang Kai wrote:
> On 2012=E5=B9=B404=E6=9C=8813=E6=97=A5 02:47, Andreas Oberritter wrote:
>> Hello Kai,
>>
>> because I was low on disk space, I just tried scripts/cleanup-workdir
>> for the first time. My observations:
>=20
> Hi Andreas,
> =20
>=20
>> 1.) It deletes work directories that were built for other machines
>> (archs) than the current one. I guess the list of architectures to
>> handle should be queried from bitbake to avoid this.
> Do you mean that you build for 2 archs under the same "build" directory=
?

I have two build directories, one for each machine, sharing a single tmp
directory.

The basic layout looks roughly like this:

$OE/build/machineA/conf/local.conf
$OE/build/machineB/conf/local.conf
$OE/tmp/work/

> Even in this way the script only delete the packages' build dir for old
> versions.

That's right, but different machines may have different versions due to
COMPATIBLE_MACHINE settings. In my setup, there's also a layer for each
machine, which contains hardware drivers etc. Although every machine
provides the same set of drivers (same ${PN}), the versions differ slight=
ly.

> Your requirement is that cleanup-workdir just clean the build dirs for
> current arch, right?

Yes. For each arch listed in PACKAGE_ARCHS (or
ALL_MULTILIB_PACKAGE_ARCHS?) for the current machine.

>> 2.) It doesn't delete work directories of previously deleted recipes.
> Because when the recipe gone, I can NOT tell whether the directory is
> left by bitbake or created by user.
> I will list them and let user to choose delete them or not.

It should be safe to assume that there are no directories created by the
user, as tmp/work is known to be managed by OE. However, recipes don't
disappear very often, so asking the user seems to be fine.

Regards,
Andreas


