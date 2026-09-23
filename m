Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE69EC982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:12:15 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2840.1790154733746531338
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VnPOtyrA;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso2018265e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154732; x=1790759532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BmREq0njeEq7KfZ1Nu4DIz0g5GRYWBE8x/MT63tSh6Y=;
        b=VnPOtyrAqzesZssWFLZNZ8IzFnjhJ/CaALw7mQUdGAUiMGpzSxfMkNY1vf7+kVbdj3
         V44k9NPJiRIv7h1JsJRXow/zQPXtBO+DD5FiJ/XvW4FrTFyI6/XARkKCj3VejW6U20rb
         1oT8V1uTmsxuWYXSqZHEi3RZ4m9iewRWg9mjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154732; x=1790759532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BmREq0njeEq7KfZ1Nu4DIz0g5GRYWBE8x/MT63tSh6Y=;
        b=aH9Vr7CWO5vajOFKI+FRBEU2aseIsIT02XWgRthea9T8LNUOy2w/FvHF+BIGxkVtjS
         01J/FSfjuRzxrVndcrQMEGwvGxoZUHgz1w2tzGiAY8a42ilJBay5I+XuKzN2H+nbIs4r
         Rabdksb1W0f6xoW+52fc0ZWKRVrsyTQemP2Jj10B77hmVTehgqC0MQxHKFLwklEQRDGb
         NuJ5BSe4pPSNZ9D2/OVffWtnuTMdOx+yrRFMmEbv3l+8sNxwK3ajlIsjzgolaHvHEfvl
         2EFqP/exkCPocq9U9LHAYtUJvOHjWjLbJzEOgGo2qfml2RadwHVZ3EX+yPii4tbgn4pQ
         8sFA==
X-Gm-Message-State: AFuF++nNuUQib+issfTw8T9IEZu9BmG5YZH12SOVLypB90Ms4Mx9ANKj
	7uzy/8VNsptyeGVqxnnUSYJWbaVOznEELfEcxSRMgfGyuFUHx+2Fp/TjmsGuXgyjB4pEGh2p1fE
	6rMs+3BI=
X-Gm-Gg: AYBFou3UXlWk6X1bIWWjpaSLRdRp5NP91oCdXmbAItzRcC/VSMKu76HjMKIPDZRKRWM
	c4lWGK9X6qqojQG/WNGdd9Sal9RGvme+QuXTOd9uoi4Fl81eTdgEnEKP/hJ6M8iIpXT28XsgGZ2
	CbOmHDDIKbtNxFj8tozpkgPGsYykNwExw+SK4DMFsSNgY6fe7emVAUjwrOqwYRkyzauHEFUjChp
	h2MiutnXGcs9ZT6hWnlzGhcSeqcliTejtMw8qdDHjLeJv9P4OdhffyMKM2bH2HXrnptwwpbnBvq
	vW8mxv4Iy849twpTmAe2iHTM/ua+vTV2XLuF3ej93o6ipBzFBKI8szGEt3E23FSa/O/w7GZYQlD
	tpNj5emZFLSRHHq6EXJM7DPzmX33VXxC3mMbvZgdMcmM5xyBjHsxkwc2exbjw8mIfzAYlrarY85
	rg0VMwZlys94T/fddqPbn+Ygpka04suCshOMatQgB2T8gFhoQEPhMyyqnZJfgD3lv4BRalzcdmD
	NFzC4Jgpbv5ZC307k4Oz00J3og1shFP3NqjoEaZFiUeHKr9hs13C8iimFySyOn662HyIpVx
X-Received: by 2002:a05:600c:6087:b0:49d:2936:8ad1 with SMTP id 5b1f17b1804b1-49fde360163mr33542035e9.1.1790154731942;
        Wed, 23 Sep 2026 02:12:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.12.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:12:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 41/48] rootfs.py: fix run-postinsts removal on multilib images
Date: Wed, 23 Sep 2026 11:10:43 +0200
Message-ID: <2522a1ad4fb66af0a9ca146ca7a88aece8f471da.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246503

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
index 5abce4ad7d5..e8e6841113e 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -266,7 +266,8 @@ class Rootfs(object, metaclass=ABCMeta):
         delayed_postinsts = self._get_delayed_postinsts()
         if delayed_postinsts is None:
             if os.path.exists(self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts")) or os.path.exists(self.d.expand("${IMAGE_ROOTFS}${systemd_system_unitdir}/run-postinsts.service")):
-                self.pm.remove(["run-postinsts"])
+                mlprefix = self.d.getVar('MLPREFIX') or ""
+                self.pm.remove([mlprefix + "run-postinsts"])
 
         image_rorfs = bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
                                         True, False, self.d) and \

