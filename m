Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuUVv-0003Qe-NI
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 22:18:27 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jul 2012 13:06:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="187041905"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2012 13:06:55 -0700
Message-ID: <5011A35F.5000508@linux.intel.com>
Date: Thu, 26 Jul 2012 13:06:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343269941-18349-1-git-send-email-Song.Li@windriver.com>
In-Reply-To: <1343269941-18349-1-git-send-email-Song.Li@windriver.com>
Subject: Re: [PATCH V2] sysstat:use a new way to remove -s option of LFLAGS
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
X-List-Received-Date: Thu, 26 Jul 2012 20:18:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/25/2012 07:32 PM, Song.Li@windriver.com wrote:
> From: "Song.Li" <Song.Li@windriver.com>
>
> sysstat Makefile shouldn't use -s option to strip binary
> because we need debug info for dbg package.
> The old way to remove -s option is passing LFLAGS=''
> in make command line to clean all the LFLAGS variable in Makefile.
> That will cause build failure when sensors lib is needed.
> In fact,Only the "-s" should be removed, others LFLAGS should be kept.
>
> [YOCTO #2740]
>
> (LOCAL PATCH: NOT UPSTREAM)
>
If it's Local Patch not for upstream, then it's not Pending, its 
Inappropriate [Yocto-specific]

Sau!

> Signed-off-by: Song.Li <Song.Li@windriver.com>
> ---
>   .../sysstat/files/remove-s-option-of-LFLAGS.patch  |   36 ++++++++++++++++++++
>   meta/recipes-extended/sysstat/sysstat.inc          |    5 +--
>   meta/recipes-extended/sysstat/sysstat_10.0.3.bb    |    2 +-
>   3 files changed, 40 insertions(+), 3 deletions(-)
>   create mode 100644 meta/recipes-extended/sysstat/files/remove-s-option-of-LFLAGS.patch
>
> diff --git a/meta/recipes-extended/sysstat/files/remove-s-option-of-LFLAGS.patch b/meta/recipes-extended/sysstat/files/remove-s-option-of-LFLAGS.patch
> new file mode 100644
> index 0000000..5345c3e
> --- /dev/null
> +++ b/meta/recipes-extended/sysstat/files/remove-s-option-of-LFLAGS.patch
> @@ -0,0 +1,36 @@
> +From 69f0088cbe300628f5d94b66505ac8ed07565229 Mon Sep 17 00:00:00 2001
> +From: "Song.Li" <Song.Li@windriver.com>
> +Date: Fri, 13 Jul 2012 13:51:13 +0800
> +Subject: [PATCH] remove -s option of LFLAGS
> +
> +sysstat Makefile shouldn't use -s option to strip binary
> +because we need debug info for dbg package.
> +The old way to remove -s option is passing LFLAGS=''
> +in make command line to clean all the LFLAGS variable in Makefile.
> +That will cause build failure when sensors lib is needed.
> +In fact,only "-s" should be removeed, others LFLAGS should be kept.
> +
> +[YOCTO #2740]
> +
> +Upstream-Status:Pending
> +
> +(LOCAL PATCH: NOT UPSTREAM)
> +
> +Signed-off-by: Song.Li <Song.Li@windriver.com>
> +---
> + Makefile.in |    1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index d1ea853..ee6cbc1 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -71,7 +71,6 @@ SYSCONFIG_DIR = @SYSCONFIG_DIR@
> + # Compiler flags
> + CFLAGS = @CFLAGS@ -Wall -Wstrict-prototypes -pipe -O2
> + DFLAGS = @DFLAGS@
> +-LFLAGS =  -s
> + DFLAGS += -DSA_DIR=\"$(SA_DIR)\" -DSADC_PATH=\"$(SADC_PATH)\"
> + DFLAGS += $(DFSENSORS)
> +
> +--
> diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
> index 9da40a7..1c98101 100644
> --- a/meta/recipes-extended/sysstat/sysstat.inc
> +++ b/meta/recipes-extended/sysstat/sysstat.inc
> @@ -5,11 +5,12 @@ LICENSE = "GPLv2+"
>   SECTION = "console/utils"
>
>   SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.gz \
> -		   file://99_sysstat"
> +		   file://99_sysstat \
> +		   file://remove-s-option-of-LFLAGS.patch \
> +          "
>
>   inherit autotools gettext
>
> -EXTRA_OEMAKE += 'LFLAGS=""'
>
>   do_install() {
>   	autotools_do_install
> diff --git a/meta/recipes-extended/sysstat/sysstat_10.0.3.bb b/meta/recipes-extended/sysstat/sysstat_10.0.3.bb
> index 7ef6c60..93fbe21 100644
> --- a/meta/recipes-extended/sysstat/sysstat_10.0.3.bb
> +++ b/meta/recipes-extended/sysstat/sysstat_10.0.3.bb
> @@ -2,7 +2,7 @@ require sysstat.inc
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>
> -PR = "r1"
> +PR = "r2"
>
>   SRC_URI[md5sum] = "0e1ed5200f31f69a3b90ff1e81c07745"
>   SRC_URI[sha256sum] = "7c0dd172f09edaff100b33db29ef502e15e71867b505c6d519f76a24fabcc1f5"
>



