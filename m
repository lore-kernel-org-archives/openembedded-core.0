Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1PzkeG-00067O-ER
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 07:56:00 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Mar 2011 23:54:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,193,1299484800"; d="scan'208";a="667768474"
Received: from unknown (HELO [10.255.12.146]) ([10.255.12.146])
	by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2011 23:54:17 -0700
Message-ID: <4D805E89.4050105@linux.intel.com>
Date: Tue, 15 Mar 2011 23:54:01 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1300247367.git.raj.khem@gmail.com>
	<25530fcd5ccb232f0236a03d8fcd45167fa8488e.1300247367.git.raj.khem@gmail.com>
In-Reply-To: <25530fcd5ccb232f0236a03d8fcd45167fa8488e.1300247367.git.raj.khem@gmail.com>
Subject: Re: [PATCH, v2 1/1] send-pull-request: Fetch TO email address from git config	if specified
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
X-List-Received-Date: Wed, 16 Mar 2011 06:56:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/15/2011 08:53 PM, Khem Raj wrote:
> Usually people using git send-email has git config sendmail.to
> configured to the usual mailing list or person so we harness that
> here.

Right, looks sane to me.

>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>

Acked-by: Darren Hart <dvhart@linux.intel.com>

Please see below all the same:

> ---
>   scripts/send-pull-request |   21 +++++++++++++++------
>   1 files changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/send-pull-request b/scripts/send-pull-request
> index 7f51a1b..3af2a9f 100755
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
> +	if [ -n "$AUTO_TO" ]; then
> +	    if [ -n "$TO" ]; then
> +		TO="$TO,$AUTO_TO"
> +	    else
> +		TO="$AUTO_TO"
> +	    fi
> +	fi

Quite the abuse of tabs and spaces for indentation here, but judging 
from the contextual lines, I don't have any right to point the finger 
here :-) I'll clean up the whitespace after this hits master.

What's the rule in poky, tabs for bash, spaces for python?

--
Darren

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


