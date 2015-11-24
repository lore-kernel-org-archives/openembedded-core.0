Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B84E76057A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 22:35:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 24 Nov 2015 14:35:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,340,1444719600"; d="scan'208";a="828325384"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.175.61])
	by orsmga001.jf.intel.com with ESMTP; 24 Nov 2015 14:35:11 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: George Nita <george.nita@enea.com>
Date: Wed, 25 Nov 2015 11:35:09 +1300
Message-ID: <6556342.K0qaf5B5dg@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.13-100.fc21.x86_64; KDE/4.14.11; x86_64; ;
	)
In-Reply-To: <1447929347-20043-1-git-send-email-george.nita@enea.com>
References: <1447929347-20043-1-git-send-email-george.nita@enea.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dizzy][PATCH] toolchain-shar-template.sh: Ensure it's ran in clean environment
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
X-List-Received-Date: Tue, 24 Nov 2015 22:35:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi George,

On Thursday 19 November 2015 11:35:47 George Nita wrote:
> Fixes [YOCTO #8698] --
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=8698
> 
> If prior to running the toolchain installation script a toolchain
> environment script is sourced then the toolchain installation will
> fail. This because the environment is now set for the sourced toolchain
> and doesn't suit the installation. In particular PATH points to the
> toolchain executables.
> 
> The fix makes the script recursively call itself a second time with a
> clean environment.
> 
> Tested by sourcing a previous successfully installed environment, erasing
> the previous installation directory and then reinstalling in the same
> directory.
> 
> Signed-off-by: George Nita <george.nita@enea.com>
> ---
>  meta/files/toolchain-shar-template.sh | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/files/toolchain-shar-template.sh
> b/meta/files/toolchain-shar-template.sh index 4a7fbd5..b8c5685 100644
> --- a/meta/files/toolchain-shar-template.sh
> +++ b/meta/files/toolchain-shar-template.sh
> @@ -1,5 +1,7 @@
>  #!/bin/bash
> 
> +[ -z "$ENVCLEANED" ] && exec /usr/bin/env -i  ENVCLEANED=1 "$0" "$@"
> +
>  INST_ARCH=$(uname -m | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
>  SDK_ARCH=$(echo @SDK_ARCH@ | sed -e "s/i[3-6]86/ix86/" -e
> "s/x86[-_]64/x86_64/")

Interesting, I wasn't aware you could do this with env, thanks.

You've sent this patch on top of dizzy, however when we make fixes like this 
the fix needs to go into master first and then backported to all release 
branches between that and the one you're targeting, assuming they are 
applicable; otherwise we can be in the situation where the fix is effectively 
lost when upgrading. In this instance I'll take care of this for you and send 
out a new fix (along with some others for the SDK), but if you could remember 
that when sending future patches that would be great.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

