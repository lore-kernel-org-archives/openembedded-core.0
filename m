Return-Path: <dpmin7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A8DC61DBE
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 01:02:50 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26877.1787792560203675275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 18:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=i8Z5NBE3;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: dpmin7@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3968e063f84so795461a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 18:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787792559; x=1788397359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ltm3N43U7fMPdtwHHsCwZKlxve89ELpD5Y0OW3ybX6s=;
        b=i8Z5NBE3yUDNw5ixFunwmh3W9Px7FFsjMW81RlXvv8LAXZEr2JbqNfZvtMb/t5PEo6
         0CEPaJMV6xdN7ckarrSbngj7R4AM/58eaUhyGrj/LnhZjJ0xsQzitV9DjUJZYzph5SNh
         Is1Vyzs7+FPshTmrm/oQA20C0FesexkzEf/3nsSqBTA6rtWiejxTzAiv3MnjhfKPI8q8
         RHbCLEm6szQ7t22IB/UxWD3iQ6dYqFLxo1wfCTkX+C/IBQU9RCSy4iNyNrVWCvTicyTa
         NifKpYGot9l66VQxSxaIC7V3BrOEq0ZrFoxkaaE7R9jnLk+Tkx8T96aBuU5itxsMi2cD
         mP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787792559; x=1788397359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ltm3N43U7fMPdtwHHsCwZKlxve89ELpD5Y0OW3ybX6s=;
        b=hL6jOz0WP7z90Rq7FRtP+UIWHhc4fg1u4fBfMbJQYlBULy42XQXsgKGbYLXBAe1X0v
         hIiOr1C4mjtfiAmoyWO4Ykx6fEfMCP5sPJKLH81tA4SpxlELE+fDv31eifNOg4YmPV3X
         9TpRJuYbZZnL/mX6f0Ky1zGTHdXM1uoyzmyPg0nMP1jj8lebtvwdqHUMq+YhPSPrEpC3
         S/BACDxiY5EKf3yjzU5NQQnVDZnbi8BT20R9F2U8zBIH49PWtZmKfkLGtybnLc6aeHAe
         ycgA9mi9YxV+LEpbRajaOK6ZaXQL6LpXpHBEEX9xhef8cHQ79QtoGe5h/OORAwV7gUiL
         srzA==
X-Gm-Message-State: AFuF++mJ7ZHQozew0L3PPDbGmX9yeixe5KsmvtjNjxJ/TIxyydIElDeo
	btg2yqNJ9dBWkWdFiUguv7RgTz6dj5FsMRVKGbMk0P9xEWO0M02l8GtaW1H/TQ==
X-Gm-Gg: AR+sD113taiQarQU3LgZQR/AiSDNP8RwPdpMXXEwNiqMq4bYx9PYnTMXFH3F1plX/qH
	Qsv6o6ujxr7DVuj/fIhbLJce/YUlBD3zPpnLmrrEYl5fUu1V1D0DYKzgk3+faKG8YA9orngWZT5
	UHqMpfFkMkWE5dJ5W1KoaIwyzCP4ccMAhirUm3o9tFMOgLmS48OjVD3eszvQwE5GlTCvysxQB5e
	wwmEWGdQWDl6dxzWArFCKt5RXsz4s3J2Z2j0xeqy0IHJN/Evkw+tRrfUS6t/xT8m/ZfFUVnatkK
	kyp9Hqc9F/QrE2azdsnaRoMnqDEa0Vr6YWs2BTV9FyLD+lJ1deIauAL/VhUZ2DQqbFA3/8tyE4V
	C+PCPZMmHgtFkStcBBkr+xY3JtCWQmy49Q3SNh2kXomkJPNVbeZeR2fQ7vSLsdAynj3WLvdThhM
	0VVuW+pHPsSES9LE4V2ZNBjanc6Zx4qmr5bffsNLgXaDCJ0jKO
X-Received: by 2002:a17:90b:3ecd:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-3966d21497amr19889879a91.8.1787792559088;
        Wed, 26 Aug 2026 18:02:39 -0700 (PDT)
Received: from dpmin-PC.. ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b1ac3cbbsm399424a91.17.2026.08.26.18.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 18:02:38 -0700 (PDT)
From: Kyungjik Min <dpmin7@gmail.com>
X-Google-Original-From: Kyungjik Min <dp.min@lge.com>
To: openembedded-core@lists.openembedded.org
Cc: Kyungjik Min <dp.min@lge.com>
Subject: [OE-core][scarthgap][PATCH] rootfs.py: fix run-postinsts removal on multilib images
Date: Thu, 27 Aug 2026 10:02:31 +0900
Message-ID: <20260827010231.2087449-1-dp.min@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 01:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244444

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
---
 meta/lib/oe/rootfs.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 5abce4ad7d..e8e6841113 100644
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

