Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T23pb-0006tQ-3B
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 19:26:03 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Aug 2012 10:13:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,780,1336374000"; d="scan'208";a="187317414"
Received: from unknown (HELO helios.localnet) ([10.252.121.76])
	by orsmga002.jf.intel.com with ESMTP; 16 Aug 2012 10:13:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Aug 2012 18:13:11 +0100
Message-ID: <1566766.76zJMGCy1b@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1345049073-27898-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1345049073-27898-1-git-send-email-paul.eggleton@linux.intel.com>
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 16 Aug 2012 17:26:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 15 August 2012 17:44:33 Paul Eggleton wrote:
> If chrpath failed here we were just silently ignoring it.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/chrpath.bbclass |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
> index 10b5ca0..ad61fe0 100644
> --- a/meta/classes/chrpath.bbclass
> +++ b/meta/classes/chrpath.bbclass
> @@ -74,7 +74,9 @@ def process_dir (directory, d):
>              if len(new_rpaths):
>                  args = ":".join(new_rpaths)
>                  #bb.note("Setting rpath for %s to %s" %(fpath, args))
> -                sub.call([cmd, '-r', args, fpath])
> +                ret = sub.call([cmd, '-r', args, fpath])
> +                if ret != 0:
> +                    bb.error("chrpath command failed with exit code %d" %
> ret)
> 
>              if perms:
>                  os.chmod(fpath, perms)

I missed that this does not actually report the output from chrpath when it 
fails because the task log is suppressed by virtue of calling bb.error. I will 
send a follow-up patch to address this.

Incidentally a couple of users are reporting that they are now seeing failures 
where the rpath size is reported to be too small to contain the path we are 
applying. I haven't seen this myself - is there some way we can increase the 
space allowed for storing the path or is there some other issue at work here? 
I tried to search for some information on how storage of the rpath works but 
did not really find anything conclusive.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


