Received: from smtp23.4emm.com ([69.18.222.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1QpB2k-0004Iu-V3
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 05:25:51 +0200
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB23.4emm.local ([::1]) with mapi id 14.01.0289.001; Thu, 4 Aug 2011
	23:20:21 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Re: erratic failure of pseudo
Thread-Index: AcxTHtW0C/f0cTEMQ5yv293kKfHOkQ==
Date: Fri, 5 Aug 2011 03:20:19 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF183101@MBX20.4emm.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: Re: erratic failure of pseudo
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
X-List-Received-Date: Fri, 05 Aug 2011 03:25:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Wed Aug 3 05:57:55, James Limbouris wrote:
> On Tue Aug 2 16:40:09, Mark Hatle wrote:
>>On 8/2/11 5:11 AM, Richard Purdie wrote:
>>> On Tue, 2011-08-02 at 07:28 +0000, James Limbouris wrote:
>>>> Hi,
>>>>
>>>> I've just switched to oe-core from -dev, and I'm finding that my root
>>>> images are showing incorrect permissions on files, randomly. From one
>>>> build to the next, different subsets of files and folders end up owned
>>>> by 1000:1000, instead of root:root. They aren't strictly grouped by
>>>> package - just random files, different every time.
>>>>
>>>> Has anyone else noticed this behaviour? Does anyone have any advice on
>>>> how to go about debugging? It might help to look at the pseudo db, and
>>>> see if the permissions are in there - can anyone tell me where it is?
>>>> I find an empty pseudo folder in the work folder after do_rm_work, but
>>>> it is not there if I do a bitbake -c build image-xxx.
>>>> =20
>>>=20
>>> I'd work backwards with this. Check the owners of the files in the
>>> packages, then that either points at the packages themselves or the
>>> rootfs step. I'd also disable rm_work whilst debugging this since it
>>> deletes a lot of the info you might want to use to debug it...
>>>=20
>>> There is the PSEUDO_DEBUG=3Dx environmental variable which can help wit=
h
>>> pseudo debugging too...
>>=20
>> First, are you using the oe-init-build-env script to setup your environm=
ent?  If
>> not, are you using the scripts/bitbake wrapper when calling bitbake?  If=
 you do
>> not use the wrapper, pseudo is not active and you will get the build uid=
/gid
>> embedded in the packages (or you will get failures.)  Assuming you are u=
sing the
>> wrapper...
>>=20
>> Each package has it's own pseudo database.  The final image does as well=
.  As
>> Richard said, start with which file or directories appear to be incorrec=
t.  Back
>> up to the package itself and see if they are incorrect in the package.  =
If they
>> are then focus on the work directory of the package.
>>=20
>> PSEUDO_DEBUG is simply a number starting with '1'.  The larger the numbe=
r the
>> more verbose the debug output will be.
>>=20
>> Inside of the work directory, i.e.
>> buld/tmp-eglibc/work/i586-oe-linux/zlib-1.2.5-r0, will be a pseudo direc=
tory.
>> There is a "pseudo.log" file here.  Inside of the files any un-owned dir=
ectories
>> that pseudo becomes aware of will be listed.  It's pretty typical for th=
ere to
>> be one or two directories listed here, normally this is not a problem.  =
If the
>> directories you are having issues with are listed that could be the caus=
e...
>> (If so please let us know by sending a bug report with the package and
>> directories that are having the issues..)
>>=20
>> The files.db is the database of all of the files.  This is an sqlite3 da=
tabase.
>>=20
>> The contents of the primary table (file) is:
>>=20
>> files ( id INTEGER PRIMARY KEY, path VARCHAR, dev INTEGER, ino INTEGER, =
uid
>> INTEGER, gid INTEGER, mode INTEGER, rdev INTEGER , deleting INTEGER)
>>=20
>> Use sql commands to find the path you are concerned with and see if it's=
 in the
>> list.  Note, not all paths are listed.  Some filesystem operations only =
work
>> based on inode..  In that case the entry is "NAMELESS FILE" [for the pat=
h], and
>> the inode is filed in.
>>=20
>> Finally, what filesystem are you using?  There are a few filesystems lik=
e
>> clearcase that do not have consistent inodes.  Pseudo uses inodes to ver=
ify that
>> the file is the same and has not moved from one instance to the next.  (=
If the
>> inode isn't set it falls back to filename only.)
>>=20
>> --Mark
>>=20
>>> Cheers,
>>>=20
>>> Richard
>>>=20
>>>=20
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core at lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> Hi,
>=20
> Thanks for the detailed hints. I've tracked the problem down to PSEUDO_LO=
CALSTATEDIR being set incorrectly.
>=20
> If I do a 'bitbake -e xxx-image > env.txt' I get a nice long file, with P=
SEUDO_LOCALSTATEDIR etc all set correctly from openembedded-core/meta/conf/=
bitbake.conf. However, when I look at run.do_rootfs, there are no pseudo re=
lated environment variables. Printing the env from within the script shows =
that PSEUDO_LOCALSTATEDIR is set to tmp-eglibc/sysroots/i686-linux/var/pseu=
do/ - so all of my packages have been using the same pseudo db. When a pack=
age is rebuilt, lots of inode mismatches etc occur, and some of the files c=
ome out corrupt.
>=20
> When building, I use:
>=20
> export SCRIPTS_BASE_VERSION=3D2
> export BBFETCH2=3DTrue
> export BUILDDIR=3D"$PWD/build"
> export PATH=3D"$PWD/sources/openembedded-core/scripts:$PWD/sources/bitbak=
e/bin:$PATH"
> export BB_ENV_EXTRAWHITE=3D"TCLIBC TCMODE GIT_PROXY_COMMAND http_proxy ft=
p_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOC=
K BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS"
> export BBPATH=3D"$PWD:$PWD/sources/openembedded-core/meta"
>=20
> as a preliminary, and then bitbake (which does call the wrapper.)
>=20
> I'm stuck now - I can't work out how the environment from bitbake.conf us=
ually reaches the run.do_* scripts.
>  =20
> Regards
>  James Limbouris

Hi,

I've tried building oe-core on its own, with no extra layers,
and pseudo then works as expected. Building it as part of Angstrom,
using the Angstrom setup scripts according to the instructions,
results in a single pseudo db being used for all packages.

So I think this looks like a bug, rather than misconfiguration on my part.

By trial and error, I found that in my own setup (based on the=20
Angstrom setup), if the first bitbake command after touching my
local.conf to cause a cache rebuild is 'bitbake -s', I get seperate
pseudo db's for packages, but not images. If it is bitbake -c clean,
I get a single pseudo db in all cases.

Right now I'm resorting to deleting the misplaced db on every bitbake
invocation, but I'd like to get to the bottom of this.

Regards,
James Limbouris



