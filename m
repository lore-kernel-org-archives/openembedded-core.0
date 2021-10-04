Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14548C433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 18:02:15 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.13549.1633370533689238017
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 11:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:42604 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mXSI0-0008RH-9R
	for openembedded-core@lists.openembedded.org; Mon, 04 Oct 2021 14:02:12 -0400
Date: Mon, 4 Oct 2021 14:02:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: just want to confirm my understanding of how systemd services get
 symlinks
Message-ID: <3918769c-432c-3ced-491-638a4f91a6c@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 18:02:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156621


  just had a discussion with a colleague about the proper design of a
systemd-based service, and my (admittedly sophomore) understanding is
that, in the service file, there is an [Install] section, which
contains a "WantedBy" line like:

  fubar.service:WantedBy=sysinit.target

upon installation in the image, from systemd.bbclass. the routine
systemd_postinst() is invoked which (among other things), does this:

        if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
                for service in ${SYSTEMD_SERVICE_ESCAPED}; do
                        systemctl ${OPTS} enable "$service"
                done
        fi

and my understanding is that it is that call to "systemctl" that
creates the appropriate symlink so that that service now exists under
the directory "sysinit.target.wants".

  my need for confirmation is based on muh collegaue's pointing at
some existing systemd-based recipes in some legacy code, which
manually do the following in do_install_append():

  ln -s ${sysconfdir}/systemd/system/fubar.service \
    ${D}/${sysconfdir}/systemd/system/sysinit.target.wants/

i'm pretty sure that that "ln" command is unnecessary as long as the
service file is defined properly, but now i just want to get that
confirmed.

rday

p.s. hmmmmmm ... i wonder if the original recipe designer was unaware
of systemd.bbclass and thought he had to do it all manually.

