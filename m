Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UGVTD-0004PA-My
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Mar 2013 15:18:57 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Mar 2013 07:02:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,850,1355126400"; d="scan'208";a="303428105"
Received: from unknown (HELO [10.255.13.217]) ([10.255.13.217])
	by fmsmga001.fm.intel.com with ESMTP; 15 Mar 2013 07:02:10 -0700
Message-ID: <514329E2.6030708@linux.intel.com>
Date: Fri, 15 Mar 2013 07:02:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Radu Moisan <radu.moisan@intel.com>
References: <cover.1363283478.git.radu.moisan@intel.com>
	<3ee9379d343ea992c82f870cbf579ebf26cf542a.1363283478.git.radu.moisan@intel.com>
In-Reply-To: <3ee9379d343ea992c82f870cbf579ebf26cf542a.1363283478.git.radu.moisan@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 16/17] watchdog: Upgrade to v5.13
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
X-List-Received-Date: Fri, 15 Mar 2013 14:18:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/14/2013 10:55 AM, Radu Moisan wrote:
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>   .../watchdog/files/fix-ping-failure.patch          |   74 --------------------

You need to include WHY you removed the patch in the commit message, 
also it seems below you did not remove it from the SRC_URI.

Also, Khem Raj posted a package update to this on 3/11.

Sau!


>   .../{watchdog_5.12.bb => watchdog_5.13.bb}         |    6 +-
>   2 files changed, 3 insertions(+), 77 deletions(-)
>   delete mode 100644 meta/recipes-extended/watchdog/files/fix-ping-failure.patch
>   rename meta/recipes-extended/watchdog/{watchdog_5.12.bb => watchdog_5.13.bb} (79%)
>
> diff --git a/meta/recipes-extended/watchdog/files/fix-ping-failure.patch b/meta/recipes-extended/watchdog/files/fix-ping-failure.patch
> deleted file mode 100644
> index c6ee843..0000000
> --- a/meta/recipes-extended/watchdog/files/fix-ping-failure.patch
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -Fix ping mode failure
> -
> -Upstream-Status: Pending
> -
> -When watchdog works on ping mode, the system will be rebooted since
> -watchdog can not receive the expected ECOREPLY on a setting interval.
> -
> -Ping mode uses a raw socket to send a ECO packet, then uses select()
> -to wait and recvfrom() to receive the ECOREPLY packet, if select()
> -shows the data is ready, and the data is not the expected ECOREPLY,
> -and waiting time is not overdue, it will continue use select() and
> -recvfrom().
> -
> -Problem is that the raw socket can receive any icmp packets, if we do
> -not set filters, and there are many icmp packets on socket, this
> -program will not find its interested ECOREPLY packet in a special
> -interval, which makes the ping mode fail.
> -
> -
> -Other program is that watchdog sometime can not reach the call of
> -recvfrom to try to receive packets since tv_sec of struct timeval
> -of select parameter is 0.
> -
> -The timeout of select() is the result of ping interval minusing the
> -time of calling gettimeofday spending, when ping interval is 1 second,
> -and the call of gettimeofday() spends several useconds, the tv_sec of
> -struct timeval of select parameter must be 0, at that condition, we
> -should it is valid of tv_sec of struct timeval of select parameter be 0
> -
> -Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ----
> - src/net.c      |    2 +-
> - src/watchdog.c |    5 ++++-
> - 2 files changed, 5 insertions(+), 2 deletions(-)
> -
> ---- a/src/net.c
> -+++ b/src/net.c
> -@@ -118,7 +118,7 @@ int check_net(char *target, int sock_fp,
> - 		    dtimeout.tv_usec -= 1000000;
> - 		    dtimeout.tv_sec++;
> - 		}
> --		if (dtimeout.tv_sec <= 0)
> -+		if (dtimeout.tv_sec < 0)
> - 		    break;
> - #if USE_SYSLOG
> - 		if (verbose && logtick && ticker == 1)
> ---- a/src/watchdog.c
> -+++ b/src/watchdog.c
> -@@ -28,6 +28,7 @@
> - #include <sys/types.h>
> - #include <sys/ioctl.h>
> - #include <linux/oom.h>
> -+#include <linux/icmp.h>
> - #include <linux/watchdog.h>
> - #include <string.h>
> -
> -@@ -567,6 +568,8 @@ int main(int argc, char *const argv[])
> -     pid_t child_pid;
> -     int oom_adjusted = 0;
> -     struct stat s;
> -+    struct icmp_filter filt;
> -+    filt.data = ~(1<<ICMP_ECHOREPLY);
> -
> - #if USE_SYSLOG
> -     char *opts = "d:i:n:Ffsvbql:p:t:c:r:m:a:";
> -@@ -703,7 +706,7 @@ int main(int argc, char *const argv[])
> - 		perror(progname);
> - 		exit(1);
> - 	    }
> --	
> -+	    setsockopt(net->sock_fp, SOL_RAW, ICMP_FILTER, (char*)&filt, sizeof(filt));
> - 	    /* this is necessary for broadcast pings to work */
> - 	    (void) setsockopt(net->sock_fp, SOL_SOCKET, SO_BROADCAST, (char *)&hold, sizeof(hold));
> -
> diff --git a/meta/recipes-extended/watchdog/watchdog_5.12.bb b/meta/recipes-extended/watchdog/watchdog_5.13.bb
> similarity index 79%
> rename from meta/recipes-extended/watchdog/watchdog_5.12.bb
> rename to meta/recipes-extended/watchdog/watchdog_5.13.bb
> index 78262b8..633718e 100644
> --- a/meta/recipes-extended/watchdog/watchdog_5.12.bb
> +++ b/meta/recipes-extended/watchdog/watchdog_5.13.bb
> @@ -8,13 +8,13 @@ BUGTRACKER = "http://sourceforge.net/tracker/?group_id=172030&atid=860194"
>   LICENSE = "GPL-2.0+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=ecc0551bf54ad97f6b541720f84d6569"
>
> -PR = "r1"
> +PR = "r0"
>
>   SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
>   	   file://fix-ping-failure.patch"
>
> -SRC_URI[md5sum] = "cea28bea70e54f3625062bc808aef9af"
> -SRC_URI[sha256sum] = "862d5da6ab34568bbd4ea695316f063fecabe107d0939ceea6c67c9ec0b1a08e"
> +SRC_URI[md5sum] = "153455f008f1cf8f65f6ad9586a21ff1"
> +SRC_URI[sha256sum] = "141e0faf3ee4d8187a6ff4e00b18ef7b7a4ce432a2d4c8a6e6fdc62507fc6eb0"
>
>   inherit autotools
>
>


