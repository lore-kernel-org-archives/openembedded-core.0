Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T24Oq-0007vd-CO
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 20:02:28 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 16 Aug 2012 10:50:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,780,1336374000"; d="scan'208";a="135068813"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Aug 2012 10:49:52 -0700
Message-ID: <502D32C0.2060601@linux.intel.com>
Date: Thu, 16 Aug 2012 10:49:52 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343945450-26806-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1343945450-26806-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] base.bbclass: allow specifying an lsb distro hook via the metadata
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
X-List-Received-Date: Thu, 16 Aug 2012 18:02:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/02/2012 03:10 PM, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>
> This is useful when you have a rather large set of compatible distros. For
> example: Centos 5.4, 5.5, 5.6, etc, RHEL server 5.x, RHEL workstation 5.x.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>   meta/classes/base.bbclass |   12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index e15fa26..192c777 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -34,11 +34,21 @@ def oe_import(d):
>   python oe_import_eh () {
>       if isinstance(e, bb.event.ConfigParsed):
>           oe_import(e.data)
> -        e.data.setVar("NATIVELSBSTRING", oe.lsb.distro_identifier())
> +        e.data.setVar("NATIVELSBSTRING", lsb_distro_identifier(e.data))
>   }
>
>   addhandler oe_import_eh
>
> +def lsb_distro_identifier(d):
> +    adjust = d.getVar('LSB_DISTRO_ADJUST', True)
> +    adjust_func = None
> +    if adjust:
> +        try:
> +            adjust_func = globals()[adjust]
> +        except KeyError:
> +            pass
> +    return oe.lsb.distro_identifier(adjust_func)
> +
>   die() {
>   	bbfatal "$*"
>   }
>
Merged into OE-Core

Thanks
	Sau!



