Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51167CD8CB9
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 15:31:08 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.82816.1781019059644975987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 08:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=njb2Z+QS;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490ac357c55so62125995e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 08:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781019058; x=1781623858; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P64mRRn3vXUn6IacuqUmQi7AQdjfl6hVqGmnVj2jkxc=;
        b=njb2Z+QSPqtRnFwHjI9hH4nkCQ4BCR9EFPJQRC4ITrpqA2Tkv5z72lOilc+XMcGK9U
         oCqNU1THbrerXCNh2DDN7VD6RgK0VQ8/MET0TYKttFOjvfkD4Jlh/7s/n6WTXQBNWiG4
         WWrt1UStD/oJP1kWECYkpsmIH+SEdd+KLwRqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019058; x=1781623858;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P64mRRn3vXUn6IacuqUmQi7AQdjfl6hVqGmnVj2jkxc=;
        b=D+aak9i097+sfv7wG3LvYB5um1+wFGsuEcB6DB7H71ILB1gqckdlxsBflJWvEKn74v
         CyfgqQrv0cyCqeXBMoa8TtSeKuSKjzigpkEcdSm3gHuVrrsTPvnkF4+t5OctkrYd7YCi
         2/sElD9QEIhUibzZDyIDUzy3HvERSV62Uzz5WTC1LonWtyTH6I5H8QGLkN/T2AX/HblN
         2sBJVmIX4wBdXquRxtmH28eHNeNJCXib0z1Y7M9qthRX8vQehUqslnWklqAhSMdnvSgU
         r8ugRVnwqpz5LS+j7MhNhWzt2qiEr6S6QfTSH7/GokPnPXNH6Oj8iY/rH2pnj6JUPORb
         Pb4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+adblL/T9dLQGWHNL3VzuBrDw1hKVg21e3DzJJ1JJ9u22BT5hAEjwGsKTZ7BEX5YS0w/5srQXNmN4BibvxqDmX4w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx/OYyraYEitbKEeUeFRvkPbaa78Ew60aSIbDfYLJ+JqEs/jyJL
	KSBVuNnqDcqBDjH38Mb5ycnKldtesmRJnuCw5ICE1XP9iTmK/P50+FTYAXCEGTKapw==
X-Gm-Gg: Acq92OH2AgsrsEI/9aBbEb00U7oziCRMKy63OYZAttOVRVQH//RkQM9Ga5I0tP9FfEv
	1Co5F0B43Z9P4GTAcTW/jJw/o9FhU3/mO/wu3ypGvSWL+1PSL/pUAQTHCiFzoQmjTrUiZG6HvYJ
	w/Dsi4Fy169DJDOg3USWUl9e5T54bEwkbor+pMKhToa0G/EP3ftsafOzQYzZ4LFuw6rwOPUIs59
	Be6ZER1zvMZVLCGXQcORbgA1Ld05mfm+c9J1Dka1s9Lq9HLLq7WRT0hwapFGAzbkoYRWz80TX19
	tttYDfQEiEfzPn8RlZdzAdDwVjYo5cApJCy30/Z45IE1oidIvIHmb3bIdl5DkMB0ICdI7tVn9gj
	sHjg+Q4LwHB6iq66+SZwWVsqaKR9OtM1xpUWewimFqCsp4vs7rJKqLxpl2WlKFlUsuGk5F4s1FV
	LlhnU3ofZ1FtjjJ+RGbguRAkLB43V1C+wB4JS84dYxxU+h7IsY9/X4zYm5IEC+2tS0vUtw9vmdy
	Bd9Ie8M5gZi8Ok+A8ht
X-Received: by 2002:a05:600c:5020:b0:48f:e230:d5ab with SMTP id 5b1f17b1804b1-490c260f495mr346300095e9.31.1781019057952;
        Tue, 09 Jun 2026 08:30:57 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f345209sm66298811f8f.17.2026.06.09.08.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 08:30:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 17:30:57 +0200
Message-Id: <DJ4MKBK72LA7.1ZVS07CUD82E@smile.fr>
To: <hsimeliere.opensource@witekio.com>,
 <openembedded-core@lists.openembedded.org>
Cc: "Bruno VERNAY" <bruno.vernay@se.com>
Subject: Re: [OE-core][scarthgap][PATCH 2/2] util-linux: Fix CVE-2026-3184
From: "Jeremy Rosen" <jeremy.rosen@smile.fr>
X-Mailer: aerc 0.21.0
References: <20260520105959.3115597-1-hsimeliere.opensource@witekio.com>
 <20260520105959.3115597-2-hsimeliere.opensource@witekio.com>
In-Reply-To: <20260520105959.3115597-2-hsimeliere.opensource@witekio.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 15:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238300

Hello Hugo

This patch seems to also be needed in master and wrynose, but I could
not find a submission for these branches

please submit for those two and then ping this mail so we can continue

(note that the other patch in the serie is applied correctly, so I will
continue to review it independentlya)

Regards
Jeremy Rosen

On Wed May 20, 2026 at 12:59 PM CEST, Hugo Simeliere via lists.openembedded=
.org wrote:
> From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witeki=
o.com>
>
> Pick patch from [1] as mentioned in Debian report in [2].
>
> [1] https://github.com/util-linux/util-linux/commit/8b29aeb081e297e48c4c1=
ac53d88ae07e1331984
> [2] https://security-tracker.debian.org/tracker/CVE-2026-3184
>
> Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource=
@witekio.com>
> Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
> ---
>  meta/recipes-core/util-linux/util-linux.inc   |  1 +
>  .../util-linux/util-linux/CVE-2026-3184.patch | 63 +++++++++++++++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-3184=
.patch
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
> index 8380419634..961a7318aa 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -47,6 +47,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux=
/v${MAJOR_VERSION}/util-lin
>             file://CVE-2025-14104-01.patch \
>             file://CVE-2025-14104-02.patch \
>             file://CVE-2026-27456.patch \
> +           file://CVE-2026-3184.patch \
>             "
> =20
>  SRC_URI[sha256sum] =3D "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b9681=
0bd572e167dfed0f"
> diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-3184.patch =
b/meta/recipes-core/util-linux/util-linux/CVE-2026-3184.patch
> new file mode 100644
> index 0000000000..933adb3250
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux/CVE-2026-3184.patch
> @@ -0,0 +1,63 @@
> +From bbd20203765f3d705d45b2f51201041ed94fc3a3 Mon Sep 17 00:00:00 2001
> +From: Karel Zak <kzak@redhat.com>
> +Date: Thu, 19 Feb 2026 12:20:28 +0100
> +Subject: [PATCH] login: use original FQDN for PAM_RHOST
> +
> +When login -h <remotehost> is invoked, init_remote_info() strips the
> +local domain suffix from the hostname (FQDN to short name) before
> +storing it in cxt->hostname. This truncated value is then used for
> +PAM_RHOST, which can bypass pam_access host deny rules that match on
> +the FQDN.
> +
> +Preserve the original -h hostname in a new cmd_hostname field and use
> +it for PAM_RHOST, while keeping the truncated hostname for utmp/wtmp
> +and logging unchanged.
> +
> +Note, the real-world impact is low -- login -h is only used by legacy
> +telnet/rlogin daemons, and exploitation requires FQDN-specific
> +pam_access rules on a system still using these obsolete services.
> +
> +CVE: CVE-2026-3184
> +Upstream-Status: Backport [https://github.com/util-linux/util-linux/comm=
it/8b29aeb081e297e48c4c1ac53d88ae07e1331984]
> +
> +Reported-by: Asim Viladi Oglu Manizada <manizada@pm.me>
> +Signed-off-by: Karel Zak <kzak@redhat.com>
> +(cherry picked from commit 8b29aeb081e297e48c4c1ac53d88ae07e1331984)
> +Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensourc=
e@witekio.com>
> +---
> + login-utils/login.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/login-utils/login.c b/login-utils/login.c
> +index 1812b9017..211968f30 100644
> +--- a/login-utils/login.c
> ++++ b/login-utils/login.c
> +@@ -127,6 +127,7 @@ struct login_context {
> + 	char		*thishost;		/* this machine */
> + 	char		*thisdomain;		/* this machine's domain */
> + 	char		*hostname;		/* remote machine */
> ++	char		*cmd_hostname;		/* remote machine as specified on command line *=
/
> + 	char		hostaddress[16];	/* remote address */
> +=20
> + 	pid_t		pid;
> +@@ -894,7 +895,7 @@ static pam_handle_t *init_loginpam(struct login_cont=
ext *cxt)
> +=20
> + 	/* hostname & tty are either set to NULL or their correct values,
> + 	 * depending on how much we know. */
> +-	rc =3D pam_set_item(pamh, PAM_RHOST, cxt->hostname);
> ++	rc =3D pam_set_item(pamh, PAM_RHOST, cxt->cmd_hostname);
> + 	if (is_pam_failure(rc))
> + 		loginpam_err(pamh, rc);
> +=20
> +@@ -1231,6 +1232,8 @@ static void init_remote_info(struct login_context =
*cxt, char *remotehost)
> +=20
> + 	get_thishost(cxt, &domain);
> +=20
> ++	cxt->cmd_hostname =3D xstrdup(remotehost);
> ++
> + 	if (domain && (p =3D strchr(remotehost, '.')) &&
> + 	    strcasecmp(p + 1, domain) =3D=3D 0)
> + 		*p =3D '\0';
> +--=20
> +2.43.0
> +


