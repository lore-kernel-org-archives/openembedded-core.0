Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC080C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 07:43:28 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.94452.1701762204932906408
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 23:43:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Mx2POhrO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA8C060002;
	Tue,  5 Dec 2023 07:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701762203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P44wqyLWGORLwblfxx0xyqn9DWWY4ybcbz9WSCDsWcY=;
	b=Mx2POhrOQ4B9dnyPjWPpNgQ4NnB9LLX1ryFcIQ32l5hkECENbUGihXFQYZbWgIaThFbcI8
	LZxclTC9eofb5m1SZOSJ4/4UIw+ZoGvpxIaTgnGKlZXZhY5NaNJkSQmD4/1hxqQ8a8Sjw/
	1tbRcTk9gYdEyv7eszMTB/TLXxeJATBKxbtS0dQRyJ7sGomVT3tOotAnTDR8j0CPbY6QEh
	1SyEf9ao+9ZNgZdwzVnX84h8a5BOhCI78TjkBn8P8UtJhJIwp2PJkPa8aRsjXjHshXwVvt
	4yzqBJzpVCiSoAhTBOyaMCylgUNZRPA6ENADfkdb84tDWshmf0upHRaePfssNA==
Date: Tue, 5 Dec 2023 08:43:22 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] openssh: Add PACKAGECONFIG option to
 customize sshd mode
Message-ID: <20231205074322881971a5@mail.local>
References: <ef31fe38-2390-ecb8-405a-570895ef1ab9@windriver.com>
 <20231205055201.1738005-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205055201.1738005-1-mingli.yu@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 07:43:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191803

Hello,

On 05/12/2023 13:52:01+0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Add systemd-sshd-socket-mode PACKAGECONFIG option to choose sshd.socket
> and systemd-sshd-service-mode PACKAGECONFIG option to choose installing
> sshd.service.
> 
> The systemd-sshd-socket-mode PACKAGECONFIG option is enabled by default
> and user can customize the above two PACKAGECONFIG option to choose the
> sshd mode.
> 

This doesn't apply after https://lore.kernel.org/all/20231201140947.792594-1-xiangyu.chen@eng.windriver.com/

Can you synchronize and provide a working series?

> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../openssh/openssh_9.5p1.bb                  | 24 ++++++++++++++-----
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> index bbb8fb091a..a10f5c5a61 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> @@ -50,16 +50,20 @@ INITSCRIPT_NAME:${PN}-sshd = "sshd"
>  INITSCRIPT_PARAMS:${PN}-sshd = "defaults 9"
>  
>  SYSTEMD_PACKAGES = "${PN}-sshd"
> -SYSTEMD_SERVICE:${PN}-sshd = "sshd.socket sshd.service"
> +SYSTEMD_SERVICE:${PN}-sshd = "${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-socket-mode','sshd.socket', '', d)} ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-service-mode','sshd.service', '', d)}"
>  
>  inherit autotools-brokensep ptest pkgconfig
>  DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
>  
> -PACKAGECONFIG ??= ""
> +# systemd-sshd-socket-mode means sshd.socket and systemd-sshd-service-mode
> +# corresponding to sshd.service
> +PACKAGECONFIG ??= " systemd-sshd-socket-mode"
>  PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
>  PACKAGECONFIG[ldns] = "--with-ldns,--without-ldns,ldns"
>  PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
>  PACKAGECONFIG[manpages] = "--with-mantype=man,--with-mantype=cat"
> +PACKAGECONFIG[systemd-sshd-socket-mode] = ""
> +PACKAGECONFIG[systemd-sshd-service-mode] = ""
>  
>  EXTRA_AUTORECONF += "--exclude=aclocal"
>  
> @@ -125,15 +129,23 @@ do_install:append () {
>  	echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
>  
>  	install -d ${D}${systemd_system_unitdir}
> -	install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_system_unitdir}
> -	install -c -m 0644 ${WORKDIR}/sshd.service ${D}${systemd_system_unitdir}
> -	install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_system_unitdir}
> +	if ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-socket-mode','true','false',d)}; then
> +	    install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_system_unitdir}
> +	    install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_system_unitdir}
> +	    sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
> +		    -e 's,@SBINDIR@,${sbindir},g' \
> +		    -e 's,@BINDIR@,${bindir},g' \
> +		    -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
> +            ${D}${systemd_system_unitdir}/sshd.socket
> +	elif ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-service-mode','true','false',d)}; then
> +	    install -c -m 0644 ${WORKDIR}/sshd.service ${D}${systemd_system_unitdir}
> +	fi
>  	install -c -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_system_unitdir}
>  	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
>  		-e 's,@SBINDIR@,${sbindir},g' \
>  		-e 's,@BINDIR@,${bindir},g' \
>  		-e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
> -		${D}${systemd_system_unitdir}/sshd.socket ${D}${systemd_system_unitdir}/*.service
> +		${D}${systemd_system_unitdir}/*.service
>  
>  	sed -i -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
>  		${D}${sysconfdir}/init.d/sshd
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191794): https://lists.openembedded.org/g/openembedded-core/message/191794
> Mute This Topic: https://lists.openembedded.org/mt/102987153/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

