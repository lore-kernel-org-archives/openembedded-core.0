Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E69A60670
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 03:13:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3J3DHhT001129
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Apr 2016 20:13:17 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Apr 2016 20:13:16 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1461033288.git.liezhi.yang@windriver.com>
	<e65a4e59689b4c095366e81bae3251a62e51e1e8.1461033288.git.liezhi.yang@windriver.com>
	<CADkTA4Npd7C8ekZV2S787YYqskMDhu1Fr4B_nZT7Xi89eDYHiA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5715A24B.9010406@windriver.com>
Date: Tue, 19 Apr 2016 11:13:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4Npd7C8ekZV2S787YYqskMDhu1Fr4B_nZT7Xi89eDYHiA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] create-pull-request: create branch on remote if not found
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
X-List-Received-Date: Tue, 19 Apr 2016 03:13:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/19/2016 11:00 AM, Bruce Ashfield wrote:
>
>
> On Mon, Apr 18, 2016 at 10:45 PM, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     Before this patch, we need two steps to create PULL:
>     * Step 1, create branch:
>        $ git push <contrib> <local_branch>:<remote_branch>
>     * Step 2, create PULL:
>        $ create-pull-request -u <contrib> -l <local_branch> -b <remote_branch>
>     -r <local_branch>~<n>
>
>     We can see that the args used in step 1 are in step 2, so we can use
>     create-pull-request to create the branch if not found to simplify the
>     steps.
>
>
> I think this needs to be optional. When I'm running this script, I'm just
> looking to have something
> I've already pushed locally dumped. If I mess up, and don't have the branch that
> I've used
> pushed to my remote already (or for  whatever reason want/need different
> branches .. which
> was broken in previous updates to the script .. grrr),  I don't want something
> pushing a branch
> without be explicitly giving permission for that to happen.

Thanks, how about add an option:

"-a	automatically push/update local branch (-l) to remote branch (-b)"

Then it will always create/update the remote branch when -a is used.

// Robert

>
> Bruce
>
>
>     [YOCTO #9408]
>
>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>>
>     ---
>       scripts/create-pull-request | 4 ++--
>       1 file changed, 2 insertions(+), 2 deletions(-)
>
>     diff --git a/scripts/create-pull-request b/scripts/create-pull-request
>     index 479ad6e..7dc9836 100755
>     --- a/scripts/create-pull-request
>     +++ b/scripts/create-pull-request
>     @@ -173,8 +173,8 @@ esac
>       if [ -n "$WEB_URL" ]; then
>              wget --no-check-certificate -q $WEB_URL -O /dev/null
>              if [ $? -ne 0 ]; then
>     -               echo "WARNING: Branch '$BRANCH' was not found on the contrib
>     git tree."
>     -               echo "         Please check your remote and branch parameter
>     before sending."
>     +               echo "Branch '$BRANCH' not found on '$REMOTE', creating it..."
>     +               git push $REMOTE $L_BRANCH:$BRANCH
>                      echo ""
>              fi
>       fi
>     --
>     2.7.4
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its
> end"

