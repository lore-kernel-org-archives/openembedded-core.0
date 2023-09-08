Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85085EE800E
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 14:21:48 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.40371.1694182903893483256
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 07:21:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout04.t-online.de (Postfix) with SMTP id A63571E2AC;
	Fri,  8 Sep 2023 16:21:41 +0200 (CEST)
Received: from [192.168.178.62] ([84.154.164.221]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qecMf-3863Ki0; Fri, 8 Sep 2023 16:21:41 +0200
Date: Fri, 08 Sep 2023 16:21:40 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [RFC][oe-core][PATCH] RFC: import libxmlb and appstream from
 meta-oe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Message-Id: <4W7O0S.NB5POCEV2FUF1@t-online.de>
In-Reply-To: <CANNYZj9iLmrSma2_PSpUijOoR5BMvgw5ueoNgzuwQDjDYbt6qg@mail.gmail.com>
References: <20230908130407.2676-1-f_l_k@t-online.de>
	<CANNYZj9iLmrSma2_PSpUijOoR5BMvgw5ueoNgzuwQDjDYbt6qg@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-3H95UiwwQZlSEbRle8qA"
X-TOI-EXPURGATEID: 150726::1694182901-737FD980-FCECBBFA/0/0 CLEAN NORMAL
X-TOI-MSGID: 5c2c0d51-9bc3-4e25-9091-dfc3558d126e
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 14:21:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187435

--=-3H95UiwwQZlSEbRle8qA
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Sep 8 2023 at 03:43:49 PM +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> Is it super hard to patch epiphany so that libadwaita is optional?

I don't think that this is possible with gtk4

I'm fine with splitting the patch if needed, but I believe that both of 
the changes are inappropriate for upstream use.

The patch renames ascli_exe command to appstreamcli so that it differs 
from the one that is used for the target binary.

This only works, because we define appstreamcli from a meson.cross file:

do_write_config:append:class-target() {
    cat >${WORKDIR}/meson-${PN}.cross <<EOF
[binaries]
appstreamcli = '${STAGING_BINDIR_NATIVE}/appstreamcli'
EOF
}

This won't work upstream like this.

I also think, the second change would break build for a lot of people 
because the hardcoded include path surely is there for a reason,
even though it breaks the yocto build.
.
Probably the reason is that the buildsystem of snowball is bitrotten 
and also has no pkgconfig support.


--=-3H95UiwwQZlSEbRle8qA
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Fri, Sep 8 2023 at 03:43:49 PM +02:0=
0:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquot=
e type=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces=
;">Is it super hard to patch epiphany so that libadwaita is optional?</div>=
</blockquote><div><br></div><div>I don't think that this is possible with g=
tk4</div><div><br></div><div>I'm fine with splitting the patch if needed, b=
ut I believe that both of the changes are inappropriate for upstream use.</=
div><div><br></div><div>The patch renames&nbsp;ascli_exe command to appstre=
amcli so that it differs from the one that is used for the target binary.</=
div><div><br></div><div>This only works, because we define appstreamcli fro=
m a meson.cross file:</div><div><br></div><div>do_write_config:append:class=
-target() {</div><div>&nbsp; &nbsp; cat &gt;${WORKDIR}/meson-${PN}.cross &l=
t;&lt;EOF</div><div>[binaries]</div><div>appstreamcli =3D '${STAGING_BINDIR=
_NATIVE}/appstreamcli'</div><div>EOF</div><div>}</div><div><br></div><div>T=
his won't work upstream like this.</div><div><br></div><div><div>I also thi=
nk, the second change would break build for a lot of people because the har=
dcoded include path surely is there for a reason,&nbsp;</div><div>even thou=
gh it breaks the yocto build.</div><div>.</div><div>Probably the reason is =
that the buildsystem of snowball is bitrotten and also has no pkgconfig sup=
port.</div></div></div>
--=-3H95UiwwQZlSEbRle8qA--


