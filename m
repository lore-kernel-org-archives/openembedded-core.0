Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S4gMz-0007kr-C4
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 23:27:05 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Mar 2012 14:18:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="125338736"
Received: from unknown (HELO [10.255.15.110]) ([10.255.15.110])
	by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2012 14:18:29 -0800
Message-ID: <4F553BB5.9040405@linux.intel.com>
Date: Mon, 05 Mar 2012 14:18:29 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1330771239.git.xiaofeng.yan@windriver.com>
	<6b45ee6d33a54d9abcbc0dd28f383a4993795017.1330771239.git.xiaofeng.yan@windriver.com>
In-Reply-To: <6b45ee6d33a54d9abcbc0dd28f383a4993795017.1330771239.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 3/3] archiver_configure.bbclass: configure the content for archiving package
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
X-List-Received-Date: Mon, 05 Mar 2012 22:27:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2012 02:54 AM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> This is configuration file to point to what content a archive package
> should include in the different stage of task by pointing to different variable and
> stage.
>
Xiaogeng,

You are on the right path with this one, but what was originally talked 
about was having multiple archiver bbclasses that did the configuration 
and set when the archive would take place.

Than one could just inherit the bbclass that matches their needs, so 
there should be a bbclass that's equivalent to the current copyleft 
bbclass. And as we defined in earlier emails the 3-4 archives, we should 
have matching bbclasses for those.

1) Original Source & Patches w/ Series file & other files
2) Patched & Configured Source & temp dir
3) Copyleft Equivlant (so we can remove that class also)

Sau!


> [YOCTO #1977]
>
> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>   meta/classes/archiver_configure.bbclass |   35 +++++++++++++++++++++++++++++++
>   1 files changed, 35 insertions(+), 0 deletions(-)
>   create mode 100644 meta/classes/archiver_configure.bbclass
>
> diff --git a/meta/classes/archiver_configure.bbclass b/meta/classes/archiver_configure.bbclass
> new file mode 100644
> index 0000000..c9892d3
> --- /dev/null
> +++ b/meta/classes/archiver_configure.bbclass
> @@ -0,0 +1,35 @@
> +# This file is for getting tarball in different stage for sources, patches, and logs by configuring
> +# the following variable and tasks
> +
> +inherit archiver
> +
> +# SOURCE_ARCHIVE_PACKAGE_TYPE = {'tar','srpm'}
> +SOURCE_ARCHIVE_PACKAGE_TYPE = 'tar'
> +
> +# SOURCE_ARCHIVE_LOG_WITH_SCRIPTS = {'logs_with_scripts', 'logs'}
> +# String 'logs_with_scripts' include temp directory and .bb and .inc file
> +# String 'logs' only include temp
> +SOURCE_ARCHIVE_LOG_WITH_SCRIPTS = 'logs_with_scripts'
> +
> +# PATCHES_ARCHIVE_WITH_SERIES = {'true', 'false'}
> +# Strings 'true' means that patches including series files(series + non-applying)
> +# String 'false' means that no series and only archive applying patches
> +PATCHES_ARCHIVE_WITH_SERIES = 'true'
> +
> +# Archive packages for copy-left
> +#COPYLEFT_COMPLIANCE = 'true'
> +
> +# Open this item when you want to get original sources tarball with patches
> +do_unpack[postfuncs] += "do_archive_original_sources_patches "
> +
> +# Open this item when you want to get tarball for patched sources including patches
> +#do_patch[postfuncs] += "do_archive_patched_sources "
> +
> +# Open this item when you want to get tarball for configured sources including patches
> +#do_configure[postfuncs] += "do_archive_configured_sources "
> +
> +# Open this item when you want to get tarball for logs tarball
> +do_package_write_rpm[prefuncs] += "do_archive_scripts_logs "
> +
> +# Get dump date and create diff file
> +do_package_write_rpm[postfuncs] += "do_dumpdata_create_diff_gz "


