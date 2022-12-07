Return-Path: <jin@mediatomb.cc>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C3BC3A5A7
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 00:21:16 +0000 (UTC)
Received: from mail1.xn--80adja5bqm.su (mail1.xn--80adja5bqm.su [198.44.140.76])
 by mx.groups.io with SMTP id smtpd.web10.2576.1670372467431752225
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Dec 2022 16:21:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mail1.xn--80adja5bqm.su, ip: 198.44.140.76, mailfrom: jin@mail1.xn--80adja5bqm.su)
Received: by mail1.xn--80adja5bqm.su (Postfix, from userid 1000)
	id 0F50140050C9; Wed,  7 Dec 2022 00:20:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail1.xn--80adja5bqm.su 0F50140050C9
Date: Wed, 7 Dec 2022 00:20:40 +0000
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org,
	Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 01/13] cargo-update-recipe-crates.bbclass: add
 a class to generate SRC_URI crate lists from Cargo.lock
Message-Id: <20221207002040.GB1080@xn--80adja5bqm.su>
References: <20221031114719.2725967-1-alex@linutronix.de>
 <167d8dfa-fe50-24ff-d2d2-249df3445ae8@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <167d8dfa-fe50-24ff-d2d2-249df3445ae8@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 00:21:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174338

Hi everyone,

I promised Randy to post my experience with Yocto and Rust, which was a
first time attempt for me. Note, that when starting I had no knowledge ab=
out=20
Rust whatsoever, so this is "clean start" observation.

On Tue, Dec 06, 2022 at 06:04:18PM -0500, Randy MacLeod wrote:
> On 2022-10-31 07:47, Alexander Kanavin wrote:
> >For better or worse, more and more rust components are appearing that =
do
> >not include their dependencies in tarballs (or git trees), and rely on=
 cargo
> >to fetch them. On the other hand, bitbake does not use cargo (and quit=
e possible
> >won't ever be able to), and relies on having each item explicitly list=
ed in SRC_URI
> >with a crate:// prefix. This however creates a problem of both making =
such lists in
> >the first place and updating them when a recipe is updated to a newer =
version.
> >
> >So this class can be used to perform such updates by implementing a ta=
sk that does it;
> >the next commit shows the outcome for python3-bcrypt (which has been t=
ested to work
> >and produce a successful build).
> >
> >Note: the python script relies on tomllib library, which appears in Py=
thon 3.11 and
> >does not exist in earlier versions - I've tested this by first updatin=
g python to 3.11-rc2
> >in oe-core.
>=20
>=20
> Thanks Alex, that's a nice approach.
>=20
> I'm reply to the thread since Jin had some trouble getting started
> with this class. This pushed me to finally try it and I have some minor
> comments and suggestions.

my first issue was to actually find out how to approach this, it seems
most google hits point to meta-rust which has been around for a longer pe=
riod
and I was lucky to get some hints in #oe on IRC, where Randy pointed me t=
o=20
cargo-update-recipe-crates.bbclass which is already in Poky.

The comment in the header about running bitbake -c update_crates recipe-n=
ame
allowed me to generate the .inc file, but it was not immediately clear to=
 me
what I should do next.

The pointer to python3-bcrypt_*.bb was a bit confusing in the sense, that
from the rust perspective it only inherits cargo-update-recipe-crates,
but trying to build my package after having genrated the SRC_URI entries =
did
not produce any build output, I ended up with an empty -dev and an empty =
-dbg=20
ipk.

By looking at the available classes I figured that I should probably also
inherit cargo, which indeed started to compile the application I needed t=
o
package.

Next, I ran into some build issues for packages which I guess the applica=
tion
was depending upon. I got an error:

error: failed to run custom build command for `libudev-sys v0.1.4`

which luckily had enough google hits to understand that it expects
a DEPENDS =3D "eudev"

It however still failed after that and it took me some time to realize
that I should also inherit pkgconfig, which finally did the trick.

I copied the working recipe back to Kirkstone and was happy to see, that =
it
builds there as well.

So overall, given that I had zero Rust knowledge, it wasn't a bad
experience, Yocto took care of most things for me.

> First, it works for me for adding ripgrep (1) and for Jin for
> something he was
> working on. It wasn't a perfect experience for me since at first, I
> had omitted:
>=20
> S =3D "${WORKDIR}/git"
>=20
> and
> $ bitbake -c update_crates=A0 ripgrep
>=20
> would fail silently with nothing useful in the log.do_update_crates fil=
e.
>=20
> I'll likely send a patch to make it more verbose on error.
>=20
>=20
> It also wasn't clear how to get started but in hindsight, you need
> 'obviously'
> need a recipe that has SRC_URI and SRCREV and S and maybe a bit more
> to get started.
>=20
>=20
> Michael,
>=20
> Do you think we should a document this workflow in addition to the
> cargo bitbake approach?

I think this should be documented more prominently, as missing informatio=
n
on how to get going was the biggest obstacle, at least for me. The benefi=
t of
this workflow is, that no additional layer is needed and that everything =
seems
to more or less work out of the box within the usual checkout.

The downside is a two step approach and I wonder if it would be possible =
to
append the SRC_URI crate entries on the fly, but in a way that still work=
s
with sstate so that regeneration happens only when something has changed.

Anyway, it seems to be a good start, thanks to everyone who made this pos=
sible!

Kind regards,
Jin

=20
=20
> 1) https://github.com/BurntSushi/ripgrep
>=20
> Recipe will go to meta-oe.
>=20
> >
> >Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >---
> >  .../cargo-update-recipe-crates.bbclass        | 41 +++++++++++++++++=
++
> >  1 file changed, 41 insertions(+)
> >  create mode 100644 meta/classes-recipe/cargo-update-recipe-crates.bb=
class
> >
> >diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/=
meta/classes-recipe/cargo-update-recipe-crates.bbclass
> >new file mode 100644
> >index 0000000000..f90938c734
> >--- /dev/null
> >+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> >@@ -0,0 +1,41 @@
> >+#
> >+# Copyright OpenEmbedded Contributors
> >+#
> >+# SPDX-License-Identifier: MIT
> >+#
> >+
> >+##
> >+## Purpose:
> >+## This class is used to update the list of crates in SRC_URI
> >+## by reading Cargo.lock in the source tree.
> >+##
> >+## See meta/recipes-devtools/python/python3-bcrypt_*.bb for an exampl=
e
> >+##
> >+## To perform the update: bitbake -c update_crates recipe-name
> >+
> >+addtask do_update_crates after do_patch
> >+do_update_crates[depends] =3D "python3-native:do_populate_sysroot"
> >+
> >+do_update_crates() {
> >+    nativepython3 - <<EOF
> >+
> >+def get_crates(f):
> >+    import tomllib
> >+    c_list =3D 'SRC_URI +=3D " \\ \n'
> >+    crates =3D tomllib.load(open(f, 'rb'))
> >+    for c in crates['package']:
> >+        if 'source' in c and 'crates.io' in c['source']:
> >+            c_list +=3D "        crate://crates.io/{}/{} \\ \n".forma=
t(c['name'], c['version'])
> >+    c_list +=3D '"\n'
> >+    return c_list
> >+
> >+import os
> >+crates =3D "# Autogenerated with 'bitbake -c update_crates ${PN}'\n\n=
"
> >+for root, dirs, files in os.walk('${S}'):
> >+    for file in files:
> >+        if file =3D=3D 'Cargo.lock':
> >+            crates +=3D get_crates(os.path.join(root, file))
> >+open(os.path.join('${THISDIR}', '${PN}'+"-crates.inc"), 'w').write(cr=
ates)
> >+
> >+EOF
> >+}
> >
> >-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >Links: You receive all messages sent to this group.
> >View/Reply Online (#172303): https://lists.openembedded.org/g/openembe=
dded-core/message/172303
> >Mute This Topic: https://lists.openembedded.org/mt/94683148/3616765
> >Group Owner: openembedded-core+owner@lists.openembedded.org
> >Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[randy.macleod@windriver.com]
> >-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>=20
> --=20
> # Randy MacLeod
> # Wind River Linux

