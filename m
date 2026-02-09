Return-Path: <logan.gallois@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDCCE94624
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 23:30:30 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8354.1770679824885010497
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 15:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MEkaV3KN;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: logan.gallois@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so2560115e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 15:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770679823; x=1771284623; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8C9o8SBZpIzhdGN+vzJOedWfnVZbg5AhiJK5DENOcmc=;
        b=MEkaV3KNH1frLOVkvnt6v3dClyU0c3Kjcvo3oYZpRNuS6IRYeuThfDFspVYVSbUVQp
         2zBo3yTLOnxdhk84+KKWwuhAa1kh+3unxX2zVYnNPC8Tdxfthtbya+I/Gkwy3GITeY7B
         abmcuJM9ZFy4zUV+rWifki7ovwwMUR40bd8+aMZbZ+PspRjyWUIOjq1Iy+ivcz2WNj5g
         aM9SeSDDs5qDnCijpNAoLC/O/1uHfwuHHZUgeBvFuO/UYf0dgqBuhvUIY79T32UWNDXJ
         nTIvoHXJ+iwBfUHlcLgn7jyNFAyDcjZSk9vCBl44EkCTkkZroqVeWFoixQT5njjZHVbg
         j0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770679823; x=1771284623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8C9o8SBZpIzhdGN+vzJOedWfnVZbg5AhiJK5DENOcmc=;
        b=jsyGwbVneFy8CCEetutS8nMQ15FYrA+8VnsUG8EtN8ccYykg2O+EV1LXFQ+ySQhTY0
         XE2PDUQUwLG1oOHSx5vjnjxAWR0WBz8UzVyvFQlfvs9U0LJXQjBz7rrieRzArKUVt7p9
         yvrK6q09ZAwYi5IU3t7RFxnmCdkSM/uhNZUKAMPJQCi9Gs55uOV3VYRDj9ChHYFHb1x1
         O35aBTSjHA28ko7NvpI1osl6+ZHHDgSFSaA44hKCfodgPmTLBONySnmqDAFmEC+1I/0Q
         gUHbSMf6JMNMrfGc58xdbIRDjOEQLCuhnwKoOrcKDdG9TNgjyHxPVSZ4iLnDXIOvlhto
         LCaA==
X-Forwarded-Encrypted: i=1; AJvYcCWWyhRmC+kOrE+P36Ybsxi1RUnb5P9YS92jPs61g0PiF4+nPUkvxonmuQCuSD71rsyJW+YoTfExrA9OzNUmVwzNbg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwYVgWZVAAeEvvt+o0bfGRFumlwMl9jUmcwdxy7GnaORjFVxiYu
	Uely4Jkv2KdmZ0r1Uud1CcDWm41bcfoDvGdWBBHoi2LutjApRna/FUFy
X-Gm-Gg: AZuq6aLqhW/HeS2kF/M/QmJ+G4Qn9xv8T1kyPFO/1nyFbcpSUBxPg2IaCDgKcFx8miE
	AxV5yz0bAkkJhi3bgZBxQXOUTBiJX7bLnckTfsyM1v5SovdL5D7OLkEP2rC+aqglltdCnq80o4Z
	kwpsQEFiTwK00ysAzVVoKa98tDsiD4LwiFDfszCKYou2DB3bwLTzsIzZ1DVIzAq8bh9E3y+jrOn
	Taag9Ej8jnHds0RM/6kS2MmZfACFLF0tP7d645/Gy6Xb4K2nud6zFVIWcu2ot6RajAsbRcRUEg2
	1dcAyZaHbh29D+x+L0kDoT9fCLn5SyzBOOipcALg11al5x7XAyeoXXFk5kKEsza56ktLTPzV4Gm
	FxeBu82/Ue2MvgemlPsxkhTKkc81WPZtJH0fG+e+ZnU0cGgLIgqInJ8bEH4FmsKefWJzwP3izy7
	ZqEPi6NIyLOsuAVu8zO4NptNON+EiGIPfDSqv7lD5bzSfCKFleeF4oiEzX4ll8H9e3yY/ZgIFPd
	pLbLw==
X-Received: by 2002:a05:600c:548d:b0:480:7162:fa48 with SMTP id 5b1f17b1804b1-483201ecd90mr205139305e9.13.1770679823176;
        Mon, 09 Feb 2026 15:30:23 -0800 (PST)
Received: from Minicarpet.home (lfbn-orl-1-620-177.w86-196.abo.wanadoo.fr. [86.196.80.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436297450b4sm30890320f8f.34.2026.02.09.15.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 15:30:21 -0800 (PST)
From: Logan Gallois <logan.gallois@gmail.com>
To: logan.gallois@gmail.com
Cc: alex.kanavin@gmail.com,
	openembedded-core@lists.openembedded.org,
	Logan Gallois <logan.gallois@hexagon.com>
Subject: [PATCH v5] oe-setup-build: TEMPLATECONF were not applied correctly
Date: Tue, 10 Feb 2026 00:30:19 +0100
Message-ID: <20260209233019.1981-1-logan.gallois@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260209224444.17275-1-logan.gallois@gmail.com>
References: <20260209224444.17275-1-logan.gallois@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 23:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230826

When using the new bitbake-setup tool, an oe-template created in a
custom layer was ignored because the TEMPLATECONF variable was not passed to the source file.

Signed-off-by: Logan Gallois <logan.gallois@hexagon.com>
---
 scripts/oe-setup-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index b391f3b9254..ab543506451 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -101,7 +101,7 @@ def setup_build_env(args):
             f.write(cmd_base)
     print("\nRun '. {}' to initialize the build in a current shell session.\n".format(initbuild))
 
-    cmd = "TEMPLATECONF={} {}".format(template["templatepath"], cmd_base)
+    cmd = "TEMPLATECONF={}\n{}".format(template["templatepath"], cmd_base)
     if not no_shell:
         cmd = cmd + " && {}".format(os.environ.get('SHELL','bash'))
     print("Running:", cmd)
-- 
2.43.0


