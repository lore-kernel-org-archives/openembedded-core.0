Return-Path: <ian.arkver.dev@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 48D8177D17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 09:21:01 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id o21so23199338wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 02:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Rs8CUepp3iyGU7QLsiC+M5+3fDOwrsORTnnK+eLzRq8=;
	b=vGXrHI8YYLkyeOqDleYez//UQ+BOolzYOc78DnpAi870L49h0nZATwuvQtBN3Ldd8N
	aU7KUlC1Q/XsqxA6iULJ3VhNbq2ZwKAPOxUtMnkFZ16YFXTJ5Ef14sYkvVYaqUDNIjHb
	ApPJKSb2ghdHClQkOcXCBLJCM/mQuzRccTEQgJ3C1g01nAa2rDp2Wsf7awH+T8HLnfJU
	LGCjNwM5ObGljjB9QQp9S8Xh4m6enrDfCDMkoZyZW9AkLplNJ3B0ChJy+e0s9wXwP+Lm
	jpPEavPhfQghr6abrWr7gaARvAAUb/RUacg9T4ZpweNsuEMKSuA75dSVzbWtHxCm2L/y
	Et8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Rs8CUepp3iyGU7QLsiC+M5+3fDOwrsORTnnK+eLzRq8=;
	b=PexgizQxMGWzbpz0iy7VetvJ4gMRGvOZ+iWF0OXEYjsWi9NUuNuq7EaXkzG+FEwa5k
	DelrbQMzB7/UPYhdOWhQqevm76vAG2/ILzjcsAFTFXgLa5leF/NYGKB8O9Xx485c9wKj
	aV+FkxWqk9z+SQKwPTScAV9aYUXIZfh3htetwubPH8bKEKT8j8LNnT0Mrj8GTRzJEdA2
	AfAwWjedG+h7OHv3aw89wShwtVzVNN3YtiV+hUPWjW1QnTaIwSIpJfLVBNheL/C4Lw9F
	f0ME5HcjYJHKzHTQ8RN7JODGI1djaD6smzv7NbdF1EtGNwJWJIbj7Vo8NHPK5ZvTitib
	nM6w==
X-Gm-Message-State: AFeK/H1caQ7DdEc/BQgcJgPwqF39A2QFz2Zylw2OICmUOzjawjrCoBBS8f6zj2saouXYtQ==
X-Received: by 10.223.134.173 with SMTP id 42mr48847214wrx.130.1491816063048; 
	Mon, 10 Apr 2017 02:21:03 -0700 (PDT)
Received: from devmjo0.home (host86-154-139-143.range86-154.btcentralplus.com.
	[86.154.139.143]) by smtp.googlemail.com with ESMTPSA id
	r5sm16643729wra.50.2017.04.10.02.21.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Apr 2017 02:21:02 -0700 (PDT)
From: ian.arkver.dev@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Apr 2017 10:20:47 +0100
Message-Id: <43e32eb47bcfe881ebf814a259cef24b58fa61ad.1491815602.git.ian.dev@arkver.com>
X-Mailer: git-send-email 2.12.1
Subject: [PATCH] Split feed_archs into words for RPM repo URIs
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
X-List-Received-Date: Mon, 10 Apr 2017 09:21:02 -0000

From: Ian.Arkver <ian.arkver.dev@gmail.com>

By default the feed_archs variable is split into single characters
resulting in very many broken short repo_uris. Add a split() to
split the string into words first.

Signed-off-by: Ian.Arkver <ian.arkver.dev@gmail.com>
---
 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 54a3c5e293..23bf51f168 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -552,7 +552,7 @@ class RpmPM(PackageManager):
         for uri in remote_uris:
             repo_name = "oe-remote-repo" + "-".join(urlparse(uri).path.split("/"))
             if feed_archs is not None:
-                repo_uris = [uri + "/" + arch for arch in feed_archs]
+                repo_uris = [uri + "/" + arch for arch in feed_archs.split()]
             else:
                 repo_uris = [uri]
             open(oe.path.join(self.target_rootfs, "etc", "yum.repos.d", repo_name + ".repo"), 'w').write("[%s]\nbaseurl=%s\n" % (repo_name, " ".join(repo_uris)))
-- 
2.12.1


