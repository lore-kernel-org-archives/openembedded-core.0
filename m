Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.28052.1629969825954722133
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 02:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:54148 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mJBbs-0004MC-0G; Thu, 26 Aug 2021 05:23:44 -0400
Date: Thu, 26 Aug 2021 05:23:42 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alexander Kanavin <alex.kanavin@gmail.com>
cc: Phil Blundell <pb@pbcl.net>, 
    OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] what means the test 'if [ -z "$D" ]' in a pkg_postinst routine?
In-Reply-To: <CANNYZj9risHPrhCMDEb7bpe8xsC_k08istpzp5T+EgZQensUng@mail.gmail.com>
Message-ID: <e3912bb5-68ac-9c84-d196-3a2bd436382@crashcourse.ca>
References: <20210825163520.Horde.SwfJDAmwq6x_Wn-Vf4FoTSG@crashcourse.ca> <CANNYZj-PJQTLydecmn9EpWdci5wWce_9Tkw_QkOGkProY6t_fQ@mail.gmail.com> <20210825171222.Horde.pjbNvErvPswYBwDudrNTUaM@crashcourse.ca> <3FDCF22A-7038-4B36-B15D-D59C31F61C86@pbcl.net>
 <20210825175143.Horde.LbItpKT-Y6zl0vjVCim0eFh@crashcourse.ca> <CANNYZj9risHPrhCMDEb7bpe8xsC_k08istpzp5T+EgZQensUng@mail.gmail.com>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: multipart/mixed; boundary="8323328-1278624913-1629969823=:6814"

--8323328-1278624913-1629969823=:6814
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 26 Aug 2021, Alexander Kanavin wrote:

> It used to be that 'exit 1' was the way to defer to boot time, but
> that was changed long time ago to not be ambiguous like that and
> cause a real failure at build time. Deferring to first boot needs to
> be explicitly requested with _ontarget() (you can read the
> definition for it to see what really happens, how $D is used and how
> request to defer is made).
>
> Alex
>
> On Wed, 25 Aug 2021 at 23:51, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>       Quoting Phil Blundell <pb@pbcl.net>:
>
>       > That's testing for offline installation. If $D is not set, it's 
>       > running on the target.
>       >
>       > p.
>
>          one last query before i head off for dinner ... so what about
>       pkg_postinst() routines that do double duty, like this one from
>       dbus_1.12.20.bb:
>
>
>       PACKAGE_WRITE_DEPS += "${@bb.utils.contains('DISTRO_FEATURES','systemd 
>       sysvinit','systemd-systemctl-native','',d)}"
>       pkg_postinst:dbus() {
>                # If both systemd and sysvinit are enabled, mask the dbus-1 
>       init script
>                if ${@bb.utils.contains('DISTRO_FEATURES','systemd 
>       sysvinit','true','false',d)}; then
>                        if [ -n "$D" ]; then
>                                OPTS="--root=$D"
>                        fi
>                        systemctl $OPTS mask dbus-1.service
>                fi
>
>                if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
>                        /etc/init.d/populate-volatile.sh update
>                fi
>       }

  so, just to confirm the previous tidbits of information (thank you
for your patience), here's my current understanding so i can submit
updated docs:

* pkg_postinst:${PN} is run at image creation time and *only* at image
  creation time; it is no longer deferred to boot time under any
  circumstances(?)

* pkg_postinst_ontarget:${PN} is run at boot time and *only* at boot
  time

* because of the above, there is no value to the numerous legacy
checks of:

  if [ -z "$D" ]
  if [ -n "$D" ]

  or any of its variations (even though, in a lot of cases, they don't
hurt)

* from within pkg_postinst:${PN}, you can still defer some work to
  boot time with "postinst_intercept delay_to_first_boot", although
  isn't this precisely what pkg_postinst_ontarget:${PN} is for, so is
  this postinst_intercept construct still useful?

* PACKAGE_WRITE_DEPS is still necessary to identify non-standard
native tools you might need for any pkg_postinst:${PN} processing

  does all that look about right?

rday

--8323328-1278624913-1629969823=:6814--
