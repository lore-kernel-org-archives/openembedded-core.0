Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D5CC17965B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 16:45:48 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id t25-v6so1709323wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 09:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=ammzvHcbp2eEA40n562FvyPbjFrMGnFcRyUODfxk9dY=;
	b=AgH1NIxsoci2/OVFH89eku/5o8ySZWr5nO986eI6aPksKc+W6X3Ft+vKCAj1O2sidC
	BBFlr6UxvR2uWSveNjS7YVgiROgUIY1iVFqB6PvZ5IWZ0GkqtGJVRtRAswTsU705TEZX
	dYmgIY4EWcLsRVl/wshIOkLPey9nL0LFQGhqQOt+ePYzQIuxDEW3KFWrnBkujFEkDPzk
	QdBSi1k9ULK4DOF3Nc/w89wl3AFjtbdcKUdzzpse1cx5ScMUc2TUapl02DOZdYxn6mSC
	BJAQKv5Hdm/psf09qpkkD89KPX2wwN/Lup5bUVnVaOQDHCvB0XXHipTo2JnT+9DbetEs
	gZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=ammzvHcbp2eEA40n562FvyPbjFrMGnFcRyUODfxk9dY=;
	b=O1TAVhTaW4qu5wXWVfa5au+Mgx2eLPo8QhhH5D6pyZQbOTBmRxm21tvlyvkWXPtqtq
	S4efZU48AcvLBnoVvy+PaBnU2GqDKN+yFiEE6sX5oPWGNOVIETieIpJLciPP87fn6YfB
	yvN6h4Xpr7yF1d8ePANc1uIb/WN8DoIgOYKnExiruf3x18W3y4kZSuVkOGWKAkk6vrnt
	n3qXryRBNet1oGOwmI4ZGL7H8YksAd7zwLukfLeBvqQpsWHTUia4euFaqmq/sKgBVo5K
	ucIvRzqTHBLCDDOl9o/4t2cdfDiYTLdyVkvAvA6IMHHfK1jRbAZtZteDBpSeKVpymDWK
	YxwQ==
X-Gm-Message-State: APzg51CSY5RiyNMqtuquqOcMIIJwPSyGdDbr8zkLHH8zUuqntZesIkpB
	q/XWyaH3sk8pGotyEMZtI4lD6Fo9
X-Google-Smtp-Source: ANB0VdYspqTNGrwGZJddEw5K5tM1D1mA/YrkED9ocvngY7eu9HjsEP1kTWvDWdkFUMRjDre8cE4/Bw==
X-Received: by 2002:a1c:4007:: with SMTP id
	n7-v6mr2014045wma.108.1536684349301; 
	Tue, 11 Sep 2018 09:45:49 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	94-v6sm24930674wrc.10.2018.09.11.09.45.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Sep 2018 09:45:48 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2018 18:45:30 +0200
Message-Id: <20180911164530.28493-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>, Igor Kreps <igork@miltenyibiotec.de>
Subject: [PATCH] coreutils: add alternative target for nice
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
X-List-Received-Date: Tue, 11 Sep 2018 16:45:49 -0000

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
index 053891f6ea..83bc20f298 100644
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
+ALTERNATIVE_LINK_NAME[df.1] = "${mandir}/man1/nice.1"
+
 ALTERNATIVE_LINK_NAME[lbracket] = "${bindir}/["
 ALTERNATIVE_TARGET[lbracket] = "${bindir}/lbracket.${BPN}"
 
-- 
2.17.1


