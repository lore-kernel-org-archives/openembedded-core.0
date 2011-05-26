Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QPcNw-0004ax-Ak
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 17:22:04 +0200
Received: by wye20 with SMTP id 20so672143wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 08:19:00 -0700 (PDT)
Received: by 10.216.6.27 with SMTP id 27mr914848wem.69.1306423140099;
	Thu, 26 May 2011 08:19:00 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id z66sm431564weq.24.2011.05.26.08.18.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 May 2011 08:18:59 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1306245860-12820-1-git-send-email-koen@dominion.thruhere.net>
Date: Thu, 26 May 2011 17:18:57 +0200
Message-Id: <73A0ACDF-8DDC-4C28-8B62-27669ECCD7FB@dominion.thruhere.net>
References: <1306245860-12820-1-git-send-email-koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [RFC][PATCH] bitbake.conf: make OVERRIDES match what people expect
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
X-List-Received-Date: Thu, 26 May 2011 15:22:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 24 mei 2011, om 16:04 heeft Koen Kooi het volgende geschreven:

> In the current situation TARGET_ARCH will override MACHINE, which is =
counter intuitive since the machine is more specific than the arch.
>=20
> The order is now pn-$PN} -> arch -> machine -> distro as the machine =
is a set of defaults and the distro is the ultimate policy.
>=20
> 'failfast' has been removed since it's not used anymore, just like =
'local'
> ---
> meta/conf/bitbake.conf |   12 ++++++------
> 1 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index a0af672..59238b8 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -602,15 +602,15 @@ AUTO_LIBNAME_PKGS =3D "${PACKAGES}"
> #=20
> # This means that an envionment variable named '<foo>_arm' overrides =
an
> # environment variable '<foo>' (when ${TARGET_ARCH} is arm).
> -# An environment variable '<foo>_ramses' overrides '<foo>' but =
doesn't override
> -# '<foo>_arm' when ${MACHINE} is 'ramses'.=20
> -# If you use combination ie '<foo>_arm_ramses', then =
'<foo>_arm_ramses' will override=20
> -# '<foo>_arm' and then '<foo>' will be overriden with that value from =
'<foo>_arm'.
> -# And finally '<foo>_local' overrides any standard variable, but with =
lowest priority.
> +# An environment variable '<foo>_qemuarm' overrides '<foo>' and =
overrides
> +# '<foo>_arm' when ${MACHINE} is 'qemuarm'.=20
> +# If you use combination ie '<foo>_qemuarm_arm', then =
'<foo>_qemuarm_arm' will override=20
> +# '<foo>_qemuarm' and then '<foo>' will be overriden with that value =
from '<foo>_qemuarm'.
> +# And finally '<foo>_forcevariable' overrides any standard variable, =
with the highest priority.
> #
> # This works for  functions as well, they are really just environment =
variables.
> # Default OVERRIDES to make compilation fail fast in case of build =
system misconfiguration.
> -OVERRIDES =3D =
"local:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${TARGET_OS}:${TARGET_ARCH}:=
build-${BUILD_OS}:fail-fast:pn-${PN}:forcevariable"
> +OVERRIDES =3D =
"${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES=
}:${DISTROOVERRIDES}:forcevariable"
> DISTROOVERRIDES ?=3D "${DISTRO}"
> MACHINEOVERRIDES ?=3D "${MACHINE}"

So what's the verdict on this one?=


