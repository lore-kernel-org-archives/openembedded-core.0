Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3D8087F024
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 16:21:16 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id h6so21518059iom.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 09:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zhQceYPwVGFDnmKn5qGlVDEAegorXBQC5sLY7xyHmaA=;
	b=C5EUcJl0EGJ2FuDGnz7OKIqMlACeVbIrEzOz6VSN8arYDsslTw6bej0hqRzulLIOMQ
	c31IR7fFVdHlsUys6kHNHZlrVzK/EyjKJ/Hu5HqCXuGC2+/8tzR3YMf2kO7TQxD6d3b3
	tXECV7UQuKk4jPzF6sdvpWOrHinhqeIepGCtO6YkPTFFSwYx0Ocop4e/F50uAdOn0vps
	O3u+xzU+sv1p6gxDZxFjRf9qiNZATvmhxkXlS8AD1lZ7lTq4kZElkii1adjynE1yEQTS
	Qc168zBwWSKTRNBjCMG5Pe1pFSptzSY3Jiy4Vc0mo6pKHcT44OETi+VxdRnOg7U6q7rb
	6PXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zhQceYPwVGFDnmKn5qGlVDEAegorXBQC5sLY7xyHmaA=;
	b=UaGtKhnBQtnyZW/UgrO1mjRO47qR/JKj5qErfVy7UnE9uCjLtT48PV8KqdH3rW2yC5
	Mcc/ToCfZXRKl3Zd4gzCT0NYcJCvV6P8mkSKBfbtHrwdPGBk95y3wr6AmhFm6B7RWWRa
	m+r7TOXnT20RWSpCzEl4obOW4OBY4cz1zDen3/nffDvbGITphiqlkAAGHJmrdMoE+ES3
	c5v1lsKYnMkQ60a386DQs1QpvwsbXgH/Yws2PHZ3BkHQKOKT1TM471w07CD3aPfsynVA
	lAKK2B4/N8XTSpLRdMkM05JweZepqq57mZk3oIMs54dVC/x/r0WNOxVxBlqcPkWQGQeb
	TZbA==
X-Gm-Message-State: APjAAAVhKxgaJxYqeBnP2MLiYvBDn8UwfY353+2UFK7H0tiIS2agXMNQ
	YEuwF+97agw4mBBcaBCJmvETFBx+
X-Google-Smtp-Source: APXvYqw+9aZkbmSyDCOaqsckenX/Aweb/3EeQZXjbkJpxVyeGW9b0hgXts9ccVjUsjp4E5PTbAjkRQ==
X-Received: by 2002:a6b:8b8b:: with SMTP id
	n133mr11252613iod.183.1562948476944; 
	Fri, 12 Jul 2019 09:21:16 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	j25sm12075744ioj.67.2019.07.12.09.21.16
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Jul 2019 09:21:16 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2019 11:21:14 -0500
Message-Id: <20190712162114.20473-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] classes/icecc: Disable remote pre-processing by default
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
X-List-Received-Date: Fri, 12 Jul 2019 16:21:16 -0000
Content-Transfer-Encoding: 8bit

Unfortunately, GCC has a number of outstanding bugs related to using
-fdirectives-only, which causes a lot of errors when using Icecream.
See:

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=47254
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88475
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=89658
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91152

Until many of these are addressed, it is better to disable remote
preprocessing.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/icecc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index edb0e10434..095518115f 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -57,7 +57,7 @@ ICECC_ENV_VERSION = "2"
 # See: https://github.com/icecc/icecream/issues/190
 export ICECC_CARET_WORKAROUND ??= "0"
 
-export ICECC_REMOTE_CPP ??= "1"
+export ICECC_REMOTE_CPP ??= "0"
 
 ICECC_CFLAGS = ""
 CFLAGS += "${ICECC_CFLAGS}"
-- 
2.21.0


