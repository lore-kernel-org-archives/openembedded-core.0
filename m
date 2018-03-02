Return-Path: <matt@madison.systems>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 34915789E7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 20:33:37 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id h19so3591405pfd.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 12:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Gj3wekNNjMGe1LVvFaU92GMS3RRw+r4mHE5O5YsMG9s=;
	b=TVSZVm0mplYgZmL7uy5d4Di0FiidT9iq0rOuHSoh3AZO71jXgHetIzU4cwByM1pS4w
	aB5ZOzs8S6K4jMJqqhz1UB7wvubq0qgDd1hSjvU/1/zFD2P3VQQX8X9+n6Hx4hpjkkcx
	kVo1NHXnoUsqs5BaxYCIKtdC7j3bTqYTAqBOxOCdTKw+HYEvWEHWbCdeBcgtHYgrGW1n
	mGJ/kNO/tQMrysL2jHfZcQQWCcN9knv/LRWA7Lny8+3xSMua03thWYwJ69IYmJTZ6jIE
	39GvXo4zye3WBDtQWFkp5Sfq4X2/8tZyqukrQCDLHvmH90zBtMONm/FC/+vYzHBQGGoe
	oIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Gj3wekNNjMGe1LVvFaU92GMS3RRw+r4mHE5O5YsMG9s=;
	b=Oa71MWGsbM132/9ALPnimUpqLZCswNKpNh7UOarZHBSGNs6Hq0Ib6aBFYH9obCGhwx
	6bIfIuiX+eOc1Lc68iMD3C80GRlb3AAp2ZRFmvcYBz4raUYySy/UPbJ2dgvCco7wgU7/
	wuzI9Ccavroht3kDuBhdKm2KzTmkannJQvY7ppUa9LQkwo7zruZ7uuDKSslcORK4P2Uc
	TdK7R6VB6q0cW+hetM4ZbigWxBuUjP0/DICd4QS3oBBgNpA2Weh699ipGEKk3b7CtOFP
	ZY835aTGpAgnh2dl2Ll5g4id15BD9funpabrYQxN3lhsYuLDLA6Uycs2+jRsc2+2kgZi
	/4OA==
X-Gm-Message-State: APf1xPBzZ6UoU/Lne7FKvBHl1s0D1iecTU4B+HQzN0zo5ltcTYLizawG
	Tut353bzgqcarJOj3C3yGKEBsgNb
X-Google-Smtp-Source: AG47ELvIGnJ5qqeR1SdXK23+cJz0KH77emnMhAIWLaV4KiiVqCaqeKtcAjmSKhKAHgCb3Es9YYoewg==
X-Received: by 10.99.158.84 with SMTP id r20mr5332586pgo.296.1520022818943;
	Fri, 02 Mar 2018 12:33:38 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	m12sm11193338pgr.35.2018.03.02.12.33.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 12:33:37 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 12:33:06 -0800
Message-Id: <20180302203314.32737-6-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180302203314.32737-1-matt@madison.systems>
References: <20180302203314.32737-1-matt@madison.systems>
Subject: [PATCH v4 05/13] go.bbclass: don't stage test data with sources
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
X-List-Received-Date: Fri, 02 Mar 2018 20:33:38 -0000

Any directory in a Go package's source tree called
'testdata' contains test data, and isn't necessary
for building.

Some packages include ELF files and other binaries
as test data, and staging them in the sysroot and
-dev package leads to unnecessary QA warnings.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/go.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 33a6fff0cd..2f196b487c 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -112,7 +112,7 @@ do_compile_ptest_base[dirs] =+ "${GOTMPDIR}"
 
 go_do_install() {
 	install -d ${D}${libdir}/go/src/${GO_IMPORT}
-	tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs --exclude '*.test' . | \
+	tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' . | \
 		tar -C ${D}${libdir}/go/src/${GO_IMPORT} --no-same-owner -xf -
 	tar -C ${B} -cf - pkg | tar -C ${D}${libdir}/go --no-same-owner -xf -
 
-- 
2.14.1


