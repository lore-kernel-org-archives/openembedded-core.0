Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7AB396FFC7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 14:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0IEbEpL019714; Mon, 18 Jan 2016 14:37:14 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OSFe1RRMBIMR; Mon, 18 Jan 2016 14:37:14 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0IEb7Dk019711
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 18 Jan 2016 14:37:09 GMT
Message-ID: <1453127827.27999.64.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Olof Johansson <olof.johansson@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 18 Jan 2016 14:37:07 +0000
In-Reply-To: <20160118124428.GK31212@axis.com>
References: <20160118124428.GK31212@axis.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: PV from filename, not reflected in siginfo?
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
X-List-Received-Date: Mon, 18 Jan 2016 14:37:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-01-18 at 13:44 +0100, Olof Johansson wrote:
> Hi,
> 
> I'm currently investigating reports of bitbake not correctly
> handling a type of change to a recipe, where the only change is a
> filename rename to update the PV.
> 
> With bitbake-dumpsigs:
> 
>  ...
>  Variable PV value is ${@bb.parse.BBHandler.vars_from_file(d.getVar('
> FILE', False),d)[1] or '1.0'}
>  Variable PN value is ${@bb.parse.BBHandler.vars_from_file(d.getVar('
> FILE', False),d)[0] or 'defaultpkgname'}
>  ...
> 
> ... with nothing containing the resolved value of PV. I would
> expect the computed value of PV to be a part of the siginfo. The
> consquence of this seems to be that bitbake doesn't schedule
> dependents to be rebuilt, i.e. if I rename the recipe
> foo_1.2.3.bb to foo_1.2.4.bb, the recipe foo is rebuilt, but the
> image isn't.
> 
> I tried some changes:
> 
>  - Changing the PV assignment in bitbake.conf to :=. Didn't work,
>    got errors that I suspect are related to not being able to
>    include foo-${PV}.inc files. The value of PV was clobbered.
>    Also played around with using BB_FILENAME instead, but didn't
>    help.
> 
>  - Changes within Bitbake that assigned the version part of the
>    filename to PV when loading new files ending with .bb. This
>    worked but is really ugly.
> 
>  - Moving the PV assignment into the recipe (as an explicit
>    assignment). This works, makes dependents build as expected
>    and bitbake-dumpsigs lists the value, but is also ugly.
> 
> I suspect this isn't usually a problem in OE-Core, since most
> recipe updates requires updates within the recipe as well
> (tarball checksums, for instance), but that's not as true for our
> internal recipes.
> 
> Is this a known issue? Any ideas on how to solve this? Nicer
> workarounds?

It isn't known but I can imagine how this could cause a problem.

I suspect (but am guessing) that:

PV[vardepvalue] = "${PV}"

might happen to fix this...

Cheers,

Richard



