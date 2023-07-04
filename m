Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9437CEB64DD
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:30:39 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.61421.1688484630257375245
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=HcZsIqN9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-666e3b15370so3106483b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484629; x=1691076629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BKsM2AMIGLc4BVItOwtW0lZZ23SfvgpZD0Z8BiH+lNw=;
        b=HcZsIqN9Wg6NcR3+sW3omwpDXW440zKaTdRetjQeAte2PQOSYw0IQNlAvORZlOIT9Y
         45GYiYaBvuxOBS8tx42Ptfd8ZjrSlTzapYeZXl/Sy4uhQT9ff53KQ/mwV5Vv1uxtHLdG
         cb5GVztCgVfEeyxp6tHlDEuSmAUNdHTHtg0wUxoxOahH8JinanHvXoc6KrlJ8SCFJFii
         dcjgBSNqMo6J26cFF3lJ6k1ADlYAMrc0Vaq4U57OI5H1YVqApRoVZe2JSaRpiuhP42hy
         eJjeq1s4/z7rPTY5Ev1hPmD2OY10gitcoSM0D3O8ogIgXyv+JGJ4vEWWTDh360A+hYCa
         PwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484629; x=1691076629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKsM2AMIGLc4BVItOwtW0lZZ23SfvgpZD0Z8BiH+lNw=;
        b=GnaKUT84WXytM/aA0myiZcwnut0+WNwPJCumDgXq3TIS9/82i934tWnuGecT4EZSnl
         matbznNPXg+PfI4ajBkPDuOl8W+G1tWx5lrAR1H5x7fA8v3nSdL2dpSz4q4456MDxOB2
         spIyWGHHEqf9WASWrd/+iTvcLGOX7+xdbOB+WmwIXT5y6YC052F2OD5xB9GzPNyxHgSD
         AjlleU90Ql2VD9Nk1H80zDXwDHhti9/DQKoCClyH3ULbwBCGcs/OmJ+1QDOnBslL1u9Z
         SVNqSYkIPbiIe2zZi2zwepRxJSXvau+AuUCpN3MnWyBS0zyNDiJwSMp9bICqFdNVGwHx
         g5ZQ==
X-Gm-Message-State: ABy/qLZ6Zt9AXACixt8ZIq6ETSKQOULbb0cTCi2+4+t1wnHOBJdfq3KZ
	SbJ6y0sXqzjigtPsmyLFkyrwn1TQ6naZK4Oi+LgaTg==
X-Google-Smtp-Source: APBJJlFEVU0vgIcL9U3bTz8jM8AxEjumzbGtKAT8YPxLvi+48HMFOuiLodK54I3YN0RYJpZMHidaFQ==
X-Received: by 2002:a05:6a20:3d1d:b0:12d:f1ac:e2cd with SMTP id y29-20020a056a203d1d00b0012df1ace2cdmr10636591pzi.32.1688484629368;
        Tue, 04 Jul 2023 08:30:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.30.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:30:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 25/30] logrotate: Do not create logrotate.status file
Date: Tue,  4 Jul 2023 05:29:27 -1000
Message-Id: <d081071c99a814e43cdd2c3ca92892c10b631692.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183860

From: Jermain Horsman <jermain.horsman@nedap.com>

The first time logrotate runs it reports an error:

  error: state file /var/lib/logrotate.status is
  world-readable and thus can be locked from other
  unprivileged users. Skipping lock acquisition...

This check was added with
https://github.com/logrotate/logrotate/commit/1f76a381e2caa0603ae3dbc51ed0f1aa0d6658b9

This error is only reported once as logrotate removes
the world-readable permissions if this happens.
Since logrotate creates this file if it does not exist,
there should be no need to install it in the first place.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8169cd2d18f1569e4357f082adbef492710e8c36)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/logrotate/logrotate_3.21.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.21.0.bb b/meta/recipes-extended/logrotate/logrotate_3.21.0.bb
index 4e4ea10628..44d86a8f8d 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.21.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.21.0.bb
@@ -64,7 +64,6 @@ do_install(){
     install -p -m 644 ${S}/examples/logrotate.conf ${D}${sysconfdir}/logrotate.conf
     install -p -m 644 ${S}/examples/btmp ${D}${sysconfdir}/logrotate.d/btmp
     install -p -m 644 ${S}/examples/wtmp ${D}${sysconfdir}/logrotate.d/wtmp
-    touch ${D}${localstatedir}/lib/logrotate.status
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_system_unitdir}
-- 
2.34.1


