Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930F2C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 11:44:43 +0000 (UTC)
Received: from forward100o.mail.yandex.net (forward100o.mail.yandex.net
 [37.140.190.180])
 by mx.groups.io with SMTP id smtpd.web09.6223.1644579878565203974
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 03:44:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@zhukoff.net
 header.s=mail header.b=wymeziXp;
 spf=pass (domain: zhukoff.net, ip: 37.140.190.180,
 mailfrom: pavel@zhukoff.net)
Received: from sas1-49a2f795d8eb.qloud-c.yandex.net
 (sas1-49a2f795d8eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:c505:0:640:49a2:f795])
	by forward100o.mail.yandex.net (Yandex) with ESMTP id 035B052A9B43;
	Fri, 11 Feb 2022 14:44:35 +0300 (MSK)
Received: from sas1-7a2c1d25dbfc.qloud-c.yandex.net
 (sas1-7a2c1d25dbfc.qloud-c.yandex.net [2a02:6b8:c08:c9f:0:640:7a2c:1d25])
	by sas1-49a2f795d8eb.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 UFERUJnKng-iYceDtnD;
	Fri, 11 Feb 2022 14:44:34 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; s=mail;
 t=1644579874;
	bh=e3FT+gw/6SSnf80C/4gOQ71Hnb+fa9pLayeRht45hkE=;
	h=Date:Subject:To:From:Message-Id:Cc;
	b=wymeziXpIPcHh9lgDhgMfY8pHlbSfeVtRSH3wfdkSGCBvmGwu4F7fTAzNIvt44wfj
	 uHa4LntFL+5aaojWedgvYTnZyHmNfSz8btAI3G/oPQYd7aevb8bnzEuwkjsJ12Nq6t
	 bC6KHl8EpKUXhY8krgKaYmkvrNAxXFcmNeGshk4w=
Authentication-Results: sas1-49a2f795d8eb.qloud-c.yandex.net;
 dkim=pass header.i=@zhukoff.net
Received: by sas1-7a2c1d25dbfc.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id nobabdEP9N-iXHej3tS;
	Fri, 11 Feb 2022 14:44:33 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: pavel@zhukoff.net,
	Pavel Zhukov <pavel.zhukov@huawei.com>
Subject: [PATCH] sanity.bb: Change CONNECTIVITY_CHECK_URIS to YP
Date: Fri, 11 Feb 2022 12:44:21 +0100
Message-Id: <20220211114420.19240-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 11:44:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161645

Do not rely on example.com . Having yoctoproject.org down may be much
more easier to detect/investigate as far as it hosts mirrors.

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 meta/classes/sanity.bbclass                     | 3 ++-
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index f288b4c84c..ffabf8d9f9 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -353,7 +353,8 @@ def check_connectivity(d):
                 msg +=3D "    Please ensure your host's network is confi=
gured correctly.\n"
                 msg +=3D "    If your ISP or network is blocking the abo=
ve URL,\n"
                 msg +=3D "    try with another domain name, for example =
by setting:\n"
-                msg +=3D "    CONNECTIVITY_CHECK_URIS =3D \"https://www.=
yoctoproject.org/\""
+                msg +=3D "    CONNECTIVITY_CHECK_URIS =3D \"https://exam=
ple.com/\" or "
+                msg +=3D "    another domain name which works for you "
                 msg +=3D "    You could also set BB_NO_NETWORK =3D \"1\"=
 to disable network\n"
                 msg +=3D "    access if all required sources are on loca=
l disk.\n"
             retval =3D msg
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/=
distro/include/default-distrovars.inc
index fb0f1097da..8f7e12e8fe 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -54,4 +54,4 @@ KERNEL_IMAGETYPES ??=3D "${KERNEL_IMAGETYPE}"
 # fetch from the network (and warn you if not). To disable the test set
 # the variable to be empty.
 # Git example url: git://git.yoctoproject.org/yocto-firewall-test;protoc=
ol=3Dgit;rev=3Dmaster;branch=3Dmaster
-CONNECTIVITY_CHECK_URIS ?=3D "https://www.example.com/"
+CONNECTIVITY_CHECK_URIS ?=3D "https://www.yoctoproject.org/"
--=20
2.34.1


