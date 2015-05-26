Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 800507566F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 21:22:39 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 26 May 2015 14:22:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,501,1427785200"; d="scan'208";a="577183391"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.144])
	([10.219.4.144])
	by orsmga003.jf.intel.com with ESMTP; 26 May 2015 14:22:41 -0700
Message-ID: <5564E473.4090400@linux.intel.com>
Date: Tue, 26 May 2015 16:24:03 -0500
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1432147458-28773-1-git-send-email-anibal.limon@linux.intel.com>
In-Reply-To: <1432147458-28773-1-git-send-email-anibal.limon@linux.intel.com>
Subject: Re: [PATCHv2] xserver-nodm: Support reboot from inside X
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
X-List-Received-Date: Tue, 26 May 2015 21:22:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

ping...

On 20/05/15 13:44, Aníbal Limón wrote:
> From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>
> If reboot was called from inside the Xserver there could happen a race
> condition where chvt would never end, and therefore the whole system was
> stalled.
>
> The user could not recover the system by ssh the machine or using the
> keyboard.
>
> Running chvt in background fixes the issue.
>
> Also move sleep 1s inside stop to give time for killproc xinit for
> fix issue when chvt 1 don't work because X server is still running.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> ---
>   meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
> index 2e3e090..bfa0a8d 100755
> --- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
> +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
> @@ -48,12 +48,12 @@ case "$1" in
>     stop)
>           echo "Stopping XServer"
>           killproc xinit
> -        chvt 1
> +        sleep 1
> +        chvt 1 &
>     ;;
>   
>     restart)
>   	$0 stop
> -        sleep 1
>           $0 start
>     ;;
>   


