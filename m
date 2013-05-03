Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kevin.strasser@linux.intel.com>) id 1UYO3J-0000Hl-Jd
	for openembedded-core@lists.openembedded.org;
	Sat, 04 May 2013 00:02:09 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 May 2013 14:43:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,607,1363158000"; d="scan'208";a="307731181"
Received: from wrk.jf.intel.com (HELO localhost) ([10.7.202.72])
	by orsmga001.jf.intel.com with ESMTP; 03 May 2013 14:43:49 -0700
Date: Fri, 3 May 2013 14:40:34 -0700
From: Kevin Strasser <kevin.strasser@linux.intel.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Message-ID: <20130503214032.GA26747@wrk>
References: <1367571664-2079-1-git-send-email-laurentiu.palcu@intel.com>
MIME-Version: 1.0
In-Reply-To: <1367571664-2079-1-git-send-email-laurentiu.palcu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] archive-*-source.bbclass: have do_dumpdata_create_diff_gz task run before do_rootfs
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
X-List-Received-Date: Fri, 03 May 2013 22:02:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Laurentiu,

On Fri, May 03, 2013 at 12:01:04PM +0300, Laurentiu Palcu wrote:
> do_rootfs[cleandirs] contains ${S} and, if do_rootfs task starts before
> the do_dumpdata_create_diff_gz is finished, an error will occur in the
> process because the directory will be removed while still needed by the
> create_diff_gz() function.
> 
> This patch will force the do_dumpdata_create_diff_gz task to run before
> do_rootfs when the final image is created.
> 
> [YOCTO #4310]
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/classes/archive-configured-source.bbclass |    2 +-
>  meta/classes/archive-original-source.bbclass   |    2 +-
>  meta/classes/archive-patched-source.bbclass    |    2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/archive-configured-source.bbclass b/meta/classes/archive-configured-source.bbclass
> index d346f69..a481b14 100644
> --- a/meta/classes/archive-configured-source.bbclass
> +++ b/meta/classes/archive-configured-source.bbclass
> @@ -14,7 +14,7 @@ addtask do_archive_configured_sources after do_configure
>  addtask do_archive_scripts_logs
>  
>  # Get dump date and create diff file 
> -addtask do_dumpdata_create_diff_gz
> +addtask do_dumpdata_create_diff_gz before do_rootfs
This will always add the task to the build, and break our ability to
filter out packages. I would suggest handling this dependency in the
anonymous python function after filtering has been applied.
>  
>  python () {
>      pn = d.getVar('PN', True)
> diff --git a/meta/classes/archive-original-source.bbclass b/meta/classes/archive-original-source.bbclass
> index 7258293..2796ff9 100644
> --- a/meta/classes/archive-original-source.bbclass
> +++ b/meta/classes/archive-original-source.bbclass
> @@ -14,7 +14,7 @@ addtask do_archive_original_sources_patches after do_unpack
>  addtask do_archive_scripts_logs
>  
>  # Get dump date and create diff file 
> -addtask do_dumpdata_create_diff_gz
> +addtask do_dumpdata_create_diff_gz before do_rootfs
ditto
>  
>  python () {
>      pn = d.getVar('PN', True)
> diff --git a/meta/classes/archive-patched-source.bbclass b/meta/classes/archive-patched-source.bbclass
> index 9e5ec74..995a259 100644
> --- a/meta/classes/archive-patched-source.bbclass
> +++ b/meta/classes/archive-patched-source.bbclass
> @@ -14,7 +14,7 @@ addtask do_archive_patched_sources after do_patch
>  addtask do_archive_scripts_logs
>  
>  # Get dump date and create diff file 
> -addtask do_dumpdata_create_diff_gz
> +addtask do_dumpdata_create_diff_gz before do_rootfs
ditto

Thanks,
Kevin
>  
>  python () {
>      pn = d.getVar('PN', True)
> -- 
> 1.7.9.5
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


