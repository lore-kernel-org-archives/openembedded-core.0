Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TJ4OJ-0004mf-5x
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 17:28:11 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 02 Oct 2012 08:15:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,524,1344236400"; d="scan'208";a="151538547"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Oct 2012 08:15:11 -0700
Message-ID: <506B04FE.1000502@linux.intel.com>
Date: Tue, 02 Oct 2012 08:15:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1348921205.4422.47.camel@x121e.pbcl.net>
In-Reply-To: <1348921205.4422.47.camel@x121e.pbcl.net>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] opkg: Don't call sync() when installing into an offline root
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Oct 2012 15:28:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/29/2012 05:20 AM, Phil Blundell wrote:
> Even when installing onto a live target system, calling sync() during
> package installation is of somewhat questionable benefit.  But calling
> it on the build host during rootfs construction is certainly useless and
> can cause I/O to stall for several seconds on even a moderately sized
> host which is clearly not desirable.
>
> (From a patch originally by Mike Crowe.)
>
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>   .../opkg/opkg/opkg-no-sync-offline.patch             |   18 ++++++++++++++++++
>   meta/recipes-devtools/opkg/opkg_svn.bb               |    3 ++-
>   2 files changed, 20 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/opkg/opkg/opkg-no-sync-offline.patch
>
> diff --git a/meta/recipes-devtools/opkg/opkg/opkg-no-sync-offline.patch b/meta/recipes-devtools/opkg/opkg/opkg-no-sync-offline.patch
> new file mode 100644
> index 0000000..b1b3453
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/opkg-no-sync-offline.patch
> @@ -0,0 +1,18 @@
> +When installing into an offline root, calling sync() is pointless and just
> +hurts performance.  Don't let's do that.
> +
> +Signed-off-by: Phil Blundell <philb@gnu.org>
> +Upstream-Status: Pending
> +
> +--- a/libopkg/opkg_cmd.c	2011-09-08 10:53:07.000000000 +0100
> ++++ b/libopkg/opkg_cmd.c	2011-10-04 10:45:22.278615584 +0100
> +@@ -64,7 +64,8 @@ write_status_files_if_changed(void)
> + 	  opkg_msg(INFO, "Writing status file.\n");
> + 	  opkg_conf_write_status_files();
> + 	  pkg_write_changed_filelists();
> +-	  sync();
> ++	  if (!conf->offline_root)
> ++	      sync();
> +      } else {
> + 	  opkg_msg(DEBUG, "Nothing to be done.\n");
> +      }
> diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
> index 820a224..f206cd5 100644
> --- a/meta/recipes-devtools/opkg/opkg_svn.bb
> +++ b/meta/recipes-devtools/opkg/opkg_svn.bb
> @@ -9,6 +9,7 @@ SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
>     file://0006-detect-circular-dependencies.patch \
>     file://0007-merge-newpkg-provides-even-when-oldpkg-provides-exis.patch \
>     file://0008-select_higher_version.patch \
> +  file://opkg-no-sync-offline.patch \
>   "
>
>   S = "${WORKDIR}/trunk"
> @@ -16,4 +17,4 @@ S = "${WORKDIR}/trunk"
>   SRCREV = "633"
>   PV = "0.1.8+svnr${SRCPV}"
>
> -PR = "${INC_PR}.4"
> +PR = "${INC_PR}.5"
>

Merged into OE-Core (with additional PR bump)

Thanks
	Sau!



