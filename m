Return-Path: <eu.smirnoff@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id CF712605BE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 11:16:16 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id l10so5412571wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 04:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uq9d1t3i8QPtvCtBXNh0bJI3xv5U87WFg4Q+Zd0ttJ8=;
	b=bjvUD8DvhNSZXsnFnALpv7izUI9hfe90d6h+h5wF7PLjBI+/TdX84pQP7jJAM/VVc6
	NZAPvMmYjNq2eYL/bKbPqAJq0QeawJQW/zAqILlx5Y8k+zNByHZOFKEnmmp/xkcO6Mb5
	zCGPPMULL9AftvMFTD8ydrM3e+TaNsldzj47072+3HiFuybem/MzYqxDi0kD/JQjULN6
	wwJ9ZFfQMVyikb5Vc62k/k6/UhPQKVtQzmP+rjpn92Xtvob/RGDyT7PCQi5PDcw1bLcc
	2AsDNZPumzwpYAvfC1ZVmXBrA+jCznoEYQbsaS+LUxHGev//cJSMWfiZJUn6xMXuBq8j
	d4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uq9d1t3i8QPtvCtBXNh0bJI3xv5U87WFg4Q+Zd0ttJ8=;
	b=OSKDYQQ4fe0U8KqIPi31B1xgXVEyaBR1dCzqzDxXx0zOilF0/tjH062IiXe7B73W+g
	qOVB3HOXVtH9em+abhMVAcvX3yPJabvWKcAfDqKfJkyxfDuo0714f6dvzvNewRdiakfo
	91u7yAO//oLVPtXOAu7Cb3SxF+U/pjFdxf+vihP+dezMJ9OK81Iovsa5Eeykh+7wcpXr
	KuODyDLwShyM49cVSGNMcvteiDkrz0WyrJgJX4w7p1Ls3KS3YPgu4riwlyEXr4VUDt35
	T5pwGyQcnA9ZV71RnairmM0DgF3Muvpl3uDwSt6nuJfn+v6ITz0ZjPpY5mvLEQ83cEWD
	vVzA==
X-Gm-Message-State: APjAAAUAJsrCqOQYvHhRMgPXi8mjQZGI6t43ori2b61V3RyDp9/Po5Sq
	Skd05MYtumswN3dmabnIgVYXBkl2
X-Google-Smtp-Source: APXvYqwaZIUd/2vci1WHftVZ3niYrwfaqlBFEK91TrFYx6rc+IFr6d8npy3sGeCCDAEwo1hh+sG1ZA==
X-Received: by 2002:adf:9b9d:: with SMTP id d29mr6601159wrc.293.1571397377018; 
	Fri, 18 Oct 2019 04:16:17 -0700 (PDT)
Received: from esm-laptop.ad.here.com ([131.228.216.134])
	by smtp.gmail.com with ESMTPSA id j1sm6953894wrg.24.2019.10.18.04.16.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 18 Oct 2019 04:16:16 -0700 (PDT)
From: Eugene Smirnov <eu.smirnoff@gmail.com>
X-Google-Original-From: Eugene Smirnov <evgenii.smirnov@here.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Oct 2019 13:16:14 +0200
Message-Id: <20191018111614.21570-1-evgenii.smirnov@here.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Eugene Smirnov <evgenii.smirnov@here.com>
Subject: [PATCH] wic/rawcopy: Support files in sub-directories
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
X-List-Received-Date: Fri, 18 Oct 2019 11:16:17 -0000
Content-Transfer-Encoding: 8bit

If the source file is located in a subdirectory of DEPLOY_DIR
rawcopy will currently fail in sparse_copy function on
open(dst_fname, 'wb'), as the parent directory for destination
file does not exist.

This patch helps to avoid that by recursively creating
parent directories.

Signed-off-by: Eugene Smirnov <evgenii.smirnov@here.com>
---
 scripts/lib/wic/plugins/source/rawcopy.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index df86d6729c..82970ce51b 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -59,6 +59,9 @@ class RawCopyPlugin(SourcePlugin):
         src = os.path.join(kernel_dir, source_params['file'])
         dst = os.path.join(cr_workdir, "%s.%s" % (source_params['file'], part.lineno))
 
+        if not os.path.exists(os.path.dirname(dst)):
+            os.makedirs(os.path.dirname(dst))
+
         if 'skip' in source_params:
             sparse_copy(src, dst, skip=int(source_params['skip']))
         else:
-- 
2.20.1


