Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T2Tjo-0008QO-9A
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 23:05:48 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Aug 2012 13:53:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,785,1336374000"; d="scan'208";a="187901620"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by orsmga002.jf.intel.com with ESMTP; 17 Aug 2012 13:53:47 -0700
Message-ID: <502EAF5B.8020400@linux.intel.com>
Date: Fri, 17 Aug 2012 13:53:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1344654924-655-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1344654924-655-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] chrpath.bbclass: Account for case when ORIGIN is in RPATH
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
X-List-Received-Date: Fri, 17 Aug 2012 21:05:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2012 08:15 PM, Khem Raj wrote:
> This fixes a case when RPATH embedded in program have one of
> its path already relative to ORIGIN. We were losing that path
> if such a path existed. This patch appends it to the new edited
> rpath being created when we see it.
>
> so RPATH like below
>
> (RPATH)              Library rpath:
> [$ORIGIN/../lib/amd64/jli:$ORIGIN/../jre/lib/amd64/jli]
>
> would end up being empty
>
> but after this patch its kept intact
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/classes/chrpath.bbclass |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
> index 10b5ca0..e903b65 100644
> --- a/meta/classes/chrpath.bbclass
> +++ b/meta/classes/chrpath.bbclass
> @@ -49,6 +49,7 @@ def process_dir (directory, d):
>               new_rpaths = []
>               for rpath in rpaths:
>                   # If rpath is already dynamic continue
> +                new_rpaths.append("%s" % (rpath.strip()))
>                   if rpath.find("$ORIGIN") != -1:
>                       continue
>                   # If the rpath shares a root with base_prefix determine a new dynamic rpath from the
>
Merged into OE-Core

Thanks
	Sau!



