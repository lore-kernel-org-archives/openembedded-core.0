Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QZS3o-0002jB-CS
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 20:21:56 +0200
Received: by wwg12 with SMTP id 12so949122wwg.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 11:18:21 -0700 (PDT)
Received: by 10.216.237.131 with SMTP id y3mr2504552weq.87.1308766701803;
	Wed, 22 Jun 2011 11:18:21 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o75sm456609weq.16.2011.06.22.11.18.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Jun 2011 11:18:21 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E0230BC.6020404@linux.intel.com>
Date: Wed, 22 Jun 2011 20:18:19 +0200
Message-Id: <2A97F42D-8473-43D1-AD28-A409829DC53D@dominion.thruhere.net>
References: <1308757294-21106-1-git-send-email-koen@dominion.thruhere.net>
	<4E0230BC.6020404@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: restore kernel-abiversion file
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
X-List-Received-Date: Wed, 22 Jun 2011 18:21:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 jun 2011, om 20:13 heeft Darren Hart het volgende geschreven:

>=20
>=20
> On 06/22/2011 08:41 AM, Koen Kooi wrote:
>> This fixes external module recipes that need $KERNEL_VERSION. It got =
removed by
>>=20
>>    commit a9d41062e24a6b99661b3a5256f369b557433607
>>    Author: Darren Hart <dvhart@linux.intel.com>
>>    Date:   Tue Mar 8 17:09:10 2011 -0800
>>=20
>>        kernel/bbclass: rework kernel and module classes to allow for =
building out-of-tree modules
>>=20
>> seemingly as an oversight.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta/classes/kernel.bbclass |    6 ++++++
>> 1 files changed, 6 insertions(+), 0 deletions(-)
>>=20
>> diff --git a/meta/classes/kernel.bbclass =
b/meta/classes/kernel.bbclass
>> index 1bb69f5..8f9f108 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -123,6 +123,12 @@ kernel_do_install() {
>> 	install -d $kerneldir
>>=20
>> 	#
>> +	# Store the kernel version in sysroots for module-base.bbclass
>> +	#
>> +
>> +	echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
>=20
> =46rom everything I can see this is an openembedded construct - which
> external modules need this? An example recipe I can review?
>=20
> I'd like to understand this better as I don't like the idea of =
depending
> on an arbitrary file that isn't part of the kernel build system to =
build
> modules.
>=20
> It seems to me that these modules should be able to DEPEND on =
something
> provided by the kernel recipes, rather than checking the contents of a
> file stuck in the build tree.

It's used in the stock module.bbclass thru module-base.bbclass:

=
https://github.com/openembedded/oe-core/blob/master/meta/classes/module-ba=
se.bbclass

An example of a recipe that's using it:

=
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstrument=
s/tree/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb

For various reasons the makefile can't be trusted or patched, so we =
can't use KBuild to get the version for us.

regards,

Koen



