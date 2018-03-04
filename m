Return-Path: <matt@madison.systems>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id E222378A86
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 21:09:52 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 68so6353494pfx.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 13:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MD4EsnERaOo778toiQ5DoT2gBfVHaFQ7J7ZuzEwEr5o=;
	b=YiRy7heqAgFdpbQpvFED0B3BY53Syun8o//fbcOOprnbBVOmrUoiLG8OHv4uZS4lfZ
	DmMkVqsDnFs/V2qQgNrLx8f8q1TDABXHt21C4Oru0wmsdIHO9+bj18RurOfF6Mt73UtA
	Wk58wluBzSn4HNIsRcAwLaRP5vhap8OvOZiFKIDG1vpNqocPmxB0ZcHblhnMnmtNvkvz
	31i2U080KCfTWA5UjCXGsJrIeaYRESiwt2KWPr8/zMYzK/ofJIexC/k1UKMx8IMH+Gc9
	7OlajmW9hcIgQTbpLaGqmKIWubSatYpubikuf+lfzHZeig2drHTyqXl1AGuEepH7g7hW
	XuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MD4EsnERaOo778toiQ5DoT2gBfVHaFQ7J7ZuzEwEr5o=;
	b=JmP3rfosrWFj6dNpkAcKZpG0joux28RWtpUl1Nj83TDearOp3ToR6XSMbo0u4bRMFU
	nZsuh+7m0ojciJ8WQDkFpFk6Myo2jtMoM3Lw04iqI3EWj/FnnrXnZgzS6LTpcBSPV9vO
	0GBOrbOvxBycxQ0Ca4gIIGe2YdKq7Di6sj5Yd9PttnVGHqDSGG7XOgSLnNJYIOnqhIXw
	wVMgMWBlYvPfSrxwTJftuz84gdHYsLjRs3geyGRPf/h1TE/SWZ6cpK1yEV/UjTWZ4Vxk
	KgOb/XtQOQmAnio6fZlsWO65dJYiv14s7oL2f+sPV28nSpNMPGAA/FfGActi4Svzsraf
	STbA==
X-Gm-Message-State: APf1xPCDKy/ixOQnQs2XIuPiQzAS4c9Sjl01mD+E0dc1OUo9ZLGLLdZR
	RtfQ5BZpoOes3T7CxeJY+w1El99U
X-Google-Smtp-Source: AG47ELtcFH4btDnHlUJBas7VzcKPOI0J65LZ2N7VM+7dkmBIdszbRalX9V/f5rs0eHJsxVzfQ5shfQ==
X-Received: by 10.101.87.199 with SMTP id q7mr10539936pgr.215.1520197793635;
	Sun, 04 Mar 2018 13:09:53 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	x123sm18594829pgb.5.2018.03.04.13.09.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 13:09:52 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 13:09:31 -0800
Message-Id: <20180304210937.29727-8-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180304210937.29727-1-matt@madison.systems>
References: <20180304210937.29727-1-matt@madison.systems>
Subject: [PATCH v5 07/13] goarch.bbclass: disable shared runtime for nativesdk builds
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
X-List-Received-Date: Sun, 04 Mar 2018 21:09:53 -0000

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


