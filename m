Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id A86F560ADE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 16:53:07 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id m7so1329678pjs.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 08:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0BtAyIwtJZrWDU2lnKrCKJdgTb3wCh2aSDw6nrLeLNc=;
	b=lvrE8QZFS+1xZbJssXHd9MDSqXJaUqBVqSAAHdJ0frsouj5iSPTTMm9VmkUDgJAqEs
	fU4G9xYyJHHHDt+Qd80PfPyJ8XWav5l/aAi1hWVPGvcug/OEq7XqQRDPk2fnPa7ZyoS8
	1K2jcKm9ONgyV7EeFkk5FmCA1Zx2FLrosRYjQb/2+5bw8JC0EugaA/BE5CcMi6CVD6Wb
	Bchje9M4/6T3/qnnFGdh8p+oCJbAdjrwA6yp4p8m1mSYu6YOQ2wRb1cKOIN957pdbuSW
	inYzj7YKFuxcUUasBT7BYcCv5O21bGS2X73AlYN3yeJiYNNlvA9XpzcUHwSnPWpR1wuK
	PuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0BtAyIwtJZrWDU2lnKrCKJdgTb3wCh2aSDw6nrLeLNc=;
	b=NRCLjUa7m0dkXcXc8cvuLk5QNBMa/b2hLzKh8THOzW1+wO6uKtBE9lYackrY4RqYuq
	k9uVgZfwHIcs3ndzvBXBACnOIoNTXQgWKbviIhhTJkAJr+0d8/2ZAnTS/+wGWIXrrlZt
	zY6Zk+JGJsLsJP8TOYRNAscQaz990ADqdjFtesGloGAx9LoGbW+3nKxRu3YLg+Rm7E4P
	sUBW0O2FQm/GtUzhjX9Ll8D5uOom8/UEINf+HJQy+xyWaY6mzMFzasLr05PS1jRNoRkk
	KJ1mDpO94RxqdSjYdJeCKyjTDZRDhx0f+Ph7m9FhyXX+JlRTfZ8ojQ6TPe8WC3Ox9gvF
	z5mQ==
X-Gm-Message-State: APjAAAXa1h0YEtg+L3VivJdn9lQ5k3r/z80X6nAlOFFv3+5yTbmhBJBq
	SMJ+rKeiN2157Q5cJdU4XngFCGTjK2w=
X-Google-Smtp-Source: APXvYqy/bACJdjjxpq27RcI9lahHhlWFt0+jd3BJSpolINDoqGkLO3ML/DIQ6hQst5ZlUQ8+zEH4cA==
X-Received: by 2002:a17:90a:950b:: with SMTP id
	t11mr4605044pjo.79.1582217588231; 
	Thu, 20 Feb 2020 08:53:08 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id f3sm4392384pga.38.2020.02.20.08.53.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 08:53:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2020 08:53:17 -0800
Message-Id: <20200220165318.3677793-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH 1/2] libsolv: Enable rpm packageconfig by default only if rpm O_P_M is enabled
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
X-List-Received-Date: Thu, 20 Feb 2020 16:53:07 -0000
Content-Transfer-Encoding: 8bit

opkg also depends on libsolv and can needlessly pull in rpm even if
the O_P_M does not desire to use rpm

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/libsolv/libsolv_0.7.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.10.bb b/meta/recipes-extended/libsolv/libsolv_0.7.10.bb
index 502f4e0e85..265a27c00d 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.10.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.10.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
-PACKAGECONFIG ??= "rpm"
+PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGE_CLASSES','package_rpm','rpm','',d)}"
 PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON,,rpm"
 
 EXTRA_OECMAKE = "-DMULTI_SEMANTICS=ON -DENABLE_COMPLEX_DEPS=ON"
-- 
2.25.1


