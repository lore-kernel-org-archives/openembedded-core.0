Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
	[209.85.166.51])
	by mail.openembedded.org (Postfix) with ESMTP id AE5616C230
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 12:45:51 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id b10so36892570ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 05:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wdb3YwCGKxVKwuDjT9qA+txx2ZCKMZPzpAZ6aY6Ca/8=;
	b=SYe+JrtH48KLdLkbWnh1rr4K2al4Xr5UivESvyxRyL0A3opjFmpJN0v/R2m9aFcwy8
	0IbvKddhru9NSf5YtUtW3gUnWRrgD1mWFpl71RJ3495yA/ogAEypzS9gA7oTZIGe5Okx
	66b6DBUU+lyjYRnzzo3RAI48+FbPu8NPM3PtgOcU0VWzmQrHRLFC/8xlvU1YtvVVJU6z
	czqBp4SJfIpRgAjoNX8M+pGjCwN/PARgvsYIF+au6sRCYmNghjegF4kxvQXRksYeQ+Dp
	oQC0SVWqOSL8SnljXXemm7GFDJNeqjlUqA07r+dnbUZCZ3Upa/iRdbVNBqz9/js4zRu1
	TxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wdb3YwCGKxVKwuDjT9qA+txx2ZCKMZPzpAZ6aY6Ca/8=;
	b=HtJzBOl6Ie1DtgUNb5/NcHFyUQJH7ygODChnShKa335bw9NDzEPotMBatXG3Xc60Sb
	JKqDhsHccoe1JL22nEGrk4BsUxUViukd7KDVZHeGOjjInBoEiW6Xwd8/od0rT5Bb6Sl5
	y/NhRc7u6lkCZTHFCC2kaEkMTzX9bE2Pdf+fewmAQso/QmMAV95DNA45XDwOsyjbYbTp
	87AGrM+Xwy9khX60xz3RCbh+mjAUJzneV+QO9TwRfl2/WOuKxrtRWXVoEYwLyEC6I0Mn
	YK8GQkCA24zqVjOzbga5mr4pSYTkQLYR3pIEg6WLzZM3h8dshA+hyzIOyml59f2D6MmZ
	eEkg==
X-Gm-Message-State: APjAAAWJ/PZ/dcXZzMu500ZbiIiv1nl8wlwEz1yKopVhj45g7OnpLM10
	YOaoUb2Xr49FF7pS+1Nzl2V7jZNd
X-Google-Smtp-Source: APXvYqwVrOYfyJe1lQt3wdXnqeyTI+s4gdW2bmKB2LWjSyyAho2PcrcGSzdsM2VWuP1bgy56gKrtfA==
X-Received: by 2002:a6b:7217:: with SMTP id n23mr31699122ioc.194.1566909952244;
	Tue, 27 Aug 2019 05:45:52 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	v23sm11478083ioh.58.2019.08.27.05.45.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 05:45:51 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2019 07:45:46 -0500
Message-Id: <20190827124546.18114-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] glibc: Fix locale DEPENDS
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
X-List-Received-Date: Tue, 27 Aug 2019 12:45:51 -0000
Content-Transfer-Encoding: 8bit

gettext is required to generate the glibc locales in do_compile. If not
present, glibc will skip the generation which isn't reproducible.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-core/glibc/glibc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 252fd56c13c..f1a6ae2a245 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -6,7 +6,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc libgcc-initial linux-libc-headers"
 
 PROVIDES = "virtual/libc"
 PROVIDES += "virtual/libintl virtual/libiconv"
-inherit autotools texinfo distro_features_check systemd
+inherit autotools texinfo distro_features_check systemd gettext
 
 LEAD_SONAME = "libc.so"
 
-- 
2.21.0


