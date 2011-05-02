Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QH2KD-0001C9-54
	for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 01:14:45 +0200
Received: by ewy5 with SMTP id 5so1896191ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2011 16:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=6SeveooWZOxEuR+41VHqGMM4tE+SJAK5ibtNwaOR5r8=;
	b=fpFkhvfJZgQbvYhWE4E1siIeENhUXL3zexBfnczJObwu65o5a2VU1iS982NsMJkIih
	yl6OOVMP/tsmBsXC6ntFeyCX4OvOLIWpPm6fc7aLaofDI3sIYbfjucHkQl/Ph9/4EU5A
	kM08tlrgaCWLeVib5pSIzBQZbm8bwtdqUsLHI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=IjlLD92/YhNZ04XwFzCf0N8OBhfCyw80INHGejpQxhDJH9UoEXhdoxlvTsNrXFyzgB
	4ejx8+mI3Fvie5y04pqTTZ4M4uIhtm+NuAPEh1GmFc4UFuWWiam9YpTTG296aMB9YBAe
	dSEx4XRKiNC0+dE6wqRvaYPJlgyBMuqNJSOyM=
Received: by 10.14.125.4 with SMTP id y4mr3540174eeh.109.1304377922388; Mon,
	02 May 2011 16:12:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Mon, 2 May 2011 16:11:32 -0700 (PDT)
In-Reply-To: <AD1A39A7-B42B-4C0F-BE6D-CB4E3AA0648F@dominion.thruhere.net>
References: <1304072026-31760-1-git-send-email-koen@dominion.thruhere.net>
	<4DBB3705.3060503@linux.intel.com>
	<AD1A39A7-B42B-4C0F-BE6D-CB4E3AA0648F@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 May 2011 16:11:32 -0700
Message-ID: <BANLkTi=mKFgk1smrJo8LXCG_iC344OFFvQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Mon, 02 May 2011 23:14:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 30, 2011 at 1:01 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 30 apr 2011, om 00:09 heeft Saul Wold het volgende geschreven:
>
>> On 04/29/2011 03:13 AM, Koen Kooi wrote:
>>> From: Martin Jansa<martin.jansa@gmail.com>
>>>
>>> * with git-native and rm_work enabled I've noticed git fetcher errors l=
ike:
>>> =C2=A0 warning: templates not found /OE/shr-core/tmp/work/x86_64-linux/=
git-native-1.7.3.4-r0/image/OE/shr-core/tmp/sysroots/x86_64-linux/usr/share=
/git-core/templates
>>> =C2=A0 fatal: Unable to find remote helper for 'http'
>>> =C2=A0 for every recipe using http:// for git repo
>>> * after this change template_dir points to
>>> =C2=A0 /OE/shr-core/tmp/sysroots/x86_64-linux/usr/share/git-core/templa=
tes
>>> =C2=A0 without that workdir prefix
>>> * haven't tested target recipe, but I guess it needs different fix or
>>> =C2=A0 maybe it worked before and gets broken by this change (that's wh=
y this
>>> =C2=A0 is just RFC)
>>>
>> Is this still just an RFC or has it been tested on the target?
>
> On the target I get:
>
> strace -o /tmp/log git clone http://git.pingu.fi/xf86-video-omapfb
> Cloning into xf86-video-omapfb...
> fatal: Unable to find remote helper for 'http'
> root@beagleboard-core:~#
>
> It does find the templates:
>
> open("/usr/share/git-core/templates/", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_=
DIRECTORY|O_CLOEXEC) =3D 3
> open("/usr/share/git-core/templates/config", O_RDONLY|O_LARGEFILE) =3D -1=
 ENOENT (No such file or directory)
> lstat64("/usr/share/git-core/templates/branches", {st_mode=3DS_IFDIR|0755=
, st_size=3D4096, ...}) =3D 0
> open("/usr/share/git-core/templates/branches", O_RDONLY|O_NONBLOCK|O_LARG=
EFILE|O_DIRECTORY|O_CLOEXEC) =3D 4
> lstat64("/usr/share/git-core/templates/description", {st_mode=3DS_IFREG|0=
644, st_size=3D73, ...}) =3D 0
> open("/usr/share/git-core/templates/description", O_RDONLY|O_LARGEFILE) =
=3D 4
> lstat64("/usr/share/git-core/templates/hooks", {st_mode=3DS_IFDIR|0755, s=
t_size=3D4096, ...}) =3D 0
> open("/usr/share/git-core/templates/hooks", O_RDONLY|O_NONBLOCK|O_LARGEFI=
LE|O_DIRECTORY|O_CLOEXEC) =3D 4
> lstat64("/usr/share/git-core/templates/hooks/applypatch-msg.sample", {st_=
mode=3DS_IFREG|0755, st_size=3D452, ...}) =3D 0
> open("/usr/share/git-core/templates/hooks/applypatch-msg.sample", O_RDONL=
Y|O_LARGEFILE) =3D 6
> lstat64("/usr/share/git-core/templates/hooks/post-receive.sample", {st_mo=
de=3DS_IFREG|0755, st_size=3D552, ...}) =3D 0
> open("/usr/share/git-core/templates/hooks/post-receive.sample", O_RDONLY|=
O_LARGEFILE) =3D 6
> lstat64("/usr/share/git-core/templates/hooks/post-commit.sample", {st_mod=
e=3DS_IFREG|0755, st_size=3D160, ...}) =3D 0
> open("/usr/share/git-core/templates/hooks/post-commit.sample", O_RDONLY|O=
_LARGEFILE) =3D 6
> lstat64("/usr/share/git-core/templates/hooks/update.sample", {st_mode=3DS=
_IFREG|0755, st_size=3D3611, ...}) =3D 0
> open("/usr/share/git-core/templates/hooks/update.sample", O_RDONLY|O_LARG=
EFILE) =3D 6
> lstat64("/usr/share/git-core/templates/hooks/pre-applypatch.sample", {st_=
mode=3DS_IFREG|0755, st_size=3D398, ...}) =3D 0
> open("/usr/share/git-core/templates/hooks/pre-applypatch.sample", O_RDONL=
Y|O_LARGEFILE) =3D 6
> lstat64("/usr/share/git-core/templates/hooks/commit-msg.sample", {st_mode=
=3DS_IFREG|0755, st_size=3D896, ...}) =3D 0
> open("/usr/share/git-core/templates/hooks/commit-msg.sample", O_RDONLY|O_=
LARGEFILE) =3D 6
> lstat64("/usr/share/git-core/templates/hooks/post-update.sample", {st_mod=
e=3DS_IFREG|0755, st_size=3D189, ...}) =3D 0
> open("/usr/share/git-core/templates/hooks/post-update.sample", O_RDONLY|O=
_LARGEFILE) =3D 6
> lstat64("/usr/share/git-core/templates/hooks/pre-commit.sample", {st_mode=
=3DS_IFREG|0755, st_size=3D1578, ...}) =3D 0
> open("/usr/share/git-core/templates/hooks/pre-commit.sample", O_RDONLY|O_=
LARGEFILE) =3D 6
> lstat64("/usr/share/git-core/templates/hooks/prepare-commit-msg.sample", =
{st_mode=3DS_IFREG|0755, st_size=3D1359, ...}) =3D 0
> open("/usr/share/git-core/templates/hooks/prepare-commit-msg.sample", O_R=
DONLY|O_LARGEFILE) =3D 6
> lstat64("/usr/share/git-core/templates/hooks/pre-rebase.sample", {st_mode=
=3DS_IFREG|0755, st_size=3D5011, ...}) =3D 0
> open("/usr/share/git-core/templates/hooks/pre-rebase.sample", O_RDONLY|O_=
LARGEFILE) =3D 6
> lstat64("/usr/share/git-core/templates/info", {st_mode=3DS_IFDIR|0755, st=
_size=3D4096, ...}) =3D 0
> open("/usr/share/git-core/templates/info", O_RDONLY|O_NONBLOCK|O_LARGEFIL=
E|O_DIRECTORY|O_CLOEXEC) =3D 4
> lstat64("/usr/share/git-core/templates/info/exclude", {st_mode=3DS_IFREG|=
0644, st_size=3D240, ...}) =3D 0
> open("/usr/share/git-core/templates/info/exclude", O_RDONLY|O_LARGEFILE) =
=3D 6
>
> But that didn't work before since /usr/libexec/git-core isn't getting pac=
kaged.
>
> And I noticed this:
>
> koen@dominion:/OE/tentacle/sources/openembedded-core$ git grep gitexecdir
> meta/recipes-devtools/git/git.inc: =C2=A0 =C2=A0 =C2=A0oe_runmake install=
 DESTDIR=3D"${D}" bindir=3D${bindir} gitexecdir=3D${gitexecdir} \
> koen@dominion:/OE/tentacle/sources/openembedded-core$
>
> 'gitexecdir' is undefined :(
>

yeah and git/makefile defines it
gitexecdir =3D libexec/git-core

may be we could set it to ${libdir}/git-core ?

> I'll do a follow-up patch to fix git on the target, but that has *never* =
worked in yocto/oe-core. So please apply this patch to get at least fetchin=
g working with rm_work.
>
> regards,
>
> Koen
>
>
>>
>> Sau!
>>
>>
>>> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
>>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>>> ---
>>> =C2=A0meta/recipes-devtools/git/git.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 =C2=A04 ++--
>>> =C2=A0meta/recipes-devtools/git/git_1.7.4.3.bb | =C2=A0 =C2=A02 +-
>>> =C2=A02 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/=
git/git.inc
>>> index e1d1c71..843a1d3 100644
>>> --- a/meta/recipes-devtools/git/git.inc
>>> +++ b/meta/recipes-devtools/git/git.inc
>>> @@ -14,8 +14,8 @@ EXTRA_OECONF =3D "--with-perl=3D${STAGING_BINDIR_NATI=
VE}/perl --without-tcltk"
>>> =C2=A0inherit autotools
>>>
>>> =C2=A0do_install () {
>>> - =C2=A0 =C2=A0oe_runmake install prefix=3D${D} bindir=3D${D}${bindir} =
gitexecdir=3D${D}${gitexecdir} \
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0template_dir=3D${D}${datadir=
}/git-core/templates \
>>> + =C2=A0 =C2=A0oe_runmake install DESTDIR=3D"${D}" bindir=3D${bindir} g=
itexecdir=3D${gitexecdir} \
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0template_dir=3D${datadir}/gi=
t-core/templates \
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GIT_PYTHON_DIR=3D${D}${=
datadir}/git-core/python
>>> =C2=A0}
>>>
>>> diff --git a/meta/recipes-devtools/git/git_1.7.4.3.bb b/meta/recipes-de=
vtools/git/git_1.7.4.3.bb
>>> index 603d2fd..2ff1ed5 100644
>>> --- a/meta/recipes-devtools/git/git_1.7.4.3.bb
>>> +++ b/meta/recipes-devtools/git/git_1.7.4.3.bb
>>> @@ -1,6 +1,6 @@
>>> =C2=A0require git.inc
>>>
>>> -PR =3D "r0"
>>> +PR =3D "r1"
>>>
>>> =C2=A0EXTRA_OECONF +=3D "ac_cv_snprintf_returns_bogus=3Dno ac_cv_c_c99_=
format=3Dyes \
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_cv_fr=
ead_reads_directories=3D${ac_cv_fread_reads_directories=3Dyes} \
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


