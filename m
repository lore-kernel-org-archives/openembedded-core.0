Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.22199.1629928305891931121
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 14:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from [::1] (port=50700 helo=cpanel8.indieserve.net)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mJ0oB-0007y8-TA; Wed, 25 Aug 2021 17:51:44 -0400
Received: from [174.114.56.109] ([174.114.56.109]) by crashcourse.ca (Horde
 Framework) with HTTPS; Wed, 25 Aug 2021 17:51:43 -0400
Date: Wed, 25 Aug 2021 17:51:43 -0400
Message-ID: <20210825175143.Horde.LbItpKT-Y6zl0vjVCim0eFh@crashcourse.ca>
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Phil Blundell <pb@pbcl.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] what means the test 'if [ -z "$D" ]' in a pkg_postinst routine?
References: <20210825163520.Horde.SwfJDAmwq6x_Wn-Vf4FoTSG@crashcourse.ca>
 <CANNYZj-PJQTLydecmn9EpWdci5wWce_9Tkw_QkOGkProY6t_fQ@mail.gmail.com>
 <20210825171222.Horde.pjbNvErvPswYBwDudrNTUaM@crashcourse.ca>
 <3FDCF22A-7038-4B36-B15D-D59C31F61C86@pbcl.net>
In-Reply-To: <3FDCF22A-7038-4B36-B15D-D59C31F61C86@pbcl.net>
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Disposition: inline


Quoting Phil Blundell <pb@pbcl.net>:

> That's testing for offline installation. If $D is not set, it's  
> running on the target.
>
> p.

   one last query before i head off for dinner ... so what about
pkg_postinst() routines that do double duty, like this one from
dbus_1.12.20.bb:


PACKAGE_WRITE_DEPS += "${@bb.utils.contains('DISTRO_FEATURES','systemd  
sysvinit','systemd-systemctl-native','',d)}"
pkg_postinst:dbus() {
         # If both systemd and sysvinit are enabled, mask the dbus-1  
init script
         if ${@bb.utils.contains('DISTRO_FEATURES','systemd  
sysvinit','true','false',d)}; then
                 if [ -n "$D" ]; then
                         OPTS="--root=$D"
                 fi
                 systemctl $OPTS mask dbus-1.service
         fi

         if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
                 /etc/init.d/populate-volatile.sh update
         fi
}


note how that routine checks its context and, as i recall (but
it's not documented in the docs i'm looking at), i'd swear that
i read somewhere that if a pkg_postinst() routine fails at image
creation time, it was deferred until boot time, which would
explain the above routine checking its runtime context.

   anyway, off for food.

rday

