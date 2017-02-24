Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6216971AEF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 11:57:49 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id v77so2627072wmv.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 03:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Wn03B8BiOobJTeRYNyOQ2m0XitQnZbLEOX2SdSCdlck=;
	b=kfns4BiuaHIaUSLM7ZOvvfyzFjrlxtqpeq1FbRjVN/st5BQesckb9Goa3/msLNwvkU
	2n9s5VWkv/RWIbuYiQn1TS4TGD92tc06yGA+c2rdOXXAfb8RgXDyYpQyOhwGkJAH01oe
	zPkXx9qc/d6MtD6JjPQSEJ1Fvf/PVzcCD3pkjYQUEU9vRF8o3S/lIC4bwnmkv25FScsa
	L/MV/okJ0IJdiqEkmpbM76FvBOamcx1Z3aSWSfoJlrfcKGYHqu+cqgSRIbXc4u3qVpjk
	R41bUO6c87Vn8rqpgjRY/DzKrrr3REJLbADSJqRqVL87ZPFpfbvbLThQP2mMlicb2xkh
	NvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Wn03B8BiOobJTeRYNyOQ2m0XitQnZbLEOX2SdSCdlck=;
	b=gLuYvkz3/brAEqGkeg03K1BCOcyEQRSpSqC+4VwHOZzq1RH36jfB5aDo48t+p8B0DQ
	L9JeOMuKOa72nGCsPmN0Xj0Wpw6kIIURGduecfvV02IuL5k5+TzymGTxERzqGk8xozas
	8M9sSOX8nF387kSpS1nskSlXgxSCvyfIIkTbIBYxsMRLoBF5vVt4D0kFL+mxQD3nA3j5
	f5RzI+vof44+VVQZ1vuT/2Fa31KTrzvj7aLOoEB6GTrdN5vEFkh9W5SKWeOSkCrJKGIK
	5IORZOwvXkwL9ca9UsrApvKdUUmosQjddpZDRm+NWwVdg3y5xq47s3PKsUPE+nm9hjne
	WkMg==
X-Gm-Message-State: AMke39nplxaOxUvma4VgwnND9MiFLSAh7b16Aa3JrWrU0CwuIaOV+ccmTCro+JfP955MDA==
X-Received: by 10.28.44.66 with SMTP id s63mr2268183wms.77.1487937470842;
	Fri, 24 Feb 2017 03:57:50 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([117.136.38.150]) by smtp.gmail.com with ESMTPSA id
	p49sm10075878wrb.10.2017.02.24.03.57.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Feb 2017 03:57:49 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2017 12:57:31 +0100
Message-Id: <1487937451-29924-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] guile: fix a bashism
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
X-List-Received-Date: Fri, 24 Feb 2017 11:57:51 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

A following flaw was detected by verify-bashisms script:
......
meta/recipes-devtools/guile/guile_2.0.13.bb
possible bashism in guile_cross_config line 94 ($'...' should be "$(printf '...')"):

   echo '#!'`which ${BUILD_SYS}-guile`$' \\\n--no-auto-compile -e main -s\n!#\n(define %guile-build-info '\'\( \
       > ${B}/guile-config.cross
......

Fixed by removing $'...' from echo command, using a printf instead.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-devtools/guile/guile_2.0.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/guile/guile_2.0.13.bb b/meta/recipes-devtools/guile/guile_2.0.13.bb
index c29e752..bb73dcf 100644
--- a/meta/recipes-devtools/guile/guile_2.0.13.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.13.bb
@@ -90,7 +90,7 @@ guile_cross_config() {
 	then
 	        # Create guile-config returning target values instead of native values
 	        install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
-        	echo '#!'`which ${BUILD_SYS}-guile`$' \\\n--no-auto-compile -e main -s\n!#\n(define %guile-build-info '\'\( \
+        	printf '#!%s \\\n--no-auto-compile -e main -s\n!#\n(define %%guile-build-info %s(\n' $(which ${BUILD_SYS}-guile) "'" \
 			> ${B}/guile-config.cross
 	        sed -n -e 's:^[ \t]*{[ \t]*":  (:' \
 			-e 's:",[ \t]*": . ":' \
-- 
1.9.1


