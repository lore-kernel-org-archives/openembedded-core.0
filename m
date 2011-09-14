Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R3qfW-0002gO-1K
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 16:42:30 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8EEbJSH001029
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 07:37:19 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 14 Sep 2011 07:37:18 -0700
Message-ID: <4E70BC1D.4030805@windriver.com>
Date: Wed, 14 Sep 2011 09:37:17 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1315980095.git.dongxiao.xu@intel.com>
	<63559405c0c9ea57cda70a0f37bae313a8c6855c.1315980095.git.dongxiao.xu@intel.com>
In-Reply-To: <63559405c0c9ea57cda70a0f37bae313a8c6855c.1315980095.git.dongxiao.xu@intel.com>
Subject: Re: [PATCH 1/3] package_rpm: add architecture info in rpm spec file
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
X-List-Received-Date: Wed, 14 Sep 2011 14:42:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

I still don't think this is what we want.  Let me look into the library issues
that you mentioned in the other thread and I'll see if we can deal with it that way.

(Note, we may need to use something like this in non-RPM cases.. but I'm not
sure about that either.)

--Mark

On 9/14/11 1:08 AM, Dongxiao Xu wrote:
> For supporting multilib, architecture information is needed in package
> require/provide/suggest/recommend fields.
> 
> Use DEFAULTTUNE value as the postfix.
> 
> For "all" arch recipe, it requires "all" arch recipe with no postfix,
> but provides all possible multilib archs.
> 
> For example, qemu-config:
> 
> Requires: rsync
> Requires: update-rc.d
> Requires: task-core-nfs-server
> Requires: distcc
> Requires: oprofileui-server
> Requires: dbus-x11
> Requires: bash
> Provides: qemu-config.x86
> Provides: qemu-config.x86-64
> 
> For other recipe like zlib:
> 
> Requires: libc6.x86-64 >= 2.13
> Provides: zlib.x86-64
> 
> [YOCTO #1457]
> 
> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> ---
>  meta/classes/multilib.bbclass    |    1 +
>  meta/classes/package_rpm.bbclass |   36 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
> index 583d76b..76c86b2 100644
> --- a/meta/classes/multilib.bbclass
> +++ b/meta/classes/multilib.bbclass
> @@ -23,6 +23,7 @@ python multilib_virtclass_handler () {
>      e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
>      e.data.setVar("SHLIBSDIR_virtclass-multilib-" + variant ,e.data.getVar("SHLIBSDIR", False) + "/" + variant)
>      e.data.setVar("TARGET_VENDOR_virtclass-multilib-" + variant, e.data.getVar("TARGET_VENDOR", False) + "ml" + variant)
> +    e.data.setVar("SAVED_DEFAULTTUNE", e.data.getVar("DEFAULTTUNE", True))
>      e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
>  }
>  
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 9ef1acd..ea0a079 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -350,6 +350,7 @@ package_install_internal_rpm () {
>  python write_specfile () {
>  	import textwrap
>  	import oe.packagedata
> +	import re
>  
>  	# We need a simple way to remove the MLPREFIX from the package name,
>  	# and dependency information...
> @@ -498,6 +499,8 @@ python write_specfile () {
>  
>  		splitname    = strip_multilib(pkgname, d)
>  
> +		defaulttune = bb.data.getVar('DEFAULTTUNE', localdata, True)
> +
>  		splitsummary = (bb.data.getVar('SUMMARY', localdata, True) or bb.data.getVar('DESCRIPTION', localdata, True) or ".")
>  		splitversion = (bb.data.getVar('PKGV', localdata, True) or "").replace('-', '+')
>  		splitrelease = (bb.data.getVar('PKGR', localdata, True) or "")
> @@ -528,6 +531,39 @@ python write_specfile () {
>  		if pkg == d.getVar("PN", True):
>  			splitrprovides = splitrprovides + " " + (d.getVar('ALTERNATIVE_LINK', True) or '') + " " + (d.getVar('ALTERNATIVE_LINKS', True) or '')
>  
> +		package_arch = bb.data.getVar('PACKAGE_ARCH', localdata, True)
> +
> +		splitrprovides = splitrprovides + " " + splitname + "." + defaulttune
> +		if package_arch != "all":
> +			pattern = '\([^()]*\)'
> +			prog = re.compile(pattern)
> +
> +			str_list = [splitrdepends, splitrrecommends, splitrsuggests]
> +			for e in range(len(str_list)):
> +				brackets = prog.findall(str_list[e])
> +				for i in range(len(brackets)):
> +					str_list[e] = str_list[e].replace(brackets[i], "#BRACKETS"+str(i)+"#")
> +				tmp = ""
> +				for i in str_list[e].split():
> +					if i.startswith("#BRACKETS"):
> +						tmp += " " + str(i)
> +						continue
> +					tmp += " " + str(i) + "." + defaulttune
> +				str_list[e] = tmp
> +				for i in range(len(brackets)):
> +					str_list[e] = str_list[e].replace("#BRACKETS"+str(i)+"#", brackets[i])
> +
> +			[splitrdepends, splitrrecommends, splitrsuggests] = str_list
> +		else:
> +			variants = (bb.data.getVar("MULTILIB_VARIANTS", localdata, True) or "").split()
> +			for variant in variants:
> +				tune = bb.data.getVar("DEFAULTTUNE_virtclass-multilib-" + variant, localdata, True) or ""
> +				if tune:
> +					splitrprovides = splitrprovides + " " + splitname + "." + tune
> +			tune = bb.data.getVar("SAVED_DEFAULTTUNE", localdata, True) or ""
> +			if tune:
> +				splitrprovides = splitrprovides + " " + splitname + "." + tune
> +
>  		# Gather special src/first package data
>  		if srcname == splitname:
>  			srcrdepends    = splitrdepends



