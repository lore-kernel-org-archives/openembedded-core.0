Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RupLZ-00044T-2z
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 19:00:53 +0100
Received: by werc1 with SMTP id c1so5833505wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 09:52:50 -0800 (PST)
Received: by 10.180.78.233 with SMTP id e9mr21383951wix.0.1328637170797;
	Tue, 07 Feb 2012 09:52:50 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id dw7sm33632850wib.4.2012.02.07.09.52.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 09:52:49 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <8E617E89-2373-4DEB-A3B1-C5D7E31ED4A4@dominion.thruhere.net>
Date: Tue, 7 Feb 2012 18:52:44 +0100
Message-Id: <80BDE81E-8DBA-46E6-84EC-B28F55E8AA70@dominion.thruhere.net>
References: <cover.1328631790.git.paul.eggleton@linux.intel.com>
	<fce0db04f4b95798f3bdf6c925f1707faf14f2ed.1328631790.git.paul.eggleton@linux.intel.com>
	<8E617E89-2373-4DEB-A3B1-C5D7E31ED4A4@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
X-Gm-Message-State: ALoCoQmGoh3FOC5YL26mZYYjGdpls0LvcOiyIyRL09KgiLrSf0myuwBQPgxn/zpjHhvSsWn4A4vD
Subject: Re: [PATCH 2/2] classes/buildhistory: sort list fields in package info
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
X-List-Received-Date: Tue, 07 Feb 2012 18:00:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 feb. 2012, om 18:50 heeft Koen Kooi het volgende geschreven:

>=20
> Op 7 feb. 2012, om 17:25 heeft Paul Eggleton het volgende geschreven:
>=20
>> Sort DEPENDS, PACKAGES, RDEPENDS, and RRECOMMENDS in package info =
files
>> so that any changes in order (which are not important) are smoothed =
out
>> in the change history.
>>=20
>> Fixes [YOCTO #1961]
>>=20
>> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>> ---
>> meta/classes/buildhistory.bbclass |   19 +++++++++++++++----
>> 1 files changed, 15 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/meta/classes/buildhistory.bbclass =
b/meta/classes/buildhistory.bbclass
>>=20
>> -	packages =3D squashspaces(d.getVar('PACKAGES', True))
>> +	packages =3D sortlist(squashspaces(d.getVar('PACKAGES', True)))
>=20
> Sorting PACKAGES is a bad idea, since order does matter in there.
>=20
>>=20
>> 	rcpinfo =3D RecipeInfo(pn)
>> 	rcpinfo.pe =3D pe
>> 	rcpinfo.pv =3D pv
>> 	rcpinfo.pr =3D pr
>> -	rcpinfo.depends =3D squashspaces(d.getVar('DEPENDS', True) or =
"")
>> +	rcpinfo.depends =3D sortlist(squashspaces(d.getVar('DEPENDS', =
True) or ""))
>> 	rcpinfo.packages =3D packages
>> 	write_recipehistory(rcpinfo, d)
>> 	write_latestlink(None, pe, pv, pr, d)
>> @@ -164,8 +175,8 @@ python buildhistory_emit_pkghistory() {
>> 		pkginfo.pe =3D pe
>> 		pkginfo.pv =3D pv
>> 		pkginfo.pr =3D pr
>> -		pkginfo.rdepends =3D squashspaces(getpkgvar(pkg, =
'RDEPENDS') or "")
>> -		pkginfo.rrecommends =3D squashspaces(getpkgvar(pkg, =
'RRECOMMENDS') or "")
>> +		pkginfo.rdepends =3D =
sortpkglist(squashspaces(getpkgvar(pkg, 'RDEPENDS') or ""))
>> +		pkginfo.rrecommends =3D =
sortpkglist(squashspaces(getpkgvar(pkg, 'RRECOMMENDS') or ""))
>=20
> Not sure what went wrong, but R* didn't seem to get sorted after these =
patches: =
https://github.com/Angstrom-distribution/buildhistory/commit/7a9f2f9308b46=
8706799be18b3f400410ee1f664

*blush* checking the console showed the error;

ERROR: Error executing a python function in =
/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-core/systemd/system=
d_git.bb:
NameError: global name 'pkgs' is not defined

ERROR: The stack trace of python calls that resulted in this =
exception/failure was:
ERROR:   File "buildhistory_emit_pkghistory", line 176, in <module>
ERROR:
ERROR:   File "buildhistory_emit_pkghistory", line 155, in =
buildhistory_emit_pkghistory
ERROR:
ERROR:   File "buildhistory_emit_pkghistory", line 107, in sortpkglist
ERROR:
ERROR: The code that was being executed was:
ERROR:      0172:
ERROR:      0173:               write_latestlink(pkg, pe, pv, pr, d)
ERROR:      0174:
ERROR:      0175:
ERROR:  *** 0176:buildhistory_emit_pkghistory(d)
ERROR:      0177:
ERROR: (file: 'buildhistory_emit_pkghistory', lineno: 176, function: =
<module>)
ERROR:      0151:               pkginfo =3D PackageInfo(pkg)
ERROR:      0152:               pkginfo.pe =3D pe
ERROR:      0153:               pkginfo.pv =3D pv
ERROR:      0154:               pkginfo.pr =3D pr
ERROR:  *** 0155:               pkginfo.rdepends =3D =
sortpkglist(squashspaces(getpkgvar(pkg, 'RDEPENDS') or ""))
ERROR:      0156:               pkginfo.rrecommends =3D =
sortpkglist(squashspaces(getpkgvar(pkg, 'RRECOMMENDS') or ""))
ERROR:      0157:               pkginfo.files =3D =
squashspaces(getpkgvar(pkg, 'FILES') or "")
ERROR:      0158:
ERROR:      0159:               # Gather information about packaged =
files
ERROR: (file: 'buildhistory_emit_pkghistory', lineno: 155, function: =
buildhistory_emit_pkghistory)
ERROR: Function failed: buildhistory_emit_pkghistory
ERROR: Logfile of failure stored in: =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-g=
nueabi/systemd-git-r15/temp/log.do_package.14521
NOTE: package systemd-git-r15: task do_package: Failed
ERROR: Task 9 =
(/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-core/systemd/syste=
md_git.bb, do_package) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2635 tasks of which 2626 didn't need to =
be rerun and 1 failed.
+ cd =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-g=
nueabi/bblayers-1.0-r0/bblayers-1.0
+ buildhistory_commit
+ '[' '!' -d /data/ssd/OE/buildhistory/ ']'
+ cd /data/ssd/OE/buildhistory//
+ '[' '!' -d .git ']'
++ git status --porcelain
+ repostatus=3D' M =
packages/armv7a-angstrom-linux-gnueabi/systemd/latest'
+ '[' ' M packages/armv7a-angstrom-linux-gnueabi/systemd/latest' '!=3D' =
'' ']'
+ git add /data/ssd/OE/buildhistory//README =
/data/ssd/OE/buildhistory//images /data/ssd/OE/buildhistory//packages
++ cat /etc/hostname
+ HOSTNAME=3Ddominion
+ git commit /data/ssd/OE/buildhistory// -m 'Build Angstrom =
v2012.02-core of angstrom v2012.02-core for machine beagleboard on =
dominion' --author 'Koen Kooi <koen@dominion.thruhere.net>'
+ '[' git@github.com:Angstrom-distribution/buildhistory.git '!=3D' '' =
']'
+ git push -q git@github.com:Angstrom-distribution/buildhistory.git
=09=


