Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sf1p4-0002yg-8k
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 06:38:18 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 Jun 2012 21:27:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="111941656"
Received: from unknown (HELO [10.255.12.138]) ([10.255.12.138])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Jun 2012 21:27:39 -0700
Message-ID: <4FD96838.20508@linux.intel.com>
Date: Wed, 13 Jun 2012 21:27:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1339514272-7427-1-git-send-email-laurentiu.palcu@intel.com>
	<1339514272-7427-2-git-send-email-laurentiu.palcu@intel.com>
In-Reply-To: <1339514272-7427-2-git-send-email-laurentiu.palcu@intel.com>
Subject: Re: [PATCH 1/2] sanity.bbclass: warn the user if BBPATH contains wrong entries
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
X-List-Received-Date: Thu, 14 Jun 2012 04:38:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2012 08:17 AM, Laurentiu Palcu wrote:
> If BBPATH references the working directory, the user is warned and asked
> to fix the problem.
>
> [Yocto #1465]
>
> Signed-off-by: Laurentiu Palcu<laurentiu.palcu@intel.com>
> ---
>   meta/classes/sanity.bbclass |   11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index f79fc3f..6ed1e6f 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -387,6 +387,17 @@ def check_sanity(sanity_data):
>       if "." in paths or "" in paths:
>           messages = messages + "PATH contains '.' or '', which will break the build, please remove this."
>
> +    bbpaths = sanity_data.getVar('BBPATH', True).split(":")
> +    if "." in bbpaths or "" in bbpaths:
> +        # TODO: change the following message to fatal when all BBPATH issues
> +        # are fixed
> +        bb.warn("BBPATH references the current directory, either through "    \
> +                "an empty entry, or a '.'.\n\t This is unsafe and means your "\
> +                "layer configuration is adding empty elements to BBPATH.\n\t "\
> +                "Please check your layer.conf files and other BBPATH "        \
> +                "settings to remove the current working directory "           \
> +                "references.");
> +
This change seems to trigger in the default case of the standard 
bblayers.conf file included in meta-yocto.  Is there a fix for this?  Do 
we need to uprev the bblayers file?

Sau!

>       if sanity_data.getVar('TARGET_ARCH', True) == "arm":
>           # This path is no longer user-readable in modern (very recent) Linux
>           try:


