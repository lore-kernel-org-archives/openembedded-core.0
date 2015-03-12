Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id B0E6573996
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 03:09:21 +0000 (UTC)
Received: by pdbnh10 with SMTP id nh10so16333051pdb.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 20:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=of/TanIDvsac7lN0Pv9Qg4kZh1fS8qUUdB4AaK1qhMs=;
	b=lxbnFh4sSVTk5B8eYpbCxc54TOs8oWFFOV6vx/poK5dv3nV8zhji2ODP01daY8S/Te
	cvFQIh7MuZtWJ3eeqvQ3g2lz3GcsjHiz6he9BE3mCjoO19A21UVZ23m+ScWO5qRpmfBX
	42VjerYoIjZsA4hAcg9L+iRX5SjbH26syIPDngYY7L0B9sv56FquIT+gFnE3rdHvphbJ
	dSqUizKbz/01ifjq+hqyHKgftsqkJLYpY3+Nf+4bm3YK9tifsRRrK6hAPLVbcjsIquek
	o3HljK9PBEWah6RfQnvrz7MrmbtHK3FhJZOACAAejenEhY9891n9aT7Ecr+aKQ4rHu9m
	SBzA==
X-Received: by 10.70.61.161 with SMTP id q1mr49022321pdr.33.1426129763055;
	Wed, 11 Mar 2015 20:09:23 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:e8ac:8ca1:ebf9:d91f?
	([2601:9:3580:84c:e8ac:8ca1:ebf9:d91f])
	by mx.google.com with ESMTPSA id qh6sm8230609pab.34.2015.03.11.20.09.22
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 11 Mar 2015 20:09:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1426109339-12975-1-git-send-email-randy.e.witt@linux.intel.com>
Date: Wed, 11 Mar 2015 20:09:22 -0700
Message-Id: <13FDACD4-FC30-49CD-AC52-9D614F407C5D@gmail.com>
References: <1426109339-12975-1-git-send-email-randy.e.witt@linux.intel.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: Instruct the journal to always be volatile
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
X-List-Received-Date: Thu, 12 Mar 2015 03:09:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Mar 11, 2015, at 2:28 PM, Randy Witt <randy.e.witt@linux.intel.com> =
wrote:
>=20
> When the storage mode for the journal is "auto" if /var/log/journal
> exists then the journal will flush to /var/log/journal assuming that
> /var/log/journal is persistent.
>=20
> However /var/log -> /var/volatile/log in poky, so even though
> /var/log/journal exists, it is still volatile.
>=20
> Since this can cause ordering issues due to /var/volatile needing to =
be mounted before the journal actually writes to it, just specify that =
the journal
> should always be volatile and never try to write to "persistent"
> storage. The journal will exist in /run/log/journal only.
>=20
> This also disables the "After" of the journal on var-volatile.mount
> since the ordering is no longer necessary when the journal is only
> stored in /run/log/journal.
>=20
> [Yocto #7388]


This is not right. What if I want persistent logs.? the options is just =
gone. Both cases should work. /var/volatile should only be used
when doing ro-rfs its not FHS specified anyway. Lets not go with this =
patch.

>=20
> Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
> ---
> meta/recipes-core/systemd/systemd/journald-volatile.conf | 6 ------
> meta/recipes-core/systemd/systemd_219.bb                 | 4 ++--
> 2 files changed, 2 insertions(+), 8 deletions(-)
> delete mode 100644 =
meta/recipes-core/systemd/systemd/journald-volatile.conf
>=20
> diff --git a/meta/recipes-core/systemd/systemd/journald-volatile.conf =
b/meta/recipes-core/systemd/systemd/journald-volatile.conf
> deleted file mode 100644
> index b11e160..0000000
> --- a/meta/recipes-core/systemd/systemd/journald-volatile.conf
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -# If /var/volatile is a mount point then make sure to mount it before
> -# the journal starts. This is because base-files creates a symlink
> -# /var/log -> /var/volatile/log. And if the journal starts before the =
mount
> -# happens, the journal will appear empty until restarted.
> -[Unit]
> -After=3Dvar-volatile.mount
> diff --git a/meta/recipes-core/systemd/systemd_219.bb =
b/meta/recipes-core/systemd/systemd_219.bb
> index d5eed08..f3bb0c4 100644
> --- a/meta/recipes-core/systemd/systemd_219.bb
> +++ b/meta/recipes-core/systemd/systemd_219.bb
> @@ -48,7 +48,6 @@ SRC_URI =3D =
"git://anongit.freedesktop.org/systemd/systemd;branch=3Dmaster;protocol=3D=

>            file://00-create-volatile.conf \
>            file://init \
>            file://run-ptest \
> -           file://journald-volatile.conf \
>           "
>=20
> S =3D "${WORKDIR}/git"
> @@ -145,7 +144,6 @@ do_install() {
> 	install -m 0644 ${WORKDIR}/*.rules =
${D}${sysconfdir}/udev/rules.d/
>=20
> 	install -m 0644 ${WORKDIR}/00-create-volatile.conf =
${D}${sysconfdir}/tmpfiles.d/
> -	install -D -m 0644 ${WORKDIR}/journald-volatile.conf =
${D}${systemd_unitdir}/system/systemd-journald.service.d/journald-volatile=
.conf
>=20
> 	if =
${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; =
then
> 		install -d ${D}${sysconfdir}/init.d
> @@ -170,6 +168,8 @@ do_install() {
>=20
> 	# Enable journal to forward message to syslog daemon
> 	sed -i -e 's/.*ForwardToSyslog.*/ForwardToSyslog=3Dyes/' =
${D}${sysconfdir}/systemd/journald.conf
> +	# Make the journal volatile by default.
> +	sed -i -e 's/.*Storage.*/Storage=3Dvolatile/' =
${D}${sysconfdir}/systemd/journald.conf
> 	# its needed in 216 upstream has fixed it with =
919699ec301ea507edce4a619141ed22e789ac0d
> 	# don't order journal flushing afte remote-fs.target
> 	sed -i -e 's/ remote-fs.target$//' =
${D}${systemd_unitdir}/system/systemd-journal-flush.service
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


