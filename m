Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C26ECAAD2
	for <webhook@archiver.kernel.org>; Sun, 28 Aug 2022 13:34:29 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.58961.1661693664993211981
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 06:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19,
 mailfrom: f_l_k@t-online.de)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout06.t-online.de (Postfix) with SMTP id 4FAF3106A0;
	Sun, 28 Aug 2022 15:34:22 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.46.178]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oSIQd-1Ek1FA0; Sun, 28 Aug 2022 15:34:19 +0200
Date: Sun, 28 Aug 2022 15:34:13 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] packagegroup-base.bb: remove wpa_supplicant
 preset from packagegroup-base-wifi
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <11VBHR.QPNRDRTYIU8J1@t-online.de>
In-Reply-To: <aa641d1c-5ac4-ae0d-b495-754ecf0121a1@windriver.com>
References: <20220827050842.5781-1-f_l_k@t-online.de>
	<aa641d1c-5ac4-ae0d-b495-754ecf0121a1@windriver.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-oQ9SqZGdhjoaAmrDEY0T"
X-TOI-EXPURGATEID: 150726::1661693659-01447895-BEB34595/0/0 CLEAN NORMAL
X-TOI-MSGID: cc939d00-443d-433e-90ef-c3e5713279db
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Aug 2022 13:34:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169985

--=-oQ9SqZGdhjoaAmrDEY0T
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Sa, 27. Aug 2022 um 20:24:55 -0400 schrieb Randy MacLeod 
<randy.macleod@windriver.com>:
> It's a little late in the release cycle for this sort of change but
> if we do take it can you add a short list of some of the alternatives

It's not a long list. Choices so far would be wpa_supplicant or iwd.
wpa_supplicant is well known, so I'll write some information about iwd 
that I've collected in the last days.

iwd is a wireless daemon written by intel and supported by all major 
network managers. It can be run in standalone mode and configured with 
'iwctl' from the terminal, and with 'iwgtk' or 'iwdgui' from the gui. 
It can also work as a wpa_supplicant drop-in replacement for 
network-manager, connman or systemd-networkd.
iwd makes heavy use of the kernel api, so it is not portable but does 
not need additional external libraries like openssl. Instead, make sure 
that the following options are enabled in the kernel:

CONFIG_CRYPTO_USER_API_SKCIPHER
CONFIG_CRYPTO_USER_API_HASH
CONFIG_CRYPTO_HMAC
CONFIG_CRYPTO_CMAC
CONFIG_CRYPTO_MD4
CONFIG_CRYPTO_MD5
CONFIG_CRYPTO_SHA256
CONFIG_CRYPTO_SHA512
CONFIG_CRYPTO_AES
CONFIG_CRYPTO_ECB
CONFIG_CRYPTO_DES
CONFIG_CRYPTO_CBC

optional for wps support would also be needed:
CONFIG_KEY_DH_OPERATIONS

In standalone mode iwd can use either systemd-resolved or resolvconf as 
dns manager. Additionally, dbus communication must be configured. In 
the default configuration, iwd expects the user to be a member of 
either the 'netdev' or 'wheel' group.

As a backend for the network managers, I have only tested iwd with 
connman, which works smoothly and without additional configuration as 
soon as you make sure that wpa_supplicant is not installed. (connman 
will  look for wpa_supplicant on startup and will bring it up if it was 
found)

but you only want the information from the first sentence in the commit 
message, right ?


--=-oQ9SqZGdhjoaAmrDEY0T
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">Am Sa, 27. Aug 2022 um 20:24:55 -0400 s=
chrieb Randy MacLeod &lt;randy.macleod@windriver.com&gt;:<br><blockquote ty=
pe=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">I=
t's a little late in the release cycle for this sort of change but
if we do take it can you add a short list of some of the alternatives</div>=
</blockquote><div><br></div><div><div>It's not a long list. Choices so far =
would be wpa_supplicant or iwd.</div><div>wpa_supplicant is well known, so =
I'll write some information about iwd that I've collected in the last days.=
&nbsp;</div><div><br></div><div>iwd is a wireless daemon written by intel a=
nd supported by all major network managers. It can be run in standalone mod=
e and configured with 'iwctl' from the terminal, and with 'iwgtk' or 'iwdgu=
i' from the gui. It can also work as a wpa_supplicant drop-in replacement f=
or network-manager, connman or systemd-networkd.</div><div>iwd makes heavy =
use of the kernel api, so it is not portable but does not need additional e=
xternal libraries like openssl. Instead, make sure that the following optio=
ns are enabled in the kernel:</div><div><br></div><div>CONFIG_CRYPTO_USER_A=
PI_SKCIPHER</div><div>CONFIG_CRYPTO_USER_API_HASH</div><div>CONFIG_CRYPTO_H=
MAC</div><div>CONFIG_CRYPTO_CMAC</div><div>CONFIG_CRYPTO_MD4</div><div>CONF=
IG_CRYPTO_MD5</div><div>CONFIG_CRYPTO_SHA256</div><div>CONFIG_CRYPTO_SHA512=
</div><div>CONFIG_CRYPTO_AES</div><div>CONFIG_CRYPTO_ECB</div><div>CONFIG_C=
RYPTO_DES</div><div>CONFIG_CRYPTO_CBC</div><div><br></div><div>optional for=
 wps support would also be needed:</div><div>CONFIG_KEY_DH_OPERATIONS</div>=
<div><br></div><div>In standalone mode iwd can use either systemd-resolved =
or resolvconf as dns manager. Additionally, dbus communication must be conf=
igured. In the default configuration, iwd expects the user to be a member o=
f either the 'netdev' or 'wheel' group.</div><div><br></div><div>As a backe=
nd for the network managers, I have only tested iwd with connman, which wor=
ks smoothly and without additional configuration as soon as you make sure t=
hat wpa_supplicant is not installed. (connman will &nbsp;look for wpa_suppl=
icant on startup and will bring it up if it was found)</div><div><br></div>=
<div>but you only want the information from the first sentence in the commi=
t message, right ?</div></div></div>
--=-oQ9SqZGdhjoaAmrDEY0T--


