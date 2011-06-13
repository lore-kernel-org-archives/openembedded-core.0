Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QW7Ea-0002GG-70
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 15:31:16 +0200
Received: by wwb17 with SMTP id 17so4046580wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 06:27:52 -0700 (PDT)
Received: by 10.216.230.153 with SMTP id j25mr2666126weq.22.1307971672065;
	Mon, 13 Jun 2011 06:27:52 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id c17sm4255883wbh.12.2011.06.13.06.27.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Jun 2011 06:27:51 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTimOnk0XvkfEqP25aOWK0_C7swHvzQ@mail.gmail.com>
Date: Mon, 13 Jun 2011 15:27:49 +0200
Message-Id: <3486EC57-81AC-4105-AC78-2721DF62E4FF@dominion.thruhere.net>
References: <8DD6CF6F-60B5-4DC0-95BC-3E47550A46FB@dominion.thruhere.net>
	<BANLkTimOnk0XvkfEqP25aOWK0_C7swHvzQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [RFC] qemu* kernel configs
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
X-List-Received-Date: Mon, 13 Jun 2011 13:31:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 jun 2011, om 14:54 heeft Bruce Ashfield het volgende geschreven:

> On Mon, Jun 13, 2011 at 8:10 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>> Hi,
>>=20
>> After finding the bug Scott was running into with systemd-image (no =
DEVTMPFS support) I have a closer look at the qemarm kernel config and =
it looks dated to me. If we want to have tools like udev, powertop, =
iotop, latencytop working we need to revisit the config. =46rom a quick =
look I found the following items missing/incomplete:
>>=20
>> * devtmpfs + devtmpfs automounting. Recent udev versions require it
>> * cgroups, systemd requires it
>> * process accounting, *top uses it
>> * fuse, gvfs requires it
>> * autofs4, systemd works a lot better with it
>>=20
>> So what are people's thoughts on enabling the items that weren't set =
before and moving modules to built-in were > needed? And if it's wanted, =
does anyone have a quickstart on how these changes should be done =
properly? My 5 > minutes of google and 30 minutes of staring at the =
meta/ subdir didn't yield results.
>=20
> Hi Koen,
>=20
> The base configuration for the qemu* machines is kept as minimal as
> possible by design. It is supposed to be used as a building block, not
> cater to all the different image types we can throw at them by =
default.

It sounds we need to remove the qemu machines from OE-core and replace =
them with more useful ones if we want people to actually test images =
with the machine present in OE-core. The current kernel config blocks me =
from merging a recent udev and systemd into oe-core since it can't be =
tested with only oe-core in bblayers.conf.

I've found minimalistic kernel configs a huge pain since you need to =
know the mapping between "userspace error X" and "CONFIG_SOMETHING=3Dy", =
which most people don't know or want to know. With superset configs =
customers (and users) can tweak it till it breaks, instead of tweaking =
till it works.

I'm not saying the qemu kernel configs needs to have everything enabled, =
since they are emulated machines which simply cannot have various extras =
(PCI cards) or have a hard time using them (USB devices are a pain in =
qemu). But having 'basic' things like devtmpfs disabled is =
counterproductive as Scott and I found out.

regards,

Koen

PS: RP won't like making kernel builds take an hour, so from that POV =
minimal configs are a feature ;)=


