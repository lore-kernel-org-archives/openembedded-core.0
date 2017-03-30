Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id D000D77BF3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 08:54:05 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 981EE68A01C; Thu, 30 Mar 2017 09:54:05 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_20,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id C404A68A019;
	Thu, 30 Mar 2017 09:54:02 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 6808F67403F7;
	Thu, 30 Mar 2017 10:54:02 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <cover.1490863008.git.Qi.Chen@windriver.com>
	<ae8133ce6aa20fd7e0f6189ebad556a5716d5111.1490863008.git.Qi.Chen@windriver.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <f9f0bdc7-2ac3-90f2-706e-012ffe86f501@mlbassoc.com>
Date: Thu, 30 Mar 2017 10:54:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <ae8133ce6aa20fd7e0f6189ebad556a5716d5111.1490863008.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 1/1] wic: improve error message
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
X-List-Received-Date: Thu, 30 Mar 2017 08:54:06 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-03-30 10:37, Chen Qi wrote:
> When using `wic create mkefidisk -e core-image-minimal', the following
> error message appeared.
>
>   Please bake it with 'bitbake parted-native' and try again.
>
> However, following this command doesn't do any help. The same problem
> still appeared.
>
> The problem is that when we 'bitbake parted-native', it doesn't have
> anything to do with core-image-minimal. And the required tool 'parted'
> is not under core-image-minimal's recipe-sysroot-native directory.
>
> Improve the error message so that following it could get things done.

Why not just fix the wic-tools recipe directly and not push it off onto the user?

>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  scripts/lib/wic/utils/misc.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/lib/wic/utils/misc.py b/scripts/lib/wic/utils/misc.py
> index c941112..1b0ab3b 100644
> --- a/scripts/lib/wic/utils/misc.py
> +++ b/scripts/lib/wic/utils/misc.py
> @@ -131,7 +131,7 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch=3, pseudo=""):
>                "was not found (see details above).\n\n" % prog
>          recipe = NATIVE_RECIPES.get(prog)
>          if recipe:
> -            msg += "Please bake it with 'bitbake %s-native' "\
> +            msg += "Please make sure wic-tools have %s-native in its DEPENDS, bake it with 'bitbake wic-tools' "\
>                     "and try again.\n" % recipe
>          else:
>              msg += "Wic failed to find a recipe to build native %s. Please "\
>


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

