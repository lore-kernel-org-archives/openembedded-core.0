Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id EA9FB6011A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 13:00:41 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id u46so25762307wrc.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 06:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=f8iXbbB9CDkNiinaPRtBmgmCOmpoZhwwJ0F6WBv4Jtw=;
	b=OLk4pP72LUh8zX9LytGQBuYK620Sq99F/m12hvRS2dncgfbc5wJoPO31Ph3xcM/02R
	a0+dXX5tyanMBcIdK5x7BR2zkV+AVcrNRUBwoILE5w+/8kBljth48FJ2Dv4nta5pfTt9
	fFkFitw9UJOw/Ar0oeZ6QmKgCx82843oay+5yZQz39yseq4DMp3dUpp1dHEthvChhive
	I55f2TQZ76dvDVb7ErQsAGa52RXeNBbkkymPSleNEdsZuPGFBZjd13q1kpEucJMkqbQL
	1b+y2qWgsSCXsG40byl10MSY5rdtK3HlJRiAuIUCg28N7jX95qj4u+8Lt0/Db/y1KaV3
	nxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=f8iXbbB9CDkNiinaPRtBmgmCOmpoZhwwJ0F6WBv4Jtw=;
	b=FuyysWbOKT4FWWAwh1fz5vCFZiteg8gfsWpnEW75AThYltrTwz2QbBJ16FvgyVhKk/
	hyhRack4oCcwHofyVmkuxJhD1x/zUMTzToyJE5ZNlmqXeJvGX+ii7G4K8dCdpE2Do7RG
	B7Dq8kkukBIywK98SQTrt4WJNc2NUZRnm7GnXmaZgJzQLp66oMlzDBY5NuU8SrTEb7SA
	0OL4nrhfUDTVax42Ab7DzOhGZgxFtWWZjxzb+wUXVQWFE9V4ntxT8bcqA+P+Vn9LF8W6
	3ZpLGA+Fi8ywmzbBybEP0pY1vUhag+CQYKmAHc3B7Kg0x7FVAd+5xkf+7mCqqMjj08GL
	Jimw==
X-Gm-Message-State: ALQs6tAH1RGCvxigf1CEA42NSUEt2tshuKNrrf05SD6+V81q7yeXJEeA
	WG1VT13xQ8AsLs24AaI9PkTz4Dz+
X-Google-Smtp-Source: AIpwx4+kHRD7W8PzFnj+MJfW+ZimRZ8ZAciKdi/TNwOeRolHaSJmjmfn/bFkniJMBuMqvylzQXyD6Q==
X-Received: by 10.80.143.196 with SMTP id y62mr33017184edy.275.1523883642466; 
	Mon, 16 Apr 2018 06:00:42 -0700 (PDT)
Received: from localhost.localdomain ([185.47.135.167])
	by smtp.gmail.com with ESMTPSA id o6sm3422518edj.31.2018.04.16.06.00.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Apr 2018 06:00:41 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
X-Google-Original-From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Apr 2018 15:00:20 +0200
Message-Id: <20180416130021.4428-3-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20180416130021.4428-1-koen.kooi@linaro.org>
References: <20180416130021.4428-1-koen.kooi@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH v2 3/4] bind: fix openSSL detection when using multiarch
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
X-List-Received-Date: Mon, 16 Apr 2018 13:00:42 -0000

In multiarch /usr/include and /usr/lib/<tuple/ are not on the same level anymore. This change will pass a correct includedir, but a wrong libdir, but the linker picks it up anyway.

Tested on multiarch and regular build.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-connectivity/bind/bind_9.10.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.10.6.bb b/meta/recipes-connectivity/bind/bind_9.10.6.bb
index 8b8835b..20c8d7b 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.6.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.6.bb
@@ -35,7 +35,7 @@ EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --enable-threads \
                  --disable-devpoll --enable-epoll --with-gost=no \
                  --with-gssapi=no --with-ecdsa=yes \
                  --sysconfdir=${sysconfdir}/bind \
-                 --with-openssl=${STAGING_LIBDIR}/.. \
+                 --with-openssl=${STAGING_DIR_HOST}${prefix} \
                "
 
 inherit autotools update-rc.d systemd useradd pkgconfig python3-dir
-- 
2.9.5


