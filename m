Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0C7DC7D797
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 May 2019 21:10:25 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l2so5254268wrb.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2019 14:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wTh8zu+ZpL1TWZf5Egha/mG4PAu9Dcd8Nyasu9HQ4GI=;
	b=VQnIz4Mqkm9pGj+jtjR2gmGiOQDniyDX5wKghJOAZNbxWpG0MYGzHIXddiNrp5JTk4
	QItxAPtlRCnSRq8OHP6nPs5+MutFBszTQHqG/2wVlcFxac8UqhVeGQxodN1/+POoq2eO
	rrbU40Nx46qsajk9xdbMhpAVYVwFS6J8oed3JuE6JMFDV4VSDncKjGoOS7mDC6iTOdgc
	TRpwhJSDXNlLa8phWVISdXeQMGpnJJ1NzL7pTEsYFoP+iB8Z2Hin4zaY+vcIpAaFvzCV
	3UL/EDAL0xJKzrwz0d/woO6+10XOowZ8P/wOWvhqcvNKiFUpJE3XKYP8TqtggO3bSaLS
	lxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wTh8zu+ZpL1TWZf5Egha/mG4PAu9Dcd8Nyasu9HQ4GI=;
	b=pNFlPsiEcKbJb2VM9wgJ/Y411snEgqtC218MoQWR9YGTpSw3kOHFApt5sQBMVbrTIK
	8KGwMR/vq5Btchchydy4bWEutwkv83kPkwWUTHRzZi6uSCaiMVeh7T+v0jQRKNFnZO++
	Rt0JsFq3N1+SLcQQrKRNNjk0smoyR2MX0SbwocuKPfu3wPRCBhygqI+JIm6VLqXT9eWf
	PIVmGzJEd+7Ty+cK2w2HuhErsQEcX7e/YUSoYmUxqsHQx90LxwjyHPpR8COFSygyHPCc
	8lwKeV05E4lUznDvcA/bKiwfi7EBJyt6qDa7C3CMp7Ti3mGTg194jgFAISi+RaZudwDC
	cpbQ==
X-Gm-Message-State: APjAAAXJYsWnxHOof4/milC5j0d3VJZxJP52bjgpRyFdYXw7IK8QCME6
	3QwOMezrX2ived/xuAMyr4LqZ6R4
X-Google-Smtp-Source: APXvYqyxRZNVn+gQaD5qaireQObqDcjtbdGW52xOlEp0AHebF05fjhlXnNljsILndqANs7ba9KdtLg==
X-Received: by 2002:a5d:51cf:: with SMTP id n15mr4104588wrv.104.1556831425713; 
	Thu, 02 May 2019 14:10:25 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id y184sm523486wmg.7.2019.05.02.14.10.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 May 2019 14:10:24 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 May 2019 22:09:44 +0100
Message-Id: <20190502210944.62696-7-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190502210944.62696-1-alex.kiernan@gmail.com>
References: <20190502210944.62696-1-alex.kiernan@gmail.com>
Cc: Alex Kiernan <alex.kiernan@hivehome.com>
Subject: [PATCH v6 6/6] image: call systemctl preset-all for images
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
X-List-Received-Date: Thu, 02 May 2019 21:10:25 -0000

From: Alex Kiernan <alex.kiernan@hivehome.com>

Rather than rely on systemd's default invocation of preset-all at
runtime, we pre-populate the symlink tree as part of of the image. This
is done late so any overrides of presets during rootfs construction
should already have happened.

Whilst we don't strictly need this for the read-write root case, it
avoids boot time churn; for read-only root we have to do it here.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v6:
- moved systemctl preset-all to IMAGE_PREPROCESS so it runs after ROOTFS,
  run for all images, not just read-only

Changes in v5: None

 meta/classes/image.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 276d0d31f4a5..a23403c0827a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -664,6 +664,13 @@ reproducible_final_image_task () {
         find  ${IMAGE_ROOTFS} -exec touch -h  --date=@$REPRODUCIBLE_TIMESTAMP_ROOTFS {} \;
     fi
 }
-IMAGE_PREPROCESS_COMMAND_append = " reproducible_final_image_task; "
+
+IMAGE_EXTRADEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-systemctl-native', '', d)}"
+
+systemd_preset_all () {
+	systemctl --root="${IMAGE_ROOTFS}" --preset-mode=enable-only preset-all
+}
+
+IMAGE_PREPROCESS_COMMAND_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd_preset_all;', '', d)} reproducible_final_image_task; "
 
 CVE_PRODUCT = ""
-- 
2.17.1


