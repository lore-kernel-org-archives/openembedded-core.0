Return-Path: <fbberton@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46714C25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 09:40:26 +0000 (UTC)
Subject: Re: Set the CMake BUILD_TESTING option to OFF as the default setting
To: openembedded-core@lists.openembedded.org
From: "Fabio Berton" <fbberton@gmail.com>
X-Originating-Location: Rinchoa, Lisbon, PT (78.137.195.161)
X-Originating-Platform: Windows Firefox 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 03 Jun 2024 02:40:19 -0700
References: <CANNYZj_4vum5En3xs8nKNOOPCvHSPJ=0Z=VFyCDc4qVsvSq3Kw@mail.gmail.com>
In-Reply-To: <CANNYZj_4vum5En3xs8nKNOOPCvHSPJ=0Z=VFyCDc4qVsvSq3Kw@mail.gmail.com>
Message-ID: <30049.1717407619992664732@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="xhKWshSqxqlyXA8psfaH"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 09:40:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200240

--xhKWshSqxqlyXA8psfaH
Content-Type: text/plain; charset="utf-8"; markup=markdown
Content-Transfer-Encoding: quoted-printable

Hi Alex,

I ran a few builds disabling CMake DBUILD_TESTING and the build time was ab=
out the same. I'm not sure if by building plenty of recipes we can see a di=
fference in build time, since bitbake needs to build all the recipe depende=
ncies that use cmake bbclass.

Looking for some recipes that use ptest, I see examples like this:

- meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb: PACKAGECONFIG ?=
?=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
- meta/recipes-core/glib-networking/glib-networking_2.78.1.bb: PACKAGECONFI=
G ??=3D "gnutls environment ${@bb.utils.contains('PTEST_ENABLED', '1', 'tes=
ts', '', d)}"
- meta/recipes-support/libnl/libnl_3.9.0.bb: do_compile_ptest to compile on=
ly when PTEST_ENABLED is enabled
- ... (and several more)
- one interesting one is meta/recipes-devtools/flex/flex_2.6.4.bb: ${@bb.ut=
ils.contains('PTEST_ENABLED', '1', '', 'file://disable-tests.patch', d)}
they decided to apply a patch to disable tests when ptest is off

Based on this, I would say that we don't want to build tests unless ptests =
are enabled (so the argument that building tests also tests the code is moo=
t). In turn, it may be sensible to use the default CMake option to disable =
building of tests.

Thanks,

Fabio

--xhKWshSqxqlyXA8psfaH
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi Alex,</p>

<p>I ran a few builds disabling CMake DBUILD_TESTING and the build time was=
 about the same. I'm not sure if by building plenty of recipes we can see a=
 difference in build time, since bitbake needs to build all the recipe depe=
ndencies that use cmake bbclass.</p>

<p>Looking for some recipes that use ptest, I see examples like this:</p>

<ul>
<li>meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb: PACKAGECONFIG=
 ??=3D &quot;${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}&qu=
ot;</li>
<li>meta/recipes-core/glib-networking/glib-networking_2.78.1.bb: PACKAGECON=
FIG ??=3D &quot;gnutls environment ${@bb.utils.contains('PTEST_ENABLED', '1=
', 'tests', '', d)}&quot;</li>
<li>meta/recipes-support/libnl/libnl_3.9.0.bb: do_compile_ptest to compile =
only when PTEST_ENABLED is enabled</li>
<li>... (and several more)</li>
<li>one interesting one is meta/recipes-devtools/flex/flex_2.6.4.bb: ${@bb.=
utils.contains('PTEST_ENABLED', '1', '', 'file://disable-tests.patch', d)}
they decided to apply a patch to disable tests when ptest is off</li>
</ul>

<p>Based on this, I would say that we don't want to build tests unless ptes=
ts are enabled (so the argument that building tests also tests the code is =
moot). In turn, it may be sensible to use the default CMake option to disab=
le building of tests.</p>

<p>Thanks,</p>

<p>Fabio</p>

--xhKWshSqxqlyXA8psfaH--

