Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QUvR9-0001hA-55
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 08:43:19 +0200
Received: by wye20 with SMTP id 20so1829656wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 23:39:58 -0700 (PDT)
Received: by 10.216.145.195 with SMTP id p45mr1633698wej.61.1307687998641;
	Thu, 09 Jun 2011 23:39:58 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id f73sm1204791wef.19.2011.06.09.23.39.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Jun 2011 23:39:57 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1307667467-467-2-git-send-email-raj.khem@gmail.com>
Date: Fri, 10 Jun 2011 08:39:55 +0200
Message-Id: <6BDF6E15-6222-45CB-BB89-F699EC6E346B@dominion.thruhere.net>
References: <1307667467-467-1-git-send-email-raj.khem@gmail.com>
	<1307667467-467-2-git-send-email-raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 2/2] sysklogd.inc: Check for package-management in IMAGE_FEATURES
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
X-List-Received-Date: Fri, 10 Jun 2011 06:43:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 jun 2011, om 02:57 heeft Khem Raj het volgende geschreven:

> ONLINE_PACKAGE_MANAGEMENT does not exist on oe-core
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> meta/recipes-extended/sysklogd/sysklogd.inc |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc =
b/meta/recipes-extended/sysklogd/sysklogd.inc
> index f2b1c15..f6a56ec 100644
> --- a/meta/recipes-extended/sysklogd/sysklogd.inc
> +++ b/meta/recipes-extended/sysklogd/sysklogd.inc
> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c28b \
> # syslog initscript is handled explicitly because order of
> # update-rc.d and update-alternatives is important (see below)
> DEPENDS_append =3D " update-rc.d update-rc.d-native"
> -RDEPENDS_${PN}_append =3D " =
${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", =
"update-rc.d", d)}"
> +RDEPENDS_${PN}_append =3D " ${@oe.utils.contains("IMAGE_FEATURES", =
"package-management", "update-rc.d", "", d)}"

You can't do IMAGE_FEATURES in RDEPENDS, consider what happens when I =
build 2 images, one with package-management and one without. Phils =
changes to catch update-rc.d usage in the image* classes should be =
enough to fix this.

regards,

Koen=


