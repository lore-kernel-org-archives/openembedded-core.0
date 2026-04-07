Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B5BFF5108
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 15:28:04 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.84064.1775575680538197162
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 08:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HOvwtSBM;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5D365C5B18E;
	Tue,  7 Apr 2026 15:28:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8B3B1603C7;
	Tue,  7 Apr 2026 15:27:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3DFED10450210;
	Tue,  7 Apr 2026 17:27:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775575678; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rOqjtfp9LL2xld+HqnAjXrGkQ6ashxkQwQWXhLQro10=;
	b=HOvwtSBMR7woKDQTkM+FLwdaOAPO8FQH4SVKvf/gsVMKEvFGtfM1Oa5rwTIwYuMTV3TqsY
	SSeKhW3OalnZM93zzbSKr24dAqBZXrjKOU7v9XkhloCuLJkwD/aOdGGeeJDgrdpLZcBM0T
	thTfPxjcZmdo1lX4uqm0x+cz0frXcgfVmm3KJn8QRZZj5BNAEmfo0trZWgLG5ND6l4jNM+
	7XtILNvfizAOAWm6Clb2G54XxpD4PgZg9UXgBqpK46Al9vw+4pmom6fqJ+WOdl7mDaYHFy
	OS8Av+j07mc3thNrSRWrJf1TocyRyzrcZWKth4skBxYREhdyGEeNuZXilwRyFA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 17:27:55 +0200
Message-Id: <DHN11ORFP49K.2PWSARK0B4AW6@bootlin.com>
Subject: Re: [PATCH v2 2/2] sbom-cve-check-update-db: Fix unpack removing
 other databases
Cc: <richard.purdie@linuxfoundation.org>, <rybczynska@gmail.com>,
 <ross.burton@arm.com>, <peter.marko@siemens.com>, <jpewhacker@gmail.com>,
 <olivier.benjamin@bootlin.com>, <mathieu.dubois-briand@bootlin.com>,
 <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Benjamin Robin" <benjamin.robin@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
References: <20260407-fix-lic-sbom-cve-check-v2-0-f69da412fd67@bootlin.com>
 <20260407-fix-lic-sbom-cve-check-v2-2-f69da412fd67@bootlin.com>
In-Reply-To: <20260407-fix-lic-sbom-cve-check-v2-2-f69da412fd67@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 15:28:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234748

Hi,

On Tue Apr 7, 2026 at 5:01 PM CEST, Benjamin Robin wrote:
> Previously, `UNPACKDIR` was set to `${SBOM_CVE_CHECK_DEPLOY_DB_DIR}`,
> which points to the `./databases/` directory and may contain multiple
> databases. Since `do_unpack` cleans the `${UNPACKDIR}` directory,
> `UNPACKDIR` must only contain a single database.
>
> To address this, set `UNPACKDIR` to
> `${SBOM_CVE_CHECK_DEPLOY_DB_DIR}/${SBOM_CVE_CHECK_DB_NAME}` and
> configure `destsuffix` to an empty string. However, it is currently not
> possible to set `BB_GIT_DEFAULT_DESTSUFFIX` to an empty string, so
> `destsuffix` is configured through the SRC_URI instead.

I've tested this the following way, first by unpacking the databases with:

SRCREV:pn-sbom-cve-check-update-nvd-native =3D "ba5e43861ba2ca0f7968597c27c=
6a412c1bfa8c2"
SRCREV:pn-sbom-cve-check-update-cvelist-native =3D "6740b38b3e0692bb9c96eb2=
26371ae9e1217c1fd"

Then created a random file in the nvd database checkout:

touch tmp/deploy/sbom-cve-check/databases/nvd-fkie/file.txt

Then I updated the sha for cvelist only:

SRCREV:pn-sbom-cve-check-update-nvd-native =3D "ba5e43861ba2ca0f7968597c27c=
6a412c1bfa8c2"
SRCREV:pn-sbom-cve-check-update-cvelist-native =3D "42e75c927b155335cb1119d=
f9d9b85a58732ad1e"

Ran the unpack again, and file.txt is still there.

Doing the same without this patch, you'd get:

$ ls -l tmp/deploy/sbom-cve-check/databases/nvd-fkie
"tmp/deploy/sbom-cve-check/databases/nvd-fkie": No such file or directory (=
os error 2)

This fixes the issue for me too, so feel free to add:

Tested-by: Antonin Godard <antonin.godard@bootlin.com>

Antonin

