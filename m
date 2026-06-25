Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D34BCDB479
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 12:55:44 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10864.1782392136270104376
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 05:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ukaj3F03;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F3A464E408DB;
	Thu, 25 Jun 2026 12:55:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C7B9E5FF03;
	Thu, 25 Jun 2026 12:55:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 512DB104C9453;
	Thu, 25 Jun 2026 14:55:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782392133; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4rTVfZsNac5QmidsY5GLxriGvJzz3h3S7NzQLawdKx4=;
	b=ukaj3F03PCanJ254ndoz+F1Tq+Z6I+tpPBAbrwSanK1gxMNmYmWhFMiJpDeiPZkWvCVaD3
	YkRsoQJJ46ywrvcFiw3jImYjpTwwgjyq89Xwv3G4+mruQUlVmlKtuTcS2Kb0praZqHjUMq
	gRWNd71M/Fztpki0X56V2ScpQQMmdEaSLXKMB2Nzs3ZD12rYDetXHGTqAahFRz5Absd7LN
	fnpC7wuGnAbyrX7BHewDjmPlA3Jrqblhsh6yOnsjDtCS3625ipNbKl6swdrzSc/yVkDhpQ
	9Qet2fZzZIGb0SmbClaleCggjGrR5od7Uyy9sTEnykOc9qkyAxIQs20toYR0hw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Jun 2026 14:55:30 +0200
Message-Id: <DJI5A0TDU4MZ.27335X1KDK4AQ@bootlin.com>
Subject: Re: [OE-core][PATCH v1] util-linux: backport pam_lastlog2 libpam
 linking fix
Cc: "Chen Qi" <Qi.Chen@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <sivakumar.bs@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260625090231.2575081-1-sivakumar.bs@gmail.com>
In-Reply-To: <20260625090231.2575081-1-sivakumar.bs@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 12:55:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239560

On Thu Jun 25, 2026 at 11:02 AM CEST, Siva Balasubramanian via lists.openem=
bedded.org wrote:
> pam_lastlog2.so uses pam_syslog() and other libpam symbols but the
> autotools build did not link the module against libpam. With the
> linker default of --as-needed, libpam was discarded and did not end
> up in the module's ELF NEEDED entries. The module then fails to load
> via dlopen() in processes that do not themselves link libpam (e.g.
> systemd on recent Fedora, or weston on journald-based systems without
> syslog):
>
>   PAM unable to dlopen(/usr/lib/security/pam_lastlog2.so): undefined symb=
ol: pam_syslog
>   PAM adding faulty module: /usr/lib/security/pam_lastlog2.so
>
> Backport the upstream fix (in 2.41.5) that moves -lpam into LIBADD so
> it is placed after the object files and retained as a NEEDED entry.
> Against 2.41.3 only the LIBADD line needs changing.
>
> [YOCTO #16320]
>
> Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
> ---
> Verified by building util-linux with pam in DISTRO_FEATURES (qemux86-64):
> without the patch the resulting pam_lastlog2.so has no libpam in its ELF
> NEEDED entries; with the patch readelf -d reports libpam.so.0, matching
> the upstream fix and resolving the dlopen() failure from the bug report.
>
> This is also a candidate for the stable 6.0.x branch (per the bug
> report), which also ships util-linux 2.41.3; the same single-hunk
> backport applies.

Hi Siva,

Thanks for the patch.

We already have a pending patch for master, upgrading to 2.42.2 [1]. So
I believe this patch won't be needed for master. It probably still makes
sense for stable branches.

[1]: https://lore.kernel.org/openembedded-core/20260619083305.3505156-2-ale=
x.kanavin@gmail.com/

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


