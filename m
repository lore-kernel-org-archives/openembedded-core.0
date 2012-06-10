Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SdrMv-0006ab-Nm
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 01:16:25 +0200
Received: by eaal1 with SMTP id l1so1782970eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jun 2012 16:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=fjxbXaeENVWgnbNoHw1kdhxPJ3cTy9dLGSP8L8asL1c=;
	b=nxJF9RI5WkUAao000rZrAK9Y6vKs+jf5K47vbD/LMMSZcDBiS1YOlq7B/9Qie0dgRs
	2GDGJsFv0MRJ5DdO+Xv/kIkv21JuvdA/VEdmEd70CVh74M9adU4w0Rkhw8+PP0POFaZU
	MfR1ZEVIgFR5QjPfBM4XhGxxJpDvjALMEcsXiySswKrUFBHTmAb6C9LEWeRuey07EUA5
	wJ9Zpf8RYJ82Z/1LQL0WK5VNI4hqLxQ1zQFSq2ZKk3R841eGxvBd/CUtslzewBSpzJDp
	ZJSgLj475ntnOsuXrqecsdGSgZZKzDBF+lV7rFarLi+bvx3Bw2dKxxQ508gXUbI1MpFa
	wZjQ==
Received: by 10.14.188.140 with SMTP id a12mr5032946een.25.1339369552778; Sun,
	10 Jun 2012 16:05:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Sun, 10 Jun 2012 16:05:22 -0700 (PDT)
In-Reply-To: <cover.1339259893.git.raj.khem@gmail.com>
References: <cover.1339259893.git.raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 10 Jun 2012 16:05:22 -0700
Message-ID: <CAMKF1sqrxWy7HimP8uoWoOguYHnbN=WNW-E1FrEtay2EzmjXwA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/16 V2] Prelink/ld bug and rpm compilation on uclibc
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
X-List-Received-Date: Sun, 10 Jun 2012 23:16:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 9, 2012 at 9:42 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
> This patch now can compile a uclibc sato image using rpm as packaging bac=
kend
> Introduces variables into cmake class to control linker flags which was
> not available
> Adds npth recipe. npth is next gen pth soon gnupg 2.1 will drop pth
> and move on to use npth, right now its only used in uclibc case
> conditionalize use of pth using libc overrides since pth is not
> compatible with uclibc
>
> The following changes since commit 75a973328d50ef3c007edb7a471ea77fb97911=
ea:
>
> =C2=A0kern-tools: anchor KMACHINE test (2012-06-08 11:56:21 +0100)
>
> are available in the git repository at:
> =C2=A0git://git.openembedded.org/openembedded-core-contrib kraj/misc-upda=
tes
> =C2=A0http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log=
/?h=3Dkraj/misc-updates


I have updated this pull request with two additional changes

1. Upgrade uclibc git recipes to latest tip of master this gets
the eventfd patches which are needed for glib-2.32.x to function
correctly.

2. Include gcc patches to exclude call-convention settings when building
native and nativesdk gcc recipes.

3. Use translated target arch instead of target_arch in gcc.

>
> Khem Raj (16):
> =C2=A0binutils_2.22: Backport to fix bogus textrels
> =C2=A0rpm: Fix compilation on uclibc
> =C2=A0pth: Mark incompatible with uclibc
> =C2=A0libtool: Let -fstack-protector passed to link step
> =C2=A0rpm: Use link time check for libssp
> =C2=A0sat-solver: Fix build on uclibc
> =C2=A0libzypp: Fix build with uclibc
> =C2=A0augeas: Fix compilation failure
> =C2=A0rpm: pass lrt and lpthread to link step explicitly for uclibc
> =C2=A0zypper: Fix build on uclibc
> =C2=A0cmake.bbclass: Add OECMAKE_C_LINK_FLAGS and OECMAKE_CXX_LINK_FLAGS
> =C2=A0 =C2=A0variables
> =C2=A0libzypp: Define OECMAKE_CXX_LINK_FLAGS when compiling for uclibc
> =C2=A0task-self-hosted.bb,task-core-lsb.bb: Conditionalize pth inclusion
> =C2=A0npth: Add recipe
> =C2=A0gpgme: Depend on npth for uclibc
> =C2=A0gnupg-2.0.19: Depend on npth for uclibc
>
> =C2=A0meta/classes/cmake.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A04 +
> =C2=A0meta/recipes-core/tasks/task-self-hosted.bb =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A04 +-
> =C2=A0.../binutils/binutils/0001-PR-ld-13470.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 82 ++++++++++++++++++++
> =C2=A0meta/recipes-devtools/binutils/binutils_2.22.bb =C2=A0 =C2=A0| =C2=
=A0 =C2=A03 +-
> =C2=A0meta/recipes-devtools/libtool/libtool-2.4.2.inc =C2=A0 =C2=A0| =C2=
=A0 =C2=A03 +-
> =C2=A0.../libtool/libtool/respect-fstack-protector.patch | =C2=A0 53 ++++=
+++++++++
> =C2=A0.../rpm/rpm/fstack-protector-configure-check.patch | =C2=A0 13 +++
> =C2=A0meta/recipes-devtools/rpm/rpm/rpmatch.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 42 ++++++++++
> =C2=A0meta/recipes-devtools/rpm/rpm/uclibc-support.patch | =C2=A0 69 ++++=
++++++++++++
> =C2=A0meta/recipes-devtools/rpm/rpm_5.4.0.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A07 ++-
> =C2=A0meta/recipes-extended/augeas/augeas.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A04 +-
> =C2=A0.../0001-Add-missing-argument-to-escape.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 29 +++++++
> =C2=A0meta/recipes-extended/augeas/augeas_0.10.0.bb =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A02 +-
> =C2=A0meta/recipes-extended/libzypp/libzypp/cstdio.patch | =C2=A0 49 ++++=
++++++++
> =C2=A0meta/recipes-extended/libzypp/libzypp_git.bb =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A09 ++-
> =C2=A0.../sat-solver/sat-solver/futimes.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 32 ++++++++
> =C2=A0meta/recipes-extended/sat-solver/sat-solver_git.bb | =C2=A0 =C2=A07=
 +-
> =C2=A0meta/recipes-extended/tasks/task-core-lsb.bb =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A06 +-
> =C2=A0meta/recipes-extended/zypper/zypper/rpmatch.patch =C2=A0| =C2=A0 23=
 ++++++
> =C2=A0meta/recipes-extended/zypper/zypper_git.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A04 +-
> =C2=A0meta/recipes-support/gnupg/gnupg_2.0.19.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A06 +-
> =C2=A0meta/recipes-support/gpgme/gpgme_1.3.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A07 +-
> =C2=A0meta/recipes-support/npth/npth_0.90.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 17 ++++
> =C2=A0meta/recipes-support/pth/pth_2.0.7.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 12 +++-
> =C2=A024 files changed, 469 insertions(+), 18 deletions(-)
> =C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils/0001-PR-=
ld-13470.patch
> =C2=A0create mode 100644 meta/recipes-devtools/libtool/libtool/respect-fs=
tack-protector.patch
> =C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/fstack-protector-c=
onfigure-check.patch
> =C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpmatch.patch
> =C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/uclibc-support.pat=
ch
> =C2=A0create mode 100644 meta/recipes-extended/augeas/augeas/0001-Add-mis=
sing-argument-to-escape.patch
> =C2=A0create mode 100644 meta/recipes-extended/libzypp/libzypp/cstdio.pat=
ch
> =C2=A0create mode 100644 meta/recipes-extended/sat-solver/sat-solver/futi=
mes.patch
> =C2=A0create mode 100644 meta/recipes-extended/zypper/zypper/rpmatch.patc=
h
> =C2=A0create mode 100644 meta/recipes-support/npth/npth_0.90.bb
>
> --
> 1.7.5.4
>


