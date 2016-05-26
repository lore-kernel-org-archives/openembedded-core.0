Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 36FA66AC4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 20:06:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 26 May 2016 13:06:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,369,1459839600"; d="scan'208";a="975257788"
Received: from unknown (HELO [10.219.17.242]) ([10.219.17.242])
	by fmsmga001.fm.intel.com with ESMTP; 26 May 2016 13:06:27 -0700
To: openembedded-core@lists.openembedded.org
References: <1464293044-41923-1-git-send-email-alejandro.hernandez@linux.intel.com>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <574757F5.8030501@linux.intel.com>
Date: Thu, 26 May 2016 15:09:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1464293044-41923-1-git-send-email-alejandro.hernandez@linux.intel.com>
Cc: joshua.g.lock@intel.com
Subject: Re: [PATCH][jethro] systemd: re-enable mount propagation for udevd
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
X-List-Received-Date: Thu, 26 May 2016 20:06:29 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Sorry Joshua I screwed up sending the email, this is meant to be for 
Robert Yang since its for jethro

On 05/26/2016 03:04 PM, Alejandro Hernandez wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> With MountFlags=slave, those mounts then become private to the systemd-udevd
> namespace and are no longer accessible from outside the namespace, which is
> not expected
>
> [YOCTO #8613]
>
> (From OE-Core rev: 73f43d857fe0102033f25491007b6dbe3d5fa8ee)
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit f2092e67ea880301058396b831a9a18905317d0d)
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>   ...dev-re-enable-mount-propagation-for-udevd.patch | 31 ++++++++++++++++++++++
>   meta/recipes-core/systemd/systemd_225.bb           |  1 +
>   2 files changed, 32 insertions(+)
>   create mode 100644 meta/recipes-core/systemd/systemd/udev-re-enable-mount-propagation-for-udevd.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/udev-re-enable-mount-propagation-for-udevd.patch b/meta/recipes-core/systemd/systemd/udev-re-enable-mount-propagation-for-udevd.patch
> new file mode 100644
> index 0000000..23e22d4
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/udev-re-enable-mount-propagation-for-udevd.patch
> @@ -0,0 +1,31 @@
> +From: Michael Biebl <biebl@debian.org>
> +Date: Sat, 27 Sep 2014 04:19:24 +0200
> +Subject: udev: re-enable mount propagation for udevd
> +
> +Upstream-Status: Backport [http://http.debian.net/debian/pool/main/s/systemd/systemd_215-17+deb8u4.debian.tar.xz]
> +
> +laptop-mode-tools remounts file systems from within a udev rule to apply
> +certain mount options. With MountFlags=slave, those mounts then become private
> +to the systemd-udevd namespace and are no longer accessible from outside the
> +namespace.
> +While the root cause is the broken behaviour of laptop-mode-tools, with mount
> +propagation turned off, this can result in a read-only root file system.
> +Therefore revert the relevant parts from commit
> +c2c13f2df42e0691aecabe3979ea81cd7faa35c7 to re-enable mount propagation for
> +udevd.
> +
> +Once affected packages have been fixed, this patch should be dropped
> +again.
> +
> +Closes: #762018
> +diff --git a/units/systemd-udevd.service.in b/units/systemd-udevd.service.in
> +index e7216d6..1e9a600 100644
> +--- a/units/systemd-udevd.service.in
> ++++ b/units/systemd-udevd.service.in
> +@@ -21,6 +21,5 @@ Sockets=systemd-udevd-control.socket systemd-udevd-kernel.socket
> + Restart=always
> + RestartSec=0
> + ExecStart=@rootlibexecdir@/systemd-udevd
> +-MountFlags=slave
> + KillMode=mixed
> + WatchdogSec=1min
> diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
> index 18c2448..a2122e0 100644
> --- a/meta/recipes-core/systemd/systemd_225.bb
> +++ b/meta/recipes-core/systemd/systemd_225.bb
> @@ -46,6 +46,7 @@ SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
>              file://init \
>              file://run-ptest \
>              file://rules-whitelist-hd-devices.patch \
> +           file://udev-re-enable-mount-propagation-for-udevd.patch \
>             "
>   SRC_URI_append_qemuall = " file://qemuall_io_latency-core-device.c-Change-the-default-device-timeout-to-2.patch"
>   


