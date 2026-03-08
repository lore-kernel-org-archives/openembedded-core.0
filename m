Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F17EA8538
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 16:58:55 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42752.1772989129739195801
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 09:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=PvU2hn5F;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9C2FF1A2D6E;
	Sun,  8 Mar 2026 16:58:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 662525FF9D;
	Sun,  8 Mar 2026 16:58:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 808AA10369A89;
	Sun,  8 Mar 2026 17:58:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772989126; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DgjfsQRIXyYaZgEc+HRFC7WSqzylQUhVKumZn42cyxQ=;
	b=PvU2hn5F8DGbU8bX0oG8vOgme4WlzvjvWrEYL+Q3mqhAo5ew6YBB3gZKkbgQFGP5aXkHWn
	oN4BvTuH0E0RN68fHcVqo3/JryDhEA8xt8yq4UZF0RzIsWSlrPL2AvQpAwaW4wQAdV28nN
	wUG80obHTV3BMtLayFVoh7SjPtP146Zs3rd18z6HT1YFD9EUgOYZZH/vWCaptq9UC8HlJ3
	KQN4QQN7rBwSNYpNDGJUd3pFTguoZ/9cq8d7T5DbBMJW/7F9dQxsOwcYwMm07SFcman+gB
	f32IwHY5ngUbOokVGMTMG8brWLPUM6e983caQZz35dZUHBT+Xl1sGmfjbgJaiA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Mar 2026 17:58:44 +0100
Message-Id: <DGXK6VAOY8N1.M2E6CJ02MAUQ@bootlin.com>
Cc: <Sundeep.Kokkonda@windriver.com>, <Randy.MacLeod@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Hemanth.KumarMD@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 7/7] ltp: workaround openat2 build failure
 with glibc 2.43
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
 <20260308150834.2508331-7-Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260308150834.2508331-7-Hemanth.KumarMD@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 16:58:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232666

On Sun Mar 8, 2026 at 4:07 PM CET, Hemanth Kumar M D via lists.openembedded=
.org wrote:
> From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>
> Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> ---

Hi Hemanth,

Thanks for your patch.

> diff --git a/meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-wit=
h-glibc-2.43.patch b/meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failu=
re-with-glibc-2.43.patch
> new file mode 100644
> index 0000000000..148731f782
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-with-glibc=
-2.43.patch
...
> diff --git a/meta/recipes-extended/ltp/ltp_20260130.bb b/meta/recipes-ext=
ended/ltp/ltp_20260130.bb
> index bb3b7e9ca3..57e3120839 100644
> --- a/meta/recipes-extended/ltp/ltp_20260130.bb
> +++ b/meta/recipes-extended/ltp/ltp_20260130.bb
> @@ -30,6 +30,7 @@ SRC_URI =3D "git://github.com/linux-test-project/ltp.gi=
t;branch=3Dmaster;protocol=3Dht
>             file://0001-Remove-OOM-tests-from-runtest-mm.patch \
>             file://0001-Add-__clear_cache-declaration-for-clang.patch \
>             file://0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64=
_RE.patch \
> +           file://0001-openat2-fix-glibc-2.43-build.patch \
>            "

File name of the patch is not correct:
"0001-ltp-fix-build-failure-with-glibc-2.43.patch" vs
"0001-openat2-fix-glibc-2.43-build.patch".

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


