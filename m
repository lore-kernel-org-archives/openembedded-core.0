Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2D022750D5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 21:47:04 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id x9-v6so20673pfm.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 14:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CSFL+8mzvJuDop3eIC2XYox9NNCj+RGPsLwmiJtzJ5E=;
	b=FMrln6AjQWCQ9U9cl+RGKWZoljgSQrEE/JjaKsy7tBQSd1SwnHyhm9SGovAJ00wGA9
	tqXG9HXSxqV4vC0iMNpnUUsQDwNM9d1q9Z5KXy9hxUi4b6EXccj9rbVLvRP/n7bSu09t
	7+QLbh/LxK5VUX0Xv8IMG32FLlSJQSURO8q9ZlYHaN3eflRLlxBoPGnHXqAz0KB+7Txn
	ywW87t/8FOg/BTPk8lO/8xLIhVpHhTOgpsfwIQNNHdDHhyLVm3j61liIvyMFcTfdU6Kw
	fPjU7owq1EWh/HXjNFw1U1E44DBYLXDHPSxwspNHwpivGJL4N3tKPnE2o1O4omt48Brh
	HR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CSFL+8mzvJuDop3eIC2XYox9NNCj+RGPsLwmiJtzJ5E=;
	b=KAnXMGqhYLBw4FCgKR4qU3ZHeWdh/TT932ZnxkumoBQiSWwgapYpzj3zI8259y6a06
	gc1wNHixrjVdtFen4IyVZUUCNMFuXQEFazWMH4Yy0RUWxB+OY0LrAc20g8PkmP/s3KeG
	FUkNmmBTCwe8mcoRevrklL0kmCOR19fczZOcuiJx/axF4ixyE7mnQPgvOzeB8JIAFQia
	NX+fWXL07oDJfWSpvAYj6EIH5EYQ0B6fQ0EQgxORUUH4fW4LIxE5zBfJxqqyMKvZXwxP
	5M4au54866E0KI6vG89CRHS+Bz1S/Eqh9Dsdh6yAyXVvUtaytCN3E0DJUVAf9pWTHUlw
	Bitw==
X-Gm-Message-State: ALQs6tCrcWMheKuNJhHyitW4iuNbd1dPEugF6nk1DMy/L6zDTDFVewFF
	lqHVuOtLHck2jkJ7sSt12Q0ZDA==
X-Google-Smtp-Source: AB8JxZqCFVtsGyqq2CdddKTSf+naUmHCezquregj4nX6Lp8m+mkKtyB+U8SqmgryF4cb0d9ov2pH8A==
X-Received: by 2002:a63:7405:: with SMTP id
	p5-v6mr31765999pgc.289.1525902425988; 
	Wed, 09 May 2018 14:47:05 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	76-v6sm3699193pge.75.2018.05.09.14.47.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 14:47:05 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 14:46:48 -0700
Message-Id: <1525902408-6796-8-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1525902408-6796-1-git-send-email-armccurdy@gmail.com>
References: <1525902408-6796-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 8/8] rpm: move ASNEEDED over-ride into the rpm recipe
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
X-List-Received-Date: Wed, 09 May 2018 21:47:05 -0000

Move the recipe specific over-ride for ASNEEDED into the recipe to
make it more apparent that the over-ride is being applied (and that
it should be re-checked on version updates, etc).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/as-needed.inc  | 1 -
 meta/recipes-devtools/rpm/rpm_4.14.1.bb | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/as-needed.inc b/meta/conf/distro/include/as-needed.inc
index f56d432..9c23564 100644
--- a/meta/conf/distro/include/as-needed.inc
+++ b/meta/conf/distro/include/as-needed.inc
@@ -2,6 +2,5 @@
 ASNEEDED = "-Wl,--as-needed"
 
 ASNEEDED_pn-openobex = ""
-ASNEEDED_pn-rpm = ""
 
 TARGET_LDFLAGS += "${ASNEEDED}"
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
index 818d3ef..d49530e 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
@@ -73,6 +73,8 @@ BBCLASSEXTEND = "native nativesdk"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[imaevm] = "--with-imaevm,,ima-evm-utils"
 
+ASNEEDED = ""
+
 # Direct rpm-native to read configuration from our sysroot, not the one it was compiled in
 # libmagic also has sysroot path contamination, so override it
 do_install_append_class-native() {
-- 
1.9.1


