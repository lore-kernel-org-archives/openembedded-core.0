Return-Path: <adraszik@digisoft.tv>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id A50BD75F1B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 12:48:54 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so26573301wib.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 05:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=p8hfS0uphLSvcbgjh5/z9TN713xb4olyeAWVQ/dqwIE=;
	b=i3GYJKixwpC59etBBw+aXLd+C5At6Qi6c3jS5g4MqrWx/HfLevcPmhJNsYtOC8d9jo
	OzLYMjPcm3WmRu/ZTUTRJ5zx6Yo92KLylMf0k6DOaoFu43O0sJtM+qCWvfxAV9COExju
	jUVdo/DsMOXkFxcM65wFVFVRf49+0F2YTOen8nFamKhfw4bkTfRDTA1ylKjp5PljTT0U
	JH5P+sPXGKogczeEgEfueYowyi3SD0j6sqawexDIzxD5JJBEiqiPMVB7emYRZy4FOGUo
	KsjnCXTteNAKU2MyxqbJgrH7gzmxUDU1FtjRG9k7wPOlkr60Rp8bnGEIgLt/1igeNmM1
	JdxQ==
X-Gm-Message-State: ALoCoQklcgtMkGHT3TV/FxGjNCABVnzgYoutLUUC1NX8gGwxk+Rxb49x+GiAdw98gmVgLgcMrK/K
X-Received: by 10.194.48.108 with SMTP id k12mr28304238wjn.151.1437742134910; 
	Fri, 24 Jul 2015 05:48:54 -0700 (PDT)
Received: from bri0771.fritz.box (31-187-15-27.dynamic.upc.ie. [31.187.15.27])
	by smtp.gmail.com with ESMTPSA id
	x5sm3374677wif.21.2015.07.24.05.48.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Jul 2015 05:48:54 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@digisoft.tv>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jul 2015 13:48:45 +0100
Message-Id: <1437742128-23260-3-git-send-email-adraszik@digisoft.tv>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1437742128-23260-1-git-send-email-adraszik@digisoft.tv>
References: <1437742128-23260-1-git-send-email-adraszik@digisoft.tv>
MIME-Version: 1.0
Subject: [PATCH 2/5] opkg: read config file from ${sysconfdir} instead of /etc
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
X-List-Received-Date: Fri, 24 Jul 2015 12:48:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <git@andred.net>

Opkg's configure script doesn't use the value from --sysconfdir to determine
the location of the conf file, it uses the value from --with-opkgetcdir
---
 meta/recipes-devtools/opkg/opkg_0.2.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/opkg/opkg_0.2.4.bb b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
index ec0f923..56df920 100644
--- a/meta/recipes-devtools/opkg/opkg_0.2.4.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
@@ -38,6 +38,7 @@ PACKAGECONFIG[sha256] = "--enable-sha256,--disable-sha256"
 PACKAGECONFIG[pathfinder] = "--enable-pathfinder,--disable-pathfinder,pathfinder"
 
 EXTRA_OECONF = "\
+  --with-opkgetcdir=${sysconfdir} \
   --with-opkglibdir=${OPKGLIBDIR} \
 "
 
-- 
2.1.4


