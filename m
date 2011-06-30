Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QcJYm-0001CQ-Lm
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 17:53:44 +0200
Received: by wyg30 with SMTP id 30so1857499wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 08:50:01 -0700 (PDT)
Received: by 10.216.120.129 with SMTP id p1mr2042446weh.81.1309449000969;
	Thu, 30 Jun 2011 08:50:00 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id b70sm1204224wek.44.2011.06.30.08.49.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Jun 2011 08:50:00 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201106301633.48933.paul.eggleton@linux.intel.com>
Date: Thu, 30 Jun 2011 17:49:57 +0200
Message-Id: <4FC82E26-5A0C-48DF-99F5-7E2D9B8C7290@dominion.thruhere.net>
References: <1309446689-21243-1-git-send-email-koen@dominion.thruhere.net>
	<201106301633.48933.paul.eggleton@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] insane bbclass: turn fatal errors back into fatal errors
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
X-List-Received-Date: Thu, 30 Jun 2011 15:53:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 jun 2011, om 17:33 heeft Paul Eggleton het volgende geschreven:

> On Thursday 30 June 2011 16:11:29 Koen Kooi wrote:
>> These were turned off by:
>>=20
>> 	commit fae8d5e985e9b05ce90f1eca434ad4dbf2259725
>> 	Author: Richard Purdie <rpurdie@linux.intel.com>
>> 	Date:   Thu Jul 8 23:51:06 2010 +0100
>>=20
>> 		insane.bbclass: Relax fatal errors for now until we get =
have time to=20
> work
>> through the backlog
>>=20
>> The current metadata triggers so many of these that they need to be =
made
>> fatal so people will actually fix them.
> ...
>>     return not error_class in [0, 5, 7, 8, 9]
>=20
> So in principle I can agree that making these fatal again will make =
people=20
> sort out the problems that they are flagging up. However, why is class =
7 -=20
> .desktop files being "invalid" - a fatal error, considering there are =
many sub-
> classes of "invalidity" being tested for with varying levels of =
significance?
>=20
> (This has probably been discussed on the OE list before but IMHO it =
merits=20
> revisiting if so.)

It's a white list, so:

# 0 - non dev contains .so
# 5 - .la contains installed=3Dyes or reference to the workdir
# 7 - the desktop file is not valid
# 8 - .la contains reference to the workdir
# 9 - LDFLAGS ignored

Are warnings and

# 1 - package contains a dangerous RPATH
# 2 - package depends on debug package
# 3 - non dbg contains .so
# 4 - wrong architecture
# 6 - .pc contains reference to /usr/include or workdir
# 10 - Build paths in binaries
# 11 - package depends on devel package

Are fatal errors. The splits seems arbitrary to me, but it that's how it =
was last year before RP disabled all fatal errors.



