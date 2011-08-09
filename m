Received: from gate.crashing.org ([63.228.1.57])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QqoMe-0007vT-Gv
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 17:37:08 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p79FWdv6001906
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 10:32:39 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1312898286.14274.298.camel@rex>
Date: Tue, 9 Aug 2011 10:32:37 -0500
Message-Id: <2C6C8741-1012-47BC-BDA9-2A02A08C5027@kernel.crashing.org>
References: <032728F4-C51D-4298-B50C-B1C2C7050E22@kernel.crashing.org>
	<1312898286.14274.298.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: meta-toolchain-sdk failure
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
X-List-Received-Date: Tue, 09 Aug 2011 15:37:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 9, 2011, at 8:58 AM, Richard Purdie wrote:

> On Tue, 2011-08-09 at 08:45 -0500, Kumar Gala wrote:
>> Seeing the following when trying to do a meta-toolchain-sdk build =
w/latest git.  Guessing we're missing a depend of some sort:
>>=20
>> | error: Failed dependencies:
>> | 	telepathy-python is needed by =
task-core-standalone-gmae-sdk-target-1.0-r13.ppc64e5500
>>=20
>> I think the reset of this is noise:
>=20
> It is, yes.
>=20
> Did telepathy-python build at all (you can check if any stamps are
> present)? Are there any packages generated (in the deploy/rpm
> directory)?
>=20
> I'm trying to work out if this wasn't present because it didn't build,
> because it did build but didn't package correctly or whether the =
rootfs
> code just isn't seeing the package...

Seems it build but no package:

=
build-p5020/tmp/deploy/rpm/ppc64e5500/telepathy-python-dev-0.15.19-r2.ppc6=
4e5500.rpm
=
build-p5020/tmp/deploy/rpm/ppc64e5500/telepathy-python-dbg-0.15.19-r2.ppc6=
4e5500.rpm

Looking at log.do_package

WARNING: For recipe telepathy-python, the following files were installed =
but not shipped in any package:
WARNING:   /usr/lib/python2.6/site-packages/telepathy/__init__.pyo
WARNING:   /usr/lib/python2.6/site-packages/telepathy/utils.py
WARNING:   /usr/lib/python2.6/site-packages/telepathy/utils.pyc
WARNING:   /usr/lib/python2.6/site-packages/telepathy/interfaces.py
WARNING:   /usr/lib/python2.6/site-packages/telepathy/errors.py
WARNING:   /usr/lib/python2.6/site-packages/telepathy/_version.pyo
WARNING:   /usr/lib/python2.6/site-packages/telepathy/__init__.py
WARNING:   /usr/lib/python2.6/site-packages/telepathy/_version.py
WARNING:   /usr/lib/python2.6/site-packages/telepathy/__init__.pyc
WARNING:   /usr/lib/python2.6/site-packages/telepathy/_version.pyc
WARNING:   /usr/lib/python2.6/site-packages/telepathy/constants.pyc
...

Since this build is with 64-bit we should be in /usr/lib64 but are not.

I believe there are other python packages that aren't respecting =
${libdir}

There was a patch to xcb, but that still had issues as for some reason =
aclocal.m4 is getting regnerated and overriding PYTHON_LIB_PREFIX.

- k



