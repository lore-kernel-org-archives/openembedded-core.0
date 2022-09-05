Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B5C7ECAAD5
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 16:15:44 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.26769.1662394539492472104
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 09:15:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=J+dkY8aI;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1662394540;
  x=1693930540;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=2XMt9GvcZjS7qVQTC1LtJ/0l/JmLGK9hvODrvQCJjVw=;
  b=J+dkY8aIanllfotE8/qspAzDNdDHGm9iIt8nCJ8Pg2TjJ3o+P8npSM+Q
   km/A1nwehrS2yVE8UclriJSEXkPm9RLAPGRnlwpbby/jwNPxH1jP+0FSE
   2PrK6VJTpQoHVQLxJ1XAfNxVlc27iuw93mCrCX7fwQQ44YhGI//6n+ljU
   sog8exJKpkVFr8ZmRNQIvF3sz5Ey4sGCPw34mgfpNpS36Up79f0h5CdMg
   XHPGSMo/l9LtXpWzJ8CLfB6mYvzQWLW9YzJbX7ONwz5O4NaVKluYtD2e+
   SJgfQYrXpJs+c5Cn5y3AlTnfht+kmxTM0PGyyiv1pru2j0MCs1wyJKzbJ
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Peter Bergin <peter@berginkonsult.se>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] rootfs-postcommands.bbclass: avoid moving ssh
 host keys if etc is writable
Thread-Topic: [OE-core] [PATCH] rootfs-postcommands.bbclass: avoid moving ssh
 host keys if etc is writable
Thread-Index: AQHYwTMiynguO8i9yEC2Y7jRAKy+Fq3Q++1g
Date: Mon, 5 Sep 2022 16:15:36 +0000
Message-ID: <dbbb813cd6f64ff2b034ab6968ac328a@axis.com>
References: <20220905142329.34087-1-peter@berginkonsult.se>
In-Reply-To: <20220905142329.34087-1-peter@berginkonsult.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 16:15:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170319

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Peter Bergin
> Sent: den 5 september 2022 16:23
> To: openembedded-core@lists.openembedded.org
> Cc: Peter Bergin <peter@berginkonsult.se>
> Subject: [OE-core] [PATCH] rootfs-postcommands.bbclass: avoid moving ssh =
host keys if etc is writable
>=20
> When using IMAGE_FEATURE read-only-rootfs ssh host keys are moved to vola=
tile
> storage. If the feature overlayfs-etc is used in addition to read-only-ro=
otfs
> /etc is writable and the move is not wanted. But in the case also the IMA=
GE_FEATURE
> stateless-roots is used the keys will be moved as storage of keys should =
not

Correct "stateless-roots" to "stateless-rootfs".

> be wanted in a stateless-rootfs.
>=20
> This change only takes effect in the case IMAGE_FEATURE contains read-onl=
y-rootfs.
> In adddition the following cases are handled:
>=20
>   IMAGE_FEATURES =3D "read-only-rootfs" --> ssh keys/config handled as ro=
 root
>   IMAGE_FEATURES =3D "read-only-rootfs overlayfs-etc" --> ssh keys/config=
 handled as rw root
>   IMAGE_FEATURES =3D "read-only-rootfs stateless-rootfs" --> ssh keys/con=
fig handled as ro root
>   IMAGE_FEATURES =3D "read-only-rootfs overlayfs-etc stateless-rootfs" --=
> ssh keys/config handled as ro root
>=20
> Signed-off-by: Peter Bergin <peter@berginkonsult.se>
> ---
>  .../rootfs-postcommands.bbclass               | 32 +++++++++++--------
>  1 file changed, 18 insertions(+), 14 deletions(-)
>=20
> diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/class=
es-recipe/rootfs-postcommands.bbclass
> index 215e38e33d..367fe07c09 100644
> --- a/meta/classes-recipe/rootfs-postcommands.bbclass
> +++ b/meta/classes-recipe/rootfs-postcommands.bbclass
> @@ -22,7 +22,7 @@ ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_a=
ny("IMAGE_FEATURES", [ 'deb
>  # Create /etc/timestamp during image construction to give a reasonably s=
ane default time setting
>  ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_update_timestamp; "
>=20
> -# Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs i=
s enabled
> +# Tweak files in /etc if read-only-rootfs is enabled
>  ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("IMAGE_FEATURES", =
"read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
>=20
>  # We also need to do the same for the kernel boot parameters,
> @@ -111,21 +111,25 @@ read_only_rootfs_hook () {
>  	# If we're using openssh and the /etc/ssh directory has no pre-generate=
d keys,
>  	# we should configure openssh to use the configuration file /etc/ssh/ss=
hd_config_readonly
>  	# and the keys under /var/run/ssh.
> -	if [ -d ${IMAGE_ROOTFS}/etc/ssh ]; then
> -		if [ -e ${IMAGE_ROOTFS}/etc/ssh/ssh_host_rsa_key ]; then
> -			echo "SYSCONFDIR=3D\${SYSCONFDIR:-/etc/ssh}" >> ${IMAGE_ROOTFS}/etc/d=
efault/ssh
> -			echo "SSHD_OPTS=3D" >> ${IMAGE_ROOTFS}/etc/default/ssh
> -		else
> -			echo "SYSCONFDIR=3D\${SYSCONFDIR:-/var/run/ssh}" >> ${IMAGE_ROOTFS}/e=
tc/default/ssh
> -			echo "SSHD_OPTS=3D'-f /etc/ssh/sshd_config_readonly'" >> ${IMAGE_ROOT=
FS}/etc/default/ssh
> +	# If overlayfs-etc is used this is not done as /etc is treated as writa=
ble
> +	# If stateless-rootfs is enabled this is always done as we don't want t=
o save keys then
> +	if ${@ 'false;' if bb.utils.contains('IMAGE_FEATURES', 'overlayfs-etc',=
 True, False, d) and not bb.utils.contains('IMAGE_FEATURES', 'stateless-roo=
tfs', True, False, d) else 'true;'} then

It is easier to understand the combined if statement if the=20
conditions of the inner if statements are true when the=20
conditions of the outer if statement shall be true. Also,=20
the ";" belongs outside the ${@...}:

	if ${@ 'true' if not bb.utils.contains('IMAGE_FEATURES', 'overlayfs-etc', =
True, False, d) or bb.utils.contains('IMAGE_FEATURES', 'stateless-rootfs', =
True, False, d) else 'false'}; then

> +	    if [ -d ${IMAGE_ROOTFS}/etc/ssh ]; then

Correct the indentation here and below. Indentation of shell=20
code in OE Core is done using tabs.

> +		    if [ -e ${IMAGE_ROOTFS}/etc/ssh/ssh_host_rsa_key ]; then
> +			    echo "SYSCONFDIR=3D\${SYSCONFDIR:-/etc/ssh}" >> ${IMAGE_ROOTFS}/e=
tc/default/ssh
> +			    echo "SSHD_OPTS=3D" >> ${IMAGE_ROOTFS}/etc/default/ssh
> +		    else
> +			    echo "SYSCONFDIR=3D\${SYSCONFDIR:-/var/run/ssh}" >> ${IMAGE_ROOTF=
S}/etc/default/ssh
> +			    echo "SSHD_OPTS=3D'-f /etc/ssh/sshd_config_readonly'" >> ${IMAGE_=
ROOTFS}/etc/default/ssh
> +		    fi
>  		fi
> -	fi
>=20
> -	# Also tweak the key location for dropbear in the same way.
> -	if [ -d ${IMAGE_ROOTFS}/etc/dropbear ]; then
> -		if [ ! -e ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key ]; then
> -			echo "DROPBEAR_RSAKEY_DIR=3D/var/lib/dropbear" >> ${IMAGE_ROOTFS}/etc=
/default/dropbear
> -		fi
> +	    # Also tweak the key location for dropbear in the same way.
> +	    if [ -d ${IMAGE_ROOTFS}/etc/dropbear ]; then
> +		    if [ ! -e ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key ]; th=
en
> +			    echo "DROPBEAR_RSAKEY_DIR=3D/var/lib/dropbear" >> ${IMAGE_ROOTFS}=
/etc/default/dropbear
> +		    fi
> +	    fi
>  	fi
>=20
>  	if ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "true", "false",=
 d)}; then
> --
> 2.34.1

//Peter


