Return-Path: <andre.draszik@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 78C817319C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 11:09:29 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id f93so5215252lfi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 04:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=v2D/b9babnBuN864sVKsWCYlWBoku3kqK2mm0Ed8g9c=;
	b=GRQdw1s7U/oMipORJADquw+RqolgdmKuLGt4d4eQMmEKEwymPlmgFaD6eRxQ1oi+XB
	8HAD2Io476NOA6mtIh1K7l56OQYvvZRmrgGCuTG0qnsR+qFKHM5o8kC2Tx4QOCFZ4O0D
	I2SPQZOE4lO/Q6Qe9VNT1lJ3tgqiEGz3qU1xg2mjjck6ZbvVVXvUN6gaYCvT3pfixxkw
	TBmxW+P9RPgiQuA8u1fbXvO4GEV/7bqyAy/6HU6+1Ur3hPFb5ox+zFEfUth4o9Jm76mz
	gi0isZ0XD+gte0KFsBUbTCgB5SYYS6/HLoErotMO/128RptdnZS30qyc260hSs3GHFRl
	KdrQ==
X-Gm-Message-State: ALyK8tJCFUOd16jjEX/ReTobqvkD/2WsIDsvxjqAWxgWS26bCy9FYXzlz5Sv7/6w8A9tSQ==
X-Received: by 10.25.218.7 with SMTP id r7mr10705842lfg.161.1469099369362;
	Thu, 21 Jul 2016 04:09:29 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.65])
	by smtp.gmail.com with ESMTPSA id o36sm1596598lfi.5.2016.07.21.04.09.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jul 2016 04:09:28 -0700 (PDT)
From: git@andred.net
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2016 12:09:23 +0100
Message-Id: <1469099363-23192-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] kernel.bbclass: explicitly set workdir in do_bundle_initramfs
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
X-List-Received-Date: Thu, 21 Jul 2016 11:09:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <git@andred.net>

bitbake rev 67a7b8b02 "build: don't use $B as the default cwd for
functions" (included in current bitbake master) breaks the assumption
that do_bundle_initramfs runs inside the build directory.

This causes kernel_do_compile() as called from within
do_bundle_initramfs() to fail, as the former is not being executed
from the correct directory anymore. (Note that kernel_do_compile()
as called from bitbake directly doesn't suffer from that problem,
as it inherits the workdir from base_do_compile() in that case.)

Set workdir explicitly.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/classes/kernel.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a56b66b..fa76a14 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -246,6 +246,7 @@ do_bundle_initramfs () {
 		done
 	fi
 }
+do_bundle_initramfs[dirs] = "${B}"
 
 python do_devshell_prepend () {
     os.environ["LDFLAGS"] = ''
-- 
2.8.1


