Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJrAf-0007Wl-TF
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 19:56:34 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 May 2011 10:53:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,346,1301900400"; 
   d="scan'208";a="430850"
Received: from unknown (HELO [10.255.12.75]) ([10.255.12.75])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2011 10:53:43 -0700
Message-ID: <4DC97BA7.1050304@linux.intel.com>
Date: Tue, 10 May 2011 10:53:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1304995908.git.dexuan.cui@intel.com>
	<29a6f5e598717a6c701495174db9ef4f448e64e7.1304995908.git.dexuan.cui@intel.com>
In-Reply-To: <29a6f5e598717a6c701495174db9ef4f448e64e7.1304995908.git.dexuan.cui@intel.com>
Subject: Re: [PATCH 1/1] rsync (GPLv2): fix security vulnerability CVE-2007-4091
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
X-List-Received-Date: Tue, 10 May 2011 17:56:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2011 07:54 PM, Dexuan Cui wrote:
> From: Dexuan Cui<dexuan.cui@intel.com>
>
> Added a patch to fix
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4091
>
> Signed-off-by: Dexuan Cui<dexuan.cui@intel.com>
> ---
>   .../rsync/rsync-2.6.9/rsync-2.6.9-fname-obo.patch  |   70 ++++++++++++++++++++
>   meta/recipes-devtools/rsync/rsync_2.6.9.bb         |    3 +-
>   2 files changed, 72 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-devtools/rsync/rsync-2.6.9/rsync-2.6.9-fname-obo.patch
>
> diff --git a/meta/recipes-devtools/rsync/rsync-2.6.9/rsync-2.6.9-fname-obo.patch b/meta/recipes-devtools/rsync/rsync-2.6.9/rsync-2.6.9-fname-obo.patch
> new file mode 100644
> index 0000000..f054452
> --- /dev/null
> +++ b/meta/recipes-devtools/rsync/rsync-2.6.9/rsync-2.6.9-fname-obo.patch
> @@ -0,0 +1,70 @@
> +Upstream-Status: Backport [ The patch is rsync-2.6.9 specific ]
> +
> +The patch is from https://issues.rpath.com/browse/RPL-1647 and is used to
> +address http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4091
> +
> +Date:   Tue May 10 10:07:36 2011 +0800
> +Dexuan Cui<dexuan.cui@intel.com>
> +
> +diff --git a/sender.c b/sender.c
> +index 6fcaa65..053a8f1 100644
> +--- a/sender.c
> ++++ b/sender.c
> +@@ -123,6 +123,7 @@ void successful_send(int ndx)
> + 	char fname[MAXPATHLEN];
> + 	struct file_struct *file;
> + 	unsigned int offset;
> ++	size_t l = 0;
> +
> + 	if (ndx<  0 || ndx>= the_file_list->count)
> + 		return;
> +@@ -133,6 +134,20 @@ void successful_send(int ndx)
> + 				    file->dir.root, "/", NULL);
> + 	} else
> + 		offset = 0;
> ++
> ++	l = offset + 1;
> ++	if (file) {
> ++		if (file->dirname)
> ++			l += strlen(file->dirname);
> ++		if (file->basename)
> ++			l += strlen(file->basename);
> ++	}
> ++
> ++	if (l>= sizeof(fname)) {
> ++		rprintf(FERROR, "Overlong pathname\n");
> ++		exit_cleanup(RERR_FILESELECT);
> ++	}
> ++
> + 	f_name(file, fname + offset);
> + 	if (remove_source_files) {
> + 		if (do_unlink(fname) == 0) {
> +@@ -224,6 +239,7 @@ void send_files(struct file_list *flist, int f_out, int f_in)
> + 	enum logcode log_code = log_before_transfer ? FLOG : FINFO;
> + 	int f_xfer = write_batch<  0 ? batch_fd : f_out;
> + 	int i, j;
> ++	size_t l = 0;
> +
> + 	if (verbose>  2)
> + 		rprintf(FINFO, "send_files starting\n");
> +@@ -259,6 +275,20 @@ void send_files(struct file_list *flist, int f_out, int f_in)
> + 				fname[offset++] = '/';
> + 		} else
> + 			offset = 0;
> ++
> ++		l = offset + 1;
> ++		if (file) {
> ++			if (file->dirname)
> ++				l += strlen(file->dirname);
> ++			if (file->basename)
> ++				l += strlen(file->basename);
> ++		}
> ++
> ++		if (l>= sizeof(fname)) {
> ++			rprintf(FERROR, "Overlong pathname\n");
> ++			exit_cleanup(RERR_FILESELECT);
> ++		}
> ++
> + 		fname2 = f_name(file, fname + offset);
> +
> + 		if (verbose>  2)
> diff --git a/meta/recipes-devtools/rsync/rsync_2.6.9.bb b/meta/recipes-devtools/rsync/rsync_2.6.9.bb
> index 4337982..17c18a4 100644
> --- a/meta/recipes-devtools/rsync/rsync_2.6.9.bb
> +++ b/meta/recipes-devtools/rsync/rsync_2.6.9.bb
> @@ -8,6 +8,7 @@ PRIORITY = "optional"
>   DEPENDS = "popt"
>
>   SRC_URI = "http://rsync.samba.org/ftp/rsync/src/rsync-${PV}.tar.gz \
> +           file://rsync-2.6.9-fname-obo.patch \
>              file://rsyncd.conf"
>
>   inherit autotools
> @@ -22,4 +23,4 @@ EXTRA_OEMAKE='STRIP=""'
>   LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=6d5a9d4c4d3af25cd68fd83e8a8cb09c"
>
> -PR = "r2"
> +PR = "r3"

Merged into oe-core and poky/master and staged for Bernard

Thanks
	Sau!


