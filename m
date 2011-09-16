Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1R4c2x-0001kt-7Z
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 19:17:51 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Sep 2011 10:12:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="49216348"
Received: from scimitar.jf.intel.com (HELO [10.7.199.70]) ([10.7.199.70])
	by orsmga002.jf.intel.com with ESMTP; 16 Sep 2011 10:12:37 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2011 10:12:37 -0700
In-Reply-To: <9320024626bed55a7c6058131e1cb6c47944a36d.1316037832.git.josh@linux.intel.com>
References: <cover.1316037832.git.josh@linux.intel.com>
	<9320024626bed55a7c6058131e1cb6c47944a36d.1316037832.git.josh@linux.intel.com>
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1316193157.2325.0.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] sanity: disable mirrors for connectivity check
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
X-List-Received-Date: Fri, 16 Sep 2011 17:17:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Any comments?

On Wed, 2011-09-14 at 15:09 -0700, Joshua Lock wrote:
> It's difficult to test a range of fetchers when using mirrors, therefore create a throwaway
> copy of the datastore and delete the MIRROR and PREMIRROR variables to ensure they aren't
> used in the connectivity check.
> 
> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
>  meta/classes/sanity.bbclass |    8 ++++++--
>  1 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 93008cc..6ed43b2 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -94,14 +94,18 @@ def check_connectivity(d):
>      # CONNECTIVITY_CHECK_URIS are set
>      network_enabled = not bb.data.getVar('BB_NO_NETWORK', d, True)
>      check_enabled = len(test_uris)
> +    # Take a copy of the data store and unset MIRRORS and PREMIRROS
> +    data = bb.data.createCopy(d)
> +    data.delVar('PREMIRRORS')
> +    data.delVar('MIRRORS')
>      if check_enabled and network_enabled:
>          try:
> -            fetcher = bb.fetch2.Fetch(test_uris, d)
> +            fetcher = bb.fetch2.Fetch(test_uris, data)
>              fetcher.checkstatus()
>          except Exception:
>              # Allow the message to be configured so that users can be
>              # pointed to a support mechanism.
> -            msg = bb.data.getVar('CONNECTIVITY_CHECK_MSG', d, True) or ""
> +            msg = bb.data.getVar('CONNECTIVITY_CHECK_MSG', data, True) or ""
>              if len(msg) == 0:
>                  msg = "Failed to fetch test data from the network. Please ensure your network is configured correctly.\n"
>              retval = msg

-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



