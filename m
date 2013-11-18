Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id B22ED6D2BD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 17:42:15 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 7A9E2F811E8; Mon, 18 Nov 2013 10:42:17 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 2EA57F811E7;
	Mon, 18 Nov 2013 10:42:16 -0700 (MST)
Message-ID: <528A5182.2080601@mlbassoc.com>
Date: Mon, 18 Nov 2013 10:42:26 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1384796370-8899-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1384796370-8899-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] combo-tool: simply branch/commit validation logic
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Nov 2013 17:42:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-11-18 10:39, Ross Burton wrote:
> Simply the branch/revision logic by using git-merge-base.

Did you mean 'simplify'?

>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   scripts/combo-layer |   13 ++-----------
>   1 file changed, 2 insertions(+), 11 deletions(-)
>
> diff --git a/scripts/combo-layer b/scripts/combo-layer
> index ae97471..2c8ba07 100755
> --- a/scripts/combo-layer
> +++ b/scripts/combo-layer
> @@ -283,23 +283,14 @@ def drop_to_shell(workdir=None):
>
>   def check_rev_branch(component, repodir, rev, branch):
>       try:
> -        actualbranch = runcmd("git branch --contains %s" % rev, repodir, printerr=False)
> +        mergepoint = runcmd("git merge-base %s %s" % (rev, branch), repodir, printerr=False).rstrip()
>       except subprocess.CalledProcessError as e:
>           if e.returncode == 129:
>               actualbranch = ""
>           else:
>               raise
>
> -    if not actualbranch:
> -        logger.error("%s: specified revision %s is invalid!" % (component, rev))
> -        return False
> -
> -    branches = []
> -    branchlist = actualbranch.split("\n")
> -    for b in branchlist:
> -        branches.append(b.strip().split(' ')[-1])
> -
> -    if branch not in branches:
> +    if mergepoint != rev:
>           logger.error("%s: specified revision %s is not on specified branch %s!" % (component, rev, branch))
>           return False
>       return True
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

