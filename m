Return-Path: <vomegaz@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 36E3A78689
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 09:22:08 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id w50so18085930wrc.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 01:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=+qXWrYnmodL+lEDJA90U13TCgjVNwypPRLcIKuLvJgA=;
	b=Iv1BwnGoN9gWJsd8XfpLIdEfCbTSeL5JRt959SGQXKbMGrJQOxOjZAacCTwltOlWgg
	NXo8hsD3yF7OEZsiGrHNRu8ycOH6iJKoJVZ0WukTAJdY91TY4Pf1rUwVjXRuvEdGutFW
	hqIwzG5+dDMS6z27//nUBmmY9F65RTDGkOYVZ8+nr27QuY91zd7GLSa3XADhT7dwdxSV
	hvqn0OcKDpkJlVAcDdy+Q7psDfRuO/PRWy7O/tYk/R2BsFfjLV9eTscgcc6556hZmLqI
	erJ9PunRjfwkXIzIOrWWlj6BaZh0L3yvEOn78RdRGrA5MxEwDFaG2vevoNGw0SwB+BqP
	qhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=+qXWrYnmodL+lEDJA90U13TCgjVNwypPRLcIKuLvJgA=;
	b=Ma/8Jn0erdr1V3sEm/6eqdn1Kva9BVdB7RBkp5ueWjy03JKg8d9USatiZoEnkprKD0
	F/XzQRqW5S/U87QHPqU1kCNVxUZ1cuENFJ0ViBHXh3E9tvYnTVTH3QkHhOGzZh98V3uX
	wlqxQLN/MPW5V/2m4nZFnkJddVfe1dyw6uY4l8DNgFMdgKGuPyIwVyGYF/VcJUHZ1N8u
	D3dsGZtuvdOZABOsYT0F+wR8zmcZah75umHcOm9yLD0e6mtyp0nQAq/SPtE59f+1Wjg1
	21okcomlOhBz4ZKV3nGNliINR6tPIsLn8UnYv40A468gZpng3voh1iAiEIs24KxdVY+q
	OemA==
X-Gm-Message-State: AKwxytcvbajniSDx+XlN+JLpdaZr6pO20+ODX+tWQ36MP2dUGCrMW0mu
	FtknHP3lO7GzxReAZWC0peVa9tAP
X-Google-Smtp-Source: ACJfBovNeWXU5MIWI1OGHzixgAHMHA/9y6nyEqnPrNAf0Z5NhmRi/y025WJqPvL1JZxCqLUsgZoezg==
X-Received: by 10.223.136.154 with SMTP id f26mr2036733wrf.200.1516180929545; 
	Wed, 17 Jan 2018 01:22:09 -0800 (PST)
Received: from sgxcmp483.sigfox.io ([217.114.201.133])
	by smtp.gmail.com with ESMTPSA id
	l142sm5228449wmb.43.2018.01.17.01.22.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 01:22:08 -0800 (PST)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jan 2018 10:21:59 +0100
Message-Id: <20180117092159.19356-1-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] kernel: Use KERNEL_IMAGETYPE_FOR_MAKE in do_bundle_initramfs
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
X-List-Received-Date: Wed, 17 Jan 2018 09:22:09 -0000

In the case of a fitImage the this step should be done on the
image use to assemble the fitImage.

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index c42f85c665..ff09d4c4c7 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -231,7 +231,7 @@ do_bundle_initramfs () {
 		copy_initramfs
 		# Backing up kernel image relies on its type(regular file or symbolic link)
 		tmp_path=""
-		for type in ${KERNEL_IMAGETYPES} ; do
+		for type in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
 			if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
 				linkpath=`readlink -n ${KERNEL_OUTPUT_DIR}/$type`
 				realpath=`readlink -fn ${KERNEL_OUTPUT_DIR}/$type`
-- 
2.13.6


