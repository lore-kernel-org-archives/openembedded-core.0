Return-Path: <Xufeng.Zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D54926102A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 05:22:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4V5Mjxl023970
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 22:22:45 -0700 (PDT)
Received: from [128.224.163.210] (128.224.163.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 30 May 2013 22:22:43 -0700
Message-ID: <51A83670.4060709@windriver.com>
Date: Fri, 31 May 2013 13:34:40 +0800
From: Xufeng Zhang <xufeng.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.10) Gecko/20100512 Thunderbird/3.0.5 ThunderBrowse/3.3.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1369978357-9146-1-git-send-email-xufeng.zhang@windriver.com>
In-Reply-To: <1369978357-9146-1-git-send-email-xufeng.zhang@windriver.com>
Subject: Re: [PATCH] ntp: Resolve some abnormal behaviors
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
X-List-Received-Date: Fri, 31 May 2013 05:22:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

Please ignore this patch, seems I have missed some field
in the long long log.


Thanks,
Xufeng

On 05/31/2013 01:32 PM, Xufeng Zhang wrote:
> The main changes include:
> 1). Add ntp:ntp(user:group) to system.
> 2). Running ntpd dameon as ntp:ntp.
> 3). Move relevant files from /usr/bin to /usr/sbin.
> 4). Add crypto support.
>
> Signed-off-by: Xufeng Zhang<xufeng.zhang@windriver.com>
> ---
>   meta-networking/recipes-support/ntp/files/ntpd    |    8 ++++----
>   meta-networking/recipes-support/ntp/files/ntpdate |    6 +++---
>   meta-networking/recipes-support/ntp/ntp.inc       |   20 ++++++++++++--------
>   3 files changed, 19 insertions(+), 15 deletions(-)
>
> diff --git a/meta-networking/recipes-support/ntp/files/ntpd b/meta-networking/recipes-support/ntp/files/ntpd
> index ae50f13..285f5c0 100755
> --- a/meta-networking/recipes-support/ntp/files/ntpd
> +++ b/meta-networking/recipes-support/ntp/files/ntpd
> @@ -1,7 +1,7 @@
>   #! /bin/sh
>   #
>   # ntpd	init.d script for ntpdc from ntp.isc.org
> -test -x /usr/bin/ntpd -a -r /etc/ntp.conf || exit 0
> +test -x /usr/sbin/ntpd -a -r /etc/ntp.conf || exit 0
>   # rcS contains TICKADJ
>   test -r /etc/default/rcS&&  . /etc/default/rcS
>
> @@ -9,9 +9,9 @@ test -r /etc/default/rcS&&  . /etc/default/rcS
>   settick(){
>     	# If TICKADJ is set we *must* adjust it before we start, because the
>   	# driftfile relies on the correct setting
> -	test -n "$TICKADJ" -a -x /usr/bin/tickadj&&  {
> +	test -n "$TICKADJ" -a -x /usr/sbin/tickadj&&  {
>   		echo -n "Setting tick to $TICKADJ: "
> -		/usr/bin/tickadj "$TICKADJ"
> +		/usr/sbin/tickadj "$TICKADJ"
>   		echo "done"
>   	}
>   }
> @@ -21,7 +21,7 @@ startdaemon(){
>   	# this.  If ntpd seems to disappear after a while assume TICKADJ
>   	# above is set to a totally incorrect value.
>   	echo -n "Starting ntpd: "
> -	start-stop-daemon --start -x /usr/bin/ntpd -- -p /var/run/ntp.pid "$@"
> +	start-stop-daemon --start -x /usr/sbin/ntpd -- -u ntp:ntp -p /var/run/ntp.pid "$@"
>   	echo "done"
>   }
>   stopdaemon(){
> diff --git a/meta-networking/recipes-support/ntp/files/ntpdate b/meta-networking/recipes-support/ntp/files/ntpdate
> index ab0551c..17b64d1 100755
> --- a/meta-networking/recipes-support/ntp/files/ntpdate
> +++ b/meta-networking/recipes-support/ntp/files/ntpdate
> @@ -1,8 +1,8 @@
>   #!/bin/sh
>
> -PATH=/sbin:/bin:/usr/bin
> +PATH=/sbin:/bin:/usr/bin:/usr/sbin
>
> -test -x /usr/bin/ntpdate || exit 0
> +test -x /usr/sbin/ntpdate || exit 0
>
>   if test -f /etc/default/ntpdate ; then
>   . /etc/default/ntpdate
> @@ -40,7 +40,7 @@ if [ -x /usr/bin/lockfile-create ]; then
>   	LOCKTOUCHPID="$!"
>   fi
>
> -if /usr/bin/ntpdate -s $OPTS $NTPSERVERS 2>/dev/null; then
> +if /usr/sbin/ntpdate -s $OPTS $NTPSERVERS 2>/dev/null; then
>   	if [ "$UPDATE_HWCLOCK" = "yes" ]; then
>   		hwclock --systohc || :
>   	fi
> diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
> index 79e7401..b52a7d6 100644
> --- a/meta-networking/recipes-support/ntp/ntp.inc
> +++ b/meta-networking/recipes-support/ntp/ntp.inc
> @@ -24,14 +24,19 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
>              file://sntp \
>   "
>
> -inherit autotools update-rc.d systemd
> +inherit autotools update-rc.d systemd useradd
>
>   # The ac_cv_header_readline_history is to stop ntpdc depending on either
>   # readline or curses
> -EXTRA_OECONF += "--with-net-snmp-config=no --without-ntpsnmpd ac_cv_header_readline_history_h=no"
> +EXTRA_OECONF += "--with-net-snmp-config=no --without-ntpsnmpd ac_cv_header_readline_history_h=no --with-binsubdir=sbin"
>   CFLAGS_append = " -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED"
>
> -PACKAGECONFIG ??= ""
> +USERADD_PACKAGES = "${PN}"
> +USERADD_PARAM_${PN} = "--system --home /etc/ntp \
> +		       --no-create-home --shell /bin/false \
> +		       --user-group ntp"
> +
> +PACKAGECONFIG ??= "openssl"
>   PACKAGECONFIG[openssl] = "--with-openssl-libdir=${STAGING_LIBDIR} \
>                             --with-openssl-incdir=${STAGING_INCDIR} \
>                             --with-crypto, \
> @@ -91,10 +96,10 @@ RCONFLICTS_ntpdate += "ntpdate-systemd"
>
>   RSUGGESTS_${PN} = "iana-etc"
>
> -FILES_${PN} = "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd ${sbindir} ${libdir}"
> -FILES_${PN}-tickadj = "${bindir}/tickadj"
> -FILES_${PN}-utils = "${bindir}"
> -FILES_ntpdate = "${bindir}/ntpdate \
> +FILES_${PN} = "${sbindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd ${libdir}"
> +FILES_${PN}-tickadj = "${sbindir}/tickadj"
> +FILES_${PN}-utils = "${sbindir}"
> +FILES_ntpdate = "${sbindir}/ntpdate \
>       ${sysconfdir}/network/if-up.d/ntpdate-sync \
>       ${bindir}/ntpdate-sync \
>       ${sysconfdir}/default/ntpdate \
> @@ -122,4 +127,3 @@ else
>       fi
>   fi
>   }
> -
>    


