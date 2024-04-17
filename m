Return-Path: <wltu@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3D4C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 18:25:44 +0000 (UTC)
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
 by mx.groups.io with SMTP id smtpd.web10.21618.1713378338515766503
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 11:25:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20230601 header.b=SfA4CX8p;
 spf=pass (domain: flex--wltu.bounces.google.com, ip: 209.85.128.201, mailfrom: 3irqgzgqkaaiynvwiqqing.eqo@flex--wltu.bounces.google.com)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-61aecbcb990so38684077b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 11:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713378337; x=1713983137; darn=lists.openembedded.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wHQvyWM9E4XUPMqUp1bDzCt42ti4JsBMvAwYyXbo37Y=;
        b=SfA4CX8ppKo+r8w8IpU5QdeMKmMJBUvAKpvlR/h35fRG2YVTyqUiJLfkJkQ+mrb0eZ
         /VQR9XlrbkyaGShHo7zgZMMqbvc26ffCnKPQdRkY38ioygn8drxROW2sf2DdU9kE2gxi
         28amg4uWFS93L0IwwGFySKvPACAjOK0aZ7Rg1cTrkEwdALmf9ewBsFbLQj4000ckdOsB
         H3BwMcIhTZJIDgu8NXKhn0KovHx+hqFhOC5S7WZQ8iVLqk8WPlbgXRQSWe21LZTR8fi2
         DeH2CnpK7uC9A1TqLQz4lwmZwAPrHyyWT+s+SnHzaArm8Kr/6IJpzNQEIdoS9fS8163T
         XArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713378337; x=1713983137;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wHQvyWM9E4XUPMqUp1bDzCt42ti4JsBMvAwYyXbo37Y=;
        b=G8NUtC7ty90qNvrYzh+XDaJEQsNIwtFhhriiAmFXvZ5O4hpC99SuUW1eHBX6n017fd
         bTxF5i8c1TNjy2muWb/0VRJp/6DF830Hdcl+sWhA8VA7BjpurKQ3PdhR7+3Rc62TxD1k
         IQ4qGE80oaHjF8pBYrYRKObboXpyEBCjSnh66/njZl/J+TTAeJeyTEemTpm9igTvcZUa
         b8Jzzj/6YFFp8jb0j/zgN36Cl+HcKTBKgInKSXhVdgdOtexl3Ywr0LwcVNIJscilbhCw
         Kj4o2Flo+c24432IdkqJ53wOrSp5SLbQLFFqApljZJoAuYfh9H1zfjlj40RqeY2EqrDm
         xqgg==
X-Gm-Message-State: AOJu0YyRU9MhMcCsrGe1IUC2boXmlb26Dd9qqkI+NFMVL13LFoZ7A2Ju
	zzMs6wfBjyZKVT86R6KsCnzPmRoXNJCnk1Le741WR8CguPQMjbZ5JlerUArCtKFMwKbXKetI31K
	EgKi6JNgBfFLVtI6HJYDB6JBjcFbjuQ+yVj8Sc4WcyZSxSxEGUxMhOZ/eRD1uMU0OWNmaxynKpU
	bTgHLa4ydYRaSxpTe8CnMuTKhImyXZNUtQukwFevnayadeVQ==
X-Google-Smtp-Source: AGHT+IHtQxaldb9JYIEWaNVC7ZfqHsF8Q07v9KN+bDFz1A+f2Wef7LEO0aiYT6EtQad0lPo8JO1HhFFO
X-Received: from wltu.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:d48])
 (user=wltu job=sendgmr) by 2002:a25:848b:0:b0:dc8:5e26:f4d7 with SMTP id
 v11-20020a25848b000000b00dc85e26f4d7mr35400ybk.13.1713378337542; Wed, 17 Apr
 2024 11:25:37 -0700 (PDT)
Date: Wed, 17 Apr 2024 18:24:59 +0000
In-Reply-To: <20240417181159.100583-1-wltu@...>
Mime-Version: 1.0
References: <20240417181159.100583-1-wltu@...>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240417182459.102143-1-wltu@google.com>
Subject: [PATCH] rust-target-config: fix featrue for vfpv4f16
From: Willy Tu <wltu@google.com>
To: openembedded-core@lists.openembedded.org
Cc: Willy Tu <wltu@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 18:25:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198473

Based on [1] which fixed the target for vfpv3d16. Adding the support for
vfpv4d16 with the same set of changes.

Tested with running tokio which hit coredump before the change. It
worked fine after this change.

[1] https://lists.openembedded.org/g/openembedded-core/message/185702

Signed-off-by: Willy Tu <wltu@google.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 926b0630b1..330ad8a3f5 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -21,6 +21,9 @@ def llvm_features_from_tune(d):
 
     if 'vfpv4' in feat:
         f.append("+vfp4")
+    elif 'vfpv4d16' in feat:
+        f.append("+vfp4")
+        f.append("-d32")
     elif 'vfpv3' in feat:
         f.append("+vfp3")
     elif 'vfpv3d16' in feat:
-- 
2.44.0.769.g3c40516874-goog


