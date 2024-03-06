Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCC8C54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 17:17:18 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.390.1709745433042165188
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 09:17:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lab9HoYF;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1dd178fc492so26024015ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 09:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709745432; x=1710350232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o4oEQmJoof/aFOfpOgT7j6jgh4yoNQlnt//5ASYoT4w=;
        b=Lab9HoYFkBkhQ5EEPW6iBSkI85PF+Th0vYTSurAZSj1A6NmqkyFFfng4dOcJ9+aNX6
         sLIofDaPRUfmIoKYmhUzNvPYMG1AjlnrcU9J4p8wGcNAoKW3ETmo3AfNK0hHNgGTMEYb
         hn6fvZL//ghPigxzo7I/vFDYacUDQAKB/b2fMDlkV2n0NkygfjbKftDXTB/JO82LshVO
         /9ngZaCo7LWyKbcnvObdyR1qmLU20gMZ2/Jx0DZwTGavBIL63E2i8ajgyjEE9ydgF3Pe
         Sr+tdAKR3tm+oGCDyC50i/S76n/41HPVMrkPMJOp4TGs+HXYAlldyk58qzJC3q+5hq7I
         qGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709745432; x=1710350232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4oEQmJoof/aFOfpOgT7j6jgh4yoNQlnt//5ASYoT4w=;
        b=sw8z6tE+ffypTVd+m3SFdUZvhFI3GEpQiRi6RjAgrpX99r8ZSO/uVbSfKaIkCS2DGH
         qQz0QualGJMphK6zqSZbi6O+MtwLurxyxd9hdn+KdJR9K/Y/jKMDsbC03/MwdJuNC+5h
         248t6r/oS+5+kB+RLHkbSkNps62t4awJ8wOLP+QT3brdsBeHv8kmu07JA5FH6qFBd5zO
         VTwUkMYEmZYJw9TFnKY1c20X/umffOQmN84DKy619TBAmHO0gFFfs2qxHmiWmRp7bZUj
         oUMw8p/GKb/b/5qvVKG2CWeMa3Bwk6SB5OmDkJkfTkCAynpvExn1xluVo0o8Fssqn0as
         J6Bg==
X-Gm-Message-State: AOJu0Yx5YJePvxC+Vrz33ft9DC8dLQH1+aDlge8G/Eo7i6U+o2rgMlJo
	37rnhQzhVFXo0A/4Njuyl3DTLH4PJv98eGy3LPDja4//6vsgNATrwtGZUfnr
X-Google-Smtp-Source: AGHT+IFXni1de52tvnsMlHiHo1DEDOOTIIgSNZLYT10qx0WyXldOSLMRUf2gnHS55cTI0LemH0hUfg==
X-Received: by 2002:a17:902:e5c8:b0:1dc:b01e:9ae0 with SMTP id u8-20020a170902e5c800b001dcb01e9ae0mr6702135plf.14.1709745431968;
        Wed, 06 Mar 2024 09:17:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8f25])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902e9cc00b001db9fa23407sm12863384plk.195.2024.03.06.09.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 09:17:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Update to tip of 2.39 branch
Date: Wed,  6 Mar 2024 09:17:09 -0800
Message-ID: <20240306171709.3002566-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 17:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196748

Brings

* 1b9c1a0047 Use gcc __builtin_stdc_* builtins in stdbit.h if possible
* e0910f1d32 S390: Do not clobber r7 in clone [BZ #31402]
* d0724994de math: Update mips64 ulps

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 5b0705f6960..618a5745664 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "312e159626b67fe11f39e83e222cf4348a3962f3"
+SRCREV_glibc ?= "1b9c1a0047fb26a65a9b2a7b8cd977243f7d353c"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.44.0


