Return-Path: <matt@madison.systems>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3C38D78A86
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 21:09:48 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id u5so6353112pfh.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 13:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UTZJIv5/OqNNKkgd6ZqhBpQL6UqJT649tcpMWCrrMgc=;
	b=HeYwq7/YsJh1m4BVZWcipWbPgQLhhiOEByVsjK6VT7DnfyWMjA0uA5wg+uZr7tmr02
	2tKlgdJZov57uxYtHEN1Urx5eMiYHTONbRPD2moUlrha7q2dX4ws7qN/0WQg1B6EfF/x
	CBbQU6GjnmXzq1LBK5GpTIB1BZhjFB8vdyaHBA5EEk+rGDXeEBReZST+PeBK83yNzNDP
	XB8YR0+UNeqoZ972s6yieZtH3qiDXPMv44O5il57JLt8QSbAC8Cro86RkFt1ilIg3/Su
	b30EEVzPJtBFeM/Gahfd8SZ2+jBekGxyp+RyR/PbhAOUDf6NwhuskbsbwNQS45/yBGPg
	TIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UTZJIv5/OqNNKkgd6ZqhBpQL6UqJT649tcpMWCrrMgc=;
	b=JDCWfyG9LKHIFHEMiRQrgoeRwKTV0c+mKiUZps6+8MAPyW9f/wGUjKhA+UHqs0b158
	72EQMTnliDlRFytgZbnzbgbYM2Q84U2SvCxJiRijQlaMA4Yj24DSxNrhy1HMF/reXdEN
	3O+OQpx1ccenFBg9dU36LS6MAkhExeX1k3H0mKXNYyd6VPp1ycJWF1bTLgGpYFPe+beI
	JdwZIYQGdgN8a6NTXF3UhKipat+ACItJNqg5d2qSqk8993zFK+zDvhfYZE4qu38O8SUH
	EVG2sCoYwG27jPehi1IXYYSgkDMI9d/4wIyXlJ5XHF9Ra42/46A2YIOHyi1218kuYmjA
	qu+w==
X-Gm-Message-State: APf1xPDD3D6mDwS3BnapnK1LhPMLSVanF9XYbJ0fMgB90VLBtLXZYAur
	Zp9u6GCuZVQOprDBBUX8ns2+42t9
X-Google-Smtp-Source: AG47ELsh4bzsuBTpz52Jgku8M8V9CSvipRgV49mADdbTG0CjgMNOnyAKeMZPnivoFn5+esdR1+N15g==
X-Received: by 10.99.127.65 with SMTP id p1mr10492702pgn.141.1520197790033;
	Sun, 04 Mar 2018 13:09:50 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	x123sm18594829pgb.5.2018.03.04.13.09.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 13:09:49 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 13:09:29 -0800
Message-Id: <20180304210937.29727-6-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180304210937.29727-1-matt@madison.systems>
References: <20180304210937.29727-1-matt@madison.systems>
Subject: [PATCH v5 05/13] go.bbclass: don't stage test data with sources
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
X-List-Received-Date: Sun, 04 Mar 2018 21:09:49 -0000

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
index 21ac2276c5..afd68b5951 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -114,7 +114,7 @@ do_compile_ptest_base[dirs] =+ "${GOTMPDIR}"
 
 go_do_install() {
 	install -d ${D}${libdir}/go/src/${GO_IMPORT}
-	tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs --exclude '*.test' . | \
+	tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' . | \
 		tar -C ${D}${libdir}/go/src/${GO_IMPORT} --no-same-owner -xf -
 	tar -C ${B} -cf - pkg | tar -C ${D}${libdir}/go --no-same-owner -xf -
 
-- 
2.14.1


