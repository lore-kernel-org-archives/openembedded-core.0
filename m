Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QWbHc-0003oX-K4
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 23:36:24 +0200
Received: by mail-ww0-f43.google.com with SMTP id 17so5311602wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 14:33:01 -0700 (PDT)
Received: by 10.227.54.195 with SMTP id r3mr6839794wbg.11.1308087181146;
	Tue, 14 Jun 2011 14:33:01 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fl19sm5350134wbb.15.2011.06.14.14.32.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Jun 2011 14:33:00 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308086688.15712.362.camel@rex>
Date: Tue, 14 Jun 2011 23:32:57 +0200
Message-Id: <CFF0ECE5-F738-4233-8214-9E57A6616C5B@dominion.thruhere.net>
References: <1308086002-16398-1-git-send-email-raj.khem@gmail.com>
	<1308086688.15712.362.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH V2] allarch.bbclass: Set FEED_ARCH to original value of BASE_PACKAGE_ARCH and then set BASE_PACKAGE_ARCH to 'all'
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
X-List-Received-Date: Tue, 14 Jun 2011 21:36:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 jun 2011, om 23:24 heeft Richard Purdie het volgende geschreven:

> On Tue, 2011-06-14 at 14:13 -0700, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> meta/classes/allarch.bbclass |    5 +++--
>> 1 files changed, 3 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta/classes/allarch.bbclass =
b/meta/classes/allarch.bbclass
>> index e3ac392..b9ba28b 100644
>> --- a/meta/classes/allarch.bbclass
>> +++ b/meta/classes/allarch.bbclass
>> @@ -2,9 +2,10 @@
>> # This class is used for architecture independent recipes/data files =
(usally scripts)
>> #
>>=20
>> +# We need to pour the value of BASE_PACKAGE_ARCH into FEED_ARCH
>> +# before we reset it
>> +FEED_ARCH :=3D ${BASE_PACKAGE_ARCH}
>> BASE_PACKAGE_ARCH =3D "all"
>> -PACKAGE_ARCH =3D "all"
>> -
>> # No need for virtual/libc or a cross compiler
>> INHIBIT_DEFAULT_DEPS =3D "1"
>=20
> This is a *really* bad idea. An "all" package should have no need to =
set
> architecture specific values into FEED_ARCH.
>=20
> Just for those not following IRC, the problem is Angstrom adds =
FEED_ARCH
> to OVERRIDES. Adding "all" to overrides turns out to do nasty things =
to
> classes like rm_work with "_all" in the function names.

So why don't we just set PACKAGE_ARCH =3D all in allarch.bbclass and not =
touch BASE_PACKAGE_ARCH and FEED_ARCH?

> I'd suggest that various machines should start adding things like =
armv7a
> to ${MACHINEOVERRIDES} which has a much more clearly defined scope and
> that FEED_ARCH should quietly die ;-).

And that's what I've start calling a 'yocto' type of solution. That just =
doesn't scale since it relies on fixing all the machines out there =
instead of levering the knowledge provided by OE already. I'd appreciate =
a solution is better thought out.=


