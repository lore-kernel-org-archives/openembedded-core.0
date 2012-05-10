Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SSH7f-0003vs-LX
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 02:20:47 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 May 2012 17:10:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="141141861"
Received: from unknown (HELO [10.255.12.218]) ([10.255.12.218])
	by azsmga001.ch.intel.com with ESMTP; 09 May 2012 17:10:45 -0700
Message-ID: <4FAB0784.2080703@linux.intel.com>
Date: Wed, 09 May 2012 17:10:44 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAF6bG8eVQcJHEH8RHsAGV2CP6ZjH1+sZUyvBTFLvB6cv--ZUhw@mail.gmail.com>
In-Reply-To: <CAF6bG8eVQcJHEH8RHsAGV2CP6ZjH1+sZUyvBTFLvB6cv--ZUhw@mail.gmail.com>
Subject: Re: [PATCH] package_deb.bbclass: don't handle advanced dependency marker
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
X-List-Received-Date: Thu, 10 May 2012 00:20:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2012 04:50 PM, Marko Lindqvist wrote:
> From: Marko Lindqvist<cazfi74@gmail.com>
> Date: Thu, 10 May 2012 02:41:06 +0300
> Subject: [PATCH] package_deb.bbclass: don't handle advanced dependency marker
>   as version number
>
> Strip advanced dependency markers away from Provides before writing
> them to control file. Left in place they would mean package version
> number in control file format.
>
> Signed-off-by: Marko Lindqvist<cazfi74@gmail.com>
> ---
>   meta/classes/package_deb.bbclass |   19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
> index dc0f963..c51bf3c 100644
> --- a/meta/classes/package_deb.bbclass
> +++ b/meta/classes/package_deb.bbclass
> @@ -206,6 +206,23 @@ python do_package_deb () {
>       import re, copy
>       import textwrap
>
> +    def deb_explode_dep_ver(varname):
> +        # Remove markers from string so they won't get handled as
> version numbers
> +        depstr = localdata.getVar(varname, True) or ""
> +        start = depstr.find("(")
> +        while start != -1:
> +            # We are not searching ")" from full string in case it's
> malformed in a way
> +            # that first ")" is before first "("
> +            endstr = depstr[start:len(depstr)]
> +            end = endstr.find(")")
> +            if (end == len(endstr) - 1) or (end == -1):
> +                tmpstr = depstr[0:start]
> +            else:
> +                tmpstr = depstr[0:start] + depstr[start+end+1:len(depstr)]
> +            depstr = tmpstr
> +            start = depstr.find("(")
> +        return bb.utils.explode_dep_versions(depstr)
> +
>       workdir = d.getVar('WORKDIR', True)
>       if not workdir:
>           bb.error("WORKDIR not defined, unable to package")
> @@ -341,7 +358,7 @@ python do_package_deb () {
>                   if '*' in dep:
>                           del rrecommends[dep]
>           rsuggests =
> bb.utils.explode_dep_versions(localdata.getVar("RSUGGESTS", True) or
> "")
> -        rprovides =
> bb.utils.explode_dep_versions(localdata.getVar("RPROVIDES", True) or
> "")
> +        rprovides = deb_explode_dep_ver("RPROVIDES")
>           rreplaces =
> bb.utils.explode_dep_versions(localdata.getVar("RREPLACES", True) or
> "")
>           rconflicts =
> bb.utils.explode_dep_versions(localdata.getVar("RCONFLICTS", True) or
> "")
>           if rdepends:

Marko,

I am not sure what's wrong with this patch or the others you sent 
recently but none of them are applying cleanly with "git am" what are 
you using to format the patch and mail it?

Please use git format-patch and git send-email or the scripts 
create-pull-request/send-pull-request.

Thanks
	Sau!


