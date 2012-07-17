Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrAFn-0000x2-Et
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:04:03 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Jul 2012 08:52:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="167478481"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by orsmga001.jf.intel.com with ESMTP; 17 Jul 2012 08:52:42 -0700
Message-ID: <50058A4A.7090806@linux.intel.com>
Date: Tue, 17 Jul 2012 08:52:42 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
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
X-List-Received-Date: Tue, 17 Jul 2012 16:04:03 -0000
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

Merged into OE-Core

Thanks	
	Sau!


