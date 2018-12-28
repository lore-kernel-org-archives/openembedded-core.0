Return-Path: <diego.rondini@kynetics.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5A4A76BDDC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 13:55:57 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id p6so17637890eds.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 05:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=vB/wuMWnLpNU9c+4cs+dPcRjNx1zEb3k9+lTvYMP7aw=;
	b=qyrqA/TpnUbbdh8P3iS2GY6URS5uTF4yDJk/DuFXyDyUZQqUw5ESzNCCmIrU1bcmip
	i6HgR6h2CV2naqmZVm6yKq+ChoTTECuZTTSpZ0BhDcS+6lMjBY0cFgR1HXsPQQAF9wYe
	d7dsVlCQthXndSu9Mz9voVnpcaY7OZmoMhymHoRPl00+kqtThceikuZVxcgoKA7cuaO2
	f5DuAT8Hk/DLtQOwzNxjeq3OzTik5yD265d4E6uS6Ow+e9ThNRWlmVSy/pkFZ43m4Dpp
	F8fBW4cT8Ci6CKtAvfxnwi+FYvShOm1AEYg51MyVbXWDEJq9EdTafUmIXMoi0z2iZe+r
	VueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vB/wuMWnLpNU9c+4cs+dPcRjNx1zEb3k9+lTvYMP7aw=;
	b=bEqi3JrQadckMLOAax4kkHWQQHgMWhKV8k0GYDVHz/NdIWeZgrLoynh6h0WHSq4Qeh
	YgWbANeK4j72h32ukOK5eXIoR4oeFXKjAdwd/wPpQlgUEdZ7Gv1PadaCYfSlBY6W5m5V
	QSL+KxSCMUslpUrNESkoomQCRGtaxa8RWPQtLcfUKMqs+31ESnOqq4uz4h0KkwOByNVB
	T/UrQBeeEW7PdXOtoGe9YtArUiKeOc8FKY8FrfbdyB8caJBgR0wH69JvDgFV0xYmNZyE
	F8hWSXAOP+Wmp9hJnOkvvCAqPVNq+n+/YYlu7uLVHyiTl1jpwqAT7zVYc1w+c/yfP/fq
	p0mA==
X-Gm-Message-State: AA+aEWbQHAjQgtUGqx2Sz3BuzEVHxOVkWyWRXmB7mgVrRiZWxvpJ+u2p
	FVXDY7wjhkCt0NstwIWOIpfcdFKi1DlLhTHqPJ8=
X-Google-Smtp-Source: AFSGD/WIocm2EHFH6pzMTV270t++cjEJ+sxa/Ey/eGsnL+fKpVltkIomH6dZCqA9dLV6kibJQxVGdg==
X-Received: by 2002:aa7:d8d3:: with SMTP id k19mr22415403eds.64.1546005357807; 
	Fri, 28 Dec 2018 05:55:57 -0800 (PST)
Received: from ip-172-31-7-228.eu-west-1.compute.internal
	(ec2-34-250-30-61.eu-west-1.compute.amazonaws.com. [34.250.30.61])
	by smtp.gmail.com with ESMTPSA id
	k26-v6sm6921285ejv.59.2018.12.28.05.55.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Dec 2018 05:55:57 -0800 (PST)
From: Diego Rondini <diego.rondini@kynetics.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2018 13:55:36 +0000
Message-Id: <1546005336-20472-1-git-send-email-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.7.4
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [PATCH] cups: default to unix pam module
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Dec 2018 13:55:57 -0000

When pam PACKAGECONFIG is enabled a cups "pam.d" configuration file is
installed. The default configuration file uses a non-existing "pam_unknown.so",
but a different existing module can be selected by passing the
--with-pam-module parameter. Use the unix pam module when pam is enabled.

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
 meta/recipes-extended/cups/cups.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index c142a4d..5010f08 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -29,7 +29,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi',
                    ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd', d)}"
 PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
-PACKAGECONFIG[pam] = "--enable-pam, --disable-pam, libpam"
+PACKAGECONFIG[pam] = "--enable-pam --with-pam-module=unix, --disable-pam, libpam"
 PACKAGECONFIG[systemd] = "--with-systemd=${systemd_system_unitdir},--without-systemd,systemd"
 PACKAGECONFIG[xinetd] = "--with-xinetd=${sysconfdir}/xinetd.d,--without-xinetd,xinetd"
 
-- 
2.7.4


