Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3FD3370A8A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 06:40:21 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id k14so4901852wgh.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 23:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=5FqaSnlTF766tLGUf9jhRgKxJFNMf6+u/+F9BwH6Z2E=;
	b=A5EQovj9bPNj7CNcHf9Cc9DUHS1DqrRO6ukoYv59SyKdegm/nHXn1k1p19kfoty23R
	K6rtzkEnXRL96pmdfqWgj8gH3/ukSZzhiOJ1nShhnmoRvmby4BIn/THAZecXBX8NIDZ1
	nVmAq79VV5Wkh/2c4N2nrmHkOtjlUwpUCBayj4VMYYGvgvr2I7wjchjNFkwMgxwO/7EQ
	Vp1iKSuY9vTZg6BFQnQ4efymVp80Yz5wZv1GFQpU/RX7AwnGyT+cttK0iQJ8XV41bU8Q
	rckfotdYtUZen0yFqINletogew/NlaRgeYPkqzJmrrH+6y4Ws645UGzVeLvS4gSYRGOX
	woJQ==
X-Gm-Message-State: ALoCoQkY1vS6PSiEdod8/F4FGTqRvlZmpFZ5PTzGUHkxOTHbK4umdamh0H/D+IG/CGR0X+JIljnq
X-Received: by 10.195.12.76 with SMTP id eo12mr18141789wjd.22.1414651221294;
	Wed, 29 Oct 2014 23:40:21 -0700 (PDT)
Received: from ?IPv6:2001:610:612::4d00:6ded:d64:252e?
	([2001:610:612:0:4d00:6ded:d64:252e])
	by mx.google.com with ESMTPSA id fx2sm7553313wjb.37.2014.10.29.23.40.19
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 29 Oct 2014 23:40:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1414631274-12001-1-git-send-email-alejandro.hernandez@linux.intel.com>
Date: Thu, 30 Oct 2014 07:40:18 +0100
Message-Id: <37168E9D-141E-41E0-87E9-7DF5830F700A@dominion.thruhere.net>
References: <1414631274-12001-1-git-send-email-alejandro.hernandez@linux.intel.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] image.bbclass: Added buildinfo IMAGE_FEATURE
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
X-List-Received-Date: Thu, 30 Oct 2014 06:40:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 30 okt. 2014, om 02:07 heeft Alejandro Hernandez =
<alejandro.hernandez@linux.intel.com> het volgende geschreven:
>=20
> Writes build information to target filesystem to help developers
>=20
> [YOCTO #6770]
>=20
> Signed-off-by: Alejandro Hernandez  =
<alejandro.hernandez@linux.intel.com>
> ---
> meta/classes/image.bbclass | 46 =
+++++++++++++++++++++++++++++++++++++++++++++-
> 1 file changed, 45 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 940bdb6..fe7cd43 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -22,7 +22,7 @@ inherit ${TESTIMAGECLASS}
> # IMAGE_FEATURES may contain any available package group
> IMAGE_FEATURES ?=3D ""
> IMAGE_FEATURES[type] =3D "list"
> -IMAGE_FEATURES[validitems] +=3D "debug-tweaks read-only-rootfs"
> +IMAGE_FEATURES[validitems] +=3D "debug-tweaks read-only-rootfs =
buildinfo"
>=20
> # rootfs bootstrap install
> ROOTFS_BOOTSTRAP_INSTALL =3D "${@bb.utils.contains("IMAGE_FEATURES", =
"package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)}"
> @@ -181,6 +181,9 @@ POSTINST_LOGFILE ?=3D =
"${localstatedir}/log/postinstall.log"
> SYSTEMD_DEFAULT_TARGET ?=3D '${@bb.utils.contains("IMAGE_FEATURES", =
"x11-base", "graphical.target", "multi-user.target", d)}'
> ROOTFS_POSTPROCESS_COMMAND +=3D =
'${@bb.utils.contains("DISTRO_FEATURES", "systemd", =
"set_systemd_default_target; ", "", d)}'
>=20
> +# Write build information to target FS
> +IMAGE_PREPROCESS_COMMAND +=3D '${@bb.utils.contains("IMAGE_FEATURES", =
"buildinfo", "buildinfo; ", "",d)}'
> +
> # some default locales
> IMAGE_LINGUAS ?=3D "de-de fr-fr en-gb"
>=20
> @@ -411,6 +414,47 @@ rootfs_sysroot_relativelinks () {
> 	sysroot-relativelinks.py ${SDK_OUTPUT}/${SDKTARGETSYSROOT}
> }
>=20
> +def get_layer_git_status(path):
> +    f =3D os.popen("cd %s; git diff --stat 2>&1 | tail -n 1" % path)
> +    data =3D f.read()
> +    if f.close() is None:
> +        if len(data) !=3D 0:
> +            return "-- modified"
> +    return ""
> +
> +def get_layer_revs(d):
> +    layers =3D (d.getVar("BBLAYERS", True) or "").split()
> +    medadata_revs =3D ["%-17s =3D %s:%s %s" % (os.path.basename(i), \
> +        base_get_metadata_git_branch(i, None).strip(), \
> +        base_get_metadata_git_revision(i, None), \
> +        get_layer_git_status(i)) \
> +            for i in layers]
> +    return '\n'.join(medadata_revs)
> +
> +def buildinfo_target(d):
> +        # Get context
> +        if d.getVar('BB_WORKERCONTEXT', True) !=3D '1':
> +                return ""
> +        # Single and list variables to be read
> +        vars =3D "DISTRO DISTRO_VERSION BB_VERSION BUILD_SYS =
TARGET_SYS MACHINE USER_CLASSES IMAGE_CLASSES IMAGE_FEATURES =
IMAGE_LINGUAS IMAGE_INSTALL PACKAGE_EXCLUDE"
> +        listvars =3D "USER_CLASSES IMAGE_CLASSES IMAGE_FEATURES =
IMAGE_LINGUAS IMAGE_INSTALL PACKAGE_EXCLUDE"
> +        return outputvars(vars, listvars, d)
> +
> +# Write build information to target filesystem
> +inherit buildhistory

Did you just make buildhistory mandatory for everyone?=

