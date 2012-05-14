Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1STrzC-00006s-Oe
	for openembedded-core@lists.openembedded.org;
	Mon, 14 May 2012 11:54:38 +0200
Received: by wgbdr1 with SMTP id dr1so3977071wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 02:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=dxVHDaoplUhJTs8cnc4ZJPxCOc3Q7kAhMWMhgWZtTfA=;
	b=ZN8TwrfoomhhvuRme8dsZmb2jvBWekejoHWhApdWJi0pw8uuZFEEetJaA7eEOraQt5
	57VzjKo/PHjN6+2JUXeYXGe4V0t2zkbdt5exZkuc43WqF9Eu0HSUW2f8ZQv0hwgjCysx
	cSPzmqW3vdK9qonqE7C2FJm5Y+lDUQdytPuRZQgr30N3e+CCEt6Q+HyOqISCaRUCH4r7
	4uHeIneOHcQYpXd9b39wJIzw32ksXwED5yebpQJoEZDHqLCxrPD8XgNM6QAdTIZDHIq7
	qZfmVExqLLHheaD+JWsx09GG87U40Fg7wQnQFIxWB86KCBaK10RvoAKIvIH+XzBHvEqW
	2dhw==
Received: by 10.180.102.3 with SMTP id fk3mr18346817wib.9.1336988679965;
	Mon, 14 May 2012 02:44:39 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id f19sm53438982wiw.11.2012.05.14.02.44.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 May 2012 02:44:37 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <b82a9a6f0dd12135e53eedc75b0833ce7dfb3eab.1336983006.git.liezhi.yang@windriver.com>
Date: Mon, 14 May 2012 11:44:35 +0200
Message-Id: <50E29635-2A3A-4D94-8826-EBF3846E3638@dominion.thruhere.net>
References: <cover.1336983006.git.liezhi.yang@windriver.com>
	<b82a9a6f0dd12135e53eedc75b0833ce7dfb3eab.1336983006.git.liezhi.yang@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQneLBDaA55nPL2Xg0kC8TrIA3PPAGy4qEEJAdn/bqBvROJc/MTGmn/bzAQpPCUAKmMOwzG7
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 2/2] rootfs_rpm.bbclass: save rpmlib rather than remove it
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
X-List-Received-Date: Mon, 14 May 2012 09:54:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Op 14 mei 2012, om 10:11 heeft Robert Yang het volgende geschreven:

> The rpmlib was removed when core-image-minimal,

Please replace 'core-image-minimal' with something like:

	images that add "remove_packaging_data_files ; " to  =
ROOTFS_POSTPROCESS_COMMAND

That points out the actual problem instead of having to guess what =
core-image-minimal is doing 'wrong' to need this patch.


> which would make the
> increment rpm image generation doesn't work in the second build, since
> list_installed_packages would get incorrect value in the second build,
> move the rpmlib to ${T} rather than remove it, and move it back when
> INC_RPM_IMAGE_GEN =3D1.
>=20
> [YOCTO #2440]
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
> meta/classes/image.bbclass      |    6 ++++++
> meta/classes/rootfs_rpm.bbclass |    6 +++++-
> 2 files changed, 11 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 4610731..b5fca32 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -142,6 +142,12 @@ fakeroot do_rootfs () {
>     # When use the rpm incremental image generation, don't remove the =
rootfs
>     if [ "${INC_RPM_IMAGE_GEN}" !=3D "1" -o "${IMAGE_PKGTYPE}" !=3D =
"rpm" ]; then
>         rm -rf ${IMAGE_ROOTFS}
> +    elif [ -d ${T}/saved_rpmlib/var/lib/rpm ]; then
> +        # Move the rpmlib back
> +        if [ ! -d ${IMAGE_ROOTFS}/var/lib/rpm ]; then
> +                mkdir -p ${IMAGE_ROOTFS}/var/lib/
> +                mv ${T}/saved_rpmlib/var/lib/rpm =
${IMAGE_ROOTFS}/var/lib/
> +        fi
>     fi
> 	rm -rf ${MULTILIB_TEMP_ROOTFS}
> 	mkdir -p ${IMAGE_ROOTFS}
> diff --git a/meta/classes/rootfs_rpm.bbclass =
b/meta/classes/rootfs_rpm.bbclass
> index 9039b21..fbc46c0 100644
> --- a/meta/classes/rootfs_rpm.bbclass
> +++ b/meta/classes/rootfs_rpm.bbclass
> @@ -154,7 +154,11 @@ EOF
> }
>=20
> remove_packaging_data_files() {
> -	rm -rf ${IMAGE_ROOTFS}${rpmlibdir}
> +	# Save the rpmlib for increment rpm image generation
> +	t=3D"${T}/saved_rpmlib/var/lib"
> +	rm -fr $t
> +	mkdir -p $t
> +	mv ${IMAGE_ROOTFS}${rpmlibdir} $t
> 	rm -rf ${IMAGE_ROOTFS}${opkglibdir}
> }
>=20
> --=20
> 1.7.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



