Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PvbGT-0006pR-GK
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 21:06:17 +0100
Received: by wyb38 with SMTP id 38so2400068wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2011 12:04:47 -0800 (PST)
Received: by 10.216.143.17 with SMTP id k17mr905192wej.74.1299269087653;
	Fri, 04 Mar 2011 12:04:47 -0800 (PST)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id m2sm1014341wer.13.2011.03.04.12.04.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Mar 2011 12:04:46 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <e807fc977770cb64a217768672c18437ea8f3057.1299267630.git.sgw@linux.intel.com>
Date: Fri, 4 Mar 2011 21:04:45 +0100
Message-Id: <A53A0FEC-74B3-483C-916C-EB87748A1AC8@dominion.thruhere.net>
References: <cover.1299267630.git.sgw@linux.intel.com>
	<e807fc977770cb64a217768672c18437ea8f3057.1299267630.git.sgw@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1082)
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 04/13] module: build hostprogs for each module
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
X-List-Received-Date: Fri, 04 Mar 2011 20:06:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 mrt 2011, om 20:42 heeft Saul Wold het volgende geschreven:

> From: Darren Hart <dvhart@linux.intel.com>
>=20
> This fixes [BUGID #241]
>=20
> The kernel hostprogs are built for the host architecture. They should =
not be
> deployed to the target, and they should not be included in an sstate =
package
> which might get reused on a host of a different architecture.
>=20
> As we don't build many out-of-tree modules, this patch takes the =
approach of
> building the hostprogs as part of the module compile process with a
> do_compile_prepend() routine in module.bbclass.
>=20
> We don't have to clean the hostprogs as modules depend on the kernel =
being
> populate_staging, so its done with the staging directory by the time =
we run.
>=20
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> CC: Gary Thomas <gary@mlbassoc.com>
> ---
> meta/classes/module.bbclass |   12 +++++++++++-
> 1 files changed, 11 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> index d16d462..bbceaf7 100644
> --- a/meta/classes/module.bbclass
> +++ b/meta/classes/module.bbclass
> @@ -3,6 +3,13 @@ DEPENDS +=3D "virtual/kernel"
>=20
> inherit module-base
>=20
> +# Ensure the hostprogs are available for module compilation
> +module_do_compile_prepend() {
> +	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS=20
> +	oe_runmake CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" =
AR=3D"${KERNEL_AR}" \
> +	           -C ${STAGING_KERNEL_DIR} scripts
> +}
> +
> module_do_compile() {
> 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> 	oe_runmake KERNEL_PATH=3D${STAGING_KERNEL_DIR}   \
> @@ -15,7 +22,10 @@ module_do_compile() {

Why not put it in do_compile itself?

regards,

Koen=


