Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T3oVR-0005Ph-8w
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 15:28:29 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by orsmga102.jf.intel.com with ESMTP; 21 Aug 2012 06:16:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,802,1336374000"; d="scan'208";a="183485021"
Received: from unknown (HELO helios.localnet) ([10.252.121.105])
	by azsmga001.ch.intel.com with ESMTP; 21 Aug 2012 06:16:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Aug 2012 14:16:21 +0100
Message-ID: <3937577.neRe3uSGJP@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1345545655-14640-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1345545655-14640-1-git-send-email-paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH] scripts/combo-layer: checkout branch in update when pull is disabled
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
X-List-Received-Date: Tue, 21 Aug 2012 13:28:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 21 August 2012 11:40:55 Paul Eggleton wrote:
> If the user selects not to pull the component repos, at least ensure
> that the correct branch is checked out before proceeding.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  scripts/combo-layer |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/combo-layer b/scripts/combo-layer
> index 448fe71..6134e81 100755
> --- a/scripts/combo-layer
> +++ b/scripts/combo-layer
> @@ -356,6 +356,10 @@ def action_update(conf, args):
>          branch = repo.get('branch', "master")
>          repo_patch_dir = os.path.join(os.getcwd(), patch_dir, name)
> 
> +        if conf.nopull:
> +            # Need to do this here as we didn't call action_pull that would
> do it otherwise +            runcmd("git checkout %s" % branch, ldir)
> +
>          # Step 2: generate the patch list and store to patch dir
>          logger.info("Generating patches from %s..." % name)
>          if dest_dir != ".":

Actually as Richard points out we don't need to be doing the checkout here - 
we can just specify the branch in the one or two places where it isn't already 
specified. A different patch is on its way.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


