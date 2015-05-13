Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id ABD7F73FF0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 22:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id B83C93154572;
	Thu, 14 May 2015 00:41:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id aFJPqm2iOLBu; Thu, 14 May 2015 00:41:19 +0200 (CEST)
Received: from [172.22.22.61] (55d46642.access.ecotel.net [85.212.102.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 70223315456B;
	Thu, 14 May 2015 00:41:19 +0200 (CEST)
Message-ID: <5553D30E.9010201@opendreambox.org>
Date: Thu, 14 May 2015 00:41:18 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Bruno Bottazzini <bruno.bottazzini@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1431553871-23972-1-git-send-email-bruno.bottazzini@intel.com>
	<1431553871-23972-4-git-send-email-bruno.bottazzini@intel.com>
In-Reply-To: <1431553871-23972-4-git-send-email-bruno.bottazzini@intel.com>
Subject: Re: [PATCH V5 3/3] systemd: split modules into packages
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
X-List-Received-Date: Wed, 13 May 2015 22:41:30 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hello Bruno,

On 13.05.2015 23:51, Bruno Bottazzini wrote:
> +########################################################################
> +# Aggregation of Split Packages
> +########################################################################
> +PACKAGES =+ "${PN}-services-base"
> +SUMMARY_${PN}-services-base = "Base services aggregation"
> +ALLOW_EMPTY_${PN}-services-base = "1"
> +RDEPENDS_${PN}-services-base = " \

I think it would be better to use RRECOMMENDS, in order to support
BAD_RECOMMENDATIONS per image. This would also remove the need to use
bb.utils.contains, because unavailable recommended packages get ignored
by the package managers.

Besides that, I wonder whether ${PN}-services would be a better name,
because the -base suffix suggests that it contained only the most
important services.

Btw., sorry for commenting late again, but it's quite a big patch.

Regards,
Andreas

> +        ${@bb.utils.contains('PACKAGECONFIG', 'ask-password', '${PN}-services-ask-password', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'backlight', '${PN}-services-backlight', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-services-binfmt', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'dbus', '${PN}-services-dbus', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'firstboot', '${PN}-services-firstboot', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'fuse', '${PN}-services-fuse', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'quota', '${PN}-services-quota', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'rfkill', '${PN}-services-rfkill', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '${PN}-services-timesyncd', '', d)}  \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'update', '${PN}-services-update', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'vconsole', '${PN}-services-vconsole', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'filesystems', '${PN}-generators-filesystems', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'preset', '${PN}-preset', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'fsck', '${PN}-services-fsck', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'journal', '${PN}-services-journal', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'modules-load', '${PN}-services-modules-load', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'randomseed', '${PN}-services-randomseed', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'sleep', '${PN}-services-sleep', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'sysctl', '${PN}-services-sysctl', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'sysusers', '${PN}-services-sysusers', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'tmpfiles', '${PN}-services-tmpfiles', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'udev', '${PN}-services-udev', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'tools', '${PN}-tools', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'bash', '${PN}-bash', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'initramfs', '${PN}-initramfs', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'kernel-install', '${PN}-kernel-install', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'rpm-macros', '${PN}-rpm-macros', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'zsh', '${PN}-zsh', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'bootchart', '${PN}-services-bootchart', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'debug', '${PN}-services-debug', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'machined', '${PN}-services-machined', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'nspawn', '${PN}-services-nspawn', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'sysvcompat', '${PN}-services-sysvcompat', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'getty', '${PN}-generators-getty', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'getty', '${PN}-services-getty', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'ldconfig', '${PN}-services-ldconfig', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'polkit', '${PN}-services-hostnamed', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'polkit', '${PN}-services-localed', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'polkit', '${PN}-services-logind', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'polkit', '${PN}-services-timedated', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PN}-pam', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'networkd', '${PN}-services-networkd', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-services-networkd', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-services-journal-gatewayd', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'cryptsetup', '${PN}-services-cryptsetup', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'gudev', 'udev-dbg', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'x11', '${PN}-services-multi-seat-x', '', d)} \
> +"


