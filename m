Return-Path: <matt@madison.systems>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6DD51789F7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 20:33:41 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id bb3-v6so6338816plb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 12:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MD4EsnERaOo778toiQ5DoT2gBfVHaFQ7J7ZuzEwEr5o=;
	b=ZGVK70uOKKG3/qUO1YQeCNFhecrwRWC+z4BhlxohP/C3eOed59kzdpUGIf8jUKFrQM
	da94adLfmG6gEYTh3KH50BqQBNqIpuh0N3Si+WwiJ9Iph6an/4P5sgA5qW/kjxxS8HrB
	OqpwUh3344ehcN4WT3Dm6KfcYnC0wytA7jtZLK0J5RPlNk4Bxkq1/Oc+OKGWYH/zX0Ds
	2HvODOk9qQ3yeV9pPn+ewR8neEvJakpXid+bcVJ0t0sq5zWQv4K/Opbtmi7LSkE0N9dm
	mjU+4Q56ty0vnMz1QXqUgGLUPbFi/z4jtptOraBWzMhFwLcjizUEkThkA2LmM6jIs1F/
	2Vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MD4EsnERaOo778toiQ5DoT2gBfVHaFQ7J7ZuzEwEr5o=;
	b=lRR6JwGpUtp+8aBjFVil0jUnB4c39yJnWIIkAXYVUqNBHwtT3ORDFmkoh5KdYkJxQA
	FFS7OoaQTLiFnZvqsKyYiwjZYDzPTKpiXTpmGbHEpOmsNOZbOC/jRg0CR0CQypI/4FK5
	RR8G7GfXQSHbTlAwvl+gKd/rw4IfY1iGBS0sBpWIeWuM15UUi3QzmNsjrwxGADHxOwMX
	25wRmeLTqDfsmfVEZYLBZzKbNis6QPy77ljUOd+rusSpni8+yZVUX+ww4rQWZybSGZ33
	Hxe7hjoC1HA+58VMfPv2ZnUDtLuJICyGm9u42+YyVbTg9ToDpxA4IRPVBG1UMCBU10Oy
	0LBQ==
X-Gm-Message-State: APf1xPBArHV5nuQkvD6ioYvuyrrdDacM8RV9YCcJhlHAcRwUpplKWipo
	tZyqCddHe3dCw6P5r7uqD5PeIfh7
X-Google-Smtp-Source: AG47ELvIyovxps8Vyds7MOf6UOg1Ag1H+dr83Xml+F3SP2YJincAKlHxc8MPeJ/b/4ddEHvp/gvg7A==
X-Received: by 2002:a17:902:d204:: with SMTP id
	t4-v6mr6426248ply.377.1520022822478; 
	Fri, 02 Mar 2018 12:33:42 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	m12sm11193338pgr.35.2018.03.02.12.33.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 12:33:41 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 12:33:08 -0800
Message-Id: <20180302203314.32737-8-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180302203314.32737-1-matt@madison.systems>
References: <20180302203314.32737-1-matt@madison.systems>
Subject: [PATCH v4 07/13] goarch.bbclass: disable shared runtime for nativesdk builds
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
X-List-Received-Date: Fri, 02 Mar 2018 20:33:42 -0000

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


