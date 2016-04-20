Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 698E260119
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 00:48:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3K0mO8H004298
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 19 Apr 2016 17:48:25 -0700
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Apr 2016 17:48:24 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1461033288.git.liezhi.yang@windriver.com>
	<e65a4e59689b4c095366e81bae3251a62e51e1e8.1461033288.git.liezhi.yang@windriver.com>
	<CADkTA4Npd7C8ekZV2S787YYqskMDhu1Fr4B_nZT7Xi89eDYHiA@mail.gmail.com>
	<5715A24B.9010406@windriver.com>
	<CADkTA4N15+J0p5o44X-21Q43E9Srmf9+F49NNtYOTEh84mCWEA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5716D1D6.3020904@windriver.com>
Date: Wed, 20 Apr 2016 08:48:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4N15+J0p5o44X-21Q43E9Srmf9+F49NNtYOTEh84mCWEA@mail.gmail.com>
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
X-List-Received-Date: Wed, 20 Apr 2016 00:48:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


Updated in the repo: (add option -a to auto push or set CONTRIB_AUTO_PUSH in env).

   git://git.openembedded.org/openembedded-core-contrib rbt/cpr
   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/cpr

Robert Yang (3):
   create-pull-request: create branch on remote if not found
   create-pull-request: read remote from env var CONTRIB_REMOTE
   create-pull-request: set subject automatically for cover latter



commit 973264bfbe57f0d56ba58caf7924710f76bafca8
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Tue Apr 19 17:30:03 2016 -0700

     create-pull-request: add option -a to auto push

     Before this patch, we need two steps to create PULL:
     * Step 1, create branch:
       $ git push <contrib> <local_branch>:<remote_branch>
     * Step 2, create PULL:
       $ create-pull-request -u <contrib> -l <local_branch> -b <remote_branch> 
-r <local_branch>~<n>

     We can see that the args used in step 1 are in step 2, so we can use
     "create-pull-request -a" or set CONTRIB_AUTO_PUSH in to create the
     branch to simplify the steps.

     [YOCTO #9408]

     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 479ad6e..595fda0 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -39,6 +39,8 @@ Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s 
subject] [-r relative_to
    -l local branch     Local branch name (default: HEAD)
    -c                  Create an RFC (Request for Comment) patch series
    -h                  Display this help message
+  -a                  Automatically push local branch (-l) to remote branch (-b),
+                      or set CONTRIB_AUTO_PUSH in env
    -i commit_id        Ending commit (default: HEAD)
    -m msg_body_file    The file containing a blurb to be inserted into the 
summary email
    -o output_dir       Specify the output directory for the messages (default: 
pull-PID)
@@ -59,7 +61,7 @@ EOM
  }

  # Parse and validate arguments
-while getopts "b:cd:hi:m:o:p:r:s:u:l:" OPT; do
+while getopts "b:acd:hi:m:o:p:r:s:u:l:" OPT; do
         case $OPT in
         b)
                 BRANCH="$OPTARG"
@@ -127,6 +129,9 @@ while getopts "b:cd:hi:m:o:p:r:s:u:l:" OPT; do
                         ;;
                 esac
                 ;;
+       a)
+               CONTRIB_AUTO_PUSH="1"
+               ;;
         esac
  done

@@ -171,6 +176,11 @@ esac
  # Perform a sanity test on the web URL. Issue a warning if it is not
  # accessible, but do not abort as users may want to run offline.
  if [ -n "$WEB_URL" ]; then
+       if [ "$CONTRIB_AUTO_PUSH" = "1" ]; then
+               echo "Pushing '$BRANCH' on '$REMOTE' as requested..."
+               git push $REMOTE $L_BRANCH:$BRANCH
+               echo ""
+       fi
         wget --no-check-certificate -q $WEB_URL -O /dev/null
         if [ $? -ne 0 ]; then
                 echo "WARNING: Branch '$BRANCH' was not found on the contrib 
git tree."

// Robert


On 04/19/2016 08:18 PM, Bruce Ashfield wrote:
>
>
> On Mon, Apr 18, 2016 at 11:13 PM, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>
>
>     On 04/19/2016 11:00 AM, Bruce Ashfield wrote:
>
>
>
>         On Mon, Apr 18, 2016 at 10:45 PM, Robert Yang <liezhi.yang@windriver.com
>         <mailto:liezhi.yang@windriver.com>
>         <mailto:liezhi.yang@windriver.com <mailto:liezhi.yang@windriver.com>>>
>         wrote:
>
>              Before this patch, we need two steps to create PULL:
>              * Step 1, create branch:
>                 $ git push <contrib> <local_branch>:<remote_branch>
>              * Step 2, create PULL:
>                 $ create-pull-request -u <contrib> -l <local_branch> -b
>         <remote_branch>
>              -r <local_branch>~<n>
>
>              We can see that the args used in step 1 are in step 2, so we can use
>              create-pull-request to create the branch if not found to simplify the
>              steps.
>
>
>         I think this needs to be optional. When I'm running this script, I'm just
>         looking to have something
>         I've already pushed locally dumped. If I mess up, and don't have the
>         branch that
>         I've used
>         pushed to my remote already (or for  whatever reason want/need different
>         branches .. which
>         was broken in previous updates to the script .. grrr),  I don't want
>         something
>         pushing a branch
>         without be explicitly giving permission for that to happen.
>
>
>     Thanks, how about add an option:
>
>     "-a     automatically push/update local branch (-l) to remote branch (-b)"
>
>     Then it will always create/update the remote branch when -a is used.
>
>
> That would meet my requirement. So looks fine to me. Others of course have the
> right to object :)
>
> Cheers,
>
> Bruce
>
>
>     // Robert
>
>
>         Bruce
>
>
>              [YOCTO #9408]
>
>              Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>         <mailto:liezhi.yang@windriver.com>
>              <mailto:liezhi.yang@windriver.com <mailto:liezhi.yang@windriver.com>>>
>
>              ---
>                scripts/create-pull-request | 4 ++--
>                1 file changed, 2 insertions(+), 2 deletions(-)
>
>              diff --git a/scripts/create-pull-request b/scripts/create-pull-request
>              index 479ad6e..7dc9836 100755
>              --- a/scripts/create-pull-request
>              +++ b/scripts/create-pull-request
>              @@ -173,8 +173,8 @@ esac
>                if [ -n "$WEB_URL" ]; then
>                       wget --no-check-certificate -q $WEB_URL -O /dev/null
>                       if [ $? -ne 0 ]; then
>              -               echo "WARNING: Branch '$BRANCH' was not found on
>         the contrib
>              git tree."
>              -               echo "         Please check your remote and branch
>         parameter
>              before sending."
>              +               echo "Branch '$BRANCH' not found on '$REMOTE',
>         creating it..."
>              +               git push $REMOTE $L_BRANCH:$BRANCH
>                               echo ""
>                       fi
>                fi
>              --
>              2.7.4
>
>              --
>              _______________________________________________
>              Openembedded-core mailing list
>         Openembedded-core@lists.openembedded.org
>         <mailto:Openembedded-core@lists.openembedded.org>
>              <mailto:Openembedded-core@lists.openembedded.org
>         <mailto:Openembedded-core@lists.openembedded.org>>
>         http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
>
>         --
>         "Thou shalt not follow the NULL pointer, for chaos and madness await
>         thee at its
>         end"
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its
> end"

