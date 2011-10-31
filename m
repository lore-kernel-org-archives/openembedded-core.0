Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RL0d1-0002Ur-TT for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 23:46:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9VMek2h022387
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 22:40:46 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22206-01 for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 22:40:42 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9VMecKA022381
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 22:40:39 GMT
Message-ID: <1320100838.8579.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 31 Oct 2011 22:40:38 +0000
In-Reply-To: <1320083026-31637-1-git-send-email-Martin.Jansa@gmail.com>
References: <1319885588-5947-1-git-send-email-Martin.Jansa@gmail.com>
	<1320083026-31637-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCHv2] dbus: fix for right owner in postinst
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
X-List-Received-Date: Mon, 31 Oct 2011 22:46:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-10-31 at 18:43 +0100, Martin Jansa wrote:
> * even when I see right chown/chmod in log.do_install, files are still
>   owned by bitbake:bitbake (user running bitbake) and we need to fix it on target
> $ tail -n 4 temp/log.do_install.27768
> + chown messagebus:messagebus /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/var/run/dbus /OE/shr-core/tmp/work/armv7a-vfp-neon-o
> e-linux-gnueabi/dbus-1.4.12-r2/image/var/lib/dbus
> + chown root:messagebus /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/usr/libexec/dbus-daemon-launch-helper
> + chmod 4754 /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/usr/libexec/dbus-daemon-launch-helper
> + ln -sf /dev/null /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image//lib/systemd/system/dbus-1.service
> 
> $ ll -d /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/var/run/dbus \
>   /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/var/lib/dbus \
>   /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/usr/libexec/dbus-daemon-launch-helper \
>  /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/usr/libexec/dbus-daemon-launch-helper
> -rwsr-xr-- 1 bitbake bitbake 819869 Oct 29 12:35 /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/usr/libexec/dbus-daemon-launch-he
> lper*
> -rwsr-xr-- 1 bitbake bitbake 819869 Oct 29 12:35 /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/usr/libexec/dbus-daemon-launch-he
> lper*
> drwxr-xr-x 2 bitbake bitbake   4096 Oct 29 12:35 /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/var/lib/dbus/
> drwxr-xr-x 2 bitbake bitbake   4096 Oct 29 12:35 /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/var/run/dbus/
> 
> * and we _cannot_ use ${D} in postinst script because it get's expanded
>   before including postinst file to ipk's control.tar.gz
>   and on target I see something like this:
>   if [ -z "/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
>   which is wrong $D without {} works
> 
> * V2: updated with Otavio version to fix it also for do_rootfs
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/dbus/dbus.inc |   12 +++++-------
>  1 files changed, 5 insertions(+), 7 deletions(-)

This is just wallpapering over the cracks I'm afraid. There is something
more fundamental going wrong here and we need to track it down...

Cheers,

Richard



