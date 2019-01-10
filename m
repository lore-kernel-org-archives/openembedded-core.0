Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id B22527C091
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 13:53:07 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j2so11513959wrw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 05:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GRjDnK72prMwEAO2GiVXCH5rZjmu93WeI2wzkJN1LrY=;
	b=bMO4IkzGVLzOC9cA2dE8KurG26LK9KT9eT3Z3Z4TZqjhF8zGfDPRVDAm2outcFNV35
	pvQuPkbOLn06mblZoExzhXrlSlRiWIp7deXoHBF8AUu5se9rXaAxy749FmkzneJSMjiQ
	SYcsoH28RxPYGBx6MfRE8jxYxgUwYsZ2FZnV+oeX8qN9dYA/sGVN+YlP/P+BlZfCYocc
	Kq5umlgO+Sbpf3W76SB7DiVYoUZH+vhL7H+ojeyyKCAcFyQsLkU2rfOOMv1y9iRSYSDp
	1J8r8L1bjGBAE8Se0CwCGixxKAxswshR+WlPLTOgVQWm4XcVmtKO4k1mO/7fTQaD/Z1a
	x7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GRjDnK72prMwEAO2GiVXCH5rZjmu93WeI2wzkJN1LrY=;
	b=d5TMZ/iWJEFscWtyb5DOcgkXqoGHa14xybos5EpVpZzazXo+TLHLgGoLV1Ou0IGs4M
	T1ddCwLI9oTe3DTe03hhpuwXhj5j6HPzIc/0kvG26evvo1vy2bG+rOysZyU23y7LGctv
	OaVfjDal0ziFFN0+97oSx1qsyvYzyvlEBwg8diF/L98CH0zkA8r/Jz2grtIlVnErCx+F
	VaMD0L8YgryPaNOC25oSO7+nUMkVED5k3JBbPjJ6xe7cWpipipNrbdt+BtMW/6NU3fBE
	CP7MDdjZWhKM2f2QT4FM7NK7ChzqKegyffXZmWyAwAaTeVQVksN/goKtY6Kmz8d2mQcY
	L+LQ==
X-Gm-Message-State: AJcUukcdjmsSGiKy3DvhY1ocNeV/U/EiAFrw/i4DpgdOPpQooD9/o+Ad
	mnytkFk8snNL3xOOYFwP3s3F8DnqMPU=
X-Google-Smtp-Source: ALg8bN4tGLqWfG1KP/UoeexDDnQy70nBTlVO4rZer0N7CN63yCg5yjS+ZWd/o5C3wZI4hId6TKLPlQ==
X-Received: by 2002:adf:de91:: with SMTP id w17mr9981218wrl.320.1547128388186; 
	Thu, 10 Jan 2019 05:53:08 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id q9sm78248587wrp.0.2019.01.10.05.53.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Jan 2019 05:53:07 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Jan 2019 13:53:01 +0000
Message-Id: <20190110135301.1888-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190110135301.1888-1-ross.burton@intel.com>
References: <20190110135301.1888-1-ross.burton@intel.com>
Subject: [PATCH 5/5] pulseaudio: switch configuration module from GConf to GSettings
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
X-List-Received-Date: Thu, 10 Jan 2019 13:53:08 -0000

The only user of the configuration module is paprefs, which as of 1.0 uses GSettings not GConf.

Also GConf is unmaintained, so one less recipe using it is good.

(From OE-Core rev: 4825ae198aedcd09c60559cb6233c0f8b6ecce32)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 9093010c8d9..16b5e6b5697 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -101,7 +101,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ
                    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', '3g', 'ofono', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd x11', d)} \
-                   dbus gconf \
+                   dbus gsettings \
                    "
 
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
-- 
2.11.0


