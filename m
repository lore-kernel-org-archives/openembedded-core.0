Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C4D716A918
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 18:01:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8NI1ont016331
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 11:01:50 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Mon, 23 Sep 2013 11:01:49 -0700
Message-ID: <5240820E.5020407@windriver.com>
Date: Mon, 23 Sep 2013 13:01:50 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1379954041-5575-1-git-send-email-david.nystrom@enea.com>
	<1379954041-5575-2-git-send-email-david.nystrom@enea.com>
In-Reply-To: <1379954041-5575-2-git-send-email-david.nystrom@enea.com>
Subject: Re: [PATCH] shadow: Create recipe nativesdk-shadow
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
X-List-Received-Date: Mon, 23 Sep 2013 18:01:49 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

This looks to be the same as the 'native' package, but I don't think you can 
just add a BBCLASSEXTEND = "nativesdk"

Perhaps (in 1.6) someone should look at merging the three back together.

If this is the same as the native version, I'd suggest adding a comment stating 
as much so we can hopefully keep them in sync.

--Mark

On 9/23/13 11:34 AM, David Nyström wrote:
> This is a second in a series of patches to enable
> offline rootfs creation from a package repository.
>
> Some postinstall cmds are Yocto specific and needed to create a
> rootfs with pre and post install hooks successfully run,
> using only the toolchain tarball + a package repo.
>
> End goal is to create a sandbox where _users_ of a Yocto
> based distribution can customize a rootfs from a package feed
> with their package manager of choice.
>
> With this patch, I can successfully create packagegroup-core-boot
> with only the toolchain tarball(OPKG). More fixes for a few postinstall
> hooks outside of packagegroup-core-boot will come next.
>
> Signed-off-by: David Nyström <david.nystrom@enea.com>
> ---
>   .../nativesdk-packagegroup-sdk-host.bb             |  1 +
>   .../shadow/nativesdk-shadow_4.1.4.3.bb             | 62 ++++++++++++++++++++++
>   2 files changed, 63 insertions(+)
>   create mode 100644 meta/recipes-extended/shadow/nativesdk-shadow_4.1.4.3.bb
>
> diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> index 84fb95d..5a64934 100644
> --- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> +++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> @@ -20,6 +20,7 @@ RDEPENDS_${PN} = "\
>       nativesdk-libtool \
>       nativesdk-autoconf \
>       nativesdk-automake \
> +    ${@base_contains('DISTRO_FEATURES', 'pam', 'nativesdk-shadow', '', d)} \
>       "
>
>   RDEPENDS_${PN}_darwin = "\
> diff --git a/meta/recipes-extended/shadow/nativesdk-shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/nativesdk-shadow_4.1.4.3.bb
> new file mode 100644
> index 0000000..22f4cf3
> --- /dev/null
> +++ b/meta/recipes-extended/shadow/nativesdk-shadow_4.1.4.3.bb
> @@ -0,0 +1,62 @@
> +SUMMARY = "Tools to change and administer password and group data"
> +DESCRIPTION = "Tools to change and administer password and group data"
> +HOMEPAGE = "http://pkg-shadow.alioth.debian.org"
> +BUGTRACKER = "https://alioth.debian.org/tracker/?group_id=30580"
> +SECTION = "base utils"
> +LICENSE = "BSD | Artistic-1.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
> +                    file://src/passwd.c;beginline=8;endline=30;md5=d83888ea14ae61951982d77125947661"
> +
> +PR = "r8"
> +
> +inherit autotools gettext nativesdk
> +
> +SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/shadow-${PV}.tar.bz2 \
> +           file://shadow.automake-1.11.patch \
> +           file://shadow-4.1.3-dots-in-usernames.patch \
> +           file://shadow-4.1.4.2-env-reset-keep-locale.patch \
> +           file://add_root_cmd_options.patch \
> +           file://disable-syslog.patch \
> +           file://useradd.patch \
> +           file://shadow_fix_for_automake-1.12.patch \
> +           file://add_root_cmd_groupmems.patch \
> +           "
> +
> +SRC_URI[md5sum] = "b8608d8294ac88974f27b20f991c0e79"
> +SRC_URI[sha256sum] = "633f5bb4ea0c88c55f3642c97f9d25cbef74f82e0b4cf8d54e7ad6f9f9caa778"
> +
> +S = "${WORKDIR}/shadow-${PV}"
> +
> +EXTRA_OECONF += "--without-audit \
> +                 --without-libcrack \
> +                 --without-libpam \
> +                 --without-selinux \
> +                 --without-nscd"
> +
> +do_install() {
> +	oe_runmake DESTDIR="${D}" sbindir="${base_sbindir}" usbindir="${sbindir}" install
> +
> +	# Info dir listing isn't interesting at this point so remove it if it exists.
> +	if [ -e "${D}${infodir}/dir" ]; then
> +		rm -f ${D}${infodir}/dir
> +	fi
> +
> +	# Enable CREATE_HOME by default.
> +	sed -i 's/#CREATE_HOME/CREATE_HOME/g' ${D}${sysconfdir}/login.defs
> +
> +	# As we are on an embedded system, ensure the users mailbox is in
> +	# ~/ not /var/spool/mail by default, as who knows where or how big
> +	# /var is. The system MDA will set this later anyway.
> +	sed -i 's/MAIL_DIR/#MAIL_DIR/g' ${D}${sysconfdir}/login.defs
> +	sed -i 's/#MAIL_FILE/MAIL_FILE/g' ${D}${sysconfdir}/login.defs
> +
> +	# Disable checking emails.
> +	sed -i 's/MAIL_CHECK_ENAB/#MAIL_CHECK_ENAB/g' ${D}${sysconfdir}/login.defs
> +
> +	# Now we don't have a mail system. Disable mail creation for now.
> +	sed -i 's:/bin/bash:/bin/sh:g' ${D}${sysconfdir}/default/useradd
> +	sed -i '/^CREATE_MAIL_SPOOL/ s:^:#:' ${D}${sysconfdir}/default/useradd
> +
> +	# Use users group by default
> +	sed -i 's,^GROUP=1000,GROUP=100,g' ${D}${sysconfdir}/default/useradd
> +}
>


