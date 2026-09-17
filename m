Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D41CDC982D9
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:07:53 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1553.1789682871810049853
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=In94UOjd;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so686325e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682870; x=1790287670; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jeDsP/cNzkyjIl54CbRsreT5mJwaLKHx9NeKVRraxWc=;
        b=In94UOjdFITE+3XPmkKL190TJpRUJwx8HDu1lOlID+9pzpjmRDbo6cNoA9GJ8ZRx4g
         Rw9ejytAt+J+yP4fJT18CCP4HWTZshm0DOrq5qs0RAB4lsVdr3fuTxtelFdB8LrP4AUJ
         gcpVKpkLAO22HBs2z2w5De2C1WV6aJk2H9phU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682870; x=1790287670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jeDsP/cNzkyjIl54CbRsreT5mJwaLKHx9NeKVRraxWc=;
        b=d4tBuaTyNw5fHmtEWy2+UqLLlBjIyWSww5+mOqE2KM+klkOOjpwnRY5Uk4smh8uucT
         Ml2Uv81wgDPuM+agkkbQKgIKJGioG0F+BPhzC7apWBDba/evTY+WrE3JL7xnMqouQZ3Q
         VVfetYwGg8dXISYipOXDfYJ2cOwV+44r1aF4Z7GisrO60nWr7eBVCBfdvn3/31UDA469
         AHnjA3xEVBBhtUOx0eWJDW0OU+2uOspLxfDIQLJfzptDrvYMaq08YRO9VkBZzxZiNC0X
         fznrhq42Nq4oD0iI7kyVsQ1jgKie3QOCAT7cDQ6Zcczmc6mCijAcKF7VstjSQ/55nxny
         HXgg==
X-Gm-Message-State: AFuF++m0tJnr1kNqc1bdiFeJJLfOl9aoGgmgxIk9/ocD7QFeTf61KtWX
	1UE8mcqZKypcEkHH1MVbtRHN+uSb4Sa4rDrvoezzIwMlnYwBA1A+C2NcUV+h8YWppTq5nmY3Aeg
	9ys7CYkg=
X-Gm-Gg: AYBFou0vOAiMIeITJseqYRgEMtLmTfkIO4nM8mTgETxNOfrFo4PvzxLWnYr1BpH2Ibd
	RauM9HmOs1tgCc/KLmaAVuyUYXcakc4jKQmyN0H7tScl8kFiCCpB9tJC+BRrMBz7CFrfE8VHUDr
	FrKN01hQsCGzvYNdUs0STar/KI8oFkjyNHxr35rJ4ZJTiDgMKK4Vaugy9lOejHlFVpW2Y/nRzmd
	uxGwu7aB1XwuStc6OB+BQy2AiGxNRIYmDhpZmHbCsmgLAd3uFTt8cpmQqBX0tuXSPHwodu9Sqpf
	oo2CJE2F/MKsPDbFL8tBZbP3QtHejfPEQYZH/h+NQXYwDiN5q6tow6pZt3HPA8Xt4qCcrhR2PKv
	d0qinA8/02VlullQpX6fJ5q8Wq2FyQAZTW13ilpKtUd6rxP54cEQwoD7qrAQs89zqRy0jWhfNec
	BSxVoeuIB4BQ/jxCMjuViOQhvWBEhhH9a+NmLdHbvzMb+fa0kY4PX1XaD2opEzKhLnJQYy5j8E+
	NgAK8El/13LNOikbl3XAhEzd0Kv0isuODiv+StANYzspyk79Jq2AFbfeMfdsnQqCHDxN7kTOCY=
X-Received: by 2002:a05:600c:46c5:b0:49e:6050:9fbe with SMTP id 5b1f17b1804b1-49fc573e80fmr5494615e9.15.1789682870158;
        Thu, 17 Sep 2026 15:07:50 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.07.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:07:49 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 01/79] rootfs.py: fix run-postinsts removal on multilib images
Date: Fri, 18 Sep 2026 00:05:46 +0200
Message-ID: <ffe8d0d572a9aab1a8c5a36065da0ab5b2ffc176.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:07:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246095

From: Kyungjik Min <dpmin7@gmail.com>

ROOTFS_BOOTSTRAP_INSTALL in image.bbclass unconditionally stages
run-postinsts into every image. When no delayed postinsts remain,
_uninstall_unneeded() is supposed to remove it again, but the removal
call used the bare "run-postinsts" package name without applying
MLPREFIX.

On a multilib image (e.g. lib32-core-image-minimal), the package that
is actually installed is lib32-run-postinsts, so the unprefixed
removal silently matches nothing and run-postinsts leaks into the
final image manifest, along with its now-pointless init script /
systemd unit.

Expand MLPREFIX before removing the package, matching the pattern
already used elsewhere in oe-core (e.g. oe/package.py) for
package-name lookups that need to work across multilib variants.

Signed-off-by: Kyungjik Min <dp.min@lge.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dfa5673907bdc5211671ecdfce8ab1fb332eae48)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oe/rootfs.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 7ef7e71f9e1..3504762b7ea 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -267,7 +267,8 @@ class Rootfs(object, metaclass=ABCMeta):
         delayed_postinsts = self._get_delayed_postinsts()
         if delayed_postinsts is None:
             if os.path.exists(self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts")) or os.path.exists(self.d.expand("${IMAGE_ROOTFS}${systemd_system_unitdir}/run-postinsts.service")):
-                self.pm.remove(["run-postinsts"])
+                mlprefix = self.d.getVar('MLPREFIX') or ""
+                self.pm.remove([mlprefix + "run-postinsts"])
 
         image_rorfs = bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
                                         True, False, self.d) and \

