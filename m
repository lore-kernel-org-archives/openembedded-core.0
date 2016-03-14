Return-Path: <jeremy.rosen@openwide.fr>
X-Greylist: delayed 488 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 14 Mar 2016 10:34:59 UTC
Received: from mx1.openwide.fr (mx1.openwide.fr [213.162.52.98])
	by mail.openembedded.org (Postfix) with ESMTP id 808B573177
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 10:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by zimbra2.corp.accelance.fr (Postfix) with ESMTP id AAAABC063C7FD;
	Mon, 14 Mar 2016 11:26:51 +0100 (CET)
Received: from mx1.openwide.fr ([127.0.0.1])
	by localhost (zimbra2.corp.accelance.fr [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id zbY3v8fRPsNz; Mon, 14 Mar 2016 11:26:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zimbra2.corp.accelance.fr (Postfix) with ESMTP id E66BBC1495E73;
	Mon, 14 Mar 2016 11:26:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at accelance.fr
Received: from mx1.openwide.fr ([127.0.0.1])
	by localhost (zimbra2.corp.accelance.fr [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id 2yExBRsW3eRK; Mon, 14 Mar 2016 11:26:50 +0100 (CET)
Received: from zimbra2.corp.accelance.fr (localhost [127.0.0.1])
	by zimbra2.corp.accelance.fr (Postfix) with ESMTP id 6B7CAC063C7FD;
	Mon, 14 Mar 2016 11:26:50 +0100 (CET)
Date: Mon, 14 Mar 2016 11:26:49 +0100 (CET)
From: Jeremy Rosen <jeremy.rosen@openwide.fr>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <124162959.1513110.1457951209870.JavaMail.zimbra@openwide.fr>
In-Reply-To: <20160314101514.GA2560@jama>
References: <1457836529-32388-1-git-send-email-twoerner@gmail.com>
	<10341857.OKlmJH1THC@peggleto-mobl.ger.corp.intel.com>
	<56E5D0C1.7010302@gmail.com>
	<1773609.Q7X4j5YgZm@peggleto-mobl.ger.corp.intel.com>
	<56E5E180.30408@gmail.com> <20160314101514.GA2560@jama>
MIME-Version: 1.0
X-Originating-IP: [213.162.49.238]
X-Mailer: Zimbra 8.6.0_GA_1178 (ZimbraWebClient - GC49 (Linux)/8.6.0_GA_1178)
Thread-Topic: metadata-revs: provide more information
Thread-Index: 1FaBrqg5rGGCcnNnirscwTDG//K52A==
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] metadata-revs: provide more information
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
X-List-Received-Date: Mon, 14 Mar 2016 10:35:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable




----- Le 14 Mar 16, =C3=A0 11:15, Martin Jansa martin.jansa@gmail.com a =C3=
=A9crit :

> On Sun, Mar 13, 2016 at 05:54:08PM -0400, Trevor Woerner wrote:
>> On 03/13/16 16:53, Paul Eggleton wrote:
>> > On Sun, 13 Mar 2016 16:42:41 Trevor Woerner wrote:
>> >> That's the problem I'm trying to solve: how can I easily keep all the
>> >> information required to reproduce this build, exactly. The whole "two
>> >> meta's" thing was just a speed bump.
>> >
>> > Right, understood, and it does make sense. I'm convinced there is an
>> > underlying problem to fix that this just papers over though.
>>=20
>> Okay, I think I see your point, and I agree. There is a layer clone
>> problem that should be addressed.
>>=20
>> But again, I think this is a speed bump.
>>=20
>> My underlying point is that we're purposefully leaving out information
>> that is vital to reproducible builds.
>=20

I think there are two problems here and that they need to be solved
separately...


* buildhistory does not save all the information to do a reproducible build
 =20
  I think the easiest way to solve that would be to save the whole bitbake
  environement used for building the recipe in the buildhistory. We would
  loose the layout info (i.e what layer touched what variable, though that
  info is in bitbake -e) but we would have enough info to reproduce the=20
  build itself. Moreover being able to diff the environement would be=20
  a great way to figure out what the change in the build actually was

* We need a way to easily transmit a set of meta revisions + extra info

  that is a different problem, telling a user how to reproduce a build=20
  from scratch, i.e starting from the download of the right meta. This
  calls for a tool similar to repo, but adapted to yocto (which might
  be repo itself, I don't know repo well enough to judge). What i've
  seen so far is that most board vendors will ship an ugly shell=20
  script that will clone and set the meta for you, usually doing some
  ugly hacks like patching the meta themselves. Having an "official"
  way to pack/distribute that info in yocto would be a very usefull
  tool indeed

my 2 cents...

Cordialement=20

J=C3=A9r=C3=A9my Rosen=20
+33 (0)1 42 68 28 13

fight key loggers : write some perl using vim=20


Open Wide Ingenierie

23, rue Daviel
75013 Paris - France
www.openwide.fr

