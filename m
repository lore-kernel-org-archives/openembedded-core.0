Return-Path: <jonathan.richardson@broadcom.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 51953601E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 20:32:02 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y11so25563352wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 12:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=qYMd1rgmwWxj7RD5YCPqH/I3nStF/46FBAScStur6Ks=;
	b=eClyRw0XvgDh+Xi5uUSczquRoHphIo/FGK0R/BzXb1Boc3u9XYKnyiTzaje/hbvp0Q
	UuUr3yGWh03Uwu1RU+KOTmzynJqVtHh9jDKHhjG3ltM26+0ltjRtRyKatYbJOw+ysQDs
	Fysr5gte76PW/JHsaEnPg3ECr7qNNK1chp8/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qYMd1rgmwWxj7RD5YCPqH/I3nStF/46FBAScStur6Ks=;
	b=rQt9PrcbagMHmu50OBWAAGsaJ/n6a9TXkH/QLBGXDJYL7BK93s8eEDDld+57Zh62pY
	3H6q2pkUOFAC8/RYzELUBPG/N0b38jF2MLm1vfx7o6sE3bbDy/fgptia9Gl3KOdau0YG
	s5sLsMS/7UTKAPsntbWsLqMS5nu1WoKZySI95wT4kRWcN7RMFqeWTTlk0EObuTfvnTSq
	6BbU+CWUP+tkgDgjONl9BvBxkNOlnKHXkIiYugXvXbF2HYjr4z+X0Ycl4kN1wtClC1ZO
	0Ehsxr2ODuGQrnlWngYFOFe9+Wsclxmh5hwhsuyBTm0AxJiI3TQxFRXVh8oVTue2UHAP
	8VaQ==
X-Gm-Message-State: APjAAAXsVzSm2Sb63byjUMxkD6IP91fAKVUeJTiZ8S7Hdac1PwIiDzOq
	ybQkZW62tr2hAx3jJJ7HU0qRi0zAlkqhBt7lrTkGas8mBM/QdYF7NL7HdYdW9dJeTL/19tVDhv6
	InesH7Niqgjzc+2qgriC2xxJK+xrIwbUXM4CbSp8gIcpN1E30v0vnUNFaEGFPlAdv5TytHfvBb7
	ZPm1jNlsRtwJuSDhD8xs6TrlksEP9G3Q==
X-Google-Smtp-Source: APXvYqw3NAHgJhvzBJC01B2MDoesL3laiwjEsL5WBE2qHQuH7yHJFIOtrhZsYUBP/hIwGExZ6Oc1CA==
X-Received: by 2002:adf:a39a:: with SMTP id l26mr30640091wrb.211.1582057922615;
	Tue, 18 Feb 2020 12:32:02 -0800 (PST)
Received: from lbrmn-lnxub108.ric.broadcom.com ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	x10sm7178652wrv.60.2020.02.18.12.32.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 12:32:02 -0800 (PST)
From: Jonathan Richardson <jonathan.richardson@broadcom.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Feb 2020 12:31:36 -0800
Message-Id: <20200218203136.8314-1-jonathan.richardson@broadcom.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe] [PATCH 1/1] fio: remove disabling of compiler optimizations
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
X-List-Received-Date: Tue, 18 Feb 2020 20:32:03 -0000

Disabling compiler optimizations affects fio performance by 25-30% so
remove this from EXTRA_OECONF. Disabling of optimizations should be
machine specific if there are bugs in the code instead of the default.

Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
---
 meta-oe/recipes-benchmark/fio/fio_3.18.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.18.bb b/meta-oe/recipes-benchmark/fio/fio_3.18.bb
index b6484290f..2c461b8c5 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.18.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.18.bb
@@ -33,7 +33,6 @@ S = "${WORKDIR}/git"
 DISABLE_STATIC = ""
 
 EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}'"
-EXTRA_OECONF = "--disable-optimizations"
 
 do_configure() {
     ./configure ${EXTRA_OECONF}
-- 
2.17.1


