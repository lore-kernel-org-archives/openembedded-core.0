Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 73EA760F7F
	for <openembedded-core@openembedded.org>;
	Tue,  4 Feb 2020 15:06:17 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id y8so7369283pll.13
	for <openembedded-core@openembedded.org>;
	Tue, 04 Feb 2020 07:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=EWXqBjqBjxqBimP1uFkvbZyXyS/0fIOCjJARWAJsXoI=;
	b=ahDkgyPndtXqROfPu6GHXgRt6roxiSLkNKd+q0d6IRR/EXQMRj3UnwM6KTRxmI7xJp
	xw4EHBtdl2/To/M5zjIgnckEaa5ZTmfE9Zqe64wIiRAm82+zMi387ryVZNQZFGsj4OYp
	dUpSE+eHFaqv9td7lASDE3hYHA33s1b2SL4pHf+IcJQ5XqhSmXfU7Jil6Qwv/hBRkHZz
	BEFKQEjBqvtZKp2MtaUPKhNZC+1zQtzx0L1CwEgsmaBl6hIG1bQTYNxhSp+3ceewzg/Y
	fcm7PB4mSRyaYs2OwdqmECnxom/hgihQ+zZ3jDnYoG5g9YsDKm+7B6OO4emFSj7AanRi
	4tLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=EWXqBjqBjxqBimP1uFkvbZyXyS/0fIOCjJARWAJsXoI=;
	b=rfzrmKFiOXDpfW9UBCrgzO6bxzIOH7yzf6Ft9oR5jWz7GjYNCu89+dqUX+k4aDbh5/
	FQUUYTI87EnCUFmAuxm9d3ANGeyi+IABV1lfGrxFUp3CxRuyvwcsdHY9m+MRSSJWBwnC
	O25Q+WMFuvV1hiQJ8visSj11i6Nh44JbjEJTKIpTWZpSRl+ltDckTp0Iki/Wg5g0Ap2j
	NFUTJyfRr41i79IoKpv+BOn9FMv+vBSNZ11oYmgPS9+ANlkEIyoT6HeLYYgQxturWjbh
	DtkJtxWHHjtQWkuwWCvnzCJp8KkUdJ6TrDyfC9AR2ctDuUfJaTmEbCseph3DTS2XyvSy
	M3tg==
X-Gm-Message-State: APjAAAU44HArtcyI6EvTx/biEcdV4kuwZDNZXn+rS1eguDrieBqRlSyf
	RYUuaYgHcGZNIGpocq+7H9dLWVdY
X-Google-Smtp-Source: APXvYqwuUpnxTSWnJaUXopGDPZ5f02VKXsTaC8KPAbu0l6XxmA7tee6MNUMKJfnwowkjMufWD48wKA==
X-Received: by 2002:a17:902:ba94:: with SMTP id
	k20mr18997352pls.104.1580828778236; 
	Tue, 04 Feb 2020 07:06:18 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0::afc]) by smtp.gmail.com with ESMTPSA id
	b98sm4216055pjc.16.2020.02.04.07.06.17
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 04 Feb 2020 07:06:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue,  4 Feb 2020 07:06:05 -0800
Message-Id: <c29059a8c2ecb18f32439b0880e9d6b2362b0036.1580828664.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580828664.git.akuster808@gmail.com>
References: <cover.1580828664.git.akuster808@gmail.com>
Subject: [zeus 5/8] bzip2: Fix CVE-2019-12900
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
X-List-Received-Date: Tue, 04 Feb 2020 15:06:17 -0000

From: Sana Kazi <Sana.Kazi@kpit.com>

Added patch for CVE-2019-12900 as backport from upstream.
Fixes out of bound access discovered while fuzzying karchive.

Tested by: Sana.Kazi@kpit.com

Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../bzip2/bzip2-1.0.6/CVE-2019-12900.patch    | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch

diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
new file mode 100644
index 0000000000..9859d9d1a2
--- /dev/null
+++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
@@ -0,0 +1,36 @@
+From 74de1e2e6ffc9d51ef9824db71a8ffee5962cdbc Mon Sep 17 00:00:00 2001
+From: Albert Astals Cid <aacid@kde.org>
+Date: Tue, 28 May 2019 19:35:18 +0200
+Subject: [PATCH] Make sure nSelectors is not out of range
+
+nSelectors is used in a loop from 0 to nSelectors to access selectorMtf
+which is
+UChar    selectorMtf[BZ_MAX_SELECTORS];
+so if nSelectors is bigger than BZ_MAX_SELECTORS it'll do an invalid memory
+access
+Fixes out of bounds access discovered while fuzzying karchive
+
+Link: https://gitlab.com/federicomenaquintero/bzip2/commit/74de1e2e6ffc9d51ef9824db71a8ffee5962cdbc.patch
+
+Upstream-Status: Backport
+CVE: CVE-2019-12900.patch
+Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
+---
+ decompress.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/decompress.c b/decompress.c
+index ab6a624..f3db91d 100644
+--- a/decompress.c
++++ b/decompress.c
+@@ -287,7 +287,7 @@ Int32 BZ2_decompress ( DState* s )
+       GET_BITS(BZ_X_SELECTOR_1, nGroups, 3);
+       if (nGroups < 2 || nGroups > 6) RETURN(BZ_DATA_ERROR);
+       GET_BITS(BZ_X_SELECTOR_2, nSelectors, 15);
+-      if (nSelectors < 1) RETURN(BZ_DATA_ERROR);
++      if (nSelectors < 1 || nSelectors > BZ_MAX_SELECTORS) RETURN(BZ_DATA_ERROR);
+       for (i = 0; i < nSelectors; i++) {
+          j = 0;
+          while (True) {
+--
+2.22.0
-- 
2.17.1


