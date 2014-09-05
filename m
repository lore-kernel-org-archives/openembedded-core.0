Return-Path: <anders@chargestorm.se>
X-Greylist: delayed 331 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 05 Sep 2014 06:23:27 UTC
Received: from stoexhubfe02.domain01.net (STOEXHUBFE02.domain01.net
	[83.145.59.141])
	by mail.openembedded.org (Postfix) with ESMTP id 7A6C77142C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 06:23:27 +0000 (UTC)
Received: from ad.chargestorm.se (213.114.64.43) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Fri, 5 Sep 2014 08:17:55 +0200
Date: Fri, 5 Sep 2014 08:17:38 +0200
From: Anders Darander <anders@chargestorm.se>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20140905061727.GB4498@ad.chargestorm.se>
Mail-Followup-To: Denys Dmytriyenko <denis@denix.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20110907175510.GB3215@chargestorm.se>
	<20110908070819.GA3928@chargestorm.se>
	<20140904230826.GV2480@denix.org>
MIME-Version: 1.0
In-Reply-To: <20140904230826.GV2480@denix.org>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
X-GFI-SMTP-Submission: 1
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Race condition when building external kernel modules
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
X-List-Received-Date: Fri, 05 Sep 2014 06:23:30 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

* Denys Dmytriyenko <denis@denix.org> [140905 01:09]:
> This report is exactly from 3 years ago. Has this ever been resolved or l=
ooked=20
> at? We have started seeing this a lot lately in our own distro based on D=
aisy=20
> with 3.14 kernel when building with 12-24 threads. But it might not be re=
lease=20
> specific or even OE specifig...

Yes, our usecase was solved by by commit 8681b82e8b466929205edde7ba479f3ac1=
a6143e,
"module.bbclass: add lock to prevent error bulding ext modules". That
seems to still be in modules.bbclass, thus the do_make_scripts task
ought to be protected.

> All the same symptoms as below - external modules break when building/usi=
ng=20
> scripts from the kernel tree ran by do_make_scripts function. Usually the=
=20
> failure is due to a race in or around fixdep: error opening depfile, but=
=20
> sometimes it's in scripts/dtc or scripts/mod when it can't move a temp fi=
le=20
> from a build. Looks like kernel creates .tmp_<name>.o files for use with =
ksyms=20
> utils as well as .<name>.o.d files for fixdep and those are usually the f=
iles=20
> that are not available at the right moment due to some race...

Do you get the issue also when building just one external module? I'd
guess not...

Can you verify that it's in the do_make_scripts function the breakage
occurs, or is it in the do_compile step?

Cheers,
Anders

--=20
Anders Darander
ChargeStorm AB		Tel: +46 702 44 84 36
Drottninggatan 20	Email: anders@chargestorm.se
602 24 Norrk=F6ping	Web: www.chargestorm.se

