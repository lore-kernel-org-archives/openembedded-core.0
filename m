Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoSAH-0004FH-Ux
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 06:35:10 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Jul 2012 21:23:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="169617790"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by orsmga002.jf.intel.com with ESMTP; 09 Jul 2012 21:23:46 -0700
Message-ID: <4FFBAE52.6070301@linux.intel.com>
Date: Mon, 09 Jul 2012 21:23:46 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20120709185017.GA22808@windriver.com>
In-Reply-To: <20120709185017.GA22808@windriver.com>
Subject: Re: [PATCH] package install failure on systems without /sbin/ldconfig
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
X-List-Received-Date: Tue, 10 Jul 2012 04:35:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2012 11:50 AM, Amy Fong wrote:
> Package install failures due to issues in post install rules.
>
> package_do_shlibs only looks for libraries in a directory "lib", this should be
> modified to the variable baselib.
>
> ldconfig_postinst_fragment failure observed on systems without /sbin/ldconfig
>          [ -x /sbin/ldconfig ] && /sbin/ldconfig
> results in the post install rule returning a failure. Modify to
>          if [ -x /sbin/ldconfig ]; then /sbin/ldconfig; fi
>
If this is addressing bug #2723, then please mark it as follows:

[YOCTO #2723] in the commit message.

Also the commit subject should include the file name for example:
package.bbclass: fix for package install failure on systems without 
/sbin/ldconfig

Thanks
	Sau!

> Signed-off-by: Amy Fong <amy.fong@windriver.com>
> ---
>   package.bbclass |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 56ab25c..28a263c 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1151,7 +1151,7 @@ emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime"
>
>   ldconfig_postinst_fragment() {
>   if [ x"$D" = "x" ]; then
> -	[ -x /sbin/ldconfig ] && /sbin/ldconfig
> +	if [ -x /sbin/ldconfig ]; then /sbin/ldconfig ; fi
>   fi
>   }
>
> @@ -1261,7 +1261,7 @@ python package_do_shlibs() {
>   		return
>   		
>   	lib_re = re.compile("^.*\.so")
> -	libdir_re = re.compile(".*/lib$")
> +	libdir_re = re.compile(".*/%s$" % d.getVar('baselib', True))
>
>   	packages = d.getVar('PACKAGES', True)
>   	targetos = d.getVar('TARGET_OS', True)
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



