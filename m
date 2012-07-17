Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrGul-0003Lz-3y
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 01:10:47 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jul 2012 15:59:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="179123348"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jul 2012 15:59:25 -0700
Message-ID: <5005EE4D.7050200@linux.intel.com>
Date: Tue, 17 Jul 2012 15:59:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Andrei Gherzan <andrei@gherzan.ro>, "Burton, Ross" <ross.burton@intel.com>
References: <8afb1ea6ef0d40d68203d164a6ad1d0cf45793fd.1342544558.git.andrei@gherzan.ro>
	<3d20c37040fb3d1a88003ff5e5d71e1b1e14e553.1342544558.git.andrei@gherzan.ro>
In-Reply-To: <3d20c37040fb3d1a88003ff5e5d71e1b1e14e553.1342544558.git.andrei@gherzan.ro>
Subject: Re: [PATCH V4 4/4] connman: fix crashes on startup on PPC/MIPS
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
X-List-Received-Date: Tue, 17 Jul 2012 23:10:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2012 10:06 AM, Andrei Gherzan wrote:
> From: Ross Burton <ross.burton@intel.com>
>
> It appears that when there is no existing connman state there is memory
> corruption which causes free() on MIPS/PPC to abort.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   ...ck-that-the-string-isn-t-empty-before-spl.patch |   37 ++++++++++++++++++++
>   meta/recipes-connectivity/connman/connman_1.3.bb   |    5 +--
>   2 files changed, 40 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-connectivity/connman/connman/0001-storage-check-that-the-string-isn-t-empty-before-spl.patch
>
> diff --git a/meta/recipes-connectivity/connman/connman/0001-storage-check-that-the-string-isn-t-empty-before-spl.patch b/meta/recipes-connectivity/connman/connman/0001-storage-check-that-the-string-isn-t-empty-before-spl.patch
> new file mode 100644
> index 0000000..c92b586
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/0001-storage-check-that-the-string-isn-t-empty-before-spl.patch
> @@ -0,0 +1,37 @@
> +From ea8c7b3efce4c1762411e073893e948de5d552d6 Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@intel.com>
> +Date: Tue, 17 Jul 2012 16:04:12 +0100
> +Subject: [PATCH] storage: check that the string isn't empty before splitting
> +
> +If the string was non-NULL but empty (str="\0"), the following \0 assignment
> +would write to str[-1] and thus cause memory corruption.
> +
> +On PPC and MIPS, this was causing crashes in glibc.
> +
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +Upstream-Status: Submitted
> +
> +---
> + src/storage.c |    6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/storage.c b/src/storage.c
> +index 47bd0cb..20766a3 100644
> +--- a/src/storage.c
> ++++ b/src/storage.c
> +@@ -212,7 +212,11 @@ gchar **connman_storage_get_services()
> + 	closedir(dir);
> +
> + 	str = g_string_free(result, FALSE);
> +-	if (str) {
> ++	if (str && str[0] != '\0') {
> ++		/*
> ++		 * Remove the trailing separator so that services doesn't end up
> ++		 * with an empty element.
> ++		 */
> + 		str[strlen(str) - 1] = '\0';
> + 		services = g_strsplit(str, "/", -1);
> + 	}
> +--
> +1.7.10.4
> +
> diff --git a/meta/recipes-connectivity/connman/connman_1.3.bb b/meta/recipes-connectivity/connman/connman_1.3.bb
> index a98b46c..1e3ee56 100644
> --- a/meta/recipes-connectivity/connman/connman_1.3.bb
> +++ b/meta/recipes-connectivity/connman/connman_1.3.bb
> @@ -7,6 +7,7 @@ SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
>               file://add_xuser_dbus_permission.patch \
>               file://connman \
>               file://0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch \
> -            file://0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch"
> +            file://0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch \
> +            file://storage-check-that-the-string-isn-t-empty-before-spl.patch"
Patch name here does not match the filename created above!

Sau!

>   S = "${WORKDIR}/git"
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.2"
>



