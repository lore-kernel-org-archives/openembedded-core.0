Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 99305610F5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 18:07:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Aug 2014 11:07:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,826,1400050800"; d="scan'208";a="582098365"
Received: from unknown (HELO [10.255.12.111]) ([10.255.12.111])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2014 11:07:30 -0700
Message-ID: <53E511E2.10300@linux.intel.com>
Date: Fri, 08 Aug 2014 11:07:30 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Sujith H <sujith.h@gmail.com>, 
 openembedded-core@lists.openembedded.org
References: <1407488988-14910-1-git-send-email-sujith.h@gmail.com>
In-Reply-To: <1407488988-14910-1-git-send-email-sujith.h@gmail.com>
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	Muzaffar Mahmood <muzaffar_mahmood@mentor.com>
Subject: Re: [PATCH] psplash: Adding support for systemd service files
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
X-List-Received-Date: Fri, 08 Aug 2014 18:07:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2014 02:09 AM, Sujith H wrote:
> From: Sujith H <Sujith_Haridasan@mentor.com>
>
> If the DISTRO_FEATURES has systemd, then its better
> to have corresponding service files associated with
> the psplash. This change will help to do the same.
>
Can you propose a patch to the psplash upstream which is part of the 
Yocto Project (send the patch to yocto@yoctoproject.org) and then we can 
do a psplash upgrade to include these files directly?

Thanks
	Sau!

> Signed-off-by: Muzaffar Mahmood <muzaffar_mahmood@mentor.com>
> Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
> ---
>   meta/recipes-core/psplash/files/psplash-quit.service  | 11 +++++++++++
>   meta/recipes-core/psplash/files/psplash-start.service | 11 +++++++++++
>   meta/recipes-core/psplash/psplash_git.bb              | 12 +++++++++++-
>   3 files changed, 33 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-core/psplash/files/psplash-quit.service
>   create mode 100644 meta/recipes-core/psplash/files/psplash-start.service
>
> diff --git a/meta/recipes-core/psplash/files/psplash-quit.service b/meta/recipes-core/psplash/files/psplash-quit.service
> new file mode 100644
> index 0000000..14bd499
> --- /dev/null
> +++ b/meta/recipes-core/psplash/files/psplash-quit.service
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=Terminate Psplash Boot Screen
> +After=psplash-start.service
> +
> +[Service]
> +Type=oneshot
> +ExecStart=/usr/bin/psplash-write QUIT
> +TimeoutSec=20
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta/recipes-core/psplash/files/psplash-start.service b/meta/recipes-core/psplash/files/psplash-start.service
> new file mode 100644
> index 0000000..502b150
> --- /dev/null
> +++ b/meta/recipes-core/psplash/files/psplash-start.service
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=Starts Psplash Boot screen
> +Wants=systemd-vconsole-setup.service
> +After=systemd-vconsole-setup.service systemd-udev-trigger.service systemd-udevd.service
> +DefaultDependencies=no
> +
> +[Service]
> +ExecStart=/usr/bin/psplash
> +
> +[Install]
> +WantedBy=sysinit.target
> diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
> index 628ced4..16fa0ae 100644
> --- a/meta/recipes-core/psplash/psplash_git.bb
> +++ b/meta/recipes-core/psplash/psplash_git.bb
> @@ -11,6 +11,8 @@ PR = "r15"
>
>   SRC_URI = "git://git.yoctoproject.org/${BPN} \
>              file://psplash-init \
> +           file://psplash-start.service \
> +           file://psplash-quit.service \
>              ${SPLASH_IMAGES}"
>
>   SPLASH_IMAGES = "file://psplash-poky-img.h;outsuffix=default"
> @@ -65,11 +67,14 @@ python __anonymous() {
>
>   S = "${WORKDIR}/git"
>
> -inherit autotools pkgconfig update-rc.d update-alternatives
> +inherit autotools pkgconfig update-rc.d update-alternatives systemd
>
>   ALTERNATIVE_PRIORITY = "100"
>   ALTERNATIVE_LINK_NAME[psplash] = "${bindir}/psplash"
>
> +SYSTEMD_PACKAGES = "${@base_contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
> +SYSTEMD_SERVICE_${PN} = "${@base_contains('DISTRO_FEATURES','systemd','psplash-start.service psplash-quit.service','',d)}"
> +
>   python do_compile () {
>       import shutil
>
> @@ -103,6 +108,11 @@ do_install_append() {
>   		install -m 0755 $i ${D}${bindir}/$i
>   	done
>   	rm -f ${D}${bindir}/psplash
> +
> +	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +                install -d ${D}${systemd_unitdir}/system
> +                install -m 644 ${WORKDIR}/*.service ${D}/${systemd_unitdir}/system
> +        fi
>   }
>
>   FILES_${PN} += "/mnt/.psplash"
>

