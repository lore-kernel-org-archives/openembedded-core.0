Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7683272277
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 22:45:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 28 Apr 2015 15:45:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,666,1422950400"; d="scan'208";a="486901249"
Received: from vkarnati-mobl2.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.33.210])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Apr 2015 15:45:17 -0700
Message-ID: <55400D7D.1090408@linux.intel.com>
Date: Tue, 28 Apr 2015 15:45:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org
References: <1430258684-432-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1430258684-432-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH] busybox: unbreak tar of uncompressed files
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
X-List-Received-Date: Tue, 28 Apr 2015 22:45:19 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


This is intended for Dizzy, will resend with the correct tag for tracking

Sau!


On 04/28/2015 03:04 PM, Saul Wold wrote:
> A patch was added to fix compressed tar files, but broke uncompressed
> tar files, this fix is from the busybox mailing list
>
> http://lists.busybox.net/pipermail/busybox/2014-January/080389.html
>
> [YOCTO #7645]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   .../busybox/unbreak_noncompressed_tar.patch        | 23 ++++++++++++++++++++++
>   meta/recipes-core/busybox/busybox_1.22.1.bb        |  1 +
>   2 files changed, 24 insertions(+)
>   create mode 100644 meta/recipes-core/busybox/busybox/unbreak_noncompressed_tar.patch
>
> diff --git a/meta/recipes-core/busybox/busybox/unbreak_noncompressed_tar.patch b/meta/recipes-core/busybox/busybox/unbreak_noncompressed_tar.patch
> new file mode 100644
> index 0000000..3c3c23a
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/unbreak_noncompressed_tar.patch
> @@ -0,0 +1,23 @@
> +
> +This patch allows tar to continue correctly when it does not detect
> +a compressed format. This allows tar to then untar a non-compressed
> +tar file.
> +
> +See this thread for details: http://lists.busybox.net/pipermail/busybox/2014-January/080389.html
> +
> +Upstream-Status: Inappropriate [Upstream has different fix with additional functionality]
> +Signed-off-by: Saul Wold <sgw@linux.intel.com>
> +
> +Index: busybox-1.22.1/archival/libarchive/open_transformer.c
> +===================================================================
> +--- busybox-1.22.1.orig/archival/libarchive/open_transformer.c
> ++++ busybox-1.22.1/archival/libarchive/open_transformer.c
> +@@ -200,7 +200,7 @@ int FAST_FUNC open_zipped(const char *fn
> + 	 || (ENABLE_FEATURE_SEAMLESS_BZ2)
> + 	 || (ENABLE_FEATURE_SEAMLESS_XZ)
> + 	) {
> +-		setup_unzip_on_fd(fd, /*fail_if_not_detected:*/ 1);
> ++		setup_unzip_on_fd(fd, /*fail_if_not_detected:*/ 0);
> + 	}
> +
> + 	return fd;
> diff --git a/meta/recipes-core/busybox/busybox_1.22.1.bb b/meta/recipes-core/busybox/busybox_1.22.1.bb
> index ae8eca7..1b1eaf3 100644
> --- a/meta/recipes-core/busybox/busybox_1.22.1.bb
> +++ b/meta/recipes-core/busybox/busybox_1.22.1.bb
> @@ -35,6 +35,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://CVE-2014-9645_busybox_reject_module_names_with_slashes.patch \
>              file://lzop-add-overflow-check.patch \
>              file://libarchive-open_zipped-does-not-need-to-check-extens.patch \
> +           file://unbreak_noncompressed_tar.patch \
>   "
>
>   SRC_URI[tarball.md5sum] = "337d1a15ab1cb1d4ed423168b1eb7d7e"
>

