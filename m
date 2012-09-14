Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TCSBt-00007J-2V
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 11:28:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Sep 2012 02:15:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,422,1344236400"; d="scan'208";a="203753066"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by orsmga002.jf.intel.com with ESMTP; 14 Sep 2012 02:15:18 -0700
Message-ID: <5052F65E.4070704@intel.com>
Date: Fri, 14 Sep 2012 12:18:22 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1347613438-22840-1-git-send-email-radu.moisan@intel.com>
In-Reply-To: <1347613438-22840-1-git-send-email-radu.moisan@intel.com>
Subject: Re: [PATCH v2] insane.bbclass: add library dir sanity check
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
X-List-Received-Date: Fri, 14 Sep 2012 09:28:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Added comments.

radu

On 09/14/2012 12:03 PM, Radu Moisan wrote:
> Check in ${PKGD} for libraries in other locations
> then ${libdir}. Trigger a warning if so.
>
> [Yocto #2038]
>
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>   meta/classes/insane.bbclass |   18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index e74eb3f..6388609 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -212,6 +212,18 @@ def package_qa_check_staticdev(path, name, d, elf, messages):
>           messages.append("non -staticdev package contains static .a library: %s path '%s'" % \
>                    (name, package_qa_clean_path(path,d)))
>   
> +def package_qa_check_libdir(path,libdir):
> +    """
> +    Check in path for libraries in other locations then libdir. Trigger a warning if so.
> +    """
> +    import re
> +    lib_re = re.compile("^.*\.(so|a)")
> +    for root, dirs, files in os.walk(path):
> +        if libdir not in root:
> +            for file in files:
> +                if lib_re.match(file):
> +                    bb.warn("Found library in wrong location: %s" % os.path.join(root,file))
> +
>   QAPATHTEST[debug-files] = "package_qa_check_dbg"
>   def package_qa_check_dbg(path, name, d, elf, messages):
>       """
> @@ -688,6 +700,12 @@ python do_package_qa () {
>               rdepends_sane = False
>   
>   
> +    ml = d.getVar("MLPREFIX", True) or ""
> +    if ml:
> +        pkgd = d.getVar('PKGD', True)
> +        libdir = d.getVar("libdir", True)
> +        package_qa_check_libdir(pkgd,libdir)
> +
>       if not walk_sane or not rdepends_sane:
>           bb.fatal("QA run found fatal errors. Please consider fixing them.")
>       bb.note("DONE with PACKAGE QA")



