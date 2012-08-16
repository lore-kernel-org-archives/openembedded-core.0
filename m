Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T23iF-0006mm-AS
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 19:18:27 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 Aug 2012 10:06:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,780,1336374000"; d="scan'208";a="181866993"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by azsmga001.ch.intel.com with ESMTP; 16 Aug 2012 10:06:28 -0700
Message-ID: <502D2894.1000203@linux.intel.com>
Date: Thu, 16 Aug 2012 10:06:28 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1345049073-27898-1-git-send-email-paul.eggleton@linux.intel.com>
In-Reply-To: <1345049073-27898-1-git-send-email-paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] classes/chrpath: trigger an error if chrpath fails
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
X-List-Received-Date: Thu, 16 Aug 2012 17:18:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/15/2012 09:44 AM, Paul Eggleton wrote:
> If chrpath failed here we were just silently ignoring it.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>   meta/classes/chrpath.bbclass |    4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
> index 10b5ca0..ad61fe0 100644
> --- a/meta/classes/chrpath.bbclass
> +++ b/meta/classes/chrpath.bbclass
> @@ -74,7 +74,9 @@ def process_dir (directory, d):
>               if len(new_rpaths):
>                   args = ":".join(new_rpaths)
>                   #bb.note("Setting rpath for %s to %s" %(fpath, args))
> -                sub.call([cmd, '-r', args, fpath])
> +                ret = sub.call([cmd, '-r', args, fpath])
> +                if ret != 0:
> +                    bb.error("chrpath command failed with exit code %d" % ret)
>
>               if perms:
>                   os.chmod(fpath, perms)
>
Merged into OE-Core

Thanks
	Sau!



