Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26238.1792947103393977193
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 09:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2swea9Rw;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1990A4E41308
	for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 16:51:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B7FCF60740;
	Sun, 25 Oct 2026 16:51:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D1FC10328E76;
	Sun, 25 Oct 2026 17:51:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792947100; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eWnNjaVt8DckAPnKypPkZZdWUuUhBH+wRVEgeL0XcJg=;
	b=2swea9RwEzuAfkQwYsjBZKX6Rj3+uKAKLVUWRm56D0LBXd7J88gMo7nBPfIEUuaR9ie/Xq
	VxXxYzJ5MHK5u9DXDP2rKnbtlYw0EcicUakV4YzLiSxqPBC2Op7n7T3QMT/evbty5OhQ9n
	rpgk+89qKRC6pJPF50t6Huizri2cyS+P6dp13EZkw0MUfxax25rfnE6QHN88nKUTkvz3gd
	89x4Jz/Zm8gDJa+DiSWVOn24CIUM5no5ehTZ37JgQBtWmxm2wBgto3tUwZ0xlyzEEQhN3D
	6pXu36lILP4ATu/MHnTNCNvB5ylY9/Po4nNRh7Dtse4kJSaLQDBsTJarp0hYgA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 Oct 2026 17:51:36 +0100
Message-Id: <DME2P9H79X8M.2UKMXPNGXMJUO@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <SaiSireesha.T@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH]
 systemd-boot,systemd-tools-native,systemd-boot-native,systemd: upgrade 262
 -> 262.1
Cc: <quic_vkraleti@quicinc.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261023191044.3603305-1-saisireesha.t@windriver.com>
In-Reply-To: <20261023191044.3603305-1-saisireesha.t@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 16:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248611

On Fri Oct 23, 2026 at 9:10 PM CEST, Sai Sireesha via lists.openembedded.or=
g T wrote:
> Upgrade the systemd recipes to the 262.1 stable release.
>
> Update the source revisions and refresh the existing patches
> to apply against the updated upstream sources.
>
> Notable fixes in v262.1:
>   - logind: fix one-byte buffer overflow
>   - ndisc: fix an off by 2 write in ndisc_option_build_encrypted_dns()
>   - sd-bus: avoid overflow in sd_bus_message_append_{array,string}_memfd(=
)
>   - firstboot: fix use-after-free/double-free in process_hostname()
>   - sd-event: fix hang after ratelimit expiry
>   - journal-file: refuse hash chains and field lists that loop back
>   - seccomp: mask socket() and setns() arguments to 32 bits
>   - kernel-image: handle errors when reading .osrel section
>   - udev-node: chase devlink on remove event
>
> Refresh the patch context for the updated upstream sources.
>
> Testing:
> - bitbake systemd
> - bitbake core-image-minimal
> - Booted core-image-minimal on qemux86-64
> - Verified systemd 262.1 as PID 1
> - Verified zero failed system units
> - Verified clean shutdown
>
> Signed-off-by: Sai Sireesha T <saisireesha.t@windriver.com>
> ---

Hi,

Thanks for the upgrade.

It looks like we have some warning during the do_rootfs, but without
much detail:

WARNING: core-image-full-cmdline-1.0-r0 do_rootfs: [log_check] core-image-f=
ull-cmdline: found 1 warning message in the logfile:
[log_check] warn.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/4830

This is only seen on qemux86 with altcfg distro. Can you have a look at
the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

