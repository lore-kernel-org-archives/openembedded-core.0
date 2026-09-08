Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36597C79F99
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 14:19:07 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8547.1788877142033064381
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 07:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=IkdHv0H9;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so66257665e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 07:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788877140; x=1789481940; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gihnLsrZq3BXuK/McS8j2y+i0xX5FG59+zkcKflnVFs=;
        b=IkdHv0H9/INk8Q2APdmGkO65t2PIV3YMnQR8S1YXBi006JMiK/KGu6Ehgw+CkR5ngT
         7GNvNZN19StKGddxG+M7GaUHnoHaQ89J0NL8pqxiPLxzBHTyGuzxD8VwlvJHnooH2HBi
         xL+uP2NuYcvHZxRE8HMpG/M1lrZm6zlDdGq+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788877140; x=1789481940;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gihnLsrZq3BXuK/McS8j2y+i0xX5FG59+zkcKflnVFs=;
        b=dnKlSzicf5D+v/aK9w3gxudkkAf64kHbcSHlwuuMFN28UA22E+7kHIbhPCGpZiVcfs
         aowmNHXqPbd+uH3zX7smO6/rQMGA0pDhoondRajGzYaa4K5FdK9caG6/wuWW30WpaB1b
         IcRedH+QLoQUFbQg1ycdAxgP8f1C3XHUUB2Vmc0YhBE1lepfiT/Rg2fb9bmI31GGSx0Q
         ArICGkcFlTKLZpKRBSnSwBZ2+368x9RctQSQHGHpmTqZ4Gf4miZJKikZPT1RfP5GlDFg
         96ZyBZZ7ykT91qS8TAd+bvdAehK+NhqzG+OnEuTJswacGrWaxIY6s2eOE+5tkZqQKZW3
         VTxw==
X-Forwarded-Encrypted: i=1; AKwUvBxWlewXhgv+6w1fraN81DOpTWi/yuU+nnsYt0GWepWh/EYOuaFK/GpNIhvjqJI6lHmdtp83xHeEczB+6m8QaTXhpQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++kma0aAaceWzDaDqLbleARr+1Sv/40B3xFg80fX+j2nC5ltDw25
	m2czdIzCxW8Ynfw7PfBBCAKtc0jWicd974TQpyj3o9jtRP2xHSIADFEHsKR1gHjkQZmXFdRXWUj
	TeC3BJ0w=
X-Gm-Gg: AYBFou0YjOQaxUl/iktfDuO4YjnCb57TlQBBDqdcUFg4aTORRU7nuuEvzCFMGUEOdju
	6ykfJYy2g02GWPLTRNPquU4eXVsffORgs+djsNab8WHjOqKVRqMcm4uUBE7oQJrmOtGXDdINBKD
	EMYPkZ1Xtjx0O1PyTd9apnJFA4tVx/QwxiAk9AiZiymqNsXAQqZgeAEThquNE6GtToigPCeaVoO
	eR+tQUECRtymTkpnDnWLAUmyXZYnW0AA7rVkxWbecORnT20D22vaUr2q26UJedHDu2ZKCQ5/zzV
	GMWJ500iYTzh8S9SrHhXqpYzeOUdCtBcP0FQl7TZ8HeeT25WkPuWqKvq3TH3N8kW3UtBmLRjY58
	jXn055eW7czL5RQR8rI/7aPDdRMGgwirYxxEzs8A6GXTQxoNPebuA46fjoOuEILqCDZxVjEJ2OX
	wEs5LWL4MqSTqCOYjSRKj1EyWucqh3c17K52hIG5nuYKZKOiRr/F5UjGB1ZYy+Dwkb+vtELWc9c
	bq7MYgIYg9LaAt8HFcq3EeMeZn7JwIjIXAz6EKeU2flxvRhnQ==
X-Received: by 2002:a05:600c:8b05:b0:49c:edd2:855 with SMTP id 5b1f17b1804b1-49cf823c411mr306463615e9.6.1788877139874;
        Tue, 08 Sep 2026 07:18:59 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce591f846sm231780785e9.1.2026.09.08.07.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 07:18:59 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Sep 2026 16:18:59 +0200
Message-Id: <DLA00SM0KMT2.1CWHEJAO2J870@smile.fr>
Subject: Re: [OE-core][wrynose][patch] kbd: Fix CVE-2026-72693
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260826081324.65559-1-vanusuri@mvista.com>
In-Reply-To: <20260826081324.65559-1-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 14:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245366

On Wed Aug 26, 2026 at 10:13 AM CEST, Vijay Anusuri via lists.openembedded.=
org wrote:
> Pick patch according to [1]
>
> [1] https://security-tracker.debian.org/tracker/CVE-2026-72693
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-72693
> [3] https://access.redhat.com/security/cve/cve-2026-72693
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../recipes-core/kbd/kbd/CVE-2026-72693.patch | 155 ++++++++++++++++++
>  meta/recipes-core/kbd/kbd_2.9.0.bb            |   1 +
>  2 files changed, 156 insertions(+)
>  create mode 100644 meta/recipes-core/kbd/kbd/CVE-2026-72693.patch
>
> diff --git a/meta/recipes-core/kbd/kbd/CVE-2026-72693.patch b/meta/recipe=
s-core/kbd/kbd/CVE-2026-72693.patch
> new file mode 100644
> index 0000000000..06b8c195a5
> --- /dev/null
> +++ b/meta/recipes-core/kbd/kbd/CVE-2026-72693.patch
> @@ -0,0 +1,155 @@
> +From 78d5ae119742e87baa7dbe0f5c4107e7533fd698 Mon Sep 17 00:00:00 2001
> +From: Alexey Gladkov <legion@kernel.org>
> +Date: Tue, 12 May 2026 10:20:50 +0200
> +Subject: [PATCH] openvt: make -u process matching more conservative
> +
> +The -u mode relies on the current VT owner to decide which user should
> +be used for the new login session. Make that check stricter by requiring
> +a matching process owner and controlling terminal instead of relying on
> +the ownership of an inherited file descriptor.
> +
> +Also reject root as a pre-authenticated target and document the tighter
> +behavior in the man page.
> +
> +Signed-off-by: Alexey Gladkov <legion@kernel.org>
> +
> +Upstream-Status: Backport [https://github.com/legionus/kbd/commit/78d5ae=
119742e87baa7dbe0f5c4107e7533fd698]
> +CVE: CVE-2026-72693
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + docs/man/man1/openvt.1 | 10 +++++++
> + src/openvt.c           | 64 +++++++++++++++++++++++++++++++++++++-----
> + 2 files changed, 67 insertions(+), 7 deletions(-)
> +
> +diff --git a/docs/man/man1/openvt.1 b/docs/man/man1/openvt.1
> +index 8f1244f..404e4a0 100644
> +--- a/docs/man/man1/openvt.1
> ++++ b/docs/man/man1/openvt.1
> +@@ -36,6 +36,8 @@ will be made the new current VT.
> + \fB\-u\fR, \fB\-\-user\fR
> + Figure out the owner of the current VT, and run login as that user.
> + Suitable to be called by init. Shouldn't be used with \fI\-c\fR or \fI\=
-l\fR.
> ++This option refuses to pre-authenticate root and requires a process own=
ed by
> ++the VT owner whose controlling terminal is the current VT.
> + .TP
> + \fB\-l\fR, \fB\-\-login\fR
> + Make the command a login shell. A \- is prepended to the name of the co=
mmand
> +@@ -64,6 +66,14 @@ If
> + is compiled with a getopt_long() and you wish to set
> + options to the command to be run, then you must supply
> + the end of options \-\- flag before the command.
> ++.PP
> ++The
> ++.B \-u
> ++option uses
> ++.BR "login -f"
> ++and therefore bypasses normal password authentication for the detected =
user.
> ++It is intended only for controlled init or keyboard-request configurati=
ons.
> ++Use a normal authenticated login command when authentication is require=
d.
> + .SH EXAMPLES
> + .B openvt
> + can be used to start a shell on the next free VT, by using the command:
> +diff --git a/src/openvt.c b/src/openvt.c
> +index a94392b..ddd9239 100644
> +--- a/src/openvt.c
> ++++ b/src/openvt.c
> +@@ -57,6 +57,51 @@ usage(int rc, const struct kbd_help *options)
> + 	exit(rc);
> + }
> +=20
> ++static int
> ++proc_pid_stat(const char *pid, uid_t *uid, dev_t *tty)
> ++{
> ++	char filename[NAME_MAX + 12];
> ++	char line[BUFSIZ];
> ++	char *lp, *rp;
> ++	FILE *fp;
> ++	struct stat st;
> ++	long tty_nr;
> ++
> ++	snprintf(filename, sizeof(filename), "/proc/%s/stat", pid);
> ++	fp =3D fopen(filename, "r");
> ++	if (!fp)
> ++		return -1;
> ++
> ++	if (fstat(fileno(fp), &st)) {
> ++		fclose(fp);
> ++		return -1;
> ++	}
> ++
> ++	if (!fgets(line, sizeof(line), fp)) {
> ++		fclose(fp);
> ++		return -1;
> ++	}
> ++	fclose(fp);
> ++
> ++	rp =3D strrchr(line, ')');
> ++	if (!rp)
> ++		return -1;
> ++
> ++	/*
> ++	 * /proc/<pid>/stat fields after comm are:
> ++	 * state ppid pgrp session tty_nr ...
> ++	 */
> ++	if (!rp || sscanf(rp + 1, " %*c %*d %*d %*d %ld", &tty_nr) !=3D 1)
> ++		return -1;
> ++
> ++	if (tty_nr <=3D 0)
> ++		return -1;
> ++
> ++	*uid =3D st.st_uid;
> ++	*tty =3D (dev_t) tty_nr;
> ++	return 0;
> ++}
> ++
> + /*
> +  * Support for Spawn_Console: openvt running from init
> +  * added by Joshua Spoerri, Thu Jul 18 21:13:16 EDT 1996
> +@@ -88,8 +133,7 @@ authenticate_user(int curvt)
> + 	DIR *dp;
> + 	struct dirent *dentp;
> + 	struct stat buf;
> +-	dev_t console_dev;
> +-	ino_t console_ino;
> ++	dev_t console_rdev;
> + 	uid_t console_uid;
> + 	char filename[NAME_MAX + 12];
> + 	struct passwd *pwnam;
> +@@ -109,10 +153,12 @@ authenticate_user(int curvt)
> + 			kbd_error(EXIT_FAILURE, errsv, "%s", filename);
> + 		}
> + 	}
> +-	console_dev =3D buf.st_dev;
> +-	console_ino =3D buf.st_ino;
> ++	console_rdev =3D buf.st_rdev;
> + 	console_uid =3D buf.st_uid;
> +=20
> ++	if (console_uid =3D=3D 0)
> ++		kbd_error(EXIT_FAILURE, 0, _("Refusing to pre-authenticate root on cu=
rrent tty."));

Hello,

Isn't this a change in befavior that might break some use-case?
I don't know how legitimate and/or unsafe it is though...
Do you know?

I'll hold this in the meantime.

Regards,
--=20
Yoann Congal
Smile ECS


