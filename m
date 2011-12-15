Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RbCsS-0006ss-Kr for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 16:05:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBFEwjN1005343;
	Thu, 15 Dec 2011 14:58:45 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05282-01; Thu, 15 Dec 2011 14:58:40 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBFEwbOL005337
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 15 Dec 2011 14:58:38 GMT
Message-ID: <1323961117.4568.41.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 15 Dec 2011 14:58:37 +0000
In-Reply-To: <1323793193-31090-4-git-send-email-dbaryshkov@gmail.com>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
	<1323793193-31090-4-git-send-email-dbaryshkov@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 4/9] consolekit: fix sdk generation issues
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
X-List-Received-Date: Thu, 15 Dec 2011 15:05:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-12-13 at 20:19 +0400, Dmitry Eremin-Solenikov wrote:
> Currently sdk generation might fail with the following error:
> | Collected errors:
> |  * extract_archive: Cannot create symlink from ./var/log to
> 'volatile/log': File exists.
> ERROR: Function 'do_populate_sdk' failed
> 
> This happens as consolekit package will include both /var/log/ConsoleKit
> and /var/volatile/log/ConsoleKit files:
> lumag@fangorn:~/OE-scripts$ dpkg-deb -c build/tmp--eglibc/deploy/ipk/core2/consolekit_0.4.5-r7_core2.ipk  | grep var
> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/
> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/log/
> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/log/ConsoleKit/
> lrwxrwxrwx root/root         0 2011-12-07 22:12 ./var/run -> volatile/run
> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/volatile/
> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/volatile/log/
> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/volatile/log/ConsoleKit/
> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/volatile/run/
> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/volatile/run/ConsoleKit/
> 
> Inclusion of both log directories causes this error. Drop the
> /var/log/ConsoleKit
> in favour of /var/volatile/log
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

This effectively reverts:
http://git.openembedded.org/openembedded-core/commit/?id=5608a748af2c754f60137ab7c3010ccce6bf9e40
so I think this fixes one problem at the expense of causing another.
Koen: Any comments?

>  .../recipes-support/consolekit/consolekit_0.4.5.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
> index 45f6ad3..9406d88 100644
> --- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
> +++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "ConsoleKit is a framework for defining and tracking users, login
>  HOMEPAGE="http://www.freedesktop.org/wiki/Software/ConsoleKit"
>  BUGTRACKER="https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
>  
> -PR = "r7"
> +PR = "r8"
>  
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
> @@ -24,7 +24,7 @@ EXTRA_OECONF = "--with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
>                  ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam-module --with-pam-module-dir=${base_libdir}/security', '--disable-pam-module', d)} \
>                 "
>  
> -FILES_${PN} += "${localstatedir}/log/ConsoleKit ${libdir}/ConsoleKit ${base_libdir} ${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*"
> +FILES_${PN} += "${libdir}/ConsoleKit ${base_libdir} ${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*"
>  FILES_${PN}-dbg += "${base_libdir}/security/.debug"
>  
>  PACKAGES =+ "pam-plugin-ck-connector"




