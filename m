Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 64ADF796EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 12:02:34 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id v90-v6so1770425wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 05:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=0PAttWSlOIv76dm65LqktlxOJ6+OEa7x3PV9a9cwKkw=;
	b=G/ZSN84uCbAgxwUs32UEzSYouDXxAxwla40vUeTmDFpmGlEJL3OMWy3gYk5AJ9St4l
	V8rJplTfzxvS2a17hn1yfh+V9F4AjoN93+fZdUFSUDjoiDDTBZGnXprC1k1A+HwEfsA1
	b8HD8zAASjAUwbIHOrbh6KsfTiZYX7ppNE9eRHZcvL+9I5HN92pudU0w4yeGnJsmTdug
	8r/HXvuJWbVC6lUNNnnY8yzyIUI6+dLUPGo+Rn5bQDZkGuQdoFjAHWe2EikbFKh8SHcy
	jtZgGALGlEMLCnNbFyIG2xi7EN13vQcbgJGy3stHxXejTIuS6ftljlI2YaY7sezmOrSj
	gafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=0PAttWSlOIv76dm65LqktlxOJ6+OEa7x3PV9a9cwKkw=;
	b=LPzLC/NuYCDTul1wKNfjCdZIQco9hQzP7aQ45uG8Dzp2ZYrItgTmSaZsmBuAb6x6g5
	q9axa6AtgT2OqmvNsmsaMvOx+gqjTHKAqOiRqomlgssMiXI1CeLdWKI8n9vdvnGqIjEU
	y2nWWKjIJH15jDHdQHB+S5vZDM+DdS1THSCiqfyso0Mfdkn61/0WY3mW1A/p3jEXwBld
	fzOuTwCpRgmCTZc14shnvnb3d5kzI0gUK9JH74ZSTZN8XeFTvNfIdYQ0Oh17bc3/r3yT
	ADFR3Q9XVz4D8GPNelQPsvAab3RuuZzKt6R5HhmHpLSt3/PiwT/K5noph5odsL5TYI82
	RRwg==
X-Gm-Message-State: APzg51BzKHuz6PkLyTX6ADHZM+LekG22fSMHpAU78vW4P/UzDRxiOFOV
	AJ7jkcqolisJ364PX0AST5ZqrclH
X-Google-Smtp-Source: ANB0VdbiyPP68oESB/Zh9J3IU71z7pqQeJvlzXQVlwBgucldBoWanrkflFJQvQ6gStyhfUPkh38Cog==
X-Received: by 2002:adf:e1c5:: with SMTP id l5-v6mr1327410wri.36.1536753754840;
	Wed, 12 Sep 2018 05:02:34 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	o3-v6sm911693wrn.58.2018.09.12.05.02.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Sep 2018 05:02:33 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Sep 2018 14:02:15 +0200
Message-Id: <20180912120215.2371-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>, Igor Kreps <igork@miltenyibiotec.de>
Subject: [PATCH v2] coreutils: add alternative target for nice
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
X-List-Received-Date: Wed, 12 Sep 2018 12:02:34 -0000

Avoid coreutils conflicts with nice from other recipes, like
busybox - even if that's not enabled by default.
In situations, where coreutils is a dependency for -dev images
and small busybox nice is available always, it avoids extra
effort for coreutils for those users.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-core/coreutils/coreutils_8.30.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.30.bb b/meta/recipes-core/coreutils/coreutils_8.30.bb
index 053891f6ea..5ebd36026e 100644
--- a/meta/recipes-core/coreutils/coreutils_8.30.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.30.bb
@@ -77,7 +77,7 @@ do_install_class-native() {
 }
 
 do_install_append() {
-	for i in df mktemp base64; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${BPN}; done
+	for i in df mktemp nice base64; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${BPN}; done
 
 	install -d ${D}${base_bindir}
 	[ "${base_bindir}" != "${bindir}" ] && for i in ${base_bindir_progs}; do mv ${D}${bindir}/$i ${D}${base_bindir}/$i.${BPN}; done
@@ -113,6 +113,10 @@ ALTERNATIVE_LINK_NAME[df] = "${base_bindir}/df"
 ALTERNATIVE_TARGET[df] = "${bindir}/df.${BPN}"
 ALTERNATIVE_LINK_NAME[df.1] = "${mandir}/man1/df.1"
 
+ALTERNATIVE_LINK_NAME[nice] = "${base_bindir}/nice"
+ALTERNATIVE_TARGET[nice] = "${bindir}/nice.${BPN}"
+ALTERNATIVE_LINK_NAME[nice.1] = "${mandir}/man1/nice.1"
+
 ALTERNATIVE_LINK_NAME[lbracket] = "${bindir}/["
 ALTERNATIVE_TARGET[lbracket] = "${bindir}/lbracket.${BPN}"
 
-- 
2.17.1


