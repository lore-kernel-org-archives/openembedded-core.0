Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id F2BBA72EE5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 14:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6C03B20B53;
	Tue, 10 Apr 2018 14:33:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id qT6lDMZ5rU_p; Tue, 10 Apr 2018 14:33:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 450B12017D;
	Tue, 10 Apr 2018 14:33:12 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B497716342E; Tue, 10 Apr 2018 10:33:11 -0400 (EDT)
Date: Tue, 10 Apr 2018 10:33:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20180410143311.GD3228@denix.org>
References: <1515690095-6391-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1515690095-6391-4-git-send-email-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1515690095-6391-4-git-send-email-richard.purdie@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] sstate: Avoid indirect bison/flex-native dependencies
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
X-List-Received-Date: Tue, 10 Apr 2018 14:33:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Richard,

Was this patch ever merged? I don't see it in master - were there any problems 
or concerns?


On Thu, Jan 11, 2018 at 05:01:35PM +0000, Richard Purdie wrote:
> This avoids adding flex-native or bison-native to the sysroot without a specific
> dependency in the recipe and means indirect dependencies (e.g. X -> Y -> binutils-cross -> flex-native)
> no longer met the dependency incidentally. This improves determinism and avoid
> build failures when people switch to external toolchains.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/sstate.bbclass | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 6808942..7509561 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -921,6 +921,13 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
>      if taskdependees[task][1] == "do_stash_locale" or taskdependees[task][1] == "do_gcc_stash_builddir":
>          return True
>  
> +    # Don't pull in flex-native or bison-native without a specific dependency in the recipe
> +    # This improves determinism in the metadata and avoids the dependency being met incidentally,
> +    # e.g. from binutils-cross which doesn't happen in the external toolchain case
> +    if taskdependees[task][1] == 'do_populate_sysroot':
> +        if taskdependees[task][0] == "flex-native" or taskdependees[task][0] == "bison-native":
> +            return True
> +
>      # We only need to trigger packagedata through direct dependencies
>      # but need to preserve packagedata on packagedata links
>      if taskdependees[task][1] == "do_packagedata":
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

