Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B07C9831E
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 09:46:18 +0000 (UTC)
Received: from dwarf.ash.relay.mailchannels.net (dwarf.ash.relay.mailchannels.net [23.83.222.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5750.1768643175028934982
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Jan 2026 01:46:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rootcommit.com header.s=hostingermail-a header.b=j6Ci0Cny;
 spf=pass (domain: rootcommit.com, ip: 23.83.222.53, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 0955F801A56;
	Sat, 17 Jan 2026 09:46:14 +0000 (UTC)
Received: from de-fra-smtpout9.hostinger.io (trex-green-2.trex.outbound.svc.cluster.local [100.110.196.244])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3B615801B63;
	Sat, 17 Jan 2026 09:46:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1768643173;
	b=k52cy1HZs/qKXRVJ93hs1wCPFiFO3UFNjb06QFkshnSrUEDO3ayH80BXbdS+3MHfLgwyyV
	LGXo4DGeaqQ+YeubnX3ewI52tGp7xs/IcBxZsLewv8CDrCYt3ixyIZb5ekej2bi1kryDQQ
	IPb0DBEgvCGWVXsY2TMQSjsbjlqN72OlQcn1opvgIQxIdkMw+aOfi3bKf5k8NXApShzG7k
	3rvsbnsr+mirljT4Hbo2Xdw1ahKw1NhgVxF9cj/ut9jnz4f0vVd7tBCSqnqVDemy8H03/a
	iCMqI7/LBXj5QMQ/UelGNeDIKMFiNcI6kLOBN9KOL992zWWRQqZs9aEcWKnJeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1768643173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=VNT7+mpTWPvfD/XILGYtKhHmayGA/ERhyKE4vEzbrA4=;
	b=QDnSfl0LZh/qpM4gO+wv4zcyfZSUD1xacbPczq0AD1BVeQ7b+KeVyFty8uKHMi0jYaITOw
	onNX17yn3HgiDnOy1ok844oIrIVOWNzXC4fYDxlFLhdSY4K4KHctW6JqW5bU7y2eGRFSMf
	i/yMGnvYZOPavVJtzBRtQ+n/x9goZFtPQdrRYDgtceKQy/4VoIoi/akqQbWmzQPlYRZcri
	Uqbr26JYlzeDNd6KY3iCUt5JIYrKHJ0mLwMCKWgC2LOgsNGswFFGk+YXTmH4vLwMxQHojW
	i6klPRfzlZndfNCryK4164coFN8nE72NkCXTcndWrEQYRW+waINNvKq31LcZlA==
ARC-Authentication-Results: i=1;
	rspamd-8f4d6bb8d-j8qnb;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Macabre-Continue: 72f34e7918e36480_1768643173922_4043507474
X-MC-Loop-Signature: 1768643173922:471024776
X-MC-Ingress-Time: 1768643173922
Received: from de-fra-smtpout9.hostinger.io (de-fra-smtpout9.hostinger.io
 [148.222.55.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.110.196.244 (trex/7.1.3);
	Sat, 17 Jan 2026 09:46:13 +0000
Received: from [IPV6:2001:861:4450:d360:1c56:de61:23e2:1b24] (unknown [IPv6:2001:861:4450:d360:1c56:de61:23e2:1b24])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dtX0g0zDCz3xGC;
	Sat, 17 Jan 2026 09:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1768643171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VNT7+mpTWPvfD/XILGYtKhHmayGA/ERhyKE4vEzbrA4=;
	b=j6Ci0CnyosKAyk/BSg6ozjCAF63idR596NyMhJuHrRnIFoP48aiDiXt25ce1cHENw+xLUO
	x+3aNfHW1WNNvWZHDAIqQDvf9N3k9SrzsBcjWMCE3cuLhaTajlXALmAcJySW+ClYQkkd9Q
	9eVVsBZMmw+Zyw9dGXFl65rWVE0VOlQGCTXL2GcWufi9L6INuFEp1wYTP7oVJbS0zWWI11
	k7+Lwr6K3qqEL7/hq3URqbnZ2mEyZhysLfc9vUc7/yxBMKaakmPUfhuKZuO4wlYoRuPU8+
	HOwJn4/WIhjt5lHdIOczoG9Wuad2XKrPlCrnib6QWkZR2WZEXjjsAIQuVCg2uA==
Message-ID: <a49f1b74-e995-41a5-8a07-7840e6f4aa6a@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] alsa-utils: fix packaging
To: ross.burton@arm.com
References: <20260116174128.1478960-1-ross.burton@arm.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
In-Reply-To: <20260116174128.1478960-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 17 Jan 2026 09:46:11 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=etGNzZpX c=1 sm=1 tr=0 ts=696b5a63 a=kay19twYc4HLmXkLgw10ew==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=foHCeV_ZAAAA:8 a=d70CFdQeAAAA:8 a=Q4-j1AaZAAAA:8 a=7CQSdrXTAAAA:8 a=_Xby9TsZheGRdUKeLhUA:9 a=QEXdDO2ut3YA:10 a=h8a9FgHX5U4dIE3jaWyr:22 a=NcxpMcIZDGm-g932nG_k:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-CM-Envelope: MS4xfAGOACDEmx1XfIr6+loJ4XgzCP2IUQLGH3YEWwNVpnqDVN2EDGR5Vf0ArLqrgvMs3RinfDpIdF5hB3yPy62oFjIVjdybUaM/YWfCJEwiDoJmRtmQh5jy WATxEJQpvHybCeqHsRdSqcGynYUhgAX6ns1Q13Z2kIRurQ+cQuaPmf9VYS2W/v7PvvziBIG8br42982bHdqC1qmikDp3FeCHkgG8KD/APsEAe4QOIOqvqlXh Cuay7Lgmh6WJKri9duOgJ1jOfF1gts+iV/K0VQR6AR9y/RaE3Jqw7UNW0Qu+XoZLnJoY2YmhJRLIULymVgrOoPJ/SfgcRf8RrjvRlrr9B+t7kjYgx82WD5GB iK09Oc4avjbIrVl90TVit91Jc57d0Qrnyvy+NlwMxEFNsJc2J2fYCJ4uefbMsAKCE/reVjrQ
X-AuthUser: michael.opdenacker@rootcommit.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Jan 2026 09:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229571

Hi Ross

Thanks for the fix!

On 1/16/26 6:41 PM, Ross Burton via lists.openembedded.org wrote:
> In the previous refactoring of this package[1] I forgot to add provides
> when merging some packages, which meant that installation of alsa-utils
> wouldn't succeed:
>
>    - nothing provides alsa-utils-aplaymidi needed by alsa-utils-1.2.15.1-r0.cortexa57 from oe-repo
>    - nothing provides alsa-utils-aplaymidi2 needed by alsa-utils-1.2.15.1-r0.cortexa57 from oe-repo
>    - nothing provides alsa-utils-arecordmidi needed by alsa-utils-1.2.15.1-r0.cortexa57 from oe-repo
>    - nothing provides alsa-utils-arecordmidi2 needed by alsa-utils-1.2.15.1-r0.cortexa57 from oe-repo
>    - nothing provides alsa-utils-axfer needed by alsa-utils-1.2.15.1-r0.cortexa57 from oe-repo
>
> This is because the auto-splitting generates a package for each of the
> binaries, but there are explicit FILES that take priority which result
> in the binaries being in another package.  However, the dependencies
> still exist. We could filter the package list after the split, but it is
> easier to add RPROVIDES for arecord and a*midi to the relevant packages,
> so that the dependencies are satisfied.
>
> Also axfer is a separate tool, so put that in its own package instead of
> merging with aplay.
>
> Finally, add a PR, as it appears that dynamically-generated packaging
> isn't enough to change the hash, and the wrong packages were being pulled
> from sstate.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
> index 927f94afb6..2e85f936fa 100644
> --- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
> @@ -11,6 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>                       file://alsactl/utils.c;beginline=3;endline=18;md5=96cc06a4cebe5eb7975688ffb0e65642"
>   DEPENDS = "alsa-lib ncurses libsamplerate0 bash"
>   
> +# Only needed as the dynamic packaging was altered, remove on upgrade
> +PR = "r1"
> +
>   # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
>   SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
>   SRC_URI[sha256sum] = "5ad79f349e59c30c9a4929ad4995ebee33267473e0e632d7c1a30e2b093d3327"
> @@ -35,7 +38,7 @@ FILES:${PN}-alsabat      = "${sbindir}/alsabat-test.sh"
>   FILES:${PN}-alsactl      = "*/udev/rules.d/90-alsa-restore.rules */*/udev/rules.d/90-alsa-restore.rules ${systemd_unitdir} ${localstatedir}/lib/alsa ${datadir}/alsa/init/"
>   FILES:${PN}-alsatplg     = "${libdir}/alsa-topology"
>   FILES:${PN}-amidi        = "${bindir}/amidi ${bindir}/aplaymidi* ${bindir}/arecordmidi*"
> -FILES:${PN}-aplay        = "${bindir}/aplay ${bindir}/arecord ${bindir}/axfer"
> +FILES:${PN}-aplay        = "${bindir}/aplay ${bindir}/arecord"
>   FILES:${PN}-speaker-test = "${datadir}/sounds/alsa/"
>   
>   SUMMARY:${PN}-aconnect       = "ALSA sequencer connection manager"
> @@ -53,12 +56,16 @@ SUMMARY:${PN}-aplay          = "Play (and record) sound files using ALSA"
>   SUMMARY:${PN}-aseqdump       = "Shows the events received at an ALSA sequencer port"
>   SUMMARY:${PN}-aseqnet        = "Network client/server for ALSA sequencer"
>   SUMMARY:${PN}-aseqsend       = "Send arbitrary messages to ALSA seqencer port"
> +SUMMARY:${PN}-axfer          = "Transfer audio data frames"
>   SUMMARY:${PN}-iecset         = "ALSA utility for setting/showing IEC958 (S/PDIF) status bits"
>   SUMMARY:${PN}-nhlt-dmic-info = "Dumps microphone array information from ACPI NHLT table"
>   SUMMARY:${PN}-speaker-test   = "ALSA surround speaker test utility"
>   
>   RRECOMMENDS:${PN}-alsactl = "alsa-states"
>   
> +RPROVIDES:${PN}-aplay += "${PN}-arecord"
> +RPROVIDES:${PN}-amidi += "${PN}-aplaymidi ${PN}-aplaymidi2 ${PN}-arecordmidi ${PN}-arecordmidi2"
> +
>   do_install:append() {
>   	# If udev is disabled, we told configure to install the rules
>   	# in /unwanted, so we can remove them now. If udev is enabled,

This looks good to me.
Tested-by: Michael Opdenacker

To minimize rework, I'd suggest to merge this change first. And then 
I'll update and send the Alsa 1.2.15.2 and 1.2.15.3 updates.
Cheers
Michael.

-- 
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com


