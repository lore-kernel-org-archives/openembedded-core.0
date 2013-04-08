Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UPBHH-0007Qc-5D for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 14:34:28 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r38CS1aP006896; Mon, 8 Apr 2013 13:28:02 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id diygJ8VuwhG0; Mon,  8 Apr 2013 13:28:01 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r38CRm1F006892
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 8 Apr 2013 13:27:53 +0100
Message-ID: <1365423401.12407.33.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bogdan Marinescu <bogdan.a.marinescu@intel.com>, Ioana Grigoropol
	<ioanax.grigoropol@intel.com>
Date: Mon, 08 Apr 2013 13:16:41 +0100
In-Reply-To: <1365422283-27630-1-git-send-email-bogdan.a.marinescu@intel.com>
References: <1365422283-27630-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tcf-agent: Use kill instead of killproc to stop agent
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Apr 2013 12:34:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-04-08 at 14:58 +0300, Bogdan Marinescu wrote:
> From: Ioana Grigoropol <ioanax.grigoropol@intel.com>

Why?

> [Yocto #3928]

I could read this but I shouldn't have to...

Cheers,

Richard

> Signed-off-by: Ioana Grigoropol <ioanax.grigoropol@intel.com>
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>  .../tcf-agent/tcf-agent/fix_tcf-agent.init.patch   |    6 ++++--
>  meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/fix_tcf-agent.init.patch b/meta/recipes-devtools/tcf-agent/tcf-agent/fix_tcf-agent.init.patch
> index fefaf04..8ea5b43 100644
> --- a/meta/recipes-devtools/tcf-agent/tcf-agent/fix_tcf-agent.init.patch
> +++ b/meta/recipes-devtools/tcf-agent/tcf-agent/fix_tcf-agent.init.patch
> @@ -13,7 +13,7 @@ Upstream-Status: Inappropriate [poky-specific script]
>   	install -c -t $(INSTALLROOT)$(INCLUDE)/tcf/services -m 644 services/*.h
>  --- /dev/null
>  +++ b/tcf-agent.init
> -@@ -0,0 +1,78 @@
> +@@ -0,0 +1,80 @@
>  +#!/bin/sh
>  +### BEGIN INIT INFO
>  +# Provides:          tcf-agent
> @@ -50,14 +50,16 @@ Upstream-Status: Inappropriate [poky-specific script]
>  +    stop)
>  +        echo -n "Stopping $DAEMON_NAME: "
>  +        count=0
> ++        pid=$(/bin/pidof $DAEMON_PATH)
>  +        while [ -n "`/bin/pidof $DAEMON_PATH`" -a $count -lt 10 ] ; do
> -+            killproc $DAEMON_PATH >& /dev/null
> ++            kill $pid > /dev/null 2>&1
>  +            sleep 1
>  +            RETVAL=$?
>  +            if [ $RETVAL != 0 -o -n "`/bin/pidof $DAEMON_PATH`" ] ; then
>  +                sleep 3
>  +            fi
>  +            count=`expr $count + 1`
> ++            pid=$(/bin/pidof $DAEMON_PATH)
>  +        done
>  +        rm -f /var/lock/subsys/$DAEMON_NAME
>  +        if [ -n "`/bin/pidof $DAEMON_PATH`" ] ; then
> diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> index 4d43c62..ced2b41 100644
> --- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> +++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
>  
>  SRCREV = "4ef94ecb927a8912c3d79ce137182247786cff8f"
>  PV = "0.4.0+git${SRCPV}"
> -PR = "r0"
> +PR = "r1"
>  
>  SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent.git;protocol=git \
>             file://fix_ranlib.patch \




