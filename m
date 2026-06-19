Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E252CD98F2
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 17:53:02 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48164.1781891571830081073
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 10:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=T9TcdzZj;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8cc0ef7c306so25855856d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 10:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781891571; x=1782496371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=040sN1lnTm5Bv/0GrQBtGKeGtR+yOwhT7Foq8zvzMbE=;
        b=T9TcdzZjOVhnUQXGNXNW23Bwi0SAuDXpn5tSj1EzyOQtEUfDifML6Omv714bgrJOxX
         lchxPJz+ncDQdWmHqzMQ0Vjmg4HeZjqz6CnxW9LuUPCGe8yS+UNz6y5gM5TkOqc7szA0
         LwPNwyg8UXM1w5xQEKRMyvMOcCSAlxbr10skXOuAEouOECJY1/Byljp419te1bcsAZOP
         qfgoH5WnmPEq7mKGrPJ8yqmeK2PY6ZChmzaZUXxWbs29JrukCfL9LAqjilVAOXdWXVxu
         I/2Av/2cXAULvAnIRvpFlq9imR58Mtho/2G7jgLcSrK5RRYTpiB/M3t0jeHBWRf8Mp5R
         4poA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781891571; x=1782496371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=040sN1lnTm5Bv/0GrQBtGKeGtR+yOwhT7Foq8zvzMbE=;
        b=rsO++5u8CoZC4sFUzJUDoDdHt4ySjbT5siiGarU1907Kg6LJhHOupWQ9gPjCJcvBuE
         GSGc+WxZhukxp+OCSP6YlqEJEkltqru5GrgxRvDA3qq5nJ+heuNiR2Nnvlk8ZrbcJQg1
         91lUOKlHl/SiOy6ajlLL7TeCvxJM1/5IvVx9x/tcnoB2miHXnkP+7rNCAHMJI4untrQi
         oTqRAabqEB3GHxJCQky0drpy5qBZXmc15avHZ5Yo6cHPS8QlHgkFJBI+ewPvrjS8ok0G
         b0JyFXRSiZOSWolSknD0HIHQBXxc9xcn/SKWqCMFWlQJKwVM4t1nuUu9w7rzmK7T3WbA
         Ezjw==
X-Gm-Message-State: AOJu0YzmaDFsy4G4cp6AFL0QT6lMvreUMxcT6hTkTqkz5+wHisWKMRas
	/owfdBsjEkobjmwl+uggX9LDGO4RiUtst4WcMvL5le9zGP4yGYG8iIr5v3X+U+B1
X-Gm-Gg: AfdE7ck4d8iFeua98v3fuovHZitD0nLrXn0LCnoEbTRqLfYr0LmihIfPjy1Kmy4aQjK
	sznT4PKUhS15CODDdqp4uYBm0twJBVwY+1AJHU/bV6q+81z9jEOK+VT2kbzSxCzGcV4Psojsohv
	luFFG1phjSZzTab1qCN8kf1UNCEKSHLTaPWDbBUGcvTfkKXJ7llDsaAaCMOfTvqZws2Rrxf2TA1
	EqmZdhJ4FVCccO02wbBPWO3rjt1BXChYUCQ6o3yd5VEUIRTwEzZtpdxKKJn6qe7MZfLWHUcjz7U
	MDfse2jjIEvLOAEPgSRlx9iaQy25JJwshMg7rJDk/EhZ0JlnB4K/1VJ22ekdi32xb6bQ7D4ICzV
	uVH0NJnZN4t+r7em58ecFNuSPQcYXMI71ram7CtBtRhTfuOnm5xcC6n9jRaMNXrejqTPjdOQtpQ
	Dzx8q9NCnQrRDSWmUc06Q3N3Y1WmH8T7wYJ/T8Zo6DB9KejowGAHu5qdKChGgbA7lGbSUiaFSBi
	Jd/23uz3pEd+5N5yzhYIYHN2gSAEEryncD6WFf+OnwE+wdiEBWzVawDFEwISAisGlINCngL20tx
	Bc241E9DmW8Yz7OhshR7z5I51bYh6+RFOA==
X-Received: by 2002:a05:620a:444d:b0:915:75ba:179e with SMTP id af79cd13be357-9209149748amr673713385a.30.1781891570577;
        Fri, 19 Jun 2026 10:52:50 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df8303ebe1sm5710976d6.49.2026.06.19.10.52.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 10:52:50 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][scarthgap] linux-yocto/6.6: genericarm64 fix configuration audit warning
Date: Fri, 19 Jun 2026 13:52:48 -0400
Message-ID: <20260619175248.2063699-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 17:53:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239182

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: genericarm64/serial: change SERIAL_IMX_CONSOLE to =y
    Date: Fri, 19 Jun 2026 00:54:55 +0200

    With the following upstream commit, this option is no longer
    tristate, so we set it to =y instead:

      commit 3f8b835a63341163da0400befb3c6e8f6d4085da
      Author: Randy Dunlap <rdunlap@infradead.org>
      Date:   Sat Jan 10 15:26:40 2026 -0800

          serial: imx: change SERIAL_IMX_CONSOLE to bool

          [ Upstream commit 79527d86ba91c2d9354832d19fd12b3baa66bd10 ]

          SERIAL_IMX_CONSOLE is a build option for the imx driver (SERIAL_IMX).
          It does not build a separate console driver file, so it can't be built
          as a module since it isn't built at all.

          Change the Kconfig symbol from tristate to bool and update the help
          text accordingly.

          Fixes: 0db4f9b91c86 ("tty: serial: imx: enable imx serial console port as module")
          Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
          Link: https://patch.msgid.link/20260110232643.3533351-2-rdunlap@infradead.org
          Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
          Signed-off-by: Sasha Levin <sashal@kernel.org>

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
    (cherry picked from commit 465cb5bcefd72f429e0b3ad6ab5b3fcff5b390fc)
    Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Stack this on top of all the previous scarthgap linux-yocto patches
and the warnings will be sorted.

Bruce

 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index c7f8b73fa9..67fb5141ce 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "422bdbd919836dc6565f5bbeb5b662b9c52dc038"
-SRCREV_meta ?= "113d5637ef24d6ca9e43d64dec47efa3f7548c89"
+SRCREV_meta ?= "4a6f16d14b76e28ab7615c88e2fbdf95ee15fc98"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 151d63c8a2..7b4f0430a6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "597d6818e83dc368f871fccf981a2a54a93196d0"
-SRCREV_meta ?= "113d5637ef24d6ca9e43d64dec47efa3f7548c89"
+SRCREV_meta ?= "4a6f16d14b76e28ab7615c88e2fbdf95ee15fc98"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 4288688afe..3261ad6ac3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "a9288bf8eb270b824e3f92ee54df9dcd72a6052f"
 SRCREV_machine:qemux86-64 ?= "a9288bf8eb270b824e3f92ee54df9dcd72a6052f"
 SRCREV_machine:qemumips64 ?= "44180b7d240f83de490ab570bc092afe5d123207"
 SRCREV_machine ?= "a9288bf8eb270b824e3f92ee54df9dcd72a6052f"
-SRCREV_meta ?= "113d5637ef24d6ca9e43d64dec47efa3f7548c89"
+SRCREV_meta ?= "4a6f16d14b76e28ab7615c88e2fbdf95ee15fc98"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0


