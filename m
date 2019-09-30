Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id DB8FB7F168
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:08 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id q7so4855974pfh.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=eUthZrTjpLjld+E3kjiQNxNY284z5Qh/gYW7uFklMjk=;
	b=soHbuZNiDB+qL5EnGglhKXLxL087OVUIKpKNDAhH+cRGsEZdiRu+OikaXlsCAh32gt
	mwxdWZzyLeX+S4WzFLK/CwVG87I9CcfNGE8njhooYnBd8kuprYxJn5h7lk9JNLQb7Cmr
	7h793HLHFnDkPSlLCn1D5iWibCTuPQ9WN1+aVu3XPSXKwFFkBdeGUHgu3QBqC6tl53gc
	W33l4+PWLVZB/ionrrfdMubK2cKCAI2x7FQvMvq6JFus4Wc8a3BcT6N5ZxzXLnzjY9Up
	jnQuWK7Wa1QWC551cXy+WLp6b68W0iDWxsSZwen53qwY86r8v3Cwd1Mi9GQy+uH7udEV
	A+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=eUthZrTjpLjld+E3kjiQNxNY284z5Qh/gYW7uFklMjk=;
	b=r6hfzoX0Qm3koxWJ9effbm7WmjgssOkF44tvHcte8LxBb5zZlKVDRgMlgWAh90df6U
	C6BU7xNENRtYxyNu9ZNec/5ocTq6IDsIurtAO0Ipw9CV9XGPqWDl3vnpNbo8AtDQjfJr
	v9o+6aY251Az0d5cSZOxjplRimehcdHbV+HFNK36lNJzP6F77aAKWKrE6xM6jeRYvguF
	WiW3jpf6hBkwJn0J710CYvvWaITpCHNrgRIzq7moZ9QZKUX5jpAlqHyn2CVk+3K4v4O4
	7lJn2MxzuzxjlvLTG/RyTSRCq1YM5fGdVMCM1FW6D/VXEYMTdY8fIo6dTlwcNqjoFcZV
	9coA==
X-Gm-Message-State: APjAAAXePIVqG2zLQOfchSh50ySYsv865xQSk7M9oBcAW2DENiIvEOTF
	kTVECeMEuiudIysSiabOWxXAVSzZKec=
X-Google-Smtp-Source: APXvYqxzehswmz8R1n0sVsjKVLg3WOJc5V4kPFQ273QFYxAqnjbJUjxiArtWmx5HOh60cD56AC/mPg==
X-Received: by 2002:a17:90b:d97:: with SMTP id
	bg23mr24661151pjb.86.1569818889924; 
	Sun, 29 Sep 2019 21:48:09 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:11 -0700
Message-Id: <b6daf8a5755842c0e38b1a88687a18432138a45a.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 16/54] rng-tools: fix very long shutdown delay with systemd
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:09 -0000

From: "Bedel, Alban" <alban.bedel@aerq.com>

The systemd service file has DefaultDependencies=no but is not
properly configured to also stop the unit. Because of this the unit
keep running after shutdown but systemd still waits for it to finish to
then later resort to a hard kill. All this take 1m30s with the default
configuration.

To fix this problem add the missing Before=shutdown.target and
Conflicts=shutdown.target to have systemd stop the unit on shutdown.

Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/rng-tools/rng-tools/rngd.service | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/recipes-support/rng-tools/rng-tools/rngd.service
index f0355db..5c8253b 100644
--- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
+++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
@@ -2,7 +2,8 @@
 Description=Hardware RNG Entropy Gatherer Daemon
 DefaultDependencies=no
 After=systemd-udev-settle.service
-Before=sysinit.target
+Before=sysinit.target shutdown.target
+Conflicts=shutdown.target
 
 [Service]
 ExecStart=@SBINDIR@/rngd -f -r /dev/hwrng
-- 
2.7.4


