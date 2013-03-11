Received: from mail-da0-f42.google.com ([209.85.210.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UF7fP-00007l-H2
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 19:41:54 +0100
Received: by mail-da0-f42.google.com with SMTP id n15so175547dad.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 11:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=1AyFpX44/eUXNOqJcqErvVUdiVMHw1m14swBtf/jr30=;
	b=pxMkvX1q+Rcl5lHE3qsYWFCymwoUhj815aFTpYVSpTgItJAC8XRx/mlDMHSkCnBZuS
	LvNwB9BBGh7l+3c2x6+FIQqSym+HxRPXZUOGxhzdlc8xoawtw5lclkx1oyc4OPAtgYe+
	jyBC0AWXkh7BL5ugiyUrTFtr3FFnOvLcAvNXbstS+/HADC5kuLiqmx+r5RxBqXUMLr67
	ZNAuZfj8USR/F9Du6dfYFLE2cOubuhupnK/ZJYSVaeVEDUikHK9vCidKBH5HbuVHVIXF
	wok8D/BkGmXK3MDffUIJYB27hEHirqXYa6RLNie5oxrkWijLOqwEbCXpuksJJXvSsVEE
	n0Cg==
X-Received: by 10.68.134.201 with SMTP id pm9mr22532280pbb.182.1363026308120; 
	Mon, 11 Mar 2013 11:25:08 -0700 (PDT)
Received: from flashheart.burtonini.com (or-67-237-97-32.sta.embarqhsd.net.
	[67.237.97.32])
	by mx.google.com with ESMTPS id hu2sm21402014pbc.38.2013.03.11.11.25.06
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 11:25:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 11:24:44 -0700
Message-Id: <971f90d91cd5f1e576e54137895917c23104a4a5.1363025917.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363025917.git.ross.burton@intel.com>
References: <cover.1363025917.git.ross.burton@intel.com>
In-Reply-To: <cover.1363025917.git.ross.burton@intel.com>
References: <cover.1363025917.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkCRM4r4vclOMc+R+YP1uwx5LXaQia36EJwoGvZl3raomFIm7pdseCtUPe9ihawlteSOV/i
Subject: [PATCH 01/12] connman: explicitly disable systemd if we don't want it enabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 18:42:07 -0000

Otherwise configure will use pkg-config and may find systemd, even though we
don't want it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 04b21f7..96ebc55 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -40,7 +40,7 @@ EXTRA_OECONF += "\
     --disable-polkit \
     --enable-client \
     --enable-fake \
-    ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '--with-systemdunitdir=', d)} \
 "
 
 INITSCRIPT_NAME = "connman"
-- 
1.7.10.4



