Return-Path: <dvhart@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 2A12E6BD8B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 15:30:35 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 Sep 2013 08:30:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,879,1371106800"; d="scan'208";a="358465647"
Received: from unknown (HELO [10.255.14.81]) ([10.255.14.81])
	by azsmga001.ch.intel.com with ESMTP; 10 Sep 2013 08:30:08 -0700
Message-ID: <1378827008.19978.103.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Tue, 10 Sep 2013 08:30:08 -0700
In-Reply-To: <8455f1f49363caff9ceb89a81d9b9a4650dd8ece.1378483732.git.pkj@axis.com>
References: <cover.1378483732.git.pkj@axis.com>
	<8455f1f49363caff9ceb89a81d9b9a4650dd8ece.1378483732.git.pkj@axis.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] bb-matrix: Clean before, rather than after, building
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
X-List-Received-Date: Tue, 10 Sep 2013 15:30:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-09-06 at 18:12 +0200, Peter Kjellerstedt wrote:
> This makes sure the the first build starts from a clean state. Otherwise
> one could have the first build affected by any leftover state from
> a previous build.
> 
> This also leaves a working state behind after the final build.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Hi Peter,

Thanks for taking the time to send in a fix!

> ---
>  scripts/contrib/bb-perf/bb-matrix.sh | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/scripts/contrib/bb-perf/bb-matrix.sh b/scripts/contrib/bb-perf/bb-matrix.sh
> index 37721fe..1064565 100755
> --- a/scripts/contrib/bb-perf/bb-matrix.sh
> +++ b/scripts/contrib/bb-perf/bb-matrix.sh
> @@ -63,6 +63,10 @@ for BB in $BB_RANGE; do
>  		date
>  		echo "BB=$BB PM=$PM Logging to $BB_LOG"
>  
> +		echo -n "  Preparing the work directory... "
> +		rm -rf pseudodone tmp sstate-cache tmp-eglibc &> /dev/null
> +		echo "done"
> +

Makes sense to me, although there is one point worth discussing. The
tmp-eglibc directory could change depending on the DISTRO setting iiuc.
All of tmp, sstate-cache, and tmp-eglibc could be dealt with using
cleansstate I believe:

bitbake <target> -c cleansstate

Richard, should we consider using this instead?

Either way, the above is an improvement, so:

Acked-by: Darren Hart <dvhart@linux.intel.com>

Finally, In the future Peter, please have a look at the git log for the
file(s) you are patching and if there is an obvious author/maintainer
from the log, please include them on Cc. This will help ensure your
patch gets reviewed and merged in a timely fashion.

Thanks again for the patch!

>  		# Export the variables under test and run the bitbake command
>  		# Strip any leading zeroes before passing to bitbake
>  		export BB_NUMBER_THREADS=$(echo $BB | sed 's/^0*//')
> @@ -70,12 +74,6 @@ for BB in $BB_RANGE; do
>  		/usr/bin/time -f "$BB $PM $TIME_STR" -a -o $RUNTIME_LOG $BB_CMD &> $BB_LOG
>  
>  		echo "  $(tail -n1 $RUNTIME_LOG)"
> -		echo -n "  Cleaning up..."
> -		mv tmp/buildstats $RUNDIR/$BB-$PM-buildstats
> -		rm -f pseudodone &> /dev/null
> -		rm -rf tmp &> /dev/null
> -		rm -rf sstate-cache &> /dev/null
> -		rm -rf tmp-eglibc &> /dev/null
> -		echo "done"
> +		cp -a tmp/buildstats $RUNDIR/$BB-$PM-buildstats
>  	done
>  done

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



