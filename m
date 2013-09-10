Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AFAC76BD8B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 15:33:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Sep 2013 08:33:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,879,1371106800"; d="scan'208";a="401257295"
Received: from unknown (HELO [10.255.14.81]) ([10.255.14.81])
	by orsmga002.jf.intel.com with ESMTP; 10 Sep 2013 08:33:18 -0700
Message-ID: <1378827198.19978.106.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Tue, 10 Sep 2013 08:33:18 -0700
In-Reply-To: <398be88b2b4779bc227d9f716ebcc360958e02dd.1378483732.git.pkj@axis.com>
References: <cover.1378483732.git.pkj@axis.com>
	<398be88b2b4779bc227d9f716ebcc360958e02dd.1378483732.git.pkj@axis.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] bb-matrix: Make sure local.conf does not interfere
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
X-List-Received-Date: Tue, 10 Sep 2013 15:33:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-09-06 at 18:12 +0200, Peter Kjellerstedt wrote:
> If any of BB_NUMBER_THREADS, PARALLEL_MAKE or SSTATE_DIR happened to be
> set in local.conf then the bb-matrix script would not perform as
> intended.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  scripts/contrib/bb-perf/bb-matrix.sh | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/contrib/bb-perf/bb-matrix.sh b/scripts/contrib/bb-perf/bb-matrix.sh
> index 1064565..d5127e7 100755
> --- a/scripts/contrib/bb-perf/bb-matrix.sh
> +++ b/scripts/contrib/bb-perf/bb-matrix.sh
> @@ -53,6 +53,10 @@ if [ $? -ne 0 ]; then
>  	exit 1
>  fi
>  
> +# Make sure neither of BB_NUMBER_THREADS, PARALLEL_MAKE and SSTATE_DIR are set
> +# in local.conf
> +sed -ri 's/^([[:space:]]*(BB_NUMBER_THREADS|PARALLEL_MAKE|SSTATE_DIR)[[:space:]]*\??=.*)/#\1/' conf/local.conf
> +

Unless I'm mistaken, you are modifying the users local.conf?

We definitely should *not* be doing that. I would support documenting
this as a requirement and even printing a warning if any of a set of
variables are found in the bitbake environment.

Note that local.conf is not the only place where these could be set.

Richard, shouldn't the env setting override anything in local.conf?

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



