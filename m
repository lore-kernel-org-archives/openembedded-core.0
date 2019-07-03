Return-Path: <prvs=0800548a1=Mikko.Rapeli@bmw.de>
Received: from esa3.bmw.c3s2.iphmx.com (esa3.bmw.c3s2.iphmx.com
	[68.232.133.150])
	by mail.openembedded.org (Postfix) with ESMTP id 672947C124
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 16:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1562169756; x=1593705756;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=5M5Rmi/9Yay1fy/etKY/yCP+DfJ4OwwC32gn/9s4eaU=;
	b=PCztWOJw7yne9IsjpyMHFoU3YFh44zFTaBmaA7Vg9gT3bFzc2wypNrAw
	Yv1ocE+zKmJBpO/MXdyXF5Lavc282sPQc0K3kPbBnA3jJ+cPtwXTH0B4O
	vU0yJHynGf4KBdhQxuVbahOqkUx/rjK61YO2+r/uN7NQ616mIhiq+HW/d k=;
IronPort-SDR: D8c09keJRadaWHj2OajViqhoDSJCp2cKT8AL5oCxn51dagxZ7nsx4mtE4oTmhUdiabjFAkjqE9
	uFxeC769bi0sX1zDxLVyywO4ytHcg3lDRQVYzt6JTr8V/SVTs5tkMMAbCIyKIlo65yXvT8cxYt
	QzUPxh1qgCc5Cl64DCWkoghB30rIg1DuMOrnFCcvQWd3t2fDRpcGZTsOgmkuOXOJRgj0cA9EGQ
	giJnLmD84r4umNNzK30RvvxmELhVoOowwxEfHy08YYry1kE+dX+bbz8FRxCfM7jYnqC1JiR6jh
	oqA=
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa3.bmw.c3s2.iphmx.com with ESMTP/TLS; 03 Jul 2019 18:02:21 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw5.muc with ESMTP/TLS;
	03 Jul 2019 18:02:21 +0200
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp)
	([160.48.96.47])
	by esabb2.muc with ESMTP/TLS; 03 Jul 2019 18:02:20 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10k.europe.bmw.corp
	(160.48.96.47) with Microsoft SMTP Server (TLS;
	Wed, 3 Jul 2019 18:02:20 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Wed, 3 Jul 2019 18:02:20 +0200
From: <Mikko.Rapeli@bmw.de>
To: <twoerner@gmail.com>
Thread-Topic: [OE-core] build failures due to pigz host tool
Thread-Index: AQHVMbCiW0qNGXCCmka8vTdeoQB6hqa47HmA
Date: Wed, 3 Jul 2019 16:02:20 +0000
Message-ID: <20190703160219.GW3459@hiutale>
References: <20190703150405.GA23280@linux-uys3>
In-Reply-To: <20190703150405.GA23280@linux-uys3>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.44]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: build failures due to pigz host tool
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
X-List-Received-Date: Wed, 03 Jul 2019 16:02:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <45EA72A97A56574C8FB3B5378D36D47A@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 03, 2019 at 11:04:06AM -0400, Trevor Woerner wrote:
> Hi,
>=20
> This came up as a topic in yesterday's Engineering Sync meeting. For roug=
hly a
> year I've been seeing random build failures on my Jenkins setup due to pi=
gz
> failing; apparently the project is now seeing them on their builds, so I'=
ll
> share what I know of them.
>=20
> At the time I started seeing these failures (Aug 2018) I had just upgrade=
d my
> system to openSUSE 15.0. Since nobody else was seeing them, I assumed the=
y
> were related to my setup. When I went out searching for an answer, I foun=
d
> there wasn't very much out there to help me. But I did notice that there =
were
> reports of other people seeing the issue who weren't using openSUSE and w=
ho
> weren't doing anything related to OE builds using Jenkins.
>=20
> The build failure looks something like this:
>=20
> 	| DEBUG: Executing shell function sstate_create_package
> 	| pigz: abort: internal threads error
> 	| tar: /z/jenkins-workspace/nightly/cubietruck/build/sstate-cache/8a/sst=
ate:linux-mainline:cubietruck-oe-linux-gnueabi:4.19.46:r0:cubietruck:3:8a15=
9ba1ffefb5fc2feeeff5b40abf8ad67658e5ff3ed3bf67d25d9c8f2805e0_package.tgz.9b=
A8tCje: Wrote only 6144 of 10240 bytes
> 	| tar: Child returned status 16
> 	| tar: Error is not recoverable: exiting now
> 	| WARNING: /z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/=
cubietruck-oe-linux-gnueabi/linux-mainline/4.19.46-r0/temp/run.sstate_creat=
e_package.19996:1 exit 1 from 'exit 1'
> 	| DEBUG: Python function sstate_task_postfunc finished
> 	| ERROR: Function failed: sstate_create_package (log file is located at =
/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/cubietruck-oe-=
linux-gnueabi/linux-mainline/4.19.46-r0/temp/log.do_package.19996)
> 	NOTE: recipe linux-mainline-4.19.46-r0: task do_package: Failed
> 	ERROR: Task (/opt/oe/configs/z/jenkins-workspace/nightly/cubietruck/laye=
rs/meta-sunxi/recipes-kernel/linux/linux-mainline_4.19.46.bb:do_package) fa=
iled with exit code '1'
>=20
> Here's another example:
>=20
> 	| DEBUG: Executing shell function sstate_create_package
> 	| pigz: abort: internal threads error
> 	| tar: /z/jenkins-workspace/nightly/odroid-xu4/build/sstate-cache/d4/sst=
ate:sqlite3:cortexa15t2hf-neon-vfpv4-oe-linux-gnueabi:3.28.0:r0:cortexa15t2=
hf-neon-vfpv4:3:d4eb5692a1756a832d72fb2003a3d431108fbc736044747d33698ad7b68=
81dd9_package.tgz.herLUpYQ: Wrote only 2048 of 10240 bytes
> 	| tar: Child returned status 16
> 	| tar: Error is not recoverable: exiting now
> 	| WARNING: /z/jenkins-workspace/nightly/odroid-xu4/build/tmp-glibc/work/=
cortexa15t2hf-neon-vfpv4-oe-linux-gnueabi/sqlite3/3_3.28.0-r0/temp/run.ssta=
te_create_package.24136:1 exit 1 from 'exit 1'
> 	| DEBUG: Python function sstate_task_postfunc finished
> 	| ERROR: Function failed: sstate_create_package (log file is located at =
/z/jenkins-workspace/nightly/odroid-xu4/build/tmp-glibc/work/cortexa15t2hf-=
neon-vfpv4-oe-linux-gnueabi/sqlite3/3_3.28.0-r0/temp/log.do_package.24136)
> 	NOTE: recipe sqlite3-3_3.28.0-r0: task do_package: Failed
> 	ERROR: Task (/opt/oe/configs/z/jenkins-workspace/nightly/odroid-xu4/laye=
rs/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.28.0.bb:do_packa=
ge) failed with exit code '1'
>=20
> When I first started seeing this problem, I would see it quite frequently=
.
> Every morning, out of roughly 15 nightly builds, around 4-5 of them would=
 have
> failed in this way. Back then I would also get a lot of errors that would
> report something along the lines of the following:
>=20
> 	fork: Resource temporarily unavailable
> 	Cannot spawn thread (?)
>=20
> I don't have an example of that error on hand, but I used to get a lot of
> those around the same time too.
>=20
> My observations are:
> - I've never seen any of these errors with builds that I run by hand, odd=
ly
>   enough, these errors only ever happen to builds that are run by Jenkins=
. I
>   have no idea if this is just a coincidence, or if there is something go=
ing
>   on related to kicking off a build from a large program (Jenkins)

This rings a bell. Jenkins spawns builds from java and the environment wher=
e
processes are spawned differs from normal console and login shells
considerably. Can't remember any details anymore, but environment variables
and various things like thread limits may be different in Java shells
compared to login ones. If pigz spawns too many threads and it happens on
too many bitbake tasks in parallel, at some point thread creation may fail
due to limits.

Hope this helps,

-Mikko

> - Back then these failures were quite frequent. Today, of the 20-ish or s=
o
>   Jenkins builds that are kicked off every night, in a 2-week span I have=
 only
>   2 such failures. So it seems that I've been able to reduce the occurren=
ce
>   rate, but not eliminate it completely
>=20
> - I haven't seen the "resource" failure in a while. I don't know if these=
 are
>   two separate issues that just happened to start at the same time, or if
>   they're related in some way.
>=20
> >From what little information I was able to find online, here are the thi=
ngs I
> tweaked (which may or may not have contributed to the reduction in the ra=
te of
> occurrence):
>=20
> - At that time, I had been setting a "barrier=3D6000" on the disk I was u=
sing
>   for the builds. I removed that tweak.
>=20
> - I edited /etc/systemd/logind.conf and set
> 	UserTaskMax=3Dinfinity
>=20
> - I edited /etc/systemd/system.conf and set:
> 	DefaultTaskAccounting=3Dno
> 	DefaultTaskMax=3Dinfinity
>=20
> - I edited /etc/sysconfig/jenkins and added/set:
> 	JENKINS_JAVA_OPTIONS=3D"-Djava.awt.headless=3Dtrue -Xmx1g"
>=20
> Since this build failure is so intermittent, it's quite hard to dig into =
it.
> As I said above, of the last roughly 280 builds my system has done in the=
 last
> 2 weeks, only 2 such failures occurred.
>=20
> It's possible that overriding CONVERSION_CMD_gz in my builds to not use p=
igz
> would probably fix the issue at the cost of losing the parallelism of the
> sstate_create_package task.
>=20
> My host machine's version of pigz is: 2.3.3
>=20
> Best regards,
> 	Trevor
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core=

