Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F00C54E41
	for <webhook@archiver.kernel.org>; Sat,  9 Mar 2024 09:38:25 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.9545.1709977097826339787
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Mar 2024 01:38:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=m25ObzRE;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5dqSHcb/gnO+XBiBe0n3r1Pp/eMUeLKiRO0x+C9TH0A=; b=m25ObzREyd3uWiqT4uHxxVw76f
	RUzapNolBn8VnOhcxUxhjiZgjndiEtxlDGEZEDv6LXmXXBnEyFyTV+V1iyW0awpb9fTSXVUQ+tZag
	t/IPjQdmnJxtWofqxVhixMG3q75yTdbHx4kfWJlrFF5BI+lHivmRJ14iVg1YKE9xbXIKZ5kwvnJAB
	WDmKpBXDOhzubT19a58tpUdDFcP0dj/kpbKhwf8tBCed/gwx5dpJH+03yyQM5GIZ9CzkLwNaAnSVS
	NJjVln+BZDf7y5a3VRUA53feSyKqBq0iw70By92n7WHNPyjmQXUVN/pgda3PC8eHjiUjseBcEMhNR
	ubB9bJzw==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:47320 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rit9h-009zbr-2M
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Mar 2024 04:38:15 -0500
Date: Sat, 9 Mar 2024 04:38:06 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: more pedantry: observation on PACKAGES ordering and
 bash-completion.bbclass
Message-ID: <8d17a5b5-4cea-34f0-d0bf-a1e0ff1c9db1@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Mar 2024 09:38:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196867


  currently perusing countless recipes to choose really good
pedagogical examples of "ptest" usage, and i began running across a
number of recipes that (unrelated to ptest) included snippets toward
the end of their recipe files that added content to FILES:${PN}.
here's an example from fwupd:

https://github.com/openembedded/meta-openembedded/blob/master/meta-oe/recipes-bsp/fwupd/fwupd_1.8.9.bb#L130

    FILES:${PN} += "${libdir}/fwupd-plugins-* \
                ${libdir}/fwupd-${PV} \
                ${systemd_unitdir} \
                ${datadir}/fish \
                ${datadir}/metainfo \
                ${datadir}/icons \
                ${datadir}/dbus-1 \
                ${datadir}/polkit-1 \
                ${nonarch_libdir}/modules-load.d"

  since i knew(?) that the default PACKAGES list is processed left to
right, and that the PN package is left until the end to gather what
remains, i couldn't understand why so many recipes insisted on adding
extra content to FILES:${PN} when the default processing would have
collected it anyway, unless ... there was something that had been
appended to PACKAGES that required that.

  sure enough, bash-completion.bbclass:

    PACKAGES += "${PN}-bash-completion"
    FILES:${PN}-bash-completion = "${datadir}/bash-completion ${sysconfdir}/bash_completion.d"

  my understanding is that the "proper" ordering of PACKAGES is to
start with the most focused and specific packages, define their
content, then move on until, at the end, whatever remains goes into
PN. which makes that definition of bash-completion.bbclass a bit
puzzling -- why was it not *prepended* to the PACKAGES list given its
specificity? and making all that subsequent addition to FILES:${PN}
unnecessary?

  or am i misunderstanding something?

rday

