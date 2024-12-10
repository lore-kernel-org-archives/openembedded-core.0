Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E93FE77182
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 20:56:57 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.3952.1733864213750250904
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 12:56:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xharGWOE;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7fd4c0220bbso2796289a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 12:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733864213; x=1734469013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ma8RC9FSZGvZeJgLBO9uY62pAdBkZv5RCDUHTSTovUM=;
        b=xharGWOEkQ5diPp3nTFv8CO7bIf4tAndlrt2/F6j4z4rjG4L9cdU6JueGQwtbS5nPR
         9D8qesMJ4REC5UFzfwgAFKyM5Ds+cio5NUHflXykwlrN+w4B28cCG2LUzJiolXe7NyON
         n6ePC87+NWQPyZcgBDiIvJ1KIZHzia4AEMMxI7EwJ4LyvCcGzksgMiHUHpn66hr9j3Yw
         HV3XtsypLS4CG65L0KDwufDJtZevzTnpZLRBeKvWx8FegU2BFdelbp0Zp1i+Lt6qw7jL
         qhZsp+Ogy+19BZUo8yPSzEfYVesA7Ep45OmAgD7Q4M3Xd4DKSW26rHUcjMSkOGxyyKM3
         AIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864213; x=1734469013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ma8RC9FSZGvZeJgLBO9uY62pAdBkZv5RCDUHTSTovUM=;
        b=f3jHxge/tw+cHO9pl0o8psbKOQVKCLs7WYoWzKVEcCtPBvAq5/vE68pHknaAKmxXQS
         62WR4c50CQ3fG70fPXGfAjaNB8UfYch66OJxcvjZsZOEb2Eg+DhbrBHhFtKnbQfQwGtc
         /BtKBSs1xZGgzvk6P9RNqlNCmmYTZqUKaxJJJ9SF0KruLqIFoJciCCNtvUEMDqaw/JI2
         R7184P/RR2F5S83h36Yev0xzzRDBznz5JZgcZ0j7jbaEw662nAFw7hAwcK/FOuwfFwfn
         ygvHcZ7U5piL2ZBK+UwEO1exL7ShQq3bZOIHCr04AsW9G/BuJBYePLR9wxNkvPU6TeBM
         PeQA==
X-Gm-Message-State: AOJu0Yz11+s5Kt/a+Z4cEa8pibUk5z/77SRjclF3nwXoOu3spsalGO72
	VxMvVqU4D/+y6rhxgKedm6A1mU3yIYX0GnGk2OUSZFATAZ4/5zSd4wCY32RL+zCQ5I92t1LW0Bv
	W
X-Gm-Gg: ASbGncvk2ZezVXnfzvJ0QPHq0g3QPHrb0MjxFuXQI440HEVapgQupDeAq4vM8JIdtNL
	yZ8UzNYMmCVyGvBziS1dYjYxOzy7k9IV9pcqP0GgmXLsWoMizqh8dnmgmX7sslP2W7wvWVIHCrb
	Y3KlP6agFoig8uoP8qoY6eR7Az6UR4/tgBMtsGY/lwREXSzHy226Ryz7Lfjhv+bmJuZTN1pxDfc
	5wYfqaNSgSJeodP15m8ZHC+BrEbXKjxgM8R2gqkGxg=
X-Google-Smtp-Source: AGHT+IHMUM/d8MDb3xXlaezJckgWvZIr9+uFDncJmgDhDoCPJ8cbT/NAd0JcWl5wiYX4Vsx68cnuvg==
X-Received: by 2002:a17:90b:1fc3:b0:2ea:77d9:6345 with SMTP id 98e67ed59e1d1-2f127fdb4afmr636246a91.22.1733864213019;
        Tue, 10 Dec 2024 12:56:53 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef45ff77b9sm10245470a91.36.2024.12.10.12.56.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:56:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/12] sanity: check for working user namespaces
Date: Tue, 10 Dec 2024 12:56:28 -0800
Message-Id: <3577ceca39c7c3be81563de9ccf06a805f61d3ca.1733863624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733863624.git.steve@sakoman.com>
References: <cover.1733863624.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 20:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208555

From: Ross Burton <ross.burton@arm.com>

If user namespaces are not available (typically because AppArmor is
blocking them), alert the user.

We consider network isolation sufficiently important that this is a fatal
error, and the user will need to configure AppArmor to allow bitbake to
create a user namespace.

[ YOCTO #15592 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b6af956fe6e876957a49d4abf425e8c789bf0459)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/sanity.bbclass | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 1d242f0f0a..72dab0fea2 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -475,6 +475,29 @@ def check_wsl(d):
             bb.warn("You are running bitbake under WSLv2, this works properly but you should optimize your VHDX file eventually to avoid running out of storage space")
     return None
 
+def check_userns():
+    """
+    Check that user namespaces are functional, as they're used for network isolation.
+    """
+
+    # There is a known failure case with AppAmrmor where the unshare() call
+    # succeeds (at which point the uid is nobody) but writing to the uid_map
+    # fails (so the uid isn't reset back to the user's uid). We can detect this.
+    parentuid = os.getuid()
+    pid = os.fork()
+    if not pid:
+        try:
+            bb.utils.disable_network()
+        except:
+            pass
+        os._exit(parentuid != os.getuid())
+
+    ret = os.waitpid(pid, 0)[1]
+    if ret:
+        bb.fatal("User namespaces are not usable by BitBake, possibly due to AppArmor.\n"
+                 "See https://discourse.ubuntu.com/t/ubuntu-24-04-lts-noble-numbat-release-notes/39890#unprivileged-user-namespace-restrictions for more information.")
+
+
 # Require at least gcc version 8.0
 #
 # This can be fixed on CentOS-7 with devtoolset-6+
@@ -641,6 +664,7 @@ def check_sanity_version_change(status, d):
     status.addresult(check_git_version(d))
     status.addresult(check_perl_modules(d))
     status.addresult(check_wsl(d))
+    status.addresult(check_userns())
 
     missing = ""
 
-- 
2.34.1


