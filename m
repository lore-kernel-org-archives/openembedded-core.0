Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
	[209.85.222.180])
	by mail.openembedded.org (Postfix) with ESMTP id 19C8B7F369
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 16:39:23 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id p13so8668598qkg.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 09:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version:organization
	:content-transfer-encoding;
	bh=QxaBPw9/3ZGmdzgXjPfnOXWmJWB1XN5vBziNyjpk6QQ=;
	b=NAZdrO50a8J48V16hzE7gq0Wkpecy48HgsU+6elSKjhfFD/P0aT6f3YqcA1TddHfjO
	pxI3hIrt0haHjC/q6TX4qE3glMyG0wAyErj+lCWgEQxyOr2XyzUybtSZkt8Q5POoGpeh
	h82lHX7xea08yJAjbjI2EZXYYE+yzMaEmaF873/M0xyvRwyVbVZjWqjEW+ZRBhIkjKOo
	ClPjaFe05r5QnR21/b6uGaDy8eZQJzHDXKJvkMs4zguDZg9IRPLxol/Z2cpE3RcPhncb
	MP6VL6L2dnzmg9jqux+xQawEkRBdUcj8hQVi20rHRL2yR3j0Y43a7ijjpOb9rydO4Faq
	l/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=QxaBPw9/3ZGmdzgXjPfnOXWmJWB1XN5vBziNyjpk6QQ=;
	b=Gzv13XsGtyodDIUDJ+pJic/Z8Z3vgUniuY6A5Fj/mY+rY4GGjNLSFBGg5hQzHUPOJC
	N0DuaZnnrZsJ1xI2+rJRoJx3pCOerv/hDUBMi5GKY4ZS1OrXRLj3AvVzTzMDM+BTc9rZ
	oYbWV57bxrFlLCG6OEpgeJ5PnYJn7Mvq7f14qOyQe3fo1qNnu2JwlgSgEaD9OJIzHSFV
	JvY0HwipZTNIKdk61bgJUCAWxIyPJSQtsF2T6VD72dl0m+mWR3OnuFdvZos4bpM5x4T1
	5chshuUhlAvwrV+8AMW925wKC8zYcXWbZOlB+cf8PEdw6Z5Afo47anxa++O2XgWN+yY1
	Uxuw==
X-Gm-Message-State: APjAAAWvYrUApvbl4r3zeAKBd5RUsr8GVGPkducds79ixNNcvZNpEOq+
	MRdAd5J8iJUtXWJjE7EsBaRnKc5w9k9wMw==
X-Google-Smtp-Source: APXvYqzUIUm//UFK+bPoyqw4kyChCpJLMAZfIpv0xvN3zq0fyIr8va2EcgHF5dcRWfDmJ395dxZSpQ==
X-Received: by 2002:a37:a013:: with SMTP id j19mr5031252qke.401.1566578364807; 
	Fri, 23 Aug 2019 09:39:24 -0700 (PDT)
Received: from centrium.lab.ossystems ([181.220.83.67])
	by smtp.gmail.com with ESMTPSA id 6sm1722633qkp.82.2019.08.23.09.39.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 23 Aug 2019 09:39:24 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 13:39:06 -0300
Message-Id: <20190823163906.20144-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: "Bedel, Alban" <alban.bedel@aerq.com>
Subject: [warrior][PATCH] rng-tools: start rngd early in the boot process again
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
X-List-Received-Date: Fri, 23 Aug 2019 16:39:24 -0000
Content-Transfer-Encoding: 8bit

From: "Bedel, Alban" <alban.bedel@aerq.com>

It do make sense to start rngd early in the boot process because
otherwise we would need to track every service that might need entropy
and explicitly configure it to start after rngd.

When used with systemd rngd blocked the shutdown process because it
simply missed the proper unit configuration. As the systemd
documentation explains, when using DefaultDependencies=no one also
have to explicitly configure the unit to properly stop at some point.
This is normaly achieved by having Before=shutdown.target and
Conflicts=shutdown.target set for the unit.

To have rngd started early again we reverte the changes done to
rngd.service in commit edf7606822 (rng-tools: fix rngd blocks system
shutdown). To have it properly stopped on shutdown we also add
Before=shutdown.target and Conflicts=shutdown.target.

Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a74e7df33e2c8ab2152e3217c0a5df3f65971713)
---
 meta/recipes-support/rng-tools/rng-tools/rngd.service | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/recipes-support/rng-tools/rng-tools/rngd.service
index f0355db14fc..5c8253b5fba 100644
--- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
+++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
@@ -2,7 +2,8 @@
 Description=Hardware RNG Entropy Gatherer Daemon
 DefaultDependencies=no
 After=systemd-udev-settle.service
-Before=sysinit.target
+Before=sysinit.target shutdown.target
+Conflicts=shutdown.target
 
 [Service]
 ExecStart=@SBINDIR@/rngd -f -r /dev/hwrng
-- 
2.20.1


