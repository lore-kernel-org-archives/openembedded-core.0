Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2FBA76FFCE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 22:04:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1CM4h0S014795
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 12 Feb 2016 14:04:43 -0800
Received: from server.local (147.11.119.103) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 12 Feb 2016 14:04:42 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1455300000.16142.331.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <56BE56F9.2030806@windriver.com>
Date: Fri, 12 Feb 2016 17:04:41 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455300000.16142.331.camel@linuxfoundation.org>
Cc: "saul.wold" <saul.wold@intel.com>
Subject: Re: [PATCH] scripts/runqemu-internal: Work around qemux86 PAT bugs in linux 4.4.1
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
X-List-Received-Date: Fri, 12 Feb 2016 22:04:46 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-02-12 1:00 PM, Richard Purdie wrote:
> Since the upgrade of qemux86 to 4.4.1 we're seeing PAT issues when
> starting the X server. We need to fix the problem but the failing
> sanity tests mask out other issues and we need a workaround.
>

I was out of the day and didn't notice if any logs were available
for the issue ? Is there a pointer to the failing logs ?

Obviously I didn't notice this in any of my runs. I'll check 4.4.x
for anything that looks suspicious, and can bisect if needed.

Bruce

> Merge this for now until we can figure out the full issue. This is
> better than changing the kernel defconfig or reverting to old
> kernel versions.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index ebed2bd..ad854d1 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -434,7 +434,7 @@ if [ "$MACHINE" = "qemux86" ]; then
>       fi
>       # Currently oprofile's event based interrupt mode doesn't work(Bug #828) in
>       # qemux86 and qemux86-64. We can use timer interrupt mode for now.
> -    KERNCMDLINE="$KERNCMDLINE oprofile.timer=1"
> +    KERNCMDLINE="$KERNCMDLINE oprofile.timer=1 nopat"
>   fi
>
>   if [ "$MACHINE" = "qemux86-64" ]; then
>
>


