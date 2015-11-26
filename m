Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 19E6B6018C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 21:49:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 26 Nov 2015 13:49:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,348,1444719600"; d="scan'208";a="860472798"
Received: from rsiu-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.135.187])
	by fmsmga002.fm.intel.com with ESMTP; 26 Nov 2015 13:49:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Nov 2015 10:49:39 +1300
Message-ID: <3279842.mNGJPsGIIZ@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.13-100.fc21.x86_64; KDE/4.14.11; x86_64; ;
	)
In-Reply-To: <1448465325-6906-1-git-send-email-george.nita@enea.com>
References: <1448465325-6906-1-git-send-email-george.nita@enea.com>
MIME-Version: 1.0
Subject: Re: [PATCH] toolchain-shar-extract.sh: Ensure it's ran in clean environment
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
X-List-Received-Date: Thu, 26 Nov 2015 21:49:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 25 November 2015 16:28:45 George Nita wrote:
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
>  meta/files/toolchain-shar-extract.sh | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/files/toolchain-shar-extract.sh
> b/meta/files/toolchain-shar-extract.sh index 98b9f1c..4fd734a 100644
> --- a/meta/files/toolchain-shar-extract.sh
> +++ b/meta/files/toolchain-shar-extract.sh
> @@ -1,5 +1,7 @@
>  #!/bin/sh
> 
> +[ -z "$ENVCLEANED" ] && exec /usr/bin/env -i ENVCLEANED=1 "$0" "$@"
> +
>  INST_ARCH=$(uname -m | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
>  SDK_ARCH=$(echo @SDK_ARCH@ | sed -e "s/i[3-6]86/ix86/" -e
> "s/x86[-_]64/x86_64/")

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

