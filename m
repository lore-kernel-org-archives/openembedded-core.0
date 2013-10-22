Return-Path: <mburtin@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id AD9446D065
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 09:45:30 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id h11so5276324wiv.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 02:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=/envdWNjNT3la/vmH3MGAsoFzql4uXuq4lMk2EVYSik=;
	b=feXfVpj8KFON4dVEwLVVkgdew0bqh+2AwrgJ81QzToIHpA7S1paerzHypN0TJvmpzH
	hNz2b20ADty3xFFwUcGrllSVHum9+CV0PTjM8YejDYhsr4OkVBs4GQ+muEyHQuewuLdA
	wCAHuvnPyvClgVw7IRqYyFYZecHQ/mUAVT9a6BXkUoykL1toLltIMKK5T8dxwV/fuKtj
	t8nCWZwy71fZ+KSQmfoIT9XgHM3wbKySeheLGZmpSBn8+2rWBcZHgu9JRvZBAmyvl6US
	hWhQX27UDY4ZkR4FlfpXUE7iuJy6wdffJHKMK2FwPjGNA8ThWeA/ggoPXsmTmH82VZl0
	4pFQ==
X-Received: by 10.194.95.72 with SMTP id di8mr653053wjb.74.1382435132123;
	Tue, 22 Oct 2013 02:45:32 -0700 (PDT)
Received: from mburtin-desktop.mpl.mstarsemi.fr ([94.103.137.126])
	by mx.google.com with ESMTPSA id pi6sm4616432wic.3.2013.10.22.02.45.31
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Oct 2013 02:45:31 -0700 (PDT)
Sender: =?UTF-8?Q?Micha=C3=ABl_Burtin?= <mburtin@gmail.com>
From: =?UTF-8?q?Micha=C3=ABl=20Burtin?= <michael.burtin@innotis.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2013 11:45:17 +0200
Message-Id: <1382435117-5375-1-git-send-email-michael.burtin@innotis.org>
X-Mailer: git-send-email 1.8.4
MIME-Version: 1.0
Subject: [PATCH] initramfs-framework: fix test that filter backup module files
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
X-List-Received-Date: Tue, 22 Oct 2013 09:45:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Test that filter backup module files (files starting with ~)
was accidentally reversed in e6039e6e3b98d6ab91252a5012d76279b1fac6e8,
this patch restore initial behavior.

Signed-off-by: Michaël Burtin <michael.burtin@innotis.org>
---
 meta/recipes-core/initrdscripts/initramfs-framework/init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index 20774aa..95fa9fb 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -103,7 +103,7 @@ mkdir $ROOTFS_DIR
 # Load and run modules
 for m in $MODULES_DIR/*; do
 	# Skip backup files
-	if [ "`echo $m | sed -e 's/\~$//'`" = "$m" ]; then
+	if [ "`echo $m | sed -e 's/\~$//'`" != "$m" ]; then
 		continue
 	fi
 
-- 
1.8.4


