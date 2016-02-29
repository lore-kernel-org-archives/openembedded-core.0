Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 93EB9605FF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 20:47:56 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id fl4so98048291pad.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 12:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WIr01KEs4xIB+on/jHJwuRPntA7/KkF9XxG1cv2aVUw=;
	b=iYVGqpJoHOUE8GZMz4BmMJxplxOXWpqWb7WSBD7qLDA3EEwKPexWifZ3FEUrNBopDc
	/L6RqvFYHrmNntt8dLK2qMIwqOiTDFcw2xHVBSyTda9Btrd7ZZIi7NURwQgVnfDUz7Fq
	yEXDeUZc8f8LF8Yd9Lj9EfV+Z5U0cLD+QwuQ8gXr/l0wfXHCJ0ChnlhNR05qDxyIPAZb
	otphW7f0A0W2BXUfRKdjOA0S9VXaiflyCx0Svs6muFL4iOxq8RplZJr5643/A0KkiN5R
	Nv3v2Bn9LPgX2mMmBZMKixhTir20WJIjasdx792OmEg94CafujBe1MAJc0Jbsc4BZfUT
	1UhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WIr01KEs4xIB+on/jHJwuRPntA7/KkF9XxG1cv2aVUw=;
	b=i6/kL8d+ufS57/lEfG3S1gravdcrvSm7jR01uPTXdRIvriRfwKO1+AOPXi+uReGyOu
	RUxpRs3IhDB+X8IldKGciIJBx/OOQPyArhjtRfoqD4QViGZEun2CPdDqjEnJMcjVj38t
	hID88goHq1gd+d6PMD7deIOA7r66P9WOSd9r2rWvaRwCq1tLN+GJpYhW+ocS9PaN9hwp
	TDAeIlah80v0SqGDQsKx4ikEeI/1TzPsDWoX82liQud1h6yNxe2vswCNn0f/J+zCWyO6
	fyUJoJ+nHSTY5qHA8zbt3BE5yJfV/a+yrZysHIMhaGiD4SL2ysUjqsVnWCpoxZr+dSaS
	mjjA==
X-Gm-Message-State: AD7BkJKqU/aA8ymyHjoRVMi7U2GYEkdurRMR7CTuhdiAY/KuWuXWZnj0Pv1OKPCfW5i4Xw==
X-Received: by 10.67.12.175 with SMTP id er15mr24834715pad.70.1456778876953;
	Mon, 29 Feb 2016 12:47:56 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	y68sm40147971pfi.6.2016.02.29.12.47.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Feb 2016 12:47:54 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Feb 2016 13:47:46 -0700
Message-Id: <1456778866-27873-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] populate_sdk_base: handle empty SDK_PACKAGING_FUNC
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
X-List-Received-Date: Mon, 29 Feb 2016 20:47:57 -0000

From: Christopher Larson <chris_larson@mentor.com>

Currently, the pre/post process command variables are parsed as shell, even
though they're not shell anymore. As a result, an empty SDK_PACKAGING_FUNC
results in a parsing error. Rather than manually adding their vardeps, only
append its ; when the var is set.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/populate_sdk_base.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index de23f14..008bb57 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -84,7 +84,8 @@ python write_host_sdk_manifest () {
 
 POPULATE_SDK_POST_TARGET_COMMAND_append = " write_target_sdk_manifest ; "
 POPULATE_SDK_POST_HOST_COMMAND_append = " write_host_sdk_manifest; "
-SDK_POSTPROCESS_COMMAND = " create_sdk_files; check_sdk_sysroots; tar_sdk; ${SDK_PACKAGING_FUNC}; "
+SDK_PACKAGING_COMMAND = "${@'${SDK_PACKAGING_FUNC};' if '${SDK_PACKAGING_FUNC}' else ''}"
+SDK_POSTPROCESS_COMMAND = " create_sdk_files; check_sdk_sysroots; tar_sdk; ${SDK_PACKAGING_COMMAND} "
 
 # Some archs override this, we need the nativesdk version
 # turns out this is hard to get from the datastore due to TRANSLATED_TARGET_ARCH
-- 
2.2.1


