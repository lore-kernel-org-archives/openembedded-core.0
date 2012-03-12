Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1S7Aaj-0008L9-TB
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 20:07:34 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2CIwoN2014859
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2012 11:58:50 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 12 Mar 2012 11:58:50 -0700
Message-ID: <4F5E4768.7030906@windriver.com>
Date: Mon, 12 Mar 2012 13:58:48 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 12 Mar 2012 19:07:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

A few quick comments to match up with the patch 2/3 comments..

On 3/3/12 4:54 AM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> This is configuration file to point to what content a archive package
> should include in the different stage of task by pointing to different variable and
> stage.
>
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

This seems odd that configuration items would be in a .bbclass file.  I would 
have expected the configuration to inherit the archiver, and then either a 
default set of values be specified in the archive.bbclass or in the bitbake.conf 
(or similar)....

As for the defaults below, I think they are fine....

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

Instead of do_unpack[postfuncs] would a do_patch[prefuncs] be better?  This 
would ensure that do_unpack and all other tasks between do_unpack and do_patch 
were run first... then do we can archive the results..

> +
> +# Open this item when you want to get tarball for patched sources including patches
> +#do_patch[postfuncs] += "do_archive_patched_sources "

Perhaps the same here between do_patch and do_configure...

--Mark

> +
> +# Open this item when you want to get tarball for configured sources including patches
> +#do_configure[postfuncs] += "do_archive_configured_sources "
> +
> +# Open this item when you want to get tarball for logs tarball
> +do_package_write_rpm[prefuncs] += "do_archive_scripts_logs "
> +
> +# Get dump date and create diff file
> +do_package_write_rpm[postfuncs] += "do_dumpdata_create_diff_gz "
> -- 1.7.0.4 _______________________________________________ Openembedded-core
> mailing list Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


