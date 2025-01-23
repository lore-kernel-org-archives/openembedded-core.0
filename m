Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C70C0218B
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 08:03:39 +0000 (UTC)
Subject: Re: [PATCH] classes/spdx-common: Fix patch error for recipes that inherit dos2unix.
To: openembedded-core@lists.openembedded.org
From: "hongxu" <hongxu.jia@eng.windriver.com>
X-Originating-Location: US (147.11.105.171)
X-Originating-Platform: Linux Firefox 134
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 23 Jan 2025 00:03:31 -0800
References: <9c98a7d0304062e884e35823af9a97f30bff75b3.camel@linuxfoundation.org>
In-Reply-To: <9c98a7d0304062e884e35823af9a97f30bff75b3.camel@linuxfoundation.org>
Message-ID: <16166.1737619411751493273@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="RaLufosdy8vm0ewqAA4T"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 08:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210176

--RaLufosdy8vm0ewqAA4T
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi RP,

Convert do_convert_crlf_to_lf from a separate task to a postfunc or prefunc
is not suitable for this case, the postfunc and prefunc is executed in
bb.build.exec_task [1], but do_patch is called by bb.build.exec_func
in archiver.bbclass and meta/lib/oe/spdx_common.py
Which means postfunc or prefunc will not be invoked in bb.build.exec_func

I think prepend function to task do_patch could workaround the issue, v2 in=
coming

[1] https://git.yoctoproject.org/poky/commit/?id=3D0f516fe9a043276c67062289=
5c4760ff6468f293

//Hongxu

--RaLufosdy8vm0ewqAA4T
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>Hi RP,</div>
<div>&nbsp;</div>
<div>Convert do_convert_crlf_to_lf from a separate task to a postfunc or pr=
efunc<br />is not suitable for this case, the postfunc and prefunc is execu=
ted in<br />bb.build.exec_task [1], but do_patch is called by bb.build.exec=
_func<br />in archiver.bbclass and meta/lib/oe/spdx_common.py</div>
<div>Which means postfunc or prefunc will not be invoked in bb.build.exec_f=
unc</div>
<div>&nbsp;</div>
<div>I think prepend function to task do_patch could workaround the issue, =
v2 incoming</div>
<div>&nbsp;</div>
<div>[1] <a href=3D"https://git.yoctoproject.org/poky/commit/?id=3D0f516fe9=
a043276c670622895c4760ff6468f293" target=3D"_blank" rel=3D"noopener">https:=
//git.yoctoproject.org/poky/commit/?id=3D0f516fe9a043276c670622895c4760ff64=
68f293</a></div>
<div>&nbsp;</div>
<div>//Hongxu</div>
</div>

--RaLufosdy8vm0ewqAA4T--

