Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6086077F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 19:48:17 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t23so2010928wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 11:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GP6NHCkB/ym4R4NWLE6xQpEVl5PrEZ46LGnn6dqLDyc=;
	b=bwUI67GxKxqnSfciNk6fjsto+jPbm7ZoqdSFUBDSwM8Mw4M2ZvsYZQcxRGiSgnwhM6
	SXw1Y411lvXm600jHiWvJ2ITzv9jmV150ffT2xrgvA7UHGZzn8wdOdlQ4zKz4fitly1L
	vNCPOIyY4a02KbZrGe5oSmtyRvM9Cbkrm3HD2PyUjYvUmbazvsWbauOt/6ndFVRyxmB/
	s+Oqym0D5z8ayi6Vxa60+WyE+MLYQSj4mZlgPDuuxMT10avcpGAYUCnjglXcVtUAKV8C
	RTLi/hJn7D0+ByJ14twhlA23PwVZksSTLHBvZseGATDe4uEgluW3E38dwiohtvS0XrEH
	nJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GP6NHCkB/ym4R4NWLE6xQpEVl5PrEZ46LGnn6dqLDyc=;
	b=K4rRlI1Kr/afcIY/jVMZZfQ/ntA+Bi5mtucJ5Vs3COJpS4Sn+3NmxcRkbE3ZNzxPD2
	nli08CsEgXXdZ72YhAA7PbsrcMr1oclnqlVQr+M/pcMFzH6ugH5LC7dHrpW7+XwLZWIw
	BKYEL6IbsZjLMB+2ZX2VW3t9cw/IIdA5HPY2/XHVzHi45bwYX2dPLQ9Z9OnoM/ODSYPR
	meKzyMKfsBIlcrKoyig43flMVxDnyDMHjw1c31YRH4P2n3HO8VmZS8b/1P6K4wWBv99G
	qO8Sp5VRFtRJw2OMTAJ1fo86dC082Vuf+u4Rx34bz9kmPO7MdRuCJZGmH4q21c9Xc86h
	zaxw==
X-Gm-Message-State: APjAAAXBC9+VeiBJiT8srhFjA1dYz/WjJEjFQi8aL6NWzgrDeEVGnrao
	FOj8Yy28HEaPF+i2EJRWxSM2rS2K
X-Google-Smtp-Source: APXvYqwoat2R8q/zMoaY++/nUwqaan+RdOqJyft5v8vE3hBQFRRCaiyf3IkwaG+shOoXqMPQ//cdJQ==
X-Received: by 2002:a7b:c958:: with SMTP id i24mr11878127wml.180.1582141697538;
	Wed, 19 Feb 2020 11:48:17 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	y185sm1204049wmg.2.2020.02.19.11.48.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 11:48:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 20:47:41 +0100
Message-Id: <20200219194752.7967-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219194752.7967-1-alex.kanavin@gmail.com>
References: <20200219194752.7967-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/13] webkitgtk: x11 and wayland are not mutually exclusive
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
X-List-Received-Date: Wed, 19 Feb 2020 19:48:17 -0000
Content-Transfer-Encoding: 8bit

Also enabling wayland if x11 is not enabled is not necessarily
the correct decision.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.26.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
index 3eb27a1550..153bc8db11 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
@@ -38,7 +38,7 @@ DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
 	   gettext-native glib-2.0 glib-2.0-native libtasn1 \
           "
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'wayland' ,d)} \
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'webgl opengl', '' ,d)} \
                    enchant \
                    libsecret \
-- 
2.25.0


