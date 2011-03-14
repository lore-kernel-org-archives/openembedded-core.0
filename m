Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1PzFzL-0008SF-4Q
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 23:11:43 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Mar 2011 15:10:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,318,1297065600"; d="scan'208";a="612901892"
Received: from doubt.jf.intel.com (HELO [10.7.199.155]) ([10.7.199.155])
	by orsmga002.jf.intel.com with ESMTP; 14 Mar 2011 15:10:00 -0700
Message-ID: <4D7E9231.3050009@linux.intel.com>
Date: Mon, 14 Mar 2011 15:09:53 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1299942641.git.raj.khem@gmail.com>
	<9d1bcc0f0467186a24ddd8acd4bd7fbc1ae5ebea.1299942641.git.raj.khem@gmail.com>
In-Reply-To: <9d1bcc0f0467186a24ddd8acd4bd7fbc1ae5ebea.1299942641.git.raj.khem@gmail.com>
Subject: Re: [PATCH 1/1] send-pull-request: Fetch TO email address from git config if specified
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Mar 2011 22:11:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Khem,

On 03/12/2011 07:12 AM, Khem Raj wrote:
> Usually people using git send-email has git config sendmail.to
> configured to the usual mailing list or person so we harness that
> here.

OK, good idea, couple concerns below.

>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   scripts/send-pull-request |   21 +++++++++++++++------
>   1 files changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/send-pull-request b/scripts/send-pull-request
> index 7f51a1b..c5dc9a9 100755
> --- a/scripts/send-pull-request
> +++ b/scripts/send-pull-request
> @@ -109,15 +109,17 @@ if [ $AUTO -eq 1 ]; then
>       harvest_recipients CC "^.*-[Bb][Yy]: *"
>   fi
>
> -if [ -z "$TO" ]&&  [ -z "$CC" ]; then
> -    echo "ERROR: you have not specified any recipients."
> -    usage
> -    exit 1
> -fi
> -
>   case "$PULL_MTA" in
>       git)
>           FROM="$(git config sendemail.from)"
> +	AUTO_TO="$(git config sendemail.to)"
> +	if [ ! -e "$AUTO_TO" ]; then

-e tests for file existence...

> +	    if [ ! -e $TO ]; then

Here too, and please quote all shell variables.

I think you want -n:

if [ -n "$AUTO_TO" ]; then
	if [ -n "$TO" ]; then

Thanks,

Darren

> +		TO="$TO,$AUTO_TO"
> +	    else
> +		TO="$AUTO_TO"
> +	    fi
> +	fi
>           ;;
>       sendmail)
>           if [ -z "$FROM" ]; then
> @@ -131,6 +133,13 @@ case "$PULL_MTA" in
>           ;;
>   esac
>
> +if [ -z "$TO" ]&&  [ -z "$CC" ]; then
> +    echo "ERROR: you have not specified any recipients."
> +    usage
> +    exit 1
> +fi
> +
> +
>   # Generate report for the user and require confirmation before sending
>   cat<<EOM
>   The following patches:

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


