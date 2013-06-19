Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4A4FE601AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 13:54:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2013 06:54:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,896,1363158000"; d="scan'208";a="352352007"
Received: from unknown (HELO [10.255.13.131]) ([10.255.13.131])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jun 2013 06:54:44 -0700
Message-ID: <51C1B7FE.1020602@linux.intel.com>
Date: Wed, 19 Jun 2013 06:54:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1371647117.20823.182.camel@ted>
In-Reply-To: <1371647117.20823.182.camel@ted>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] utility-tasks: Add recideptask flag for fetchall/checkuriall
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
X-List-Received-Date: Wed, 19 Jun 2013 13:54:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/19/2013 06:05 AM, Richard Purdie wrote:
> See the bitbake commit adding the recideptask flag for details of the
> problem but in summary, we weren't seeing the [depends] of tasks like
> do_rootfs being taking into account for fetchall. This was leading
> to not all sources being fetched and this is the OE-Core part of the
> fix for this problem.
>
> BB_DEFAULT_TASK is the default task used since this is the one that
> most commands would end up targeting and is how users expect the command
> to behave.
>
> [YOCTO #4597]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/prexport.bbclass b/meta/classes/prexport.bbclass
> index 16c4bf2..5a1cb33 100644
> --- a/meta/classes/prexport.bbclass
> +++ b/meta/classes/prexport.bbclass
> @@ -55,4 +55,4 @@ python prexport_handler () {
>   }
>
>   addhandler prexport_handler
> -prexport_handler bb.event.RecipeParsed bb.event.ParseStarted bb.event.ParseCompleted"
> +prexport_handler[eventmask] = "bb.event.RecipeParsed bb.event.ParseStarted bb.event.ParseCompleted"
> diff --git a/meta/classes/utility-tasks.bbclass b/meta/classes/utility-tasks.bbclass
> index bb26eb7..507e0f1 100644
> --- a/meta/classes/utility-tasks.bbclass
> +++ b/meta/classes/utility-tasks.bbclass
> @@ -48,6 +48,7 @@ python do_checkuri() {
>
>   addtask checkuriall after do_checkuri
>   do_checkuriall[recrdeptask] = "do_checkuriall do_checkuri"
> +do_checkuriall[recideptask] = "do_${BB_DEFAULT_TASK}"
>   do_checkuriall[nostamp] = "1"
>   do_checkuriall() {
>   	:
> @@ -55,6 +56,7 @@ do_checkuriall() {
>
>   addtask fetchall after do_fetch
>   do_fetchall[recrdeptask] = "do_fetchall do_fetch"
> +do_fetchall[recideptask] = "do_${BB_DEFAULT_TASK}"

Would this change be needed in some of the distrodata tasks also? 
Mostly they operate on world or universe and not images, but I could see 
someone trying to get that info for a given image.

Sau!

>   do_fetchall() {
>   	:
>   }
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

