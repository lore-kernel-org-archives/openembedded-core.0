Return-Path: <matt@madison.systems>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2AA3078911
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:17:12 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id d26so3149733pfn.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MD4EsnERaOo778toiQ5DoT2gBfVHaFQ7J7ZuzEwEr5o=;
	b=rKe86ah+ZL5OqnmqAzP/aU3aSh05IzxosxDlZs5E0xsr6ioe1Wj+D7UnlqMlyRDFW0
	ZwOmXqSsRlTkKQY1SDpJDhC0wd+9ZXdfLvMHWWYS7syU8BMA1A6g8PQ5qo73vi6b4h8B
	ZDAU4KqYSwzBlMAqX0ENO3ONRnGXYrn2sYbhc0wL7+GVjGrh1ZDPCGJUMSVIZx3AoSlr
	1K10jpvuu7cUiJBAiWuUZb1tDdiWieCUYsrl/U2iGYsvlXhePOOx64At/ZrUg6sVRXai
	J0Kuprx57Asp4OSulfu++Bb3Xw7WY0l7MWOPKXL8Ms4uoCZCGW7gNQyWfoh05SmVwg50
	qwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MD4EsnERaOo778toiQ5DoT2gBfVHaFQ7J7ZuzEwEr5o=;
	b=jpaYh1FYP9tbufYAS9xvW3RQhyPZHGezbU/+cAcHIwVU2bMnOZgMzETAbHYlAwNVAt
	15ls/5dDj5dzrnNlerNU5BwzsfvD+FRxDumO7vY37umxJMDK2SdnXNZWMnBa+yEw6M/f
	mkTB8GnAhLs3aSh05BNbzrxRw4Vn4Q4iDNUo08cw0ibvC45Wzv8BuX3lpV/jq5PdJryg
	EYcM/Mb5lYAfrcU9kQze6OTZUvVzEejocD4awv65iSN0DtPieiy3WLUOzuk5aHgHa56J
	TMX34pQKAoDpIEtEdj1bqefaOS9vTChkhE/wYM/KCr8Ya+VArK1yrqMmj2EqzaE4HXVa
	sDFQ==
X-Gm-Message-State: APf1xPARwF7qX93uWRE289IKn1podnxyBvQLAydTxprDR/q9vR18vxZC
	U3LKlfu1f6KEMsI+pbnQbqDRKE6a
X-Google-Smtp-Source: AG47ELu8wk57Mg7Qj1G4vpAdaUO5vbIEuweGvXu31H+gINb3UYG94azIaBvn15pa9WI+j5Lh7C1dXw==
X-Received: by 10.99.165.9 with SMTP id n9mr2924017pgf.324.1519946233828;
	Thu, 01 Mar 2018 15:17:13 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	p128sm7853503pga.45.2018.03.01.15.17.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 15:17:12 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 15:16:48 -0800
Message-Id: <20180301231654.24018-8-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180301231654.24018-1-matt@madison.systems>
References: <20180301231654.24018-1-matt@madison.systems>
Subject: [PATCH v3 07/13] goarch.bbclass: disable shared runtime for nativesdk builds
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
X-List-Received-Date: Thu, 01 Mar 2018 23:17:13 -0000

While useful on embedded devices for saving disk space, use
of shared runtime in Go is not the usual practice, so disable
it for nativesdk builds.  We don't use it for native builds,
either, so this makes the SDK match the native environment
more closely.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/goarch.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 1021b94d4c..5c8ed33b15 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -24,6 +24,7 @@ GO_DYNLINK_x86 = "1"
 GO_DYNLINK_x86-64 = "1"
 GO_DYNLINK_powerpc64 = "1"
 GO_DYNLINK_class-native = ""
+GO_DYNLINK_class-nativesdk = ""
 
 # define here because everybody inherits this class
 #
-- 
2.14.1


