Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T4yfb-0002ZY-9B
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 20:31:47 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by azsmga102.ch.intel.com with ESMTP; 24 Aug 2012 11:19:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,304,1344236400"; d="scan'208";a="184999286"
Received: from unknown (HELO [10.255.13.21]) ([10.255.13.21])
	by orsmga001.jf.intel.com with ESMTP; 24 Aug 2012 11:19:38 -0700
Message-ID: <5037C5B9.1030202@linux.intel.com>
Date: Fri, 24 Aug 2012 11:19:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1345555030-24506-1-git-send-email-paul.eggleton@linux.intel.com>
In-Reply-To: <1345555030-24506-1-git-send-email-paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] scripts/combo-layer: specify branch when getting current revision
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
X-List-Received-Date: Fri, 24 Aug 2012 18:31:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/21/2012 06:17 AM, Paul Eggleton wrote:
> Handle the case during update where the configured branch is not
> currently checked out in the component repository by just specifying
> it in the places where it was not previously.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>   scripts/combo-layer |    5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/combo-layer b/scripts/combo-layer
> index 448fe71..330faca 100755
> --- a/scripts/combo-layer
> +++ b/scripts/combo-layer
> @@ -191,7 +191,7 @@ def action_init(conf, args):
>               branch = repo.get('branch', "master")
>               file_filter = repo.get('file_filter', "")
>               runcmd("git archive %s | tar -x -C %s %s" % (branch, extract_dir, file_filter), ldir)
> -            lastrev = runcmd("git rev-parse HEAD", ldir).strip()
> +            lastrev = runcmd("git rev-parse %s" % branch, ldir).strip()
>               conf.update(name, "last_revision", lastrev, initmode=True)
>           runcmd("git add .")
>           if conf.localconffile:
> @@ -475,7 +475,8 @@ def apply_patchlist(conf, repos):
>           else:
>               logger.info("No patches to apply from %s" % name)
>               ldir = conf.repos[name]['local_repo_dir']
> -            lastrev = runcmd("git rev-parse HEAD", ldir).strip()
> +            branch = conf.repos[name].get('branch', "master")
> +            lastrev = runcmd("git rev-parse %s" % branch, ldir).strip()
>
>           if lastrev != repo['last_revision']:
>               conf.update(name, "last_revision", lastrev)
>

Merged into OE-Core

Thanks
	Sau!



