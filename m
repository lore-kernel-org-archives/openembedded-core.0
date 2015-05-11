Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8DB686013D;
	Mon, 11 May 2015 06:21:51 +0000 (UTC)
Received: by wgbhc8 with SMTP id hc8so17760489wgb.2;
	Sun, 10 May 2015 23:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=oFX5IYj7mgdYsQkL9+zZ6VXcoA5cYbese2tkkMvUROA=;
	b=X8tL5pjkMHMbbze0DsOIg/N0NnL7Dc6WlXTDOTYUFkwFDX08qpDBxUNgq/Zm8g8Hy8
	b0uAPPJxQ+SxzXLnFll0QpDH620PrPjsGMe+irSeYjCDqY6vulNlcGtZxLJGl3ICpkMx
	Ua1hsRvNMNwOQy2USp9RdtF9LX1sFT7pIZJfN7b+i8HzteFzvg4e3wBHwwUNRhbpDnRk
	CnpBBtFaGOyAoZtZ6KIE42RAosAfVhrclwfqo0yZjdpuIW8B6nI8HDmpji5VMc5yhTmx
	hfzh5GxWZgGzffNKMzWF4XzgwHtTllBKCuRO8DUydNWkaqcxMXTDB7wAdbYKpWay338x
	pRhQ==
X-Received: by 10.194.48.101 with SMTP id k5mr16956568wjn.79.1431325312696;
	Sun, 10 May 2015 23:21:52 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	d14sm21119114wjn.30.2015.05.10.23.21.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 May 2015 23:21:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 11 May 2015 08:22:22 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150511062222.GD2400@jama>
References: <20150501160602.GA5885@denix.org>
	<CAAQYJAvpGUdZyAzOay+VuDz+tdZF72ny0bgDfkTFomCFbVrMhQ@mail.gmail.com>
	<554A67AB.1000800@dresearch-fe.de>
	<20150506233137.GH5885@denix.org> <20150508192852.GJ5885@denix.org>
MIME-Version: 1.0
In-Reply-To: <20150508192852.GJ5885@denix.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] opkg_install_pkg: Package <name> md5sum mismatch. Either the opkg or the package index are corrupt.
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
X-List-Received-Date: Mon, 11 May 2015 06:21:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 08, 2015 at 03:28:52PM -0400, Denys Dmytriyenko wrote:
> On Wed, May 06, 2015 at 07:31:37PM -0400, Denys Dmytriyenko wrote:
> > On Wed, May 06, 2015 at 09:12:43PM +0200, Steffen Sledz wrote:
> > > Am 02.05.2015 um 23:55 schrieb Andrea Adami:
> > > > On Fri, May 1, 2015 at 6:06 PM, Denys Dmytriyenko <denis@denix.org>=
 wrote:
> > > >> Has anyone ever seen this message during <image>.do_rootfs task?
> > > >>
> > > >> Collected errors:
> > > >>  * opkg_install_pkg: Package <package> md5sum mismatch. Either the=
 opkg or the package index are corrupt. Try 'opkg update'.
> > > >>  * opkg_install_cmd: Cannot install package <package>.
> > > >>
> > > >> We started seeing it on random packages inside the <image> few wee=
ks ago on
> > > >> different machines. At the time we had switched to bitbake 1.26. B=
ut even
> > > >> trying different bitbake versions still occasionally caused the sa=
me error, so
> > > >> the culprit is still unknwon. Using oe-core/daisy for now.
> > > >>
> > > >> Any comments or suggestions to where start looking would be apprec=
iated!
> > > >=20
> > > > yes, I have seen this during multimachine builds.
> > > > My TMPDIR is on tmpfs in ram so everytime I reboot it is re-populat=
ed
> > > > from sstate.
> > > > ...
> > >=20
> > > We have the same problem here. Also with packages from the "all" feed=
 in a=20
> > > multimachine build environment. But it does not seem related to=20
> > > packagegroups.
> > >=20
> > > I've a hypothesis but was not able to validate or falsify it till now=
: Given=20
> > > a recipe which does only use file:// type SRC_URI. If i change someth=
ing in=20
> > > these sources and do not update PR the prserv/hashing mechanism detec=
ts the=20
> > > changes a builds a new package. But this package has the same version=
 info=20
> > > as the one before. So for opkg there's no need to update it's "packag=
e=20
> > > database".
> >=20
> > After fixing few of our own goofs in packagegroups, I still saw this is=
sue=20
> > with some real packages like weston-init. It went away after it got reb=
uilt=20
> > due to the dependencies, but I'll keep an eye on it and report if it co=
mes=20
> > back...
>=20
> Ok, so on the second day it failed again on weston-init and couple of our=
 own=20
> packages. They are all marked as allarch, but it seems they get re-packag=
ed=20
> for some reason for different machines in multi-machine build - the times=
tamp=20
> of the ipk package changed, while nothing else in the recipe or its data =
has=20
> changed. There's nothing obvious in weston-init I can see that would trig=
ger=20
> it. And in the logs I see that do_package_write_ipk_setscene being trigge=
red -=20
> I'm trying to figure out why... Any pointers?

There are many recipes with incorrect PACKAGE_ARCH, see latest report
=66rom world build:
http://lists.openembedded.org/pipermail/openembedded-core/2015-January/1007=
34.html

weston-init is one of recipes where I've sent change to drop allarch
long time ago:
http://patchwork.openembedded.org/patch/74133/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

