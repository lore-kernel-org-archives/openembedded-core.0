Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 582B66E3DE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 20:42:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Apr 2014 13:42:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,790,1389772800"; d="scan'208";a="486799039"
Received: from unknown (HELO [10.255.12.43]) ([10.255.12.43])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2014 13:42:28 -0700
Message-ID: <533DC7B3.3060108@linux.intel.com>
Date: Thu, 03 Apr 2014 13:42:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1396519133.git.liezhi.yang@windriver.com>
	<a3a8a29aaf2c8349e71f20cd42e3a1627dd27a6c.1396519133.git.liezhi.yang@windriver.com>
In-Reply-To: <a3a8a29aaf2c8349e71f20cd42e3a1627dd27a6c.1396519133.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] useradd_base.bbclass: sleep more and more seconds (up to 10)
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
X-List-Received-Date: Thu, 03 Apr 2014 20:42:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/03/2014 02:59 AM, Robert Yang wrote:
> Currently, it would sleep 1 second when fail to add the user, this maybe
> not enough when we use the sstate cache, as my test shows below, nearly
> all the useradd actions are doing in the same minute when mirror from
> ssate cache, and it would fail when the load is high, I got these time
> by adding strace before the useradd for debugging:
>
> 2014-03-31 14:48:22.978079781 +0800 /tmp/log/pulseaudio.4.c
> 2014-03-31 14:48:22.028079813 +0800 /tmp/log/pulseaudio.1.c
> 2014-03-31 14:48:21.949079816 +0800 /tmp/log/pulseaudio.3.c
> 2014-03-31 14:48:20.903079852 +0800 /tmp/log/pulseaudio.2.c
> 2014-03-31 14:48:20.006079883 +0800 /tmp/log/nfs-utils.9.c
> 2014-03-31 14:48:18.876079923 +0800 /tmp/log/xuser-account.9.c
> 2014-03-31 14:48:18.824079924 +0800 /tmp/log/pulseaudio.0.c
> 2014-03-31 14:48:17.826079959 +0800 /tmp/log/xuser-account.8.c
> 2014-03-31 14:48:17.766079961 +0800 /tmp/log/nfs-utils.8.c
> 2014-03-31 14:48:16.794079995 +0800 /tmp/log/xuser-account.7.c
> 2014-03-31 14:48:16.735079997 +0800 /tmp/log/nfs-utils.7.c
> 2014-03-31 14:48:14.719080066 +0800 /tmp/log/xuser-account.5.c
> 2014-03-31 14:48:14.677080068 +0800 /tmp/log/nfs-utils.5.c
> 2014-03-31 14:48:12.621080139 +0800 /tmp/log/nfs-utils.3.c
> 2014-03-31 14:48:11.589080175 +0800 /tmp/log/nfs-utils.2.c
> 2014-03-31 14:48:10.242080221 +0800 /tmp/log/builder.0.c
> 2014-03-31 14:48:09.523080246 +0800 /tmp/log/nfs-utils.0.c
> 2014-03-31 14:48:09.488080248 +0800 /tmp/log/openssh.0.c
> 2014-03-31 14:48:09.485080248 +0800 /tmp/log/rpcbind.1.c
> 2014-03-31 14:48:07.590080313 +0800 /tmp/log/rpcbind.0.c
> 2014-03-31 14:28:15.437121590 +0800 /tmp/log/avahi.0.c
> 2014-03-31 14:18:19.067142238 +0800 /tmp/log/dbus.0.c
>
> The nfs-utils and xuser-account are failed to add the user.
>
> The useradd command needs two locks, passwd.lock and group.lock, it may
> get one, but can't get another one if we look into these .c files, sleep
> 1 second is not enough, it needs more seconds, the reason is that, if
> succeed, it doesn't have any side effects, if failed, we need wait for
> more seconds rather than make it more crowding.
>
> I've tried to use "sleep 5", but it didn't make much better since they
> would sleep and wake up nearly at the same time, I also tried to use
> "sleep <RANDOM seconds between 1 and 10>", that didn't make much better
> ,either.
>
> I think that a better ways is sleep more and more seconds (up to 10
> seconds) when failed, this can't fix the problem that they may do the
> actions at the same time, but the logic is: if it is not crowding, sleep
> less time should be OK, otherwise sleep more and more time.
>
> Here is the testing result which seems much better:
> 2014-04-03 14:09:56.605185284 +0800 dbus.0.c
> 2014-04-03 14:09:39.899185862 +0800 rpcbind.5.c
> 2014-04-03 14:09:38.400185914 +0800 distcc.4.c
> 2014-04-03 14:09:35.206186025 +0800 pulseaudio.1.c
> 2014-04-03 14:09:33.979186067 +0800 rpcbind.4.c
> 2014-04-03 14:09:33.364186089 +0800 pulseaudio.0.c
> 2014-04-03 14:09:33.360186089 +0800 distcc.3.c
> 2014-04-03 14:09:30.996186171 +0800 avahi-ui.0.c
> 2014-04-03 14:09:30.298186195 +0800 distcc.2.c
> 2014-04-03 14:09:29.905186208 +0800 rpcbind.3.c
> 2014-04-03 14:09:29.410186226 +0800 avahi-ui.2.c
> 2014-04-03 14:09:28.239186266 +0800 distcc.1.c
> 2014-04-03 14:09:27.298186299 +0800 xuser-account.0.c
> 2014-04-03 14:09:27.032186308 +0800 distcc.0.c
> 2014-04-03 14:09:26.836186315 +0800 rpcbind.2.c
> 2014-04-03 14:09:25.846186349 +0800 nfs-utils.1.c
> 2014-04-03 14:09:25.752186352 +0800 avahi-ui.1.c
> 2014-04-03 14:09:24.779186386 +0800 builder.0.c
> 2014-04-03 14:09:24.746186387 +0800 rpcbind.1.c
> 2014-04-03 14:09:23.916186416 +0800 openssh.1.c
> 2014-04-03 14:09:23.848186418 +0800 nfs-utils.0.c
> 2014-04-03 14:09:23.594186427 +0800 rpcbind.0.c
> 2014-04-03 14:09:22.609186461 +0800 ppp-dialin.0.c
> 2014-04-03 14:09:21.817186488 +0800 openssh.0.c
>
> [YOCTO #6085]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/classes/useradd_base.bbclass | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.bbclass
> index 7aafe29..01d2e99 100644
> --- a/meta/classes/useradd_base.bbclass
> +++ b/meta/classes/useradd_base.bbclass
> @@ -24,7 +24,7 @@ perform_groupadd () {
>   			group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
>   			if test "x$group_exists" = "x"; then
>   				bbwarn "groupadd command did not succeed. Retrying..."
> -				sleep 1
> +				sleep `expr $count + 1`

Why not move the count assignment that is below the fi (not visible in 
this diff) to above the test and then check for count > retries, this 
will save one call to expr.

Sau!

>   			else
>   				break
>   			fi
> @@ -52,7 +52,7 @@ perform_useradd () {
>   		       user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
>   		       if test "x$user_exists" = "x"; then
>   			       bbwarn "useradd command did not succeed. Retrying..."
> -			       sleep 1
> +			       sleep `expr $count + 1`
>   		       else
>   			       break
>   		       fi
> @@ -90,7 +90,7 @@ perform_groupmems () {
>   			mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $rootdir/etc/group || true`"
>   			if test "x$mem_exists" = "x"; then
>   				bbwarn "groupmems command did not succeed. Retrying..."
> -				sleep 1
> +				sleep `expr $count + 1`
>   			else
>   				break
>   			fi
> @@ -126,7 +126,7 @@ perform_groupdel () {
>   			group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
>   			if test "x$group_exists" != "x"; then
>   				bbwarn "groupdel command did not succeed. Retrying..."
> -				sleep 1
> +				sleep `expr $count + 1`
>   			else
>   				break
>   			fi
> @@ -154,7 +154,7 @@ perform_userdel () {
>   		       user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
>   		       if test "x$user_exists" != "x"; then
>   			       bbwarn "userdel command did not succeed. Retrying..."
> -			       sleep 1
> +			       sleep `expr $count + 1`
>   		       else
>   			       break
>   		       fi
> @@ -184,7 +184,7 @@ perform_groupmod () {
>   			eval $PSEUDO groupmod $opts
>   			if test $? != 0; then
>   				bbwarn "groupmod command did not succeed. Retrying..."
> -				sleep 1
> +				sleep `expr $count + 1`
>   			else
>   				break
>   			fi
> @@ -214,7 +214,7 @@ perform_usermod () {
>   		       eval $PSEUDO usermod $opts
>   		       if test $? != 0; then
>   			       bbwarn "usermod command did not succeed. Retrying..."
> -			       sleep 1
> +			       sleep `expr $count + 1`
>   		       else
>   			       break
>   		       fi
>

