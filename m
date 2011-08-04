Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qoz2b-00036q-0a
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 16:36:53 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Aug 2011 07:32:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,316,1309762800"; d="scan'208";a="37846066"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by fmsmga001.fm.intel.com with ESMTP; 04 Aug 2011 07:32:28 -0700
Message-ID: <4E3AAD7B.2080407@linux.intel.com>
Date: Thu, 04 Aug 2011 07:32:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311804095-3244-1-git-send-email-tom_rini@mentor.com>
In-Reply-To: <1311804095-3244-1-git-send-email-tom_rini@mentor.com>
Subject: Re: [PATCH] connman_test.sh: Rework for busybox 'ps'
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
X-List-Received-Date: Thu, 04 Aug 2011 14:36:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/27/2011 03:01 PM, Tom Rini wrote:
> This script has two problems today.  First, it does 'ps -ef cmd'
> in failure which real ps doesn't grok and busybox ps just ignores
> the argument on.  Switch that to 'ps -ef'.  Second, busybox ps -o
> doesn't understand cmd but does understand comm.  Using comm lets
> us simplify the test logic as well, so switch to that.
>
> Signed-off-by: Tom Rini<tom_rini@mentor.com>
> ---
>   scripts/qemuimage-tests/tools/connman_test.sh |    8 ++++----
>   1 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/qemuimage-tests/tools/connman_test.sh b/scripts/qemuimage-tests/tools/connman_test.sh
> index d7e63e7..dd5554c 100644
> --- a/scripts/qemuimage-tests/tools/connman_test.sh
> +++ b/scripts/qemuimage-tests/tools/connman_test.sh
> @@ -27,21 +27,21 @@ if [ ! -f /usr/sbin/connmand ]; then
>   fi
>
>   # Check if connmand is running in background
> -count=`ps -eo cmd | cut -d " " -f 1 | grep -c connmand`
> +count=`ps -eo comm | grep -c connmand`
>
>   if [ $count -ne 1 ]; then
>   	Target_Info "connmand has issue when running in background, Pls, check the output of ps"
> -	ps -ef cmd | grep connmand
> +	ps -ef | grep connmand
>   	exit 1
>   fi
>
>   # Check if there is always only one connmand running in background
>   if [ connmand>  /dev/null 2>&1 ]; then
>   	Target_Info "connmand command run without problem"
> -	count=`ps -eo cmd | cut -d " " -f 1 | grep -c connmand`
> +	count=`ps -eo comm | grep -c connmand`
>   	if [ $count -ne 1 ]; then
>   		Target_Info "There are more than one connmand running in background, Pls, check the output of ps"
> -		ps -ef cmd | grep connmand
> +		ps -ef | grep connmand
>   		exit 1
>   	else
>   		Target_Info "There is always one connmand running in background, test pass"

Merged into OE-Core

Thanks
	Sau!


