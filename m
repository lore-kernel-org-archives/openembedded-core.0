Return-Path: <ian.arkver.dev@gmail.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4755372F4E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 10:50:27 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id z109so5970172wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 03:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=+ZQuibmKFC7L3PWDDrMlBdOwirfLi7khzX6zK7Q9WCM=;
	b=XBc3LjyNpaXILiGV1mLZ8uklgzPTM1ARqNQnATZPgiRj/GNmcdaKuyYAUAJu29m1T/
	IeaiDosnMHnPjMK75FZmjKQNs4whe4EFQt726Tj+5dkWmV6BNXqxiJgc7axERRVb1Nii
	ZoAEQqC27u/GWNu1IaJb0CKrtqoT6c1b1rZNA6TOKi8u+J4V3d8qg+39fIVY5Knl02t0
	QF7E2VV+z5nAH3kCMpDIVSm68Nh8XQ4kNh2XWfs7G/zvupHNKFlKN4mUhRv5RKU2KYaG
	lvgq7/xiKFEPh+3WEiqd0VTmJFpOaF/csGaeDv3PUw/x1SlIDW/lK/1o8nNwSzFsHn5V
	Cvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+ZQuibmKFC7L3PWDDrMlBdOwirfLi7khzX6zK7Q9WCM=;
	b=Wp3fO4a/jOMK2SFMKR0y0RA2LojdolqhP1K7chQzi3ZlsNb6ubzIdNm7qdkd+igqOz
	OWnXx5QSb2Fp42M5kvIuHXZbo8fEHuqA61QA10LyV6VG6MxnhJ3RHLPCBqzl9Ywi3DOw
	6fsU+9v5UsftLU08nlDAJxDfsLwVb6S6upe8I9S/BHBOXJ8HHdVRpFjGQzNmFeJwZ9mt
	vqjDyvv50zyq+8zwVuRA03vfiHFrNIZdrUgOl96/sx7zLQhXvsw3IcZ2799D0vr0jvxH
	NAL+DtTQ9K4zZWvo0Ik/DrfOgML4PY4oZPJEC01d+Ts8dgUDTw6tYy3/jJkKT4RREPDG
	QjRQ==
X-Gm-Message-State: AFeK/H3ZgsqaOFist69UXtU+78wcbJl7DoZzpj5Y1MXShh4A4J/K6GlQc1MaY7NYBK5l8Q==
X-Received: by 10.223.155.130 with SMTP id d2mr47108077wrc.67.1491821428799;
	Mon, 10 Apr 2017 03:50:28 -0700 (PDT)
Received: from devmjo0.home (host86-154-139-143.range86-154.btcentralplus.com.
	[86.154.139.143])
	by smtp.gmail.com with ESMTPSA id 13sm3723080wml.25.2017.04.10.03.50.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Apr 2017 03:50:28 -0700 (PDT)
From: "Ian.Arkver" <ian.arkver.dev@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Apr 2017 11:50:14 +0100
Message-Id: <d9575348767b5cc2eff473df044d6d3dc6e40596.1491818427.git.ian.arkver.dev@gmail.com>
X-Mailer: git-send-email 2.12.1
Subject: [PATCH v2] package_manager.py: Split feed_archs for RPM repo URIs
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
X-List-Received-Date: Mon, 10 Apr 2017 10:50:28 -0000

By default the feed_archs variable is split into single characters
resulting in very many broken short repo_uris. Add a split() to
split the string into words first.

Signed-off-by: Ian.Arkver <ian.arkver.dev@gmail.com>
---
Changes since v1:
    Change shortlog message to meet style requirement

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


