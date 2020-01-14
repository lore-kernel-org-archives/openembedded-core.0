Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 258E37FC4F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 14:00:30 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id w5so2379748wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 06:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IV0kpl2AQPhTDRp9frzWs8gIwFBb7YOGPOdg5hcSBao=;
	b=OHDjoCR1JO3qMqE71ZZ3CFc+/RB3U4wFgXyuEpSvGQMmQYo3lrUC/DybXQOl5a8hl6
	vWJ2KfM5YfqNcRPPmJzJVfvsIuwG2YIbed2EbKnDDzUeBw1KMQtirVS0zH9HHIPF7Ctp
	4xUdP7f8tPZNj2mI0+1OLoL4pt9PHqYytKxlW6NllTYx9XyZ7HUKuGX/WxNmhDTLDgsU
	i/el9T76m7kWC8t19TLECdkRR25wryzhq+BHPnHPBfUrWdtEGcV+Pe26x7+0EmJBam67
	mMjtywU8uM177K+4tH8R4J7xJI6bvY+cohlSmiqBtmX2xOQxaRdXK71w+ygkOFjGpCuc
	QKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IV0kpl2AQPhTDRp9frzWs8gIwFBb7YOGPOdg5hcSBao=;
	b=gvcUuHeriCITyfcPj+8HjdcJr2HlGablaXroDMxg+o6ZqAY4zmKLAmyMV3VLx2jfQR
	tGM/gAZFboxN+xINSIFJ1TgBV7yoiCTTVYQyzZV01nbV7mgHezgcVH/oVv+4CL3V+Tfg
	EarzjobqYGhytFpvEotx3OFslAf0Yv+bqC3QFVgbhlas90K5PETtuVwII/6Z8NSU9AgQ
	IKW2v5viDOvivBzpExjG2NI/M9Q4eoHBoexdwH1DEatDm4nGheX7PU4e8QVhRTebBIcP
	jwYbmserWYdhMsnWLcWcYlHE1rXm0vQDjG7M2NHwbsriCbjOOjyJyTXVNGNDqNO+zqwt
	aFOA==
X-Gm-Message-State: APjAAAXdh9ej2KJN3FGDMiJj1LT83JdBuZf+EHpCeYpRZeNq7lvle2m2
	IMH3fpoaPdvF+ZWPN8Q8osYNJJaT
X-Google-Smtp-Source: APXvYqy5CBeWMpzQkslnrko9i9KMyoiCcWhNWrOqRU27rjzzINkInLFKGPgKPe0sAGoS/6VAmRGu7Q==
X-Received: by 2002:a7b:cb0d:: with SMTP id u13mr28408667wmj.31.1579010430546; 
	Tue, 14 Jan 2020 06:00:30 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	r62sm20147333wma.32.2020.01.14.06.00.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 06:00:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 15:00:06 +0100
Message-Id: <20200114140007.36622-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200114140007.36622-1-alex.kanavin@gmail.com>
References: <20200114140007.36622-1-alex.kanavin@gmail.com>
Subject: [PATCH 19/20] strace: fix failing ptests
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
X-List-Received-Date: Tue, 14 Jan 2020 14:00:30 -0000

1. They need to be run under regular user.
2. Some tests genuinely need more time than 30 seconds
3. The Makefile patch erroneously introduced a test-breaking change.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/strace/strace/Makefile-ptest.patch | 2 +-
 meta/recipes-devtools/strace/strace/run-ptest            | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index 2437d1fb6d0..1f01ef79f25 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -42,6 +42,6 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 +	done
 +	for file in $(EXTRA_DIST); do \
 +		install $(srcdir)/$$file $(DESTDIR)/$(TESTDIR); \
-+		sed -i -e 's/$${srcdir=.}/./g' $(DESTDIR)/$(TESTDIR)/$$file; \
++		#sed -i -e 's/$${srcdir=.}/./g' $(DESTDIR)/$(TESTDIR)/$$file; \
 +	done
 +	for i in net scm_rights-fd rt_sigaction; do sed -i -e 's/$$srcdir/./g' $(DESTDIR)/$(TESTDIR)/$$i.test; done
diff --git a/meta/recipes-devtools/strace/strace/run-ptest b/meta/recipes-devtools/strace/strace/run-ptest
index 2fed984e901..4660207220b 100755
--- a/meta/recipes-devtools/strace/strace/run-ptest
+++ b/meta/recipes-devtools/strace/strace/run-ptest
@@ -1,3 +1,6 @@
 #!/bin/sh
-export TIMEOUT_DURATION=30
-make -B -C tests -k test-suite.log
+export TIMEOUT_DURATION=120
+chown nobody tests
+chown nobody tests/*
+chown nobody ../ptest
+su nobody -c "make -B -C tests -k test-suite.log"
-- 
2.17.1


