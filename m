Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DBEC5AD4C
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 13:15:17 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.90272.1700745309676434640
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 05:15:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout02.t-online.de (Postfix) with SMTP id B5087FF56;
	Thu, 23 Nov 2023 14:15:07 +0100 (CET)
Received: from [192.168.178.67] ([84.163.41.134]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r69Xt-1gAEdc0; Thu, 23 Nov 2023 14:15:06 +0100
Date: Thu, 23 Nov 2023 14:15:32 +0100
From: f_l_k@t-online.de
Subject: Re: [oe-core][PATCHv3] cups: Allow to be controlled by root and users
 in wheel
To: Ross Burton <Ross.Burton@arm.com>
Cc: f_l_k@t-online.de, openembedded-core@lists.openembedded.org
Message-Id: <WHVK4S.34D99LCWGM2K2@t-online.de>
In-Reply-To: <33C2C00C-ED6D-478B-B616-0E2FBAA88C01@arm.com>
References: <20231120161848.1461683-1-f_l_k@t-online.de>
	<33C2C00C-ED6D-478B-B616-0E2FBAA88C01@arm.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-IYgf6pwdm86v7y6iQPCs"
X-TOI-EXPURGATEID: 150726::1700745306-3E7FB877-8D1B33F7/0/0 CLEAN NORMAL
X-TOI-MSGID: 77c0e217-b224-448a-8863-50927f6c69fa
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 13:15:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191149

--=-IYgf6pwdm86v7y6iQPCs
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23 2023 at 12:43:48 PM +00:00:00, Ross Burton=20
<Ross.Burton@arm.com> wrote:
>  removing the lpadmin group entirely, which isn=FFt mentioned in the=20
> commit message at all and presumably has other implications

Yes, it does. I have sent two versions of the patch. The first one just=20
adjusts the place in cups-files.conf to set the system groups and in=20
the second attempt I thought it would be cleaner to remove the lpadmin=20
group altogether because it is not used. I didn't find any other usage=20
in oe-core and in meta openembedded only:
flk@intel-corei7-64:~/poky/meta-openembedded$ grep -r lpadmin .
./meta-networking/recipes-connectivity/samba/samba/smb.conf:# You may=20
need to replace 'lpadmin' with the name of the group your
./meta-networking/recipes-connectivity/samba/samba/smb.conf:; write=20
list =3D root, @lpadmin

and I planned to have a look at  the samba part in near future. I guess=20
the same list would apply there as well to get a working default=20
setting.
This is also how cups is configured in fedora. I don't know about debian

The first patch is a little less invasive but ugly with sed


Should I send a v3 with adjusted commit message? Thought it was quite=20
obvious what the patch does


--=-IYgf6pwdm86v7y6iQPCs
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Thu, Nov 23 2023 at 12:43:48 PM +00:=
00:00, Ross Burton &lt;Ross.Burton@arm.com&gt; wrote:<br><blockquote type=
=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;"> re=
moving the lpadmin group entirely, which isn=FFt mentioned in the commit me=
ssage at all and presumably has other implications</div></blockquote><div><=
br></div><div><div>Yes, it does. I have sent two versions of the patch. The=
 first one just adjusts the place in cups-files.conf to set the system grou=
ps and in the second attempt I thought it would be cleaner to remove the lp=
admin group altogether because it is not used. I didn't find any other usag=
e in oe-core and in meta openembedded only:</div><div>flk@intel-corei7-64:~=
/poky/meta-openembedded$ grep -r lpadmin .</div><div>./meta-networking/reci=
pes-connectivity/samba/samba/smb.conf:# You may need to replace 'lpadmin' w=
ith the name of the group your</div><div>./meta-networking/recipes-connecti=
vity/samba/samba/smb.conf:; write list =3D root, @lpadmin</div><div><br></d=
iv><div>and I planned to have a look at &nbsp;the samba part in near future=
. I guess the same list would apply there as well to get a working default =
setting.</div><div>This is also how cups is configured in fedora. I don't k=
now about debian</div><div><br></div><div><div>The first patch is a little =
less invasive but ugly with sed</div></div><div><br></div><div><br></div><d=
iv>Should I send a v3 with adjusted commit message? Thought it was quite ob=
vious what the patch does</div></div></div>
--=-IYgf6pwdm86v7y6iQPCs--


