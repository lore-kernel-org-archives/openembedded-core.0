Return-Path: <pedro.silva.ferreira@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A26BC02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 14:37:31 +0000 (UTC)
Subject: Re: [PATCH] buildhistory.bbclass: restore BUILDHISTORY_PRESERVE files
To: openembedded-core@lists.openembedded.org
From: "Pedro Ferreira" <pedro.silva.ferreira@criticaltechworks.com>
X-Originating-Location: Vila Nova de Foz Coa, Guarda, PT (213.205.68.220)
X-Originating-Platform: Windows Chrome 132
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 23 Jan 2025 06:37:21 -0800
References: <FA6EADF9-7198-4DF2-8417-1FB6BFA24BDA@arm.com>
In-Reply-To: <FA6EADF9-7198-4DF2-8417-1FB6BFA24BDA@arm.com>
Message-ID: <16166.1737643041567770551@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="yLG2Kg5L9zAy7dvp4vmW"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 14:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210191

--yLG2Kg5L9zAy7dvp4vmW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

Here's a simple test do reproduce it.

*Pre-conditions:*
INHERIT +=3D "buildhistory"
BUILDHISTORY_RESET =3D "1"
BUILDHISTORY_PRESERVE:append =3D " files-in-package.txt"

*- Starting without sstate cache*
*Run:*
bitbake base-passwd
*Check:*
cat PATH_TO_BUILD_dir/buildhistory/packages/core2-64-poky-linux/base-passwd=
/base-passwd-dbg/files-in-package.txt
(File exists and content ok)
*Run:*
bitbake base-passwd (it will use sstate cache)
*Check:*
cat PATH_TO_BUILD_dir/buildhistory/packages/core2-64-poky-linux/base-passwd=
/base-passwd-dbg/files-in-package.txt
(File wont exist)

*- Starting with sstate cache*
*Run:*
bitbake base-passwd --no-setscene
*Check:*
cat PATH_TO_BUILD_dir/buildhistory/packages/core2-64-poky-linux/base-passwd=
/base-passwd-dbg/files-in-package.txt
(File exists and content ok)
*Run:*
bitbake base-passwd (it will use sstate cache)
*Check:*
cat PATH_TO_BUILD_dir/buildhistory/packages/core2-64-poky-linux/base-passwd=
/base-passwd-dbg/files-in-package.txt
(File wont exist)

Cheers,
Pedro

--yLG2Kg5L9zAy7dvp4vmW
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Ross,</div>
<div>&nbsp;</div>
<div>Here's a simple test do reproduce it.</div>
<div>&nbsp;</div>
<div>
<div><strong>Pre-conditions:</strong></div>
<div>INHERIT +=3D "buildhistory"<br />BUILDHISTORY_RESET =3D "1"<br />BUILD=
HISTORY_PRESERVE:append =3D " files-in-package.txt"</div>
<div>&nbsp;</div>
<div><strong>- Starting without sstate cache</strong><br /><strong>Run:</st=
rong><br />bitbake base-passwd<br /><strong>Check:</strong><br />cat PATH_T=
O_BUILD_dir/buildhistory/packages/core2-64-poky-linux/base-passwd/base-pass=
wd-dbg/files-in-package.txt<br /><em>(File exists and content ok)</em><br /=
><strong>Run:</strong><br />bitbake base-passwd (it will use sstate cache)<=
br /><strong>Check:</strong><br />cat PATH_TO_BUILD_dir/buildhistory/packag=
es/core2-64-poky-linux/base-passwd/base-passwd-dbg/files-in-package.txt<br =
/><em>(File wont exist)</em></div>
<div>&nbsp;</div>
<div><strong>- Starting with sstate cache</strong><br /><strong>Run:</stron=
g><br />bitbake base-passwd --no-setscene<br /><strong>Check:</strong><br /=
>cat PATH_TO_BUILD_dir/buildhistory/packages/core2-64-poky-linux/base-passw=
d/base-passwd-dbg/files-in-package.txt<br /><em>(File exists and content ok=
)</em><br /><strong>Run:</strong><br />bitbake base-passwd (it will use sst=
ate cache)<br /><strong>Check:</strong><br />cat PATH_TO_BUILD_dir/buildhis=
tory/packages/core2-64-poky-linux/base-passwd/base-passwd-dbg/files-in-pack=
age.txt<br /><em>(File wont exist)</em></div>
<div>&nbsp;</div>
<div>Cheers,<br />Pedro</div>
</div>

--yLG2Kg5L9zAy7dvp4vmW--

