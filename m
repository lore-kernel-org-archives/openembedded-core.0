Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC8D73074
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 14:37:10 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id j90so29047265lfk.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 06:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BpFAxIuRxhMvLWoe4sNUauKmdFcXFs6a+WilcWqvIq8=;
	b=tc5f0psAri0NsWzPiZrCl4q7QTPabvsLJt05yKac/FrGzVTgxGPOwzl5h3H8R7A0gX
	8dE3m2s8BIIa2IYjG8yQNdkY/CcF0mS+nJbRV2qYBQzKs0mfXM2+O/FI+up2IrzCIDgE
	yZFk5cVNenkZbsBxx8qzt9HK/ka1xMo+pSdo2lVB2+ibs9V8ZpceFKvmpdRwCFRuIXXt
	899gOAbKBUsN0c9vaQUTRnD1Kk4CXgFDUKE0s3LMUZV7g4cFx3BmW2sykwgcTq9/BWkw
	nWvoeBhaRi2RnIikWanv8V1ZeCoD9GO6J0Ukc6Y8PCKZMIDz9YAoTSejmI/5YBV7tsD6
	y/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BpFAxIuRxhMvLWoe4sNUauKmdFcXFs6a+WilcWqvIq8=;
	b=bmbPqGhS28EonXBpG2y5v43eAE6iFi2kvws+Gu73XdGgSYSzL+p4QRtnJrUHT/emnj
	IDh/XuXXq/+Aumq63Qh7BtXVuYGo9NgcdhP7+g9s4885Cz3N/ozy5qTPZaecxWrcVLnK
	ijtwuGrxoOeMmKsmcc/9Qhs/myHBdP3Z7qNKRjHUNJJcrzMXSpj3wMaAoyd9sYkxegZ0
	z306WiThXFPqJeu3OidHQm8HCBpuYgelE3hwIS/c324P5pkwPJu/6kt3yvCEwIvr+reQ
	ihbPIPBSMDdZ6Vyj93wIr1ekzw8PNDyq4q4G5mLVL0oFjwvzgtW+6/QF3H99Ct8fIbsZ
	KDYw==
X-Gm-Message-State: AMke39kfFkTPL+aV+B1pPO1YfHZqSCX3MQl/oLCgMiW+AFpMacljjuNnwMGEAVuS0KGr2Q==
X-Received: by 10.25.193.8 with SMTP id r8mr3028793lff.127.1489070231897;
	Thu, 09 Mar 2017 06:37:11 -0800 (PST)
Received: from localhost.localdomain ([176.111.205.58])
	by smtp.googlemail.com with ESMTPSA id
	191sm1293394lfz.44.2017.03.09.06.37.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Mar 2017 06:37:10 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: ed.bartosh@linux.intel.com
Date: Thu,  9 Mar 2017 15:37:09 +0100
Message-Id: <1489070229-12809-1-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20170309132820.GA9232@linux.intel.com>
References: <20170309132820.GA9232@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] wic/direct.py: Avoid exception if using multiple rawcopy/no-table entries.
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
X-List-Received-Date: Thu, 09 Mar 2017 14:37:11 -0000

If we are both having a bootloader and a U-Boot environment file, we
can end up with two entries using "--source rawcopy" and "--no-table",
and since they reuse the same file [1], their cleanup handlers will
try to delete the same file twice. So make sure we only do it once.

[1] Although they reuse the same file, the resulting output is
correct, so it appears the file is accessed in properly sequential
order.

Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 481d24d..67450a2 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -548,7 +548,7 @@ class PartitionedImage():
 
     def cleanup(self):
         # remove partition images
-        for image in self.partimages:
+        for image in set(self.partimages):
             os.remove(image)
 
     def assemble(self):
-- 
2.7.4


