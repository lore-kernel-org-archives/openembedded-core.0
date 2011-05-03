Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QHKzB-0005YS-5Z
	for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 21:10:17 +0200
Received: by ewy5 with SMTP id 5so125615ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2011 12:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=TCBIKWzQJUHDXskn/+4plDI5FEi1iwYbCK7GQ78kODo=;
	b=W7BJGeMa1IQpUajBJuBdseWha+aSngxtHgBMlDWx6cWxQZZl0uFgsQ/kR5R9y7Y9P+
	AKq0aWv1HeqO7/IEchPKKfsunouioAZOH4BypCncSvcfbX3ZFkxmMirTKxq1tb4s5qqb
	Kebw7ajJdFblrA3ROdGV8BsFLNge0V/A08pVw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=OOAReXo9DuvtvYmOZ3il/WmLjwLM/EdlY3CJqep4zOfVYJ5hoj/YsBOHAGB9NwtNKu
	KWeVfCFxnQ9foNCiTfLNm8l19zxKQDXDZg4vA3X8TRYbXj3J0EHEfxpA3IY5GfY7bz9x
	IUEAQ75SR5Y9Yy4ZwxI0IqndSBMIgkw1/Xjg4=
Received: by 10.14.52.132 with SMTP id e4mr100335eec.173.1304449658119; Tue,
	03 May 2011 12:07:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Tue, 3 May 2011 12:07:07 -0700 (PDT)
In-Reply-To: <E75D0BAC-5241-4455-A732-8C747F7D6396@dominion.thruhere.net>
References: <1304072026-31760-1-git-send-email-koen@dominion.thruhere.net>
	<4DBB3705.3060503@linux.intel.com>
	<AD1A39A7-B42B-4C0F-BE6D-CB4E3AA0648F@dominion.thruhere.net>
	<BANLkTi=mKFgk1smrJo8LXCG_iC344OFFvQ@mail.gmail.com>
	<E75D0BAC-5241-4455-A732-8C747F7D6396@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 May 2011 12:07:07 -0700
Message-ID: <BANLkTikgC5_yrxLN6xpg2KrPN-DaOyL8nw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 03 May 2011 19:10:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 3, 2011 at 11:36 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 3 mei 2011, om 01:11 heeft Khem Raj het volgende geschreven:
>
>> On Sat, Apr 30, 2011 at 1:01 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>>
>>> Op 30 apr 2011, om 00:09 heeft Saul Wold het volgende geschreven:
>>>
>>>> On 04/29/2011 03:13 AM, Koen Kooi wrote:
>>>>> From: Martin Jansa<martin.jansa@gmail.com>
>>>>>
>>>>> * with git-native and rm_work enabled I've noticed git fetcher errors=
 like:
>>>>> =C2=A0 warning: templates not found /OE/shr-core/tmp/work/x86_64-linu=
x/git-native-1.7.3.4-r0/image/OE/shr-core/tmp/sysroots/x86_64-linux/usr/sha=
re/git-core/templates
>>>>> =C2=A0 fatal: Unable to find remote helper for 'http'
>>>>> =C2=A0 for every recipe using http:// for git repo
>>>>> * after this change template_dir points to
>>>>> =C2=A0 /OE/shr-core/tmp/sysroots/x86_64-linux/usr/share/git-core/temp=
lates
>>>>> =C2=A0 without that workdir prefix
>>>>> * haven't tested target recipe, but I guess it needs different fix or
>>>>> =C2=A0 maybe it worked before and gets broken by this change (that's =
why this
>>>>> =C2=A0 is just RFC)
>>>>>
>>>> Is this still just an RFC or has it been tested on the target?
>>>
>>> On the target I get:
>>>
>>> strace -o /tmp/log git clone http://git.pingu.fi/xf86-video-omapfb
>>> Cloning into xf86-video-omapfb...
>>> fatal: Unable to find remote helper for 'http'
>>> root@beagleboard-core:~#
>>>
>>> It does find the templates:
>>>
>>> open("/usr/share/git-core/templates/", O_RDONLY|O_NONBLOCK|O_LARGEFILE|=
O_DIRECTORY|O_CLOEXEC) =3D 3
>>> open("/usr/share/git-core/templates/config", O_RDONLY|O_LARGEFILE) =3D =
-1 ENOENT (No such file or directory)
>>> lstat64("/usr/share/git-core/templates/branches", {st_mode=3DS_IFDIR|07=
55, st_size=3D4096, ...}) =3D 0
>>> open("/usr/share/git-core/templates/branches", O_RDONLY|O_NONBLOCK|O_LA=
RGEFILE|O_DIRECTORY|O_CLOEXEC) =3D 4
>>> lstat64("/usr/share/git-core/templates/description", {st_mode=3DS_IFREG=
|0644, st_size=3D73, ...}) =3D 0
>>> open("/usr/share/git-core/templates/description", O_RDONLY|O_LARGEFILE)=
 =3D 4
>>> lstat64("/usr/share/git-core/templates/hooks", {st_mode=3DS_IFDIR|0755,=
 st_size=3D4096, ...}) =3D 0
>>> open("/usr/share/git-core/templates/hooks", O_RDONLY|O_NONBLOCK|O_LARGE=
FILE|O_DIRECTORY|O_CLOEXEC) =3D 4
>>> lstat64("/usr/share/git-core/templates/hooks/applypatch-msg.sample", {s=
t_mode=3DS_IFREG|0755, st_size=3D452, ...}) =3D 0
>>> open("/usr/share/git-core/templates/hooks/applypatch-msg.sample", O_RDO=
NLY|O_LARGEFILE) =3D 6
>>> lstat64("/usr/share/git-core/templates/hooks/post-receive.sample", {st_=
mode=3DS_IFREG|0755, st_size=3D552, ...}) =3D 0
>>> open("/usr/share/git-core/templates/hooks/post-receive.sample", O_RDONL=
Y|O_LARGEFILE) =3D 6
>>> lstat64("/usr/share/git-core/templates/hooks/post-commit.sample", {st_m=
ode=3DS_IFREG|0755, st_size=3D160, ...}) =3D 0
>>> open("/usr/share/git-core/templates/hooks/post-commit.sample", O_RDONLY=
|O_LARGEFILE) =3D 6
>>> lstat64("/usr/share/git-core/templates/hooks/update.sample", {st_mode=
=3DS_IFREG|0755, st_size=3D3611, ...}) =3D 0
>>> open("/usr/share/git-core/templates/hooks/update.sample", O_RDONLY|O_LA=
RGEFILE) =3D 6
>>> lstat64("/usr/share/git-core/templates/hooks/pre-applypatch.sample", {s=
t_mode=3DS_IFREG|0755, st_size=3D398, ...}) =3D 0
>>> open("/usr/share/git-core/templates/hooks/pre-applypatch.sample", O_RDO=
NLY|O_LARGEFILE) =3D 6
>>> lstat64("/usr/share/git-core/templates/hooks/commit-msg.sample", {st_mo=
de=3DS_IFREG|0755, st_size=3D896, ...}) =3D 0
>>> open("/usr/share/git-core/templates/hooks/commit-msg.sample", O_RDONLY|=
O_LARGEFILE) =3D 6
>>> lstat64("/usr/share/git-core/templates/hooks/post-update.sample", {st_m=
ode=3DS_IFREG|0755, st_size=3D189, ...}) =3D 0
>>> open("/usr/share/git-core/templates/hooks/post-update.sample", O_RDONLY=
|O_LARGEFILE) =3D 6
>>> lstat64("/usr/share/git-core/templates/hooks/pre-commit.sample", {st_mo=
de=3DS_IFREG|0755, st_size=3D1578, ...}) =3D 0
>>> open("/usr/share/git-core/templates/hooks/pre-commit.sample", O_RDONLY|=
O_LARGEFILE) =3D 6
>>> lstat64("/usr/share/git-core/templates/hooks/prepare-commit-msg.sample"=
, {st_mode=3DS_IFREG|0755, st_size=3D1359, ...}) =3D 0
>>> open("/usr/share/git-core/templates/hooks/prepare-commit-msg.sample", O=
_RDONLY|O_LARGEFILE) =3D 6
>>> lstat64("/usr/share/git-core/templates/hooks/pre-rebase.sample", {st_mo=
de=3DS_IFREG|0755, st_size=3D5011, ...}) =3D 0
>>> open("/usr/share/git-core/templates/hooks/pre-rebase.sample", O_RDONLY|=
O_LARGEFILE) =3D 6
>>> lstat64("/usr/share/git-core/templates/info", {st_mode=3DS_IFDIR|0755, =
st_size=3D4096, ...}) =3D 0
>>> open("/usr/share/git-core/templates/info", O_RDONLY|O_NONBLOCK|O_LARGEF=
ILE|O_DIRECTORY|O_CLOEXEC) =3D 4
>>> lstat64("/usr/share/git-core/templates/info/exclude", {st_mode=3DS_IFRE=
G|0644, st_size=3D240, ...}) =3D 0
>>> open("/usr/share/git-core/templates/info/exclude", O_RDONLY|O_LARGEFILE=
) =3D 6
>>>
>>> But that didn't work before since /usr/libexec/git-core isn't getting p=
ackaged.
>>>
>>> And I noticed this:
>>>
>>> koen@dominion:/OE/tentacle/sources/openembedded-core$ git grep gitexecd=
ir
>>> meta/recipes-devtools/git/git.inc: =C2=A0 =C2=A0 =C2=A0oe_runmake insta=
ll DESTDIR=3D"${D}" bindir=3D${bindir} gitexecdir=3D${gitexecdir} \
>>> koen@dominion:/OE/tentacle/sources/openembedded-core$
>>>
>>> 'gitexecdir' is undefined :(
>>>
>>
>> yeah and git/makefile defines it
>> gitexecdir =3D libexec/git-core
>>
>> may be we could set it to ${libdir}/git-core ?
>
> Nah, tools belong in libexec. Any objections to this or the followup patc=
h?
>

saw that patch later seems good to me.
> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


