Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8C7CD343F
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 11:00:07 +0000 (UTC)
Subject: Re: [PATCH] useradd: Switch from --root to --prefix option
To: openembedded-core@lists.openembedded.org
From: "Jeevan" <j-sahu@ti.com>
X-Originating-Location: IN (103.146.116.9)
X-Originating-Platform: Linux Firefox 148
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 07 May 2026 04:00:02 -0700
References: <18A6D73A494B779A.1570320@lists.openembedded.org> <a22f7cad3e614532f051d01001cbd2f76e684a84.camel@linuxfoundation.org>
In-Reply-To: <a22f7cad3e614532f051d01001cbd2f76e684a84.camel@linuxfoundation.org>
Message-ID: <1459546.1778151602472771602@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="VhmMAosazXK8MBlOgebg"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 11:00:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236575

--VhmMAosazXK8MBlOgebg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 11:46 AM, Richard Purdie wrote:

>=20
> On Thu, 2026-04-16 at 13:49 +0100, Richard Purdie via
> lists.openembedded.org wrote:
>=20
>> Whilst assessing where we use chroot (which requires superuser
>> privileges),
>> I realised that shadow's utilities we use have the option of specifing
>> a prefix for files. This provides the same outcome but avoids the chroot
>> call. Whist we can emulate that under pseudo, it is probably nicer to
>> avoid
>> doing that and use the prefix option instead.
>>=20
>> Therefore switch --root -> --prefix
>>=20
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>> meta/classes/useradd.bbclass | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
>> index 9d857a4555d..d7ed6cb9315 100644
>> --- a/meta/classes/useradd.bbclass
>> +++ b/meta/classes/useradd.bbclass
>> @@ -26,7 +26,7 @@ SYSROOT=3D""
>> if test "x$D" !=3D "x"; then
>> # Installing into a sysroot
>> SYSROOT=3D"$D"
>> - OPT=3D"--root $D"
>> + OPT=3D"--prefix $D"
>>=20
>> # Make sure login.defs is there, this is to make debian package backend
>> work
>> # correctly while doing rootfs.
>> @@ -37,7 +37,7 @@ if test "x$D" !=3D "x"; then
>> cp $D${sysconfdir}/login.defs.dpkg-new $D${sysconfdir}/login.defs
>> fi
>>=20
>> - # user/group lookups should match useradd/groupadd --root
>> + # user/group lookups should match useradd/groupadd --prefix
>> export PSEUDO_PASSWD=3D"$SYSROOT"
>> fi
>=20
> Without the chroot, it is finding /sbin/pam_tally2 on the host and callin=
g
> it:
>=20
> ERROR: core-image-sato-sdk-1.0-r0 do_rootfs: [log_check]
> core-image-sato-sdk: found 6 error messages in the logfile:
> [log_check]
> b'/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-l=
inux/core-image-sato-sdk/1.0/recipe-sysroot-native/usr/sbin/useradd\n/srv/p=
okybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-linux/core-=
image-sato-sdk/1.0/recipe-sysroot-native/usr/sbin/useradd\nRunning
> useradd commands...\nNOTE: ptest-runner: Performing useradd with [--prefi=
x
> /srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-lin=
ux/core-image-sato-sdk/1.0/recipe-sysroot
> --system --no-create-home --home / --user-group ptest]\npam_tally2: Error
> opening /var/log/tallylog for update: Permission denied\npam_tally2:
> Authentication error\nuseradd: failed to reset the tallylog entry of user
> "ptest"\n/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86=
-poky-linux/core-image-sato-sdk/1.0/recipe-sysroot-native/usr/sbin/useradd\=
n'
>=20
> [log_check] pam_tally2: Error opening /var/log/tallylog for update:
> Permission denied
> [log_check] pam_tally2: Error opening /var/log/tallylog for update:
> Permission denied
> [log_check] pam_tally2: Error opening /var/log/tallylog for update:
> Permission denied
> [log_check] pam_tally2: Error opening /var/log/tallylog for update:
> Permission denied
> [log_check] pam_tally2: Error opening /var/log/tallylog for update:
> Permission denied
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/3587
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/3607
>=20
> This is likely an issue even within the chroot if the binary were
> present but of the wrong arch so we'll need to fix this regardless.
>=20
> The call is from useradd.c:tallylog_reset() in shadow-native.
>=20
> Cheers,
>=20
> Richard

On Fri, Apr 17, 2026 at 11:46 AM, Richard Purdie wrote:

>=20
> On Thu, 2026-04-16 at 13:49 +0100, Richard Purdie via
> lists.openembedded.org wrote:
>=20
>> Whilst assessing where we use chroot (which requires superuser
>> privileges),
>> I realised that shadow's utilities we use have the option of specifing
>> a prefix for files. This provides the same outcome but avoids the chroot
>> call. Whist we can emulate that under pseudo, it is probably nicer to
>> avoid
>> doing that and use the prefix option instead.
>>=20
>> Therefore switch --root -> --prefix
>>=20
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>> meta/classes/useradd.bbclass | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
>> index 9d857a4555d..d7ed6cb9315 100644
>> --- a/meta/classes/useradd.bbclass
>> +++ b/meta/classes/useradd.bbclass
>> @@ -26,7 +26,7 @@ SYSROOT=3D""
>> if test "x$D" !=3D "x"; then
>> # Installing into a sysroot
>> SYSROOT=3D"$D"
>> - OPT=3D"--root $D"
>> + OPT=3D"--prefix $D"
>>=20
>> # Make sure login.defs is there, this is to make debian package backend
>> work
>> # correctly while doing rootfs.
>> @@ -37,7 +37,7 @@ if test "x$D" !=3D "x"; then
>> cp $D${sysconfdir}/login.defs.dpkg-new $D${sysconfdir}/login.defs
>> fi
>>=20
>> - # user/group lookups should match useradd/groupadd --root
>> + # user/group lookups should match useradd/groupadd --prefix
>> export PSEUDO_PASSWD=3D"$SYSROOT"
>> fi
>=20
> Without the chroot, it is finding /sbin/pam_tally2 on the host and callin=
g
> it:
>=20
> ERROR: core-image-sato-sdk-1.0-r0 do_rootfs: [log_check]
> core-image-sato-sdk: found 6 error messages in the logfile:
> [log_check]
> b'/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-l=
inux/core-image-sato-sdk/1.0/recipe-sysroot-native/usr/sbin/useradd\n/srv/p=
okybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-linux/core-=
image-sato-sdk/1.0/recipe-sysroot-native/usr/sbin/useradd\nRunning
> useradd commands...\nNOTE: ptest-runner: Performing useradd with [--prefi=
x
> /srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-lin=
ux/core-image-sato-sdk/1.0/recipe-sysroot
> --system --no-create-home --home / --user-group ptest]\npam_tally2: Error
> opening /var/log/tallylog for update: Permission denied\npam_tally2:
> Authentication error\nuseradd: failed to reset the tallylog entry of user
> "ptest"\n/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86=
-poky-linux/core-image-sato-sdk/1.0/recipe-sysroot-native/usr/sbin/useradd\=
n'
>=20
> [log_check] pam_tally2: Error opening /var/log/tallylog for update:
> Permission denied
> [log_check] pam_tally2: Error opening /var/log/tallylog for update:
> Permission denied
> [log_check] pam_tally2: Error opening /var/log/tallylog for update:
> Permission denied
> [log_check] pam_tally2: Error opening /var/log/tallylog for update:
> Permission denied
> [log_check] pam_tally2: Error opening /var/log/tallylog for update:
> Permission denied
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/3587
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/3607
>=20
> This is likely an issue even within the chroot if the binary were
> present but of the wrong arch so we'll need to fix this regardless.
>=20
> The call is from useradd.c:tallylog_reset() in shadow-native.
>=20
> Cheers,
>=20
> Richard

groupmems in shadow does not support --prefix (unlike useradd, groupadd, an=
d usermod
which all gained --prefix support). Only -R/--root is recognized. So switch=
ing the global OPT
to --prefix breaks any recipe using GROUPMEMS_PARAM=C2=A0with "unrecognized=
 option" at
do_prepare_recipe_sysroot,=C2=A0even though the same switch works fine for =
the other shadow utilities.

- Jeevan.

--VhmMAosazXK8MBlOgebg
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Fri, Apr 17, 2026 at 11:46 AM, Richard Purdie wrote:</div>
<div>
<blockquote>On Thu, 2026-04-16 at 13:49 +0100, Richard Purdie via lists.ope=
nembedded.org wrote:<br />
<blockquote>Whilst assessing where we use chroot (which requires superuser =
privileges),<br />I realised that shadow's utilities we use have the option=
 of specifing<br />a prefix for files. This provides the same outcome but a=
voids the chroot<br />call. Whist we can emulate that under pseudo, it is p=
robably nicer to avoid<br />doing that and use the prefix option instead.<b=
r /><br />Therefore switch --root -&gt; --prefix<br /><br />Signed-off-by: =
Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;<br />---<br />&nb=
sp;meta/classes/useradd.bbclass | 4 ++--<br />&nbsp;1 file changed, 2 inser=
tions(+), 2 deletions(-)<br /><br />diff --git a/meta/classes/useradd.bbcla=
ss b/meta/classes/useradd.bbclass<br />index 9d857a4555d..d7ed6cb9315 10064=
4<br />--- a/meta/classes/useradd.bbclass<br />+++ b/meta/classes/useradd.b=
bclass<br />@@ -26,7 +26,7 @@ SYSROOT=3D""<br />&nbsp;if test "x$D" !=3D "x=
"; then<br />&nbsp; # Installing into a sysroot<br />&nbsp; SYSROOT=3D"$D"<=
br />- OPT=3D"--root $D"<br />+ OPT=3D"--prefix $D"<br />&nbsp;<br />&nbsp;=
 # Make sure login.defs is there, this is to make debian package backend wo=
rk<br />&nbsp; # correctly while doing rootfs.<br />@@ -37,7 +37,7 @@ if te=
st "x$D" !=3D "x"; then<br />&nbsp; &nbsp;&nbsp;&nbsp; cp $D${sysconfdir}/l=
ogin.defs.dpkg-new $D${sysconfdir}/login.defs<br />&nbsp; fi<br />&nbsp;<br=
 />- # user/group lookups should match useradd/groupadd --root<br />+ # use=
r/group lookups should match useradd/groupadd --prefix<br />&nbsp; export P=
SEUDO_PASSWD=3D"$SYSROOT"<br />&nbsp;fi</blockquote>
Without the chroot, it is finding /sbin/pam_tally2 on the host and calling =
it:<br /><br />ERROR: core-image-sato-sdk-1.0-r0 do_rootfs: [log_check] cor=
e-image-sato-sdk: found 6 error messages in the logfile:<br />[log_check] b=
'/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-linu=
x/core-image-sato-sdk/1.0/recipe-sysroot-native/usr/sbin/useradd\n/srv/poky=
build/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-linux/core-ima=
ge-sato-sdk/1.0/recipe-sysroot-native/usr/sbin/useradd\nRunning useradd com=
mands...\nNOTE: ptest-runner: Performing useradd with [--prefix /srv/pokybu=
ild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-linux/core-image=
-sato-sdk/1.0/recipe-sysroot --system --no-create-home --home / --user-grou=
p ptest]\npam_tally2: Error opening /var/log/tallylog for update: Permissio=
n denied\npam_tally2: Authentication error\nuseradd: failed to reset the ta=
llylog entry of user "ptest"\n/srv/pokybuild/yocto-worker/qemux86/build/bui=
ld/tmp/work/qemux86-poky-linux/core-image-sato-sdk/1.0/recipe-sysroot-nativ=
e/usr/sbin/useradd\n'<br />[log_check] pam_tally2: Error opening /var/log/t=
allylog for update: Permission denied<br />[log_check] pam_tally2: Error op=
ening /var/log/tallylog for update: Permission denied<br />[log_check] pam_=
tally2: Error opening /var/log/tallylog for update: Permission denied<br />=
[log_check] pam_tally2: Error opening /var/log/tallylog for update: Permiss=
ion denied<br />[log_check] pam_tally2: Error opening /var/log/tallylog for=
 update: Permission denied<br /><br /><a href=3D"https://autobuilder.yoctop=
roject.org/valkyrie/#/builders/30/builds/3587" target=3D"_blank" rel=3D"noo=
pener">https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/3=
587</a><br /><a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/bui=
lders/36/builds/3607" target=3D"_blank" rel=3D"noopener">https://autobuilde=
r.yoctoproject.org/valkyrie/#/builders/36/builds/3607</a><br /><br />This i=
s likely an issue even within the chroot if the binary were<br />present bu=
t of the wrong arch so we'll need to fix this regardless.<br /><br />The ca=
ll is from useradd.c:tallylog_reset() in shadow-native.<br /><br />Cheers,<=
br /><br />Richard</blockquote>
</div>
<div>On Fri, Apr 17, 2026 at 11:46 AM, Richard Purdie wrote:</div>
<div>
<blockquote>On Thu, 2026-04-16 at 13:49 +0100, Richard Purdie via lists.ope=
nembedded.org wrote:<br />
<blockquote>Whilst assessing where we use chroot (which requires superuser =
privileges),<br />I realised that shadow's utilities we use have the option=
 of specifing<br />a prefix for files. This provides the same outcome but a=
voids the chroot<br />call. Whist we can emulate that under pseudo, it is p=
robably nicer to avoid<br />doing that and use the prefix option instead.<b=
r /><br />Therefore switch --root -&gt; --prefix<br /><br />Signed-off-by: =
Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;<br />---<br />&nb=
sp;meta/classes/useradd.bbclass | 4 ++--<br />&nbsp;1 file changed, 2 inser=
tions(+), 2 deletions(-)<br /><br />diff --git a/meta/classes/useradd.bbcla=
ss b/meta/classes/useradd.bbclass<br />index 9d857a4555d..d7ed6cb9315 10064=
4<br />--- a/meta/classes/useradd.bbclass<br />+++ b/meta/classes/useradd.b=
bclass<br />@@ -26,7 +26,7 @@ SYSROOT=3D""<br />&nbsp;if test "x$D" !=3D "x=
"; then<br />&nbsp; # Installing into a sysroot<br />&nbsp; SYSROOT=3D"$D"<=
br />- OPT=3D"--root $D"<br />+ OPT=3D"--prefix $D"<br />&nbsp;<br />&nbsp;=
 # Make sure login.defs is there, this is to make debian package backend wo=
rk<br />&nbsp; # correctly while doing rootfs.<br />@@ -37,7 +37,7 @@ if te=
st "x$D" !=3D "x"; then<br />&nbsp; &nbsp;&nbsp;&nbsp; cp $D${sysconfdir}/l=
ogin.defs.dpkg-new $D${sysconfdir}/login.defs<br />&nbsp; fi<br />&nbsp;<br=
 />- # user/group lookups should match useradd/groupadd --root<br />+ # use=
r/group lookups should match useradd/groupadd --prefix<br />&nbsp; export P=
SEUDO_PASSWD=3D"$SYSROOT"<br />&nbsp;fi</blockquote>
Without the chroot, it is finding /sbin/pam_tally2 on the host and calling =
it:<br /><br />ERROR: core-image-sato-sdk-1.0-r0 do_rootfs: [log_check] cor=
e-image-sato-sdk: found 6 error messages in the logfile:<br />[log_check] b=
'/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-linu=
x/core-image-sato-sdk/1.0/recipe-sysroot-native/usr/sbin/useradd\n/srv/poky=
build/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-linux/core-ima=
ge-sato-sdk/1.0/recipe-sysroot-native/usr/sbin/useradd\nRunning useradd com=
mands...\nNOTE: ptest-runner: Performing useradd with [--prefix /srv/pokybu=
ild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-linux/core-image=
-sato-sdk/1.0/recipe-sysroot --system --no-create-home --home / --user-grou=
p ptest]\npam_tally2: Error opening /var/log/tallylog for update: Permissio=
n denied\npam_tally2: Authentication error\nuseradd: failed to reset the ta=
llylog entry of user "ptest"\n/srv/pokybuild/yocto-worker/qemux86/build/bui=
ld/tmp/work/qemux86-poky-linux/core-image-sato-sdk/1.0/recipe-sysroot-nativ=
e/usr/sbin/useradd\n'<br />[log_check] pam_tally2: Error opening /var/log/t=
allylog for update: Permission denied<br />[log_check] pam_tally2: Error op=
ening /var/log/tallylog for update: Permission denied<br />[log_check] pam_=
tally2: Error opening /var/log/tallylog for update: Permission denied<br />=
[log_check] pam_tally2: Error opening /var/log/tallylog for update: Permiss=
ion denied<br />[log_check] pam_tally2: Error opening /var/log/tallylog for=
 update: Permission denied<br /><br /><a href=3D"https://autobuilder.yoctop=
roject.org/valkyrie/#/builders/30/builds/3587" target=3D"_blank" rel=3D"noo=
pener">https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/3=
587</a><br /><a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/bui=
lders/36/builds/3607" target=3D"_blank" rel=3D"noopener">https://autobuilde=
r.yoctoproject.org/valkyrie/#/builders/36/builds/3607</a><br /><br />This i=
s likely an issue even within the chroot if the binary were<br />present bu=
t of the wrong arch so we'll need to fix this regardless.<br /><br />The ca=
ll is from useradd.c:tallylog_reset() in shadow-native.<br /><br />Cheers,<=
br /><br />Richard</blockquote>
</div>
<div>groupmems in shadow does not support --prefix (unlike useradd, groupad=
d, and usermod</div>
<div>which all gained --prefix support). Only -R/--root is recognized. So s=
witching the global OPT</div>
<div>to --prefix breaks any recipe using GROUPMEMS_PARAM&nbsp;with "unrecog=
nized option" at</div>
<div>do_prepare_recipe_sysroot,&nbsp;even though the same switch works fine=
 for the other shadow utilities.</div>
<div>&nbsp;</div>
<div>- Jeevan.</div>
<div>&nbsp;</div>

--VhmMAosazXK8MBlOgebg--

