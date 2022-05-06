Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB85C433FE
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 15:56:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.11432.1651852569057575528
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 08:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9469D152B;
	Fri,  6 May 2022 08:56:08 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1839F3F885;
	Fri,  6 May 2022 08:56:07 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/5] scripts: Make git intercept global
Date: Fri,  6 May 2022 16:56:02 +0100
Message-Id: <20220506155604.2401829-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506155604.2401829-1-ross.burton@arm.com>
References: <20220506155604.2401829-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 15:56:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165346

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The previous minimially invasive git intercept simply isn't enough. For e=
xample,
meson used in the igt-gpu-tools recipe hardcodes the path to git in the c=
onfigure
step so at install time, changing PATH has no effect.

There are lots of interesting things we could do to try and avoid problem=
s but
making the git intercept and dropping fakeroot privs for git global is pr=
obably
the least worst solution at this point. It will add slight overhead to gi=
t calls
but we don't make many so the overall impact is likely minimal.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/{git-intercept =3D> }/git | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename scripts/{git-intercept =3D> }/git (100%)

diff --git a/scripts/git-intercept/git b/scripts/git
similarity index 100%
rename from scripts/git-intercept/git
rename to scripts/git
--=20
2.25.1


