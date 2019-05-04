Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id DF8FF7D7A0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:34 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id w22so2900574pgi.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=3DGAvLPZvgJMh/STuqQVvit2mup6IZzdVwjIqS+EONk=;
	b=doFr1XPv3XYIWAztmdzk7VMU40nUqbvg91z974GcV5zgWBQvJr7bCWfF4bdza/hWSG
	V58KMgnlWQb0s7w3LNOlRRLfjRfH/XixEKKc5pz9RAefUHT2UELwfbbHd+6Qu8yixY19
	0MfRMDB/zTFaifx1vex3Y9HMFVVtos+2aOB7/dLG34/LZk9v5NmZu8R66Zln/kNXrpiK
	HoidPBp3Wl6cF4+LaRyV5tRD2VMfbVrDDGy4yM8Nqwo3t4geEZcOtWbGNhqU6UqnJue5
	4+AhxqA7quyLvxjJJU1Upeq9p71sug1yfhIMSBD9aDlGYQAnGfUFEeCVf7w3WLAOKYPC
	LVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=3DGAvLPZvgJMh/STuqQVvit2mup6IZzdVwjIqS+EONk=;
	b=m6K0IEq2dwMO65afKZyar1jAgBiGRWhiHvuZUwf91AZH1DYEtRmAM1D5/6B3QZnSYM
	DlxkiJ+1iSnLCSxfyVgG55dlOsn+zqX7mtMalBHk1GgBd3v7b9OT29OOtibxdlYpaZvw
	FiIild8eIPNmqkXkX5wlUy2p8lEtZ6LdMAsWgEv4uECFlAdVndz6ptXCp48iA8y/UuGB
	SAzeIwt7Cz1LlC9HDPOWwD4qUZ8kwm5iEjARNvHUwt+7hykJef2DGYNECD3/AKqC4tCn
	8vdhi8dGtoQDZCc9jCDCTagfCMOFdDnsg+W6a22Omzd8NmQwp3SPiiAdAeZQtrr0bsQJ
	8vZQ==
X-Gm-Message-State: APjAAAWBnGVGEADqjITD6RfRrct8J3mJ7rnutMSdnZyhrsVASIeM9gLK
	K9Bh9FEck42yGQZ0A1QpWg4x6qvg
X-Google-Smtp-Source: APXvYqytlFLT3JmDS0caEcdMfd7ms/P8EKi2vKeWQiPjnHrM7a6O1yCcyx9hiCV0G0X5SsyKIhtVXg==
X-Received: by 2002:aa7:8208:: with SMTP id k8mr20109884pfi.69.1556983655952; 
	Sat, 04 May 2019 08:27:35 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:26:46 -0700
Message-Id: <16b39e9deb50d5583e1be9ad08cce8d76b78639d.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 10/43] kernel.bbclass: convert base_do_unpack_append() to a task
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
X-List-Received-Date: Sat, 04 May 2019 15:27:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Steven Hung (洪于玉) <Steven.Hung@mediatek.com>

<pre>
when&#32;externalsrc&#32;is&#32;enabled&#32;and&#32;the&#32;&#39;do_unpack&#39;&#32;task&#32;is&#32;deleted,
building&#32;kernel&#32;module&#32;fail

Signed-off-by:&#32;Steven&#32;Hung&#32;(&#27946;&#20110;&#29577;)&#32;&lt;Steven.Hung@mediatek.com&gt;
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/kernel.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 9da9818..b346a60 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -130,7 +130,7 @@ inherit ${KERNEL_CLASSES}
 # the symlink.
 do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
 do_clean[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
-base_do_unpack_append () {
+python do_symlink_kernsrc () {
     s = d.getVar("S")
     if s[-1] == '/':
         # drop trailing slash, so that os.symlink(kernsrc, s) doesn't use s as directory name and fail
@@ -147,6 +147,7 @@ base_do_unpack_append () {
             shutil.move(s, kernsrc)
             os.symlink(kernsrc, s)
 }
+addtask symlink_kernsrc before do_configure after do_unpack
 
 inherit kernel-arch deploy
 
-- 
2.7.4


