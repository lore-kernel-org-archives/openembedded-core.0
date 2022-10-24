Return-Path: <christian.thiessen@airbus.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55BF7C38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 11:05:17 +0000 (UTC)
Subject: Re: license manifest files effectively disappear when do_rootfs is not rerun
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?Q2hyaXN0aWFuIFRoaWXDn2Vu?= <christian.thiessen@airbus.com>
X-Originating-Location: Düsseldorf, North Rhine-Westphalia, DE (163.116.173.55)
X-Originating-Platform: Windows Chrome 106
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 24 Oct 2022 04:05:14 -0700
References: <CANNYZj-p9vce2nRGHjKJ0-VqGEaF0Ed2X-YMgFkfos4zJDiEWA@mail.gmail.com>
In-Reply-To: <CANNYZj-p9vce2nRGHjKJ0-VqGEaF0Ed2X-YMgFkfos4zJDiEWA@mail.gmail.com>
Message-ID: <1878.1666609514952259746@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 11:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172083

Thanks, you're right; a normal rebuild doesn't execute any tasks. I've now =
found that this is related to rm_work: If you enable it with INHERIT+=3D" r=
m_work" in local.conf, bitbake will rerun three tasks on each rebuild: popu=
late_lic_deploy, rm_work and build. After that you get the missing manifest=
s.
So another option for a workaround would be to exclude the image recipe fro=
m rm_work.

Christian

