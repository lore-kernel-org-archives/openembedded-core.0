Return-Path: <openembedded-devel@urbanec.net>
Received: from mail16.tpgi.com.au (mail16.tpgi.com.au [203.12.160.231])
	by mail.openembedded.org (Postfix) with ESMTP id 468BD7212A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 04:23:58 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Mon, 2 Mar 2015 15:23:53 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail16.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id t224NmL8006051
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Mon, 2 Mar 2015 15:23:53 +1100
Received: from beep.urbanec.net ([192.168.42.2]) by gw.urbanec.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <openembedded-devel@urbanec.net>)
	id 1YSHtU-0008Jt-7M; Mon, 02 Mar 2015 15:23:48 +1100
Message-ID: <54F3E5D4.7070808@urbanec.net>
Date: Mon, 02 Mar 2015 15:23:48 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <1424759999-25846-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1424759999-25846-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] glibc: Help compile with -Os
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
X-List-Received-Date: Mon, 02 Mar 2015 04:24:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/02/15 17:39, Khem Raj wrote:
> When we modify to use -Os
> -Werror doesnt go well with it, glibc needs to be
> cleaned up for that but until then lets disable -Werror
> when using -Os
>
> Change-Id: I5495255fce67953f15c07e423e3e0eef41d4ce5e
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-core/glibc/glibc.inc                  |  3 ++
>   .../glibc/glibc/eglibc-use-option-groups.patch     | 47 ++++++++++++++++++----
>   2 files changed, 43 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
> index 99a4753..4d5e98b 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -15,6 +15,9 @@ def get_optimization(d):
>       if bb.utils.contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
>           bb.note("glibc can't be built with -O0, -O2 will be used instead.")
>           return selected_optimization.replace("-O0", "-O2")
> +    elif bb.utils.contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
> +        bb.note("glibc can't be built with -Os, -Os -Wno-error will be used instead.")
> +        return selected_optimization.replace("-Os", "-Os -Wno-error")

I think there's a typo here which prevents this from working as 
intended. The second check is done on "-O0" when it's supposed to be "-Os"

Cheers,

	Peter


