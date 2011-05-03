Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QHKVZ-0005MF-Do
	for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 20:39:41 +0200
Received: by wwb17 with SMTP id 17so345566wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2011 11:37:00 -0700 (PDT)
Received: by 10.227.102.99 with SMTP id f35mr183951wbo.11.1304447819809;
	Tue, 03 May 2011 11:36:59 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id w25sm228587wbd.5.2011.05.03.11.36.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 May 2011 11:36:57 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTi=mKFgk1smrJo8LXCG_iC344OFFvQ@mail.gmail.com>
Date: Tue, 3 May 2011 20:36:56 +0200
Message-Id: <E75D0BAC-5241-4455-A732-8C747F7D6396@dominion.thruhere.net>
References: <1304072026-31760-1-git-send-email-koen@dominion.thruhere.net>
	<4DBB3705.3060503@linux.intel.com>
	<AD1A39A7-B42B-4C0F-BE6D-CB4E3AA0648F@dominion.thruhere.net>
	<BANLkTi=mKFgk1smrJo8LXCG_iC344OFFvQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] git: use DESTDIR=$D instead prefixing all variables by $D
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
X-List-Received-Date: Tue, 03 May 2011 18:39:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 mei 2011, om 01:11 heeft Khem Raj het volgende geschreven:

> On Sat, Apr 30, 2011 at 1:01 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>=20
>> Op 30 apr 2011, om 00:09 heeft Saul Wold het volgende geschreven:
>>=20
>>> On 04/29/2011 03:13 AM, Koen Kooi wrote:
>>>> From: Martin Jansa<martin.jansa@gmail.com>
>>>>=20
>>>> * with git-native and rm_work enabled I've noticed git fetcher =
errors like:
>>>>   warning: templates not found =
/OE/shr-core/tmp/work/x86_64-linux/git-native-1.7.3.4-r0/image/OE/shr-core=
/tmp/sysroots/x86_64-linux/usr/share/git-core/templates
>>>>   fatal: Unable to find remote helper for 'http'
>>>>   for every recipe using http:// for git repo
>>>> * after this change template_dir points to
>>>>   =
/OE/shr-core/tmp/sysroots/x86_64-linux/usr/share/git-core/templates
>>>>   without that workdir prefix
>>>> * haven't tested target recipe, but I guess it needs different fix =
or
>>>>   maybe it worked before and gets broken by this change (that's why =
this
>>>>   is just RFC)
>>>>=20
>>> Is this still just an RFC or has it been tested on the target?
>>=20
>> On the target I get:
>>=20
>> strace -o /tmp/log git clone http://git.pingu.fi/xf86-video-omapfb
>> Cloning into xf86-video-omapfb...
>> fatal: Unable to find remote helper for 'http'
>> root@beagleboard-core:~#
>>=20
>> It does find the templates:
>>=20
>> open("/usr/share/git-core/templates/", =
O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY|O_CLOEXEC) =3D 3
>> open("/usr/share/git-core/templates/config", O_RDONLY|O_LARGEFILE) =3D =
-1 ENOENT (No such file or directory)
>> lstat64("/usr/share/git-core/templates/branches", =
{st_mode=3DS_IFDIR|0755, st_size=3D4096, ...}) =3D 0
>> open("/usr/share/git-core/templates/branches", =
O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY|O_CLOEXEC) =3D 4
>> lstat64("/usr/share/git-core/templates/description", =
{st_mode=3DS_IFREG|0644, st_size=3D73, ...}) =3D 0
>> open("/usr/share/git-core/templates/description", =
O_RDONLY|O_LARGEFILE) =3D 4
>> lstat64("/usr/share/git-core/templates/hooks", {st_mode=3DS_IFDIR|0755,=
 st_size=3D4096, ...}) =3D 0
>> open("/usr/share/git-core/templates/hooks", =
O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY|O_CLOEXEC) =3D 4
>> lstat64("/usr/share/git-core/templates/hooks/applypatch-msg.sample", =
{st_mode=3DS_IFREG|0755, st_size=3D452, ...}) =3D 0
>> open("/usr/share/git-core/templates/hooks/applypatch-msg.sample", =
O_RDONLY|O_LARGEFILE) =3D 6
>> lstat64("/usr/share/git-core/templates/hooks/post-receive.sample", =
{st_mode=3DS_IFREG|0755, st_size=3D552, ...}) =3D 0
>> open("/usr/share/git-core/templates/hooks/post-receive.sample", =
O_RDONLY|O_LARGEFILE) =3D 6
>> lstat64("/usr/share/git-core/templates/hooks/post-commit.sample", =
{st_mode=3DS_IFREG|0755, st_size=3D160, ...}) =3D 0
>> open("/usr/share/git-core/templates/hooks/post-commit.sample", =
O_RDONLY|O_LARGEFILE) =3D 6
>> lstat64("/usr/share/git-core/templates/hooks/update.sample", =
{st_mode=3DS_IFREG|0755, st_size=3D3611, ...}) =3D 0
>> open("/usr/share/git-core/templates/hooks/update.sample", =
O_RDONLY|O_LARGEFILE) =3D 6
>> lstat64("/usr/share/git-core/templates/hooks/pre-applypatch.sample", =
{st_mode=3DS_IFREG|0755, st_size=3D398, ...}) =3D 0
>> open("/usr/share/git-core/templates/hooks/pre-applypatch.sample", =
O_RDONLY|O_LARGEFILE) =3D 6
>> lstat64("/usr/share/git-core/templates/hooks/commit-msg.sample", =
{st_mode=3DS_IFREG|0755, st_size=3D896, ...}) =3D 0
>> open("/usr/share/git-core/templates/hooks/commit-msg.sample", =
O_RDONLY|O_LARGEFILE) =3D 6
>> lstat64("/usr/share/git-core/templates/hooks/post-update.sample", =
{st_mode=3DS_IFREG|0755, st_size=3D189, ...}) =3D 0
>> open("/usr/share/git-core/templates/hooks/post-update.sample", =
O_RDONLY|O_LARGEFILE) =3D 6
>> lstat64("/usr/share/git-core/templates/hooks/pre-commit.sample", =
{st_mode=3DS_IFREG|0755, st_size=3D1578, ...}) =3D 0
>> open("/usr/share/git-core/templates/hooks/pre-commit.sample", =
O_RDONLY|O_LARGEFILE) =3D 6
>> =
lstat64("/usr/share/git-core/templates/hooks/prepare-commit-msg.sample", =
{st_mode=3DS_IFREG|0755, st_size=3D1359, ...}) =3D 0
>> open("/usr/share/git-core/templates/hooks/prepare-commit-msg.sample", =
O_RDONLY|O_LARGEFILE) =3D 6
>> lstat64("/usr/share/git-core/templates/hooks/pre-rebase.sample", =
{st_mode=3DS_IFREG|0755, st_size=3D5011, ...}) =3D 0
>> open("/usr/share/git-core/templates/hooks/pre-rebase.sample", =
O_RDONLY|O_LARGEFILE) =3D 6
>> lstat64("/usr/share/git-core/templates/info", {st_mode=3DS_IFDIR|0755, =
st_size=3D4096, ...}) =3D 0
>> open("/usr/share/git-core/templates/info", =
O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY|O_CLOEXEC) =3D 4
>> lstat64("/usr/share/git-core/templates/info/exclude", =
{st_mode=3DS_IFREG|0644, st_size=3D240, ...}) =3D 0
>> open("/usr/share/git-core/templates/info/exclude", =
O_RDONLY|O_LARGEFILE) =3D 6
>>=20
>> But that didn't work before since /usr/libexec/git-core isn't getting =
packaged.
>>=20
>> And I noticed this:
>>=20
>> koen@dominion:/OE/tentacle/sources/openembedded-core$ git grep =
gitexecdir
>> meta/recipes-devtools/git/git.inc:      oe_runmake install =
DESTDIR=3D"${D}" bindir=3D${bindir} gitexecdir=3D${gitexecdir} \
>> koen@dominion:/OE/tentacle/sources/openembedded-core$
>>=20
>> 'gitexecdir' is undefined :(
>>=20
>=20
> yeah and git/makefile defines it
> gitexecdir =3D libexec/git-core
>=20
> may be we could set it to ${libdir}/git-core ?

Nah, tools belong in libexec. Any objections to this or the followup =
patch?

regards,

Koen=


