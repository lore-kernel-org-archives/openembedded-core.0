Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DECEC88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 22:16:01 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50892.1789164951634588858
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 15:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ugQfoIVd;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso470445e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 15:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789164950; x=1789769750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=067A+DjUQf7dXPbO1H2XVLZbPTNE+AIDysJ6ehso6kM=;
        b=ugQfoIVdfZ0YDaiHwCFNOLr9kBUwEEc+n9IrjnHJFIYWPtwHx+CUYZQzP4auQXvAXV
         yH3uyiIpUSps7UdQMsG9kQqvCXB7lt46XE2X7xmQ6OuxP+Ht7PiWQTqow7ZTHrU+ThRi
         gZ+sex3zxMoG72P+C4Lgz12F6X+/JxAz/pBsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164950; x=1789769750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=067A+DjUQf7dXPbO1H2XVLZbPTNE+AIDysJ6ehso6kM=;
        b=ZO2kacjA1Esk4S0WUptIUEygcrjrBcnFdK359DIbqVscnk+FStfzJt4+mWSe73gva/
         y1DEr0IMTYAMmN6R8w2haSk1KgpIjLiZOvY9y0SLWJM+JVjNV5tVGrDsLfLe6OD/ob1G
         nTr0yJRdW9+wWQ4VQ2yb6ZnQ1OZgksRbXU9xQu7AqMc4KSqITRASgLOOibCFIUSwTHCG
         opXxCmyl/qqUtjQNdPAdvgmriuEnsO5KvwdKm+GC26EPgCi29vn0hZrBGcrPS7OSGsuA
         COEs7rVlM+2uU7Fy9TlfGJ+nJgKPu6eohYegcvV4bROTYb14X0xHbeWBNX0LXlLW4k5u
         a51w==
X-Gm-Message-State: AFuF++kbs6sz9XU0DrO7cyt2314PSgza7GlIfrKBnfZgzkuGtDPbcZTR
	7pmR8/iS2r7xZU6xPRfk7IHJg/ny6pfGiWBCgv3suk6c78Bxg1FqJUyZfMW10xU9DQI9pBrG1hG
	q2lA5KB8=
X-Gm-Gg: AYBFou3b/W2MILzWDoAXoE/6Ab429l77re+xRlrMyGMVadleVSN1tlNbK3VtooUoGdB
	QDwF31AvbNLC8N+y2ipGNUsAcJPwc/w8aiI6T89vYeuj/Mx0yIgaIuP/nk31rEhC/pic2ZWavtc
	1RvTxN8oT9/twAwQnE6c/ZIFMQBEGadu5C+FdwzYWt3+lVBEQeei+TSpbdBq8bGwdQrdoXY+Y4l
	eJKrQQsoW6UetzLW5jJlw6UoniQj/tJeBYOttcLhN7iqwj9pfn8K4CVzgUqQze2J0Du3aDuVtuR
	2hj7ViO53ytGjAkphduPUW9qD7mvaGkZVw7RKFnJPoaOOv9ulDW6j3fLN8YjUO/tFt/MP4i+CPZ
	2KrQlEhYy6crvuG61+0BjVDjteuayezkzfWfx/say4hCHbfA/ndLulkqv+bQ4CC0JDZgsdUgyuV
	agzWnyFS2rmSv+TgQgAjzoMciWZpjtQRIOO4jJYu9goRlpDcwuDqcmcCqRNdbn1mrTbNhpGxxfO
	rrOfIZiao4IpuH9hQWDyByygP5GawRKgETgC3GYPVxo+9pC6MfxrPBexmEaMwmNyl9gDmrrUhuF
X-Received: by 2002:a05:600c:548f:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-49e6caa69e8mr1359155e9.7.1789164949853;
        Fri, 11 Sep 2026 15:15:49 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm8434045e9.11.2026.09.11.15.15.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:49 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/13] libarchive: mark CVE-2026-14164 as fixed-version
Date: Sat, 12 Sep 2026 00:15:05 +0200
Message-ID: <b1f2c26126e8733439832f840621c3b29169374d.1789163914.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789163914.git.yoann.congal@smile.fr>
References: <cover.1789163914.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 22:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245681

From: Daniel Turull <daniel.turull@ericsson.com>

The RAR5 double-free in init_unpack() is a regression introduced
upstream by commit 620bdafa on 2026-05-16 and existed only
on the git master branch until it was fixed by PR #3071 (commit
1c914cdf) on 2026-05-24. It was never part of an upstream release.

The upstream release tarballs (3.6.x/3.7.x/3.8.6) use the older
init_unpack() with unchecked calloc and no early-return path, so the
freed window_buf/filtered_buf pointers are never left dangling and the
double-free cannot occur.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-14164
  https://lore.kernel.org/openembedded-core/0447ebc9d29b0736de8ba0c75f155ed4f880d072.camel@pbarker.dev/

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/libarchive/libarchive_3.7.9.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index b36632cc1fe..2eb22e2d61a 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -84,3 +84,8 @@ ALTERNATIVE_LINK_NAME[cpio] = "${base_bindir}/cpio"
 ALTERNATIVE_TARGET[cpio] = "${bindir}/bsdcpio"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2026-14164] = "fixed-version: Double-free regression in the RAR5\
+ reader's init_unpack() was introduced upstream by commit 620bdafa (2026-05-16) and existed\
+ only on the git master branch until the fix in PR #3071 (commit 1c914cdf, 2026-05-24). It was\
+ never part of an upstream release tarball."

