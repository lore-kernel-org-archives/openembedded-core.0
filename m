Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S1n8H-000637-Pq
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 00:03:57 +0100
Received: by wiax18 with SMTP id x18so253914wia.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2012 14:55:32 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.96.8 as permitted sender)
	client-ip=10.180.96.8; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.96.8 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.96.8])
	by 10.180.96.8 with SMTP id do8mr13289914wib.21.1330296932522 (num_hops
	= 1); Sun, 26 Feb 2012 14:55:32 -0800 (PST)
Received: by 10.180.96.8 with SMTP id do8mr10503865wib.21.1330296932319;
	Sun, 26 Feb 2012 14:55:32 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ft8sm18089626wib.11.2012.02.26.14.55.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 14:55:31 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <b5c5d99d64381f508be653cc48e793f1e25eb2fe.1330294151.git.paul.eggleton@linux.intel.com>
Date: Sun, 26 Feb 2012 23:55:25 +0100
Message-Id: <1A634368-87AC-4206-8B0C-3729A478FF0C@dominion.thruhere.net>
References: <cover.1330294151.git.paul.eggleton@linux.intel.com>
	<b5c5d99d64381f508be653cc48e793f1e25eb2fe.1330294151.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnUDd6qXix2ejhQSnIANSNhtH4OJlRYHbmKOArQfv+mlfUTaISQ6jwNQP3aCbCjYsmHZzeX
Subject: Re: [PATCH 1/4] qt4: fix compile error in Qt 4.8.0 with gcc 4.6
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
X-List-Received-Date: Sun, 26 Feb 2012 23:03:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 feb. 2012, om 23:27 heeft Paul Eggleton het volgende geschreven:

> Ensure the Qt configure script can can detect the compiler correctly =
as
> g++. This fixes the following compile error with gcc 4.6:
>=20
> ./wtf/NullPtr.h:48:1: error: identifier 'nullptr' will become a =
keyword in C++0x [-Werror=3Dc++0x-compat]
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> meta/recipes-qt/qt4/qt-4.8.0.inc                   |    1 +
> .../qt4/qt-4.8.0/configure_oe_compiler.patch       |   31 =
++++++++++++++++++++
> meta/recipes-qt/qt4/qt4-embedded_4.8.0.bb          |    2 +-
> 3 files changed, 33 insertions(+), 1 deletions(-)
> create mode 100644 =
meta/recipes-qt/qt4/qt-4.8.0/configure_oe_compiler.patch
>=20
> diff --git a/meta/recipes-qt/qt4/qt-4.8.0.inc =
b/meta/recipes-qt/qt4/qt-4.8.0.inc
> index 2addbb2..532f1ff 100644
> --- a/meta/recipes-qt/qt4/qt-4.8.0.inc
> +++ b/meta/recipes-qt/qt4/qt-4.8.0.inc
> @@ -14,6 +14,7 @@ SRC_URI =3D =
"http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
>            file://fix-translations.patch \
>            file://add_nostrip_for_debug_packages.diff \
>            file://qmake_cxx_eval.patch \
> +           file://configure_oe_compiler.patch \
>            file://g++.conf \
>            file://linux.conf \
>            "
> diff --git a/meta/recipes-qt/qt4/qt-4.8.0/configure_oe_compiler.patch =
b/meta/recipes-qt/qt4/qt-4.8.0/configure_oe_compiler.patch
> new file mode 100644
> index 0000000..d455d0a
> --- /dev/null
> +++ b/meta/recipes-qt/qt4/qt-4.8.0/configure_oe_compiler.patch
> @@ -0,0 +1,31 @@
> +Ensure we identify the compiler as g++ in configure
> +
> +Our PLATFORM in OE is ${TARGET_OS}-oe-g++, and previously the =
configure
> +script was interpreting from this that the compiler was "oe-g++" and =
thus
> +g++ specific checks were not being run since this string did not =
match;
> +among other things this resulted in a compiler version check in the
> +QtWebKit build code not working, and hence the following error at =
build
> +time:
> +
> +./wtf/NullPtr.h:48:1: error: identifier 'nullptr' will become a =
keyword in C++0x [-Werror=3Dc++0x-compat]
> +
> +The easiest thing since our PLATFORM is entirely artificial is to =
just
> +force COMPILER to "g++" in the configure script if it is detected as
> +"oe-g++".
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Can I bribe you to make those proper git patches? :)

regards,

Koen=


