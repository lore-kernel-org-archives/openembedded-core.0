Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ss4WA-0000Sj-Eg
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 06:08:42 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jul 2012 20:57:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181038379"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2012 20:57:18 -0700
Message-ID: <5008D71E.1000809@linux.intel.com>
Date: Thu, 19 Jul 2012 20:57:18 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342575703-10784-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1342575703-10784-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [v2 PATCH] watchdog: fix ping mode failure
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
X-List-Received-Date: Fri, 20 Jul 2012 04:08:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2012 06:41 PM, rongqing.li@windriver.com wrote:
> From: Roy.Li <rongqing.li@windriver.com>
>
> [YOCTO #2755]
>
> When watchdog works on ping mode, the system will be rebooted since
> watchdog can not receive the expected ECOREPLY on a setting interval.
>
> Ping mode uses a raw socket to send a ECO packet, then uses select()
> to wait and recvfrom() to receive the ECOREPLY packet, if select()
> shows the data is ready, and the data is not the expected ECOREPLY,
> and waiting time is not overdue, it will continue use select() and
> recvfrom().
>
> Problem is that the raw socket can receive any icmp packets, if we do
> not set filters, and there are many icmp packets on socket, this
> program will not find its interested ECOREPLY packet in a special
> interval, which makes the ping mode fail.
>
> Other program is that watchdog sometime can not reach the call of
> recvfrom to try to receive packets since tv_sec of struct timeval
> of select parameter is 0.
>
> The timeout of select() is the result of ping interval minusing the
> time of calling gettimeofday spending, when ping interval is 1 second,
> and the call of gettimeofday() spends several useconds, the tv_sec of
> struct timeval of select parameter must be 0, at that condition, we
> should think it is valid of tv_sec of struct timeval of select parameter
> be 0
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>   .../watchdog/files/fix-ping-failure.patch          |   74 ++++++++++++++++++++
>   meta/recipes-extended/watchdog/watchdog_5.11.bb    |    6 +-
>   2 files changed, 78 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-extended/watchdog/files/fix-ping-failure.patch
>
> diff --git a/meta/recipes-extended/watchdog/files/fix-ping-failure.patch b/meta/recipes-extended/watchdog/files/fix-ping-failure.patch
> new file mode 100644
> index 0000000..c6ee843
> --- /dev/null
> +++ b/meta/recipes-extended/watchdog/files/fix-ping-failure.patch
> @@ -0,0 +1,74 @@
> +Fix ping mode failure
> +
> +Upstream-Status: Pending
> +
> +When watchdog works on ping mode, the system will be rebooted since
> +watchdog can not receive the expected ECOREPLY on a setting interval.
> +
> +Ping mode uses a raw socket to send a ECO packet, then uses select()
> +to wait and recvfrom() to receive the ECOREPLY packet, if select()
> +shows the data is ready, and the data is not the expected ECOREPLY,
> +and waiting time is not overdue, it will continue use select() and
> +recvfrom().
> +
> +Problem is that the raw socket can receive any icmp packets, if we do
> +not set filters, and there are many icmp packets on socket, this
> +program will not find its interested ECOREPLY packet in a special
> +interval, which makes the ping mode fail.
> +
> +
> +Other program is that watchdog sometime can not reach the call of
> +recvfrom to try to receive packets since tv_sec of struct timeval
> +of select parameter is 0.
> +
> +The timeout of select() is the result of ping interval minusing the
> +time of calling gettimeofday spending, when ping interval is 1 second,
> +and the call of gettimeofday() spends several useconds, the tv_sec of
> +struct timeval of select parameter must be 0, at that condition, we
> +should it is valid of tv_sec of struct timeval of select parameter be 0
> +
> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> +---
> + src/net.c      |    2 +-
> + src/watchdog.c |    5 ++++-
> + 2 files changed, 5 insertions(+), 2 deletions(-)
> +
> +--- a/src/net.c
> ++++ b/src/net.c
> +@@ -118,7 +118,7 @@ int check_net(char *target, int sock_fp,
> + 		    dtimeout.tv_usec -= 1000000;
> + 		    dtimeout.tv_sec++;
> + 		}
> +-		if (dtimeout.tv_sec <= 0)
> ++		if (dtimeout.tv_sec < 0)
> + 		    break;
> + #if USE_SYSLOG
> + 		if (verbose && logtick && ticker == 1)
> +--- a/src/watchdog.c
> ++++ b/src/watchdog.c
> +@@ -28,6 +28,7 @@
> + #include <sys/types.h>
> + #include <sys/ioctl.h>
> + #include <linux/oom.h>
> ++#include <linux/icmp.h>
> + #include <linux/watchdog.h>
> + #include <string.h>
> +
> +@@ -567,6 +568,8 @@ int main(int argc, char *const argv[])
> +     pid_t child_pid;
> +     int oom_adjusted = 0;
> +     struct stat s;
> ++    struct icmp_filter filt;
> ++    filt.data = ~(1<<ICMP_ECHOREPLY);
> +
> + #if USE_SYSLOG
> +     char *opts = "d:i:n:Ffsvbql:p:t:c:r:m:a:";
> +@@ -703,7 +706,7 @@ int main(int argc, char *const argv[])
> + 		perror(progname);
> + 		exit(1);
> + 	    }
> +-	
> ++	    setsockopt(net->sock_fp, SOL_RAW, ICMP_FILTER, (char*)&filt, sizeof(filt));
> + 	    /* this is necessary for broadcast pings to work */
> + 	    (void) setsockopt(net->sock_fp, SOL_SOCKET, SO_BROADCAST, (char *)&hold, sizeof(hold));
> +
> diff --git a/meta/recipes-extended/watchdog/watchdog_5.11.bb b/meta/recipes-extended/watchdog/watchdog_5.11.bb
> index 3c4f77b..6a611c9 100644
> --- a/meta/recipes-extended/watchdog/watchdog_5.11.bb
> +++ b/meta/recipes-extended/watchdog/watchdog_5.11.bb
> @@ -8,9 +8,11 @@ BUGTRACKER = "http://sourceforge.net/tracker/?group_id=172030&atid=860194"
>   LICENSE = "GPL-1.0+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=8a7258c60a71a2f04b67fb01f495889c"
>
> -PR = "r0"
> +PR = "r1"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog_${PV}.tar.gz \
> +	   file://fix-ping-failure.patch"
>
> -SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog_${PV}.tar.gz"
>
>   SRC_URI[md5sum] = "02c764219b3bdb2373091cbd67109eb6"
>   SRC_URI[sha256sum] = "723a7966e0c3d58e3f4df20943a5c9aa1553381f46aa0dbcf832016756e62792"
>

Merged into OE-Core

Thanks
	Sau!


