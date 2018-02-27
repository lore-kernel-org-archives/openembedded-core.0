Return-Path: <matt@madison.systems>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 469E2787D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 12:37:03 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id d4so11268421pll.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 04:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MD4EsnERaOo778toiQ5DoT2gBfVHaFQ7J7ZuzEwEr5o=;
	b=avsZ/rqoZICY0EPX5VzKiPqIcLBV0qAp3Greg3KGH7cxdCuytR4nLrBnHiki4MZXv8
	/HDJv6cyF1nrooHHlnSknZKZvliOD1plbal0epAZw07SC7PJUCy797vcuIi2sUnMYAzT
	aFgGIm7ItePlFqCcBFtuitiy648TYBa3qWV4TcCSJXDl05g7S3wPGdQTTio4xTwunV31
	8jwxSQKIkpeRoz8fqxxoYNWbVOtOmWJfi16Vj7wbnsfYfQ+ynACdYqCj2QoQVGkpwuqz
	+yTuQzJYWF/RWVlGfWuFWenua1iFojfyBEGQSSuiOOcQUWIlR4yu/rxv1cMYfvBdCy2I
	dXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MD4EsnERaOo778toiQ5DoT2gBfVHaFQ7J7ZuzEwEr5o=;
	b=CZdQNpr9eTEqvwR+6vU6t/RGkLnDUjIubVlvWKsWbThH95az8m7h2TBgWVUYvZdJAF
	XNwSFA3WriB6ZNMRb1GU1eK1Msd0PEooemIfBN+dhwjWDJAbwoLO0wzG3mdZclgdkDDN
	1mFSkcMuXuNQx+eDKXNR9J9/FrvQ0LOGS1TZPhwFOCOroC244YkUsBZG9HIbFF4/ypR+
	VOH1wGwHvnx5/Xsv7IN0c5inZSuJUjNecRk3u1+eYrErBrMZIE+rAQAsJUOrIIHwvIml
	3NzfQUMwsY2HB6z5zXLBA2Gjx0Npme55sNVk5NUUHuADjmlM1u+7Fut82BQuCC7gYhEJ
	WKRw==
X-Gm-Message-State: APf1xPC8NzQDzmZFoI2uYFkiLU6NC4tuUBvK+YYDVYi6D8HTG1Q8EXls
	LIMtItf5yU/XvErAcoU11R7I5uWW
X-Google-Smtp-Source: AH8x225rInm3yJ15yQ7QEcthU39ocVXHpq2of5nFS0pq4B7mVZsDR5X45pCDt5AxdR3viEzWe20KlA==
X-Received: by 2002:a17:902:710f:: with SMTP id
	a15-v6mr13803891pll.87.1519735024486; 
	Tue, 27 Feb 2018 04:37:04 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	o82sm1596760pfj.163.2018.02.27.04.37.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 04:37:03 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 04:36:33 -0800
Message-Id: <20180227123634.2812-8-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180227123634.2812-1-matt@madison.systems>
References: <20180227123634.2812-1-matt@madison.systems>
Subject: [PATCH v2 7/8] goarch.bbclass: disable shared runtime for nativesdk builds
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
X-List-Received-Date: Tue, 27 Feb 2018 12:37:03 -0000

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


