Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web12.5339.1605192792642899370
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 06:53:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison-systems.20150623.gappssmtp.com header.s=20150623 header.b=KWoyGMp9;
 spf=none, err=SPF record not found (domain: madison.systems, ip: 209.85.210.195, mailfrom: matt@madison.systems)
Received: by mail-pf1-f195.google.com with SMTP id v12so4713243pfm.13
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 06:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison-systems.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/0Dbl8sYWNDmSbdPq+8jqPBxLVzL7YWZ4ijlUQgl/zs=;
        b=KWoyGMp9fuJYFkcVZHszMFKY1VYd5FpGx1+E1MJfjKBwrRJqfjw2dxF7JkZuA7PSse
         yweUcp3cCV/ygWWGgYbB9LobVbgxha+xMaE5i7xnqSA+k8TEx7sxpwAqNtxgrIgqDALX
         r3slXbyo22eeRJUc1XwFUeHyGLBo7xDVAEU93U6DCNIj3I+uAM2QPjJ3d0APFX8erNIo
         R3880tXOkjdukOCYb9GSXn86qptE6YnwQ5C342pU7UgjA6MNvNeoLvmcGWikh9ZB079B
         ca3IjzgTXEQCU0+q+ka8SclT09OTmV2ruefa3FfQ89zKdvziXHQXT+idjITymKtK1hyi
         jYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/0Dbl8sYWNDmSbdPq+8jqPBxLVzL7YWZ4ijlUQgl/zs=;
        b=rnIlnZcrYutL8P+T7ZuABoFXFlcRcJ3MzqSZfMd3ftfCVVRFNZW//Zrvxdp/xiERVu
         mbqVuCkj251VJeryD8Pu1u0/gqQ/QQCDou7r1LMrfJTSz09awuiNxTlXgvAKGLINxJzF
         nx1JcqmUxU3Y1jabYSLpf3fOoMsR28ve4wqnMMCgqSuQHmBLSfYyNvdIOn8m6VHbHTCB
         dhYrI1HciEZNOICMKktDEI8G7B0PAZh2QE4n/yCpJxXviJ4t/NZJM1n3xKdwrynPcRSj
         MrC1oLwS/s8ur4SfEklQhtTQuMgVjT3HBHDMWWHI46mkbjJwZSaUQkiKy88v1TOVXlRr
         bhCw==
X-Gm-Message-State: AOAM533KKjVasL8z10Rm+oGCHYmC4NXl9CrLJMkNFd3kTTwSJR+Cq5Ec
	MTvXht2O+qjHQncs3b36N3G6qZJuCo3LEw==
X-Google-Smtp-Source: ABdhPJyIE6qyuV2HQekfdeCKVQhIieqrdaBKk4j5FdeU+bwgvCeIIL5WsQTwfMaLMut43fZywPGCcA==
X-Received: by 2002:a63:354c:: with SMTP id c73mr27594120pga.315.1605192791515;
        Thu, 12 Nov 2020 06:53:11 -0800 (PST)
Return-Path: <matt@madison.systems>
Received: from legion.athrat.org ([2600:1700:87f0:9cff:a0dc:1ce5:7ffe:3079])
        by smtp.gmail.com with ESMTPSA id q16sm6879936pfj.117.2020.11.12.06.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 06:53:10 -0800 (PST)
From: "Matt Madison" <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Cc: Matt Madison <matt@madison.systems>
Subject: [PATCH] layer.conf: fix syntax error in PATH setting
Date: Thu, 12 Nov 2020 06:51:41 -0800
Message-Id: <20201112145141.699659-1-matt@madison.systems>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 05a87be51b44608ce4f77ac332df90a3cd2445ef introduced
a Python conditional expression when updating PATH that
generates syntax warnings in bitbake-cookerdaemon.log:

  Var <PATH[:=]>:1: SyntaxWarning: "is not" with a literal. Did you mean "!="?

Fix this by using the more appropriate '!=' comparison
operator.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 2d9cd05695..cda37c33b4 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -104,4 +104,4 @@ SSTATE_EXCLUDEDEPS_SYSROOT += ".*->autoconf-archive-native"
 # We need to keep bitbake tools in PATH
 # Avoid empty path entries
 BITBAKEPATH := "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}"
-PATH := "${@'${BITBAKEPATH}:' if '${BITBAKEPATH}' is not '' else ''}${HOSTTOOLS_DIR}"
+PATH := "${@'${BITBAKEPATH}:' if '${BITBAKEPATH}' != '' else ''}${HOSTTOOLS_DIR}"
-- 
2.25.1

