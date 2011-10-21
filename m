Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RH65F-0005ah-9K
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 05:47:49 +0200
Received: from mail-gy0-f180.google.com ([209.85.160.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 20 Oct 2011 20:41:55 -0700
Received: by gyf1 with SMTP id 1so7808118gyf.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 20:41:55 -0700 (PDT)
Received: by 10.68.72.167 with SMTP id e7mr8339533pbv.19.1319168514641;
	Thu, 20 Oct 2011 20:41:54 -0700 (PDT)
Received: from [192.168.1.12] (c-98-246-160-155.hsd1.or.comcast.net.
	[98.246.160.155])
	by mx.google.com with ESMTPS id x7sm25501893pbf.5.2011.10.20.20.41.53
	(version=SSLv3 cipher=OTHER); Thu, 20 Oct 2011 20:41:53 -0700 (PDT)
Message-ID: <4EA0EA00.1050800@intel.com>
Date: Thu, 20 Oct 2011 20:41:52 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1319167843.git.otavio@ossystems.com.br>
	<9c3cff6e514e8ccc69b9462197c7bceeb117a55e.1319167843.git.otavio@ossystems.com.br>
In-Reply-To: <9c3cff6e514e8ccc69b9462197c7bceeb117a55e.1319167843.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 2/4] useradd.bbclass: check if a group already exists manually
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
X-List-Received-Date: Fri, 21 Oct 2011 03:47:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/2011 08:31 PM, Otavio Salvador wrote:
> The use of groupadd -f makes much more difficult to figure when a
> group is not add. This was the case of the class not working for our
> usage and this being caused by the lack of '/etc/group' file but
> unnoticed as groupadd wasn't failing according.
>
> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>

Thanks for getting to the bottom of this!

Acked-by: Scott Garman <scott.a.garman@intel.com>

> ---
>   meta/classes/useradd.bbclass |    8 +++++++-
>   1 files changed, 7 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
> index 1e03a04..fb70b3e 100644
> --- a/meta/classes/useradd.bbclass
> +++ b/meta/classes/useradd.bbclass
> @@ -37,7 +37,13 @@ if test "x$GROUPADD_PARAM" != "x"; then
>   	opts=`echo "$GROUPADD_PARAM" | cut -d ';' -f 1`
>   	remaining=`echo "$GROUPADD_PARAM" | cut -d ';' -f 2-`
>   	while test "x$opts" != "x"; do
> -		eval $PSEUDO groupadd -f $OPT $opts
> +		groupname=`echo "$opts" | awk '{ print $NF }'`
> +		group_exists=`grep "^$groupname:" $SYSROOT/etc/group || true`
> +		if test "x$group_exists" = "x"; then
> +			eval $PSEUDO groupadd  $OPT $opts
> +		else
> +			echo "Note: group $groupname already exists, not re-creating it"
> +		fi
>
>   		if test "x$opts" = "x$remaining"; then
>   			break


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


