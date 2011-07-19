Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjFL4-0007hO-Ja
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 20:48:14 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Jul 2011 11:44:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,229,1309762800"; d="scan'208";a="32183734"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2011 11:44:08 -0700
Message-ID: <4E25D078.4000406@linux.intel.com>
Date: Tue, 19 Jul 2011 11:44:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1310657092.2378.67.camel@phil-desktop>
In-Reply-To: <1310657092.2378.67.camel@phil-desktop>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH] sanity, base: remove gcc3 check since qemu doesn't need it any more
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
X-List-Received-Date: Tue, 19 Jul 2011 18:48:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/14/2011 08:24 AM, Phil Blundell wrote:
> Recent versions of qemu seem to be happy enough building with gcc 4.x, and indeed most modern distributions aren't shipping gcc3 any more, so there is no point checking for its presence as part of sanity.
>
> Also remove the check_gcc3 function from base since nothing else uses it.
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   meta/classes/base.bbclass   |   10 ----------
>   meta/classes/sanity.bbclass |    8 --------
>   2 files changed, 0 insertions(+), 18 deletions(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 0c2c546..3ca4e47 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -397,16 +397,6 @@ python () {
>               bb.warn("Recipe %s is marked as only being architecture specific but seems to have machine specific packages?! The recipe may as well mark itself as machine specific directly." % d.getVar("PN", True))
>   }
>
> -def check_gcc3(data):
> -
> -	gcc3_versions = 'gcc-3.4.6 gcc-3.4.7 gcc-3.4 gcc34 gcc-3.4.4 gcc-3.3 gcc33 gcc-3.3.6 gcc-3.2 gcc32'
> -
> -	for gcc3 in gcc3_versions.split():
> -		if check_app_exists(gcc3, data):
> -			return gcc3
> -	
> -	return False
> -
>   addtask cleansstate after do_clean
>   python do_cleansstate() {
>           sstate_clean_cachefiles(d)
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index c9d37c9..716b158 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -211,14 +211,6 @@ def check_sanity(e):
>
>       required_utilities = "patch help2man diffstat texi2html makeinfo cvs svn bzip2 tar gzip gawk hg chrpath wget cpio"
>
> -    # qemu-native needs gcc 3.x
> -    if "qemu-native" not in assume_provided and "gcc3-native" in assume_provided:
> -        gcc_version = commands.getoutput("${BUILD_PREFIX}gcc --version | head -n 1 | cut -f 3 -d ' '")
> -
> -        if not check_gcc3(e.data) and gcc_version[0] != '3':
> -            messages = messages + "gcc3-native was in ASSUME_PROVIDED but the gcc-3.x binary can't be found in PATH"
> -            missing = missing + "gcc-3.x (needed for qemu-native),"
> -
>       if "qemu-native" in assume_provided:
>           if not check_app_exists("qemu-arm", e.data):
>               messages = messages + "qemu-native was in ASSUME_PROVIDED but the QEMU binaries (qemu-arm) can't be found in PATH"

Merged into OE-Core

Thanks
	Sau!


