Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TiCNL-0000DU-W7
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 00:03:08 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Dec 2012 14:48:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,254,1355126400"; d="scan'208";a="262101287"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.85])
	by fmsmga002.fm.intel.com with ESMTP; 10 Dec 2012 14:48:27 -0800
Message-ID: <50C666BB.1090707@linux.intel.com>
Date: Mon, 10 Dec 2012 14:48:27 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Stan Hu <stanhu@gmail.com>
References: <1355089073-30880-1-git-send-email-stanhu@gmail.com>
In-Reply-To: <1355089073-30880-1-git-send-email-stanhu@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] procps: apply patch from Ubuntu to finally get rid of 'Unknown Hz value'
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
X-List-Received-Date: Mon, 10 Dec 2012 23:03:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/09/2012 01:37 PM, Stan Hu wrote:
> Patch ported from openembedded tree:
>
> http://cgit.openembedded.org/openembedded/commit/?id=ce2d4f482a41ee2b8884095174ce278d8fc277de
> ---
>   .../procps/procps-3.2.8/linux-version-init.patch   |   45 ++++++++++++++++++++
>   1 file changed, 45 insertions(+)
>   create mode 100644 meta/recipes-extended/procps/procps-3.2.8/linux-version-init.patch
>
Not sure how this was tested, as I don's see any changes to the procps 
recipe itself to add the patch and bump the PR (although that's going 
away shortly).

> diff --git a/meta/recipes-extended/procps/procps-3.2.8/linux-version-init.patch b/meta/recipes-extended/procps/procps-3.2.8/linux-version-init.patch
> new file mode 100644
> index 0000000..9c1477a
> --- /dev/null
> +++ b/meta/recipes-extended/procps/procps-3.2.8/linux-version-init.patch

Please add a patch header explaining why this is needed, also need a 
Signed-off-by: or the Author's name from oe commit.  Also a Upstream-Status:

See http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines for 
more details.

Sau!

> @@ -0,0 +1,45 @@
> +Index: procps-3.2.8/proc/sysinfo.c
> +===================================================================
> +--- procps-3.2.8.orig/proc/sysinfo.c	2008-03-23 21:33:43.000000000 -0700
> ++++ procps-3.2.8/proc/sysinfo.c	2012-12-09 00:52:53.288000030 -0800
> +@@ -212,6 +212,7 @@
> + static void init_libproc(void) __attribute__((constructor));
> + static void init_libproc(void){
> +   have_privs = check_for_privs();
> ++  init_Linux_version(); // make sure we have version before continuing...
> +   // ought to count CPUs in /proc/stat instead of relying
> +   // on glibc, which foolishly tries to parse /proc/cpuinfo
> +   //
> +Index: procps-3.2.8/proc/version.c
> +===================================================================
> +--- procps-3.2.8.orig/proc/version.c	2012-12-09 00:52:53.228000030 -0800
> ++++ procps-3.2.8/proc/version.c	2012-12-09 00:56:14.468000086 -0800
> +@@ -33,12 +33,13 @@
> +
> + int linux_version_code;
> +
> +-static void init_Linux_version(void) __attribute__((constructor));
> +-static void init_Linux_version(void) {
> ++// cannot depend on this auto-running before libproc init...
> ++//static void init_Linux_version(void) __attribute__((constructor));
> ++void init_Linux_version(void) {
> +     int x = 0, y = 0, z = 0;	/* cleared in case sscanf() < 2 */
> +     FILE *fp;
> +     char buf[256];
> +-
> ++
> +     if ( (fp=fopen("/proc/version","r")) == NULL) /* failure implies impending death */
> +       exit(1);
> +     if (fgets(buf, 256, fp) == NULL) {
> +Index: procps-3.2.8/proc/version.h
> +===================================================================
> +--- procps-3.2.8.orig/proc/version.h	2002-12-14 16:08:32.000000000 -0800
> ++++ procps-3.2.8/proc/version.h	2012-12-09 00:52:53.288000030 -0800
> +@@ -14,6 +14,7 @@
> +
> + EXTERN_C_BEGIN
> +
> ++extern void init_Linux_version(void);	/* initialize linux version */
> + extern void display_version(void);	/* display suite version */
> + extern const char procps_version[];		/* global buf for suite version */
> +
>


