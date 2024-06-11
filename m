Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557B3C27C79
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 23:35:33 +0000 (UTC)
Subject: Re: [PATCH] archiver.bbclass: Fix work-shared checking for kernel recipes
To: openembedded-core@lists.openembedded.org
From: "Livius" <egyszeregy@freemail.hu>
X-Originating-Location: Budapest, HU (80.98.74.198)
X-Originating-Platform: Windows Chrome 125
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 11 Jun 2024 16:35:23 -0700
References: <642EEA27-10FD-40C7-8B06-24741CEA1548@arm.com>
In-Reply-To: <642EEA27-10FD-40C7-8B06-24741CEA1548@arm.com>
Message-ID: <23837.1718148644454631767@lists.openembedded.org>
X-Old-Date: Tue, 11 Jun 2024 16:33:42 -0700
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 23:35:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200551
Message-ID: <20240611233523.sbphp3kCbnn59ghojoXtT9bf5N5NURnUnE_4YrwDOb8@z>

S =3D "${WORKDIR}/git" does not contain "${TMPDIR}/work-shared" path, there=
fore "def is_work_shared(d):" will be returned with False and archiver is f=
ailed for linux kernel recipe (somewhy unpack is broken and kernel source i=
s missing in work-shared folder in this situation).
https://github.com/openembedded/bitbake/blob/master/conf/bitbake.conf#L45

In default S =3D "${STAGING_KERNEL_DIR}" is the source path for a kernel. N=
ow, archiver works only in this case when it is not changed to "${WORKDIR}/=
git" symbolic link folder. We can see "bb.data.inherits_class('kernel', d)"=
 was in the old code for checking it because of this situation, when somebo=
dy like to use this kind of symbolic link git source solution. This should =
not have been dropped in last commit.

https://github.com/openembedded/openembedded-core/commit/5fbb4ca8da4f4f1ea4=
26275c45634802dcb5a575#diff-7a2ccc0d645ec49c87c4956f90ab24ace5292140dff6654=
59bbc94e4e72a8e07L473
https://github.com/openembedded/openembedded-core/blob/master/meta/classes-=
recipe/kernel.bbclass#L26


