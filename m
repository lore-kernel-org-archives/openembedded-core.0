Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 07EC571ABF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 05:09:05 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l10so8705wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Oct 2017 22:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1mfgGGBWka7oZRZKGUXjX5bD54XB07y/oJjxGjPU0NQ=;
	b=pU7pX6Yh83BXSMobt9C/SsZpHoSjUj9rTepvrxblMoVLjNen9rVMT/3X9/cBO+XiaZ
	B2QR0DfPEvE+Tz/Jp8WhxPv5KnDHIv2AEjPa/dzn7LOt3wtyeuHhu5n9OiWs6jpcZhMg
	WXm3FmptjbJHcC4hgiO+C2nbaZhEG5T+/WoRt/FoD39f0mAo+hB6LunMaxZaTZk3JSWE
	UV6rjG97oqoyuK/3Baaz/4F+ON0Fz0XBYce3f3UC0+8HcIg9E/mVgUXj31xCkVjlVywn
	mbgxT8aKe2ATqDNb25fW3JOskUxBRrOUOCh77AsNvQUeE7/hARR1nvLp12PHh4gwa3/E
	Y4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1mfgGGBWka7oZRZKGUXjX5bD54XB07y/oJjxGjPU0NQ=;
	b=jbv5YC7KNSoVizGBlHQfNHTGMwMi3am1SitPTtXfXv0zYptdCjHT9MWa7QxNyujOhA
	Sg8JnEC/aSjXLhErD1BOZW/8DkiuMyoykLNtMH41sWmPwEo6mNAuAamcjK9UMTxS39ES
	f7cVfPrHgf01RKMqsGYxroyz7dwoi8ZPiDb/EY6D5INeqp/MFZ9KdrUAnjW1ij2wmzB5
	Z6JUSDQTYMfHQrPRMSnhJX9Hx+u7ruhJ/hod/slOL04iZ8N3G19ojb6WV/EX/dkYj/bW
	G5EMY1zd9Z9o+qLizdNZDi6vW/BqtaxhMptge+CZl/6nWA2C5TPF+lijRYfoNlVqedyj
	MLug==
X-Gm-Message-State: AHPjjUhLCn0Dwyu4ATLbXNr+a4kPIAVSAUT4kv5d5lANhetG3thbDlVA
	6GBlvtTvP132l96woM3N8OW66Ncc
X-Google-Smtp-Source: AOwi7QAG986TjF8kGEFOIJd7d4MQcfiMEgHxvendXrJXUej6mx6F35741rttX5dFi7fpbPucQzkKpA==
X-Received: by 10.80.150.196 with SMTP id z4mr18463113eda.269.1506920946411;
	Sun, 01 Oct 2017 22:09:06 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([117.136.38.60]) by smtp.gmail.com with ESMTPSA id
	x29sm9792646eda.51.2017.10.01.22.09.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Oct 2017 22:09:05 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Oct 2017 07:08:46 +0200
Message-Id: <1506920927-1938-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] libsolv: fix a kernel-devsrc installation issue
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
X-List-Received-Date: Mon, 02 Oct 2017 05:09:06 -0000

From: Ming Liu <liu.ming50@gmail.com>

This patch aims to fix a kernel-devsrc rpm installation failure on
target, I had sent the patch to libsolv upstream, but its maintainers
rejected it with the reason:
...
we probably want to sync these values with RPM code...
...

I am not a rpm expert, would somebody please comment on this? Is this a
issue also should be addressed in rpm?

Ming Liu (1):
  libsolv: fix a kernel-devsrc installation issue

 ....c-increase-MAX_HDR_CNT-and-MAX_HDR_DSIZE.patch | 35 ++++++++++++++++++++++
 meta/recipes-extended/libsolv/libsolv_0.6.28.bb    |  3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0001-repo_rpmdb.c-increase-MAX_HDR_CNT-and-MAX_HDR_DSIZE.patch

-- 
2.7.4


