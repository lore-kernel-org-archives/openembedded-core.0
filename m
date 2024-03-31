Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86646CD128A
	for <webhook@archiver.kernel.org>; Sun, 31 Mar 2024 21:34:37 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.24908.1711920876282293767
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Mar 2024 14:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Zfh5bkv5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2607940002;
	Sun, 31 Mar 2024 21:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711920874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2bZFOgrxDM1mhOA6lNAEtHLyrXgUhaXI/3G6OspTIC8=;
	b=Zfh5bkv522d8I106jByW7xLHbGTN2Kqz/GZMQ89iRJBm4gL7t+HiLVEW3KMqfGrK3HxEC9
	yXdWp6TEW7PGTYV4G2kGscXpQb3HB99maWzgcYfrbvcZHVVLYPPUT+mAd0R2hXnohxyfCg
	TB2jrlTshEiUUcz/ToljZBGCY2AmNQgzw+fl7GFMm9VFOzkG/jE4RebaNbUtXYcrk6uQEu
	G2rOljy3cQpr3RFw5I5IJJAiwOjG6mcFIJayRMl6T3nziuPjhq6D6eY7yhSwoa9EG5FSiN
	VRoVy4w7BR9FPUHixYYsXgEqdIm+MnE0URJ055r3p0i+wBDk27Oh2SCy5pS46Q==
Date: Sun, 31 Mar 2024 23:34:33 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: Re: [OE-core] [PATCH v5 1/3] nfs-utils: clean up startup
Message-ID: <2024033121343383185c87@mail.local>
References: <20240329012413.892379-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329012413.892379-1-danismostlikely@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Mar 2024 21:34:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197669

This still fails on the AB:

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/9115/steps/14/logs/stdio

On 28/03/2024 19:24:10-0600, Dan McGregor wrote:
> From: Daniel McGregor <daniel.mcgregor@vecima.com>
> 
> Change the sysvinit script to start at the S runlevel, this matches
> Debian, and prevents systemd from generating a unit file for it.
> Also have the nfsd systemd service request the nfsd kernel filesystem
> mountpoint. This avoids startup failures in unpriviled containers
> or other setups that don't support the filesystem.
> 
> Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> ---
>  meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon | 4 ++--
>  meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb  | 9 ++++-----
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
> index 992267d5a16..4c1ad17c3c6 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
> @@ -3,7 +3,7 @@
>  # Provides:          nfs-common
>  # Required-Start:    $portmap hwclock
>  # Required-Stop:     $portmap hwclock
> -# Default-Start:     2 3 4 5
> +# Default-Start:     S
>  # Default-Stop:      0 1 6
>  # Short-Description: NFS support for both client and server
>  # Description:       NFS is a popular protocol for file sharing across
> @@ -20,7 +20,7 @@
>  . /etc/init.d/functions
>  
>  test -x "$NFS_STATD" || NFS_STATD=/usr/sbin/rpc.statd
> -test -z "$STATD_PID" && STATD_PID=/var/run/rpc.statd.pid
> +test -z "$STATD_PID" && STATD_PID=/run/rpc.statd.pid
>  #
>  # The default state directory is /var/lib/nfs
>  test -n "$NFS_STATEDIR" || NFS_STATEDIR=/var/lib/nfs
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
> index 2f2644f9a83..527fcd609c1 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
> @@ -132,15 +132,14 @@ do_install:append () {
>  	install -m 0644 ${WORKDIR}/nfs-server.service ${D}${systemd_system_unitdir}/
>  	install -m 0644 ${WORKDIR}/nfs-mountd.service ${D}${systemd_system_unitdir}/
>  	install -m 0644 ${WORKDIR}/nfs-statd.service ${D}${systemd_system_unitdir}/
> +	install -m 0644 ${WORKDIR}/proc-fs-nfsd.mount ${D}${systemd_system_unitdir}/
>  	sed -i -e 's,@SBINDIR@,${sbindir},g' \
>  		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
>  		-e 's,@HIGH_RLIMIT_NOFILE@,${HIGH_RLIMIT_NOFILE},g' \
>  		${D}${systemd_system_unitdir}/*.service
> -	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> -		install -m 0644 ${WORKDIR}/proc-fs-nfsd.mount ${D}${systemd_system_unitdir}/
> -		install -d ${D}${systemd_system_unitdir}/sysinit.target.wants/
> -		ln -sf ../proc-fs-nfsd.mount ${D}${systemd_system_unitdir}/sysinit.target.wants/proc-fs-nfsd.mount
> -	fi
> +	# Add compatibility symlinks for the sysvinit scripts
> +	ln -s nfs-server.service ${D}${systemd_system_unitdir}/nfsserver.service
> +	ln -s /dev/null ${D}${systemd_system_unitdir}/nfscommon.service
>  
>  	# kernel code as of 3.8 hard-codes this path as a default
>  	install -d ${D}/var/lib/nfs/v4recovery
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197616): https://lists.openembedded.org/g/openembedded-core/message/197616
> Mute This Topic: https://lists.openembedded.org/mt/105209254/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

