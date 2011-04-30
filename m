Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QG5GM-0001qv-L9
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Apr 2011 10:10:51 +0200
Received: by wwb17 with SMTP id 17so3967461wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Apr 2011 01:08:16 -0700 (PDT)
Received: by 10.216.145.206 with SMTP id p56mr338868wej.80.1304150522447;
	Sat, 30 Apr 2011 01:02:02 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id bd8sm2133463wbb.14.2011.04.30.01.01.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 30 Apr 2011 01:02:00 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DBB3705.3060503@linux.intel.com>
Date: Sat, 30 Apr 2011 10:01:57 +0200
Message-Id: <AD1A39A7-B42B-4C0F-BE6D-CB4E3AA0648F@dominion.thruhere.net>
References: <1304072026-31760-1-git-send-email-koen@dominion.thruhere.net>
	<4DBB3705.3060503@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] git: use DESTDIR=$D instead prefixing all	variables by $D
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
X-List-Received-Date: Sat, 30 Apr 2011 08:10:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 apr 2011, om 00:09 heeft Saul Wold het volgende geschreven:

> On 04/29/2011 03:13 AM, Koen Kooi wrote:
>> From: Martin Jansa<martin.jansa@gmail.com>
>>=20
>> * with git-native and rm_work enabled I've noticed git fetcher errors =
like:
>>   warning: templates not found =
/OE/shr-core/tmp/work/x86_64-linux/git-native-1.7.3.4-r0/image/OE/shr-core=
/tmp/sysroots/x86_64-linux/usr/share/git-core/templates
>>   fatal: Unable to find remote helper for 'http'
>>   for every recipe using http:// for git repo
>> * after this change template_dir points to
>>   /OE/shr-core/tmp/sysroots/x86_64-linux/usr/share/git-core/templates
>>   without that workdir prefix
>> * haven't tested target recipe, but I guess it needs different fix or
>>   maybe it worked before and gets broken by this change (that's why =
this
>>   is just RFC)
>>=20
> Is this still just an RFC or has it been tested on the target?

On the target I get:

strace -o /tmp/log git clone http://git.pingu.fi/xf86-video-omapfb
Cloning into xf86-video-omapfb...
fatal: Unable to find remote helper for 'http'
root@beagleboard-core:~#=20

It does find the templates:

open("/usr/share/git-core/templates/", =
O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY|O_CLOEXEC) =3D 3
open("/usr/share/git-core/templates/config", O_RDONLY|O_LARGEFILE) =3D =
-1 ENOENT (No such file or directory)
lstat64("/usr/share/git-core/templates/branches", {st_mode=3DS_IFDIR|0755,=
 st_size=3D4096, ...}) =3D 0
open("/usr/share/git-core/templates/branches", =
O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY|O_CLOEXEC) =3D 4
lstat64("/usr/share/git-core/templates/description", =
{st_mode=3DS_IFREG|0644, st_size=3D73, ...}) =3D 0
open("/usr/share/git-core/templates/description", O_RDONLY|O_LARGEFILE) =
=3D 4
lstat64("/usr/share/git-core/templates/hooks", {st_mode=3DS_IFDIR|0755, =
st_size=3D4096, ...}) =3D 0
open("/usr/share/git-core/templates/hooks", =
O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY|O_CLOEXEC) =3D 4
lstat64("/usr/share/git-core/templates/hooks/applypatch-msg.sample", =
{st_mode=3DS_IFREG|0755, st_size=3D452, ...}) =3D 0
open("/usr/share/git-core/templates/hooks/applypatch-msg.sample", =
O_RDONLY|O_LARGEFILE) =3D 6
lstat64("/usr/share/git-core/templates/hooks/post-receive.sample", =
{st_mode=3DS_IFREG|0755, st_size=3D552, ...}) =3D 0
open("/usr/share/git-core/templates/hooks/post-receive.sample", =
O_RDONLY|O_LARGEFILE) =3D 6
lstat64("/usr/share/git-core/templates/hooks/post-commit.sample", =
{st_mode=3DS_IFREG|0755, st_size=3D160, ...}) =3D 0
open("/usr/share/git-core/templates/hooks/post-commit.sample", =
O_RDONLY|O_LARGEFILE) =3D 6
lstat64("/usr/share/git-core/templates/hooks/update.sample", =
{st_mode=3DS_IFREG|0755, st_size=3D3611, ...}) =3D 0
open("/usr/share/git-core/templates/hooks/update.sample", =
O_RDONLY|O_LARGEFILE) =3D 6
lstat64("/usr/share/git-core/templates/hooks/pre-applypatch.sample", =
{st_mode=3DS_IFREG|0755, st_size=3D398, ...}) =3D 0
open("/usr/share/git-core/templates/hooks/pre-applypatch.sample", =
O_RDONLY|O_LARGEFILE) =3D 6
lstat64("/usr/share/git-core/templates/hooks/commit-msg.sample", =
{st_mode=3DS_IFREG|0755, st_size=3D896, ...}) =3D 0
open("/usr/share/git-core/templates/hooks/commit-msg.sample", =
O_RDONLY|O_LARGEFILE) =3D 6
lstat64("/usr/share/git-core/templates/hooks/post-update.sample", =
{st_mode=3DS_IFREG|0755, st_size=3D189, ...}) =3D 0
open("/usr/share/git-core/templates/hooks/post-update.sample", =
O_RDONLY|O_LARGEFILE) =3D 6
lstat64("/usr/share/git-core/templates/hooks/pre-commit.sample", =
{st_mode=3DS_IFREG|0755, st_size=3D1578, ...}) =3D 0
open("/usr/share/git-core/templates/hooks/pre-commit.sample", =
O_RDONLY|O_LARGEFILE) =3D 6
lstat64("/usr/share/git-core/templates/hooks/prepare-commit-msg.sample", =
{st_mode=3DS_IFREG|0755, st_size=3D1359, ...}) =3D 0
open("/usr/share/git-core/templates/hooks/prepare-commit-msg.sample", =
O_RDONLY|O_LARGEFILE) =3D 6
lstat64("/usr/share/git-core/templates/hooks/pre-rebase.sample", =
{st_mode=3DS_IFREG|0755, st_size=3D5011, ...}) =3D 0
open("/usr/share/git-core/templates/hooks/pre-rebase.sample", =
O_RDONLY|O_LARGEFILE) =3D 6
lstat64("/usr/share/git-core/templates/info", {st_mode=3DS_IFDIR|0755, =
st_size=3D4096, ...}) =3D 0
open("/usr/share/git-core/templates/info", =
O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY|O_CLOEXEC) =3D 4
lstat64("/usr/share/git-core/templates/info/exclude", =
{st_mode=3DS_IFREG|0644, st_size=3D240, ...}) =3D 0
open("/usr/share/git-core/templates/info/exclude", O_RDONLY|O_LARGEFILE) =
=3D 6

But that didn't work before since /usr/libexec/git-core isn't getting =
packaged.

And I noticed this:

koen@dominion:/OE/tentacle/sources/openembedded-core$ git grep =
gitexecdir
meta/recipes-devtools/git/git.inc:      oe_runmake install =
DESTDIR=3D"${D}" bindir=3D${bindir} gitexecdir=3D${gitexecdir} \
koen@dominion:/OE/tentacle/sources/openembedded-core$=20

'gitexecdir' is undefined :(

I'll do a follow-up patch to fix git on the target, but that has *never* =
worked in yocto/oe-core. So please apply this patch to get at least =
fetching working with rm_work.

regards,

Koen


>=20
> Sau!
>=20
>=20
>> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>> ---
>>  meta/recipes-devtools/git/git.inc        |    4 ++--
>>  meta/recipes-devtools/git/git_1.7.4.3.bb |    2 +-
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/meta/recipes-devtools/git/git.inc =
b/meta/recipes-devtools/git/git.inc
>> index e1d1c71..843a1d3 100644
>> --- a/meta/recipes-devtools/git/git.inc
>> +++ b/meta/recipes-devtools/git/git.inc
>> @@ -14,8 +14,8 @@ EXTRA_OECONF =3D =
"--with-perl=3D${STAGING_BINDIR_NATIVE}/perl --without-tcltk"
>>  inherit autotools
>>=20
>>  do_install () {
>> -	oe_runmake install prefix=3D${D} bindir=3D${D}${bindir} =
gitexecdir=3D${D}${gitexecdir} \
>> -		template_dir=3D${D}${datadir}/git-core/templates \
>> +	oe_runmake install DESTDIR=3D"${D}" bindir=3D${bindir} =
gitexecdir=3D${gitexecdir} \
>> +		template_dir=3D${datadir}/git-core/templates \
>>  		GIT_PYTHON_DIR=3D${D}${datadir}/git-core/python
>>  }
>>=20
>> diff --git a/meta/recipes-devtools/git/git_1.7.4.3.bb =
b/meta/recipes-devtools/git/git_1.7.4.3.bb
>> index 603d2fd..2ff1ed5 100644
>> --- a/meta/recipes-devtools/git/git_1.7.4.3.bb
>> +++ b/meta/recipes-devtools/git/git_1.7.4.3.bb
>> @@ -1,6 +1,6 @@
>>  require git.inc
>>=20
>> -PR =3D "r0"
>> +PR =3D "r1"
>>=20
>>  EXTRA_OECONF +=3D "ac_cv_snprintf_returns_bogus=3Dno =
ac_cv_c_c99_format=3Dyes \
>>                   =
ac_cv_fread_reads_directories=3D${ac_cv_fread_reads_directories=3Dyes} \



