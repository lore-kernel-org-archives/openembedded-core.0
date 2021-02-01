Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.36607.1612196779664244487
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 08:26:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YwG+CV43;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.52, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f52.google.com with SMTP id v1so16844212ott.10
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 08:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8r7bV2CDFKXS2ohvBBCOiSAsAdOenKseGbCUa1T88bo=;
        b=YwG+CV43MCpFfvb267UjRBnG9cM6q+J6gMvo9yiEYwXNYOAbnUVnyKGbDpcObgj3PF
         bvnVfXbGDTmAfBtcnpqVrrjUQK3rv4wpbDHCm4L6h12da5Mj7gB2V6BLZwrEpv44gU3p
         WWrDHGdxO/sgHP73KCIRr6MBEDEKYNKnZcwSRDFrEsE7iRHFXRnrZHGO82NJ8fhseTDN
         0dUgGDU7xdb2M2jDxpwPWDEkSj77PfPkeyGQkRQeRC2paECAs4Ic/zNzMmg1XV5yNE/0
         dEKjSCc6NVTu8qeKpABXUkuHrBmDIPmsSqs4tTcycpiwmUABGJ0NeP/onQeijDmy/s31
         crRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8r7bV2CDFKXS2ohvBBCOiSAsAdOenKseGbCUa1T88bo=;
        b=nT/9tOKInKxmZ5zL5ZeROUvSYqYLlNgmbu4wm485qwT5GpD4me3ltM7ERVDMHUzaIa
         MDklxLQe/Gh+54c33A3zBPFgqqGQNANNArlgFagJCdnc6ITCr1MNUox4/ZQ2UUhSmdxD
         y4bTxPf64uZxYAtQa6Vx1OHHlX5y/fHEiJmVlM+FlgqN3vqeIrooWyzqd8sSQd4zyb2P
         yOb/+n+jy+u450l4U0qfxrkJOh77y2e3iF6NhOAdBrFa3b98cl81F59SKDi2RZZSE/FL
         Qv9b9qSRKGmRPa0KnN95lIE7Ps6bz9lxudSKWAfLwyOdCX3E5Q1Yrq/ZJVQCIrK5lak9
         HLmg==
X-Gm-Message-State: AOAM533eoMk49IwzlIGe6OARDQgHAGUNFictPae92sr6u4RZuHZ52NXO
	fzrrNHQXgLyua0X2J0FypYvpjmgHADLYU9lwDpc=
X-Google-Smtp-Source: ABdhPJxhaQ39Wg96tPAwrqZTxpDe1TFASo4zRVCHRqapekcR4Um7HWzdYNxRyEE/m94wevtk+MTUmg==
X-Received: by 2002:a9d:19aa:: with SMTP id k39mr12143970otk.28.1612196777158;
        Mon, 01 Feb 2021 08:26:17 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id o16sm3980726ote.79.2021.02.01.08.26.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 08:26:16 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/21] externalsrc: Fix parsing error with devtool non-git sources
Date: Mon,  1 Feb 2021 06:24:40 -1000
Message-Id: <59f0af647e28fa9579d5376b6ff0c9c0a1656ab3.1612188857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612188857.git.steve@sakoman.com>
References: <cover.1612188857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

If srcdir is under poky directory (e.g. devtool poky/build/workspace/sources)
and is not a git repository then ${@srctree_hash_files(d)} will run "git
rev-parse --git-dir" and detect poky directory as git-dir and run "'git', 'add',
'-A', '.'], cwd=s_dir" trying to add srcdir but build dir is in .gitignore and
latest git will fail with "The following paths are ignored by one of your
.gitignore files: build" which will end with "ExpansionError during parsing".

In this commit I added a check if git_dir is the same as git-dir from
TOPDIR (which will detect poky directory) and if yes, then treat srcdir
as non-git sources.

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 95fbac8dcad6c93f4c9737e9fe13e92ab6befa09)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/externalsrc.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index d200129987..259ccbc79f 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -197,6 +197,10 @@ def srctree_hash_files(d, srcdir=None):
     try:
         git_dir = os.path.join(s_dir,
             subprocess.check_output(['git', '-C', s_dir, 'rev-parse', '--git-dir'], stderr=subprocess.DEVNULL).decode("utf-8").rstrip())
+        top_git_dir = os.path.join(s_dir, subprocess.check_output(['git', '-C', d.getVar("TOPDIR"), 'rev-parse', '--git-dir'],
+            stderr=subprocess.DEVNULL).decode("utf-8").rstrip())
+        if git_dir == top_git_dir:
+            git_dir = None
     except subprocess.CalledProcessError:
         pass
 
-- 
2.25.1

