Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 603D26A9C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 18:54:56 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id r10so786395lbi.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 11:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=E2fUAZL/I6/aHLzKBp2wPPz4eSj3E2NQQ4Y/zr2WorY=;
	b=JEBVBvW80nvYAEjFA33xIGge18Vy6Kl36G19gSP4djPzH2ETef0Gbbd2JLv6JcwoIC
	Rv4YCKWKfygvCEEByZqw1UZh7OvgcSt/PuRfl20DbpcEasNhKmaxiftuEGBzgqU3nylx
	7NOXNnZPRt6toyrrRTDzakqOYoNg7ahxUe785mzokJ/rvvHyOTooT1FmBodcHWRqrlpB
	PsOggyWnslJt+NJfHH7ZuoXmGNod5B4DaBPpUCufIStjlBGspHj8UtEOGBQ2gBpz8V5p
	cg9f532kXUG0+6JRJ//8kLSTJKxU0KBXSBRvMxX9atLl3hfWP2R2wVZGzovGpbmhn8HC
	RXoQ==
X-Received: by 10.112.143.162 with SMTP id sf2mr16438973lbb.1.1374692096343;
	Wed, 24 Jul 2013 11:54:56 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.17.67 with HTTP; Wed, 24 Jul 2013 11:54:36 -0700 (PDT)
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 24 Jul 2013 11:54:36 -0700
X-Google-Sender-Auth: ni1CVAItrWKOmRBrU--p3fEQ_tY
Message-ID: <CABcZANmOQBbYKAk145vSMZn2ag1Us=ySmjq_sECCrscQCqk+dg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: RFC: meta-ro-rootfs approach and volatiles vs tmpfiles.d
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
X-List-Received-Date: Wed, 24 Jul 2013 18:54:57 -0000
Content-Type: multipart/alternative; boundary=089e011830381405bb04e2467201

--089e011830381405bb04e2467201
Content-Type: text/plain; charset=UTF-8

Greetings all,

I've recently been doing some work at Mentor Graphics on read-only-rootfs,
for our purposes, and have done some things which I think may be of use.
I'm looking for comments/thoughts on the approach and potential use of a
pattern generally, and also wish to discuss the volatiles vs tmp files.d
situation.

I have recently created a `meta-ro-rootfs` layer to hold work in this
direction which is not yet in or-core. As is fairly usual, it's a staging
area between us and upstream, not a place for anything to live permanently.
What follows is a summation of the work done there thus far:

- Created a 'systemd-tmpfiles' recipe for non-systemd builds, and also for
native

  - Patched in --sysroot= support for systemd-tmpfiles, to facilitate
running it up front against the filesystem at do_rootfs time the way
read_only_rootfs_hook does with populate-volatiles

  - Added an 'update-tmpfiles' script, which iterates over all files in
/etc/default/volatiles/, converting them to tmpfiles.d config files,
writing them into /usr/lib/tmpfiles.d/, and removing the volatile config
files

  - Reduced the dependencies, via patches and EXTRA_OECONF, as much as
seemed to be viable

- Split out 'systemd-tmpfiles' from 'systemd' package in the main systemd
recipe, equivalent to the standalone one, for builds with `systemd` in
DISTRO_FEATURES

- Created a 'read-only-rootfs-systemd' bbclass, which appends the bits to
run both update-tmpfiles and systemd-tmpfiles against the filesystem at
do_rootfs time for systemd distros. This will need to be altered to not
remove the volatiles config files for non-systemd *images*. I realize there
are many use cases to consider in the sysvinit vs systemd realm, and I
haven't verified that all are satisfied just yet, as systemd is our current
priority for r/o rootfs.

- Added a COMPLEMENTARY_GLOBS config (in the layer.conf for now, though I
may move it into the bbclass) which adds `pkg-volatile` for each `pkg` to
the rootfs if read-only-rootfs is enabled.

- Implemented a prototype configuration for dbus which uses this to support
read-only-rootfs. In the main package, we install a dbus.conf into
/usr/lib/tmpfiles.d/ which ensures /var/lib/dbus exists for the non-r/o
case, without including the path in the package (as including paths within
volatile paths in a binary package will break things). In the dbus-volatile
package, I install a different dbus.conf to /etc/tmpfiles.d/, which
overrides the one in /usr/lib/tmpfiles.d/ (yes, update-alternatives would
have been an option too, and has a certain amount of merit, as
/etc/tmpfiles.d/ is supposed to be reserved for use by the administrator),
and this config ensures that /var/volatile/lib/dbus is created and that
/var/lib/dbus is a symlink which points to it.

I have confirmed that I can create a systemd image with read-only-rootfs
and read-only-rootfs-systemd inherited, and dbus is able to write to the
volatile /var/lib/dbus/ path.

I think this is a step in the right direction, though clearly more needs to
be worked out, but this pattern of using override volatile/tmpfiles
configurations with an additional complementary package should let us
cleanly share binary packages between r/o and non-r/o images.

Now, regarding tmpfiles.d vs volatiles. This is a rather unpleasant
situation currently, as for a recipe to cleanly support both sysvinit and
systemd images, it needs not only both sysv init script and systemd
services (though admittedly the latter is optional with sysv compat), it
also needs to provide both a volatiles config and a tmpfiles.d config if it
needs volatile paths.

The standalone systemd-tmpfiles recipe I've created has a fairly small set
of dependencies: intltool-native, dbus, libcap. Given this, I'd like to
propose transitioning away from populate-volatiles to systemd-tmpfiles,
even for non-systemd images. I think that the update-tmpfiles shell script
may be of use in a transition, but before we even begin discussing a
transition path, I'd like to request comments on the notion of moving to it
at all. Thoughts? Objections?

Thanks,
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e011830381405bb04e2467201
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style>Greetings all,</div><div style><br></div><div s=
tyle>I&#39;ve recently been doing some work at Mentor Graphics on read-only=
-rootfs, for our purposes, and have done some things which I think may be o=
f use. I&#39;m looking for comments/thoughts on the approach and potential =
use of a pattern generally, and also wish to discuss the volatiles vs tmp f=
iles.d situation.</div>

<div style><br></div><div style>I have recently created a `meta-ro-rootfs` =
layer to hold work in this direction which is not yet in or-core. As is fai=
rly usual, it&#39;s a staging area between us and upstream, not a place for=
 anything to live permanently. What follows is a summation of the work done=
 there thus far:</div>

<div style><br></div><div style>- Created a &#39;systemd-tmpfiles&#39; reci=
pe for non-systemd builds, and also for native<br></div><div style><br></di=
v><div style>=C2=A0 - Patched in --sysroot=3D support for systemd-tmpfiles,=
 to facilitate running it up front against the filesystem at do_rootfs time=
 the way read_only_rootfs_hook does with populate-volatiles</div>

<div style><br></div><div style>=C2=A0 - Added an &#39;update-tmpfiles&#39;=
 script, which iterates over all files in /etc/default/volatiles/, converti=
ng them to tmpfiles.d config files, writing them into /usr/lib/tmpfiles.d/,=
 and removing the volatile config files</div>

<div style><br></div><div style>=C2=A0 - Reduced the dependencies, via patc=
hes and EXTRA_OECONF, as much as seemed to be viable</div><div style><br></=
div><div style><div>- Split out &#39;systemd-tmpfiles&#39; from &#39;system=
d&#39; package in the main systemd recipe, equivalent to the standalone one=
, for builds with `systemd` in DISTRO_FEATURES</div>

<div><br></div><div style>- Created a &#39;read-only-rootfs-systemd&#39; bb=
class, which appends the bits to run both update-tmpfiles and systemd-tmpfi=
les against the filesystem at do_rootfs time for systemd distros. This will=
 need to be altered to not remove the volatiles config files for non-system=
d *images*. I realize there are many use cases to consider in the sysvinit =
vs systemd realm, and I haven&#39;t verified that all are satisfied just ye=
t, as systemd is our current priority for r/o rootfs.</div>

<div style><br></div><div style>- Added a COMPLEMENTARY_GLOBS config (in th=
e layer.conf for now, though I may move it into the bbclass) which adds `pk=
g-volatile` for each `pkg` to the rootfs if read-only-rootfs is enabled.</d=
iv>

<div style><br></div><div style>- Implemented a prototype configuration for=
 dbus which uses this to support read-only-rootfs. In the main package, we =
install a dbus.conf into /usr/lib/tmpfiles.d/ which ensures /var/lib/dbus e=
xists for the non-r/o case, without including the path in the package (as i=
ncluding paths within volatile paths in a binary package will break things)=
. In the dbus-volatile package, I install a different dbus.conf to /etc/tmp=
files.d/, which overrides the one in /usr/lib/tmpfiles.d/ (yes, update-alte=
rnatives would have been an option too, and has a certain amount of merit, =
as /etc/tmpfiles.d/ is supposed to be reserved for use by the administrator=
), and this config ensures that /var/volatile/lib/dbus is created and that =
/var/lib/dbus is a symlink which points to it.</div>

<div style><br></div><div style>I have confirmed that I can create a system=
d image with read-only-rootfs and read-only-rootfs-systemd inherited, and d=
bus is able to write to the volatile /var/lib/dbus/ path.</div><div style>

<br></div><div style>I think this is a step in the right direction, though =
clearly more needs to be worked out, but this pattern of using override vol=
atile/tmpfiles configurations with an additional complementary package shou=
ld let us cleanly share binary packages between r/o and non-r/o images.</di=
v>

<div style><br></div><div style>Now, regarding tmpfiles.d vs volatiles. Thi=
s is a rather unpleasant situation currently, as for a recipe to cleanly su=
pport both sysvinit and systemd images, it needs not only both sysv init sc=
ript and systemd services (though admittedly the latter is optional with sy=
sv compat), it also needs to provide both a volatiles config and a tmpfiles=
.d config if it needs volatile paths.</div>

<div style><br></div><div style>The standalone systemd-tmpfiles recipe I&#3=
9;ve created has a fairly small set of dependencies: intltool-native, dbus,=
 libcap. Given this, I&#39;d like to propose transitioning away from popula=
te-volatiles to systemd-tmpfiles, even for non-systemd images. I think that=
 the update-tmpfiles shell script may be of use in a transition, but before=
 we even begin discussing a transition path, I&#39;d like to request commen=
ts on the notion of moving to it at all. Thoughts? Objections?</div>

<div style><br></div><div style>Thanks,</div></div>-- <br>Christopher Larso=
n<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZau=
rus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div>

--089e011830381405bb04e2467201--
