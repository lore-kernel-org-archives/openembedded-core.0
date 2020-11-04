Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.20384.1604530075543178142
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2020 14:47:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@meraki.net header.s=google header.b=F9xSShtj;
 spf=pass (domain: meraki.net, ip: 209.85.215.178, mailfrom: william.hauser@meraki.net)
Received: by mail-pg1-f178.google.com with SMTP id r186so116845pgr.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2020 14:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=meraki.net; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=uyNfTWJa0Q7thtvW2Tj/yy3931+zu2O6D1MKMx915wo=;
        b=F9xSShtjrEOjXS4YxDi29IdhZBjQsGlEjd3ue2GmFVkbZhIao69tEiJoPXn8j/EQdA
         fvPDNSPmXUEJsKjTFAEPwm7H++HgEUPuW7jsIsB56CI0QXL/AeEvlwm8axZK+I3/iHXJ
         rUC5Nzc3crvx+k3sVXL5dW78Rxt8D5p/3h4os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=uyNfTWJa0Q7thtvW2Tj/yy3931+zu2O6D1MKMx915wo=;
        b=jYNLbL1caqu9NLQWHvt7mVxnIR9/gJIsknjCsV7qz5toyaVBTYw8e5y7c4EPBiQ89q
         vwoKChWEh7gCDjIwOszfgQe+0kjJ2XH1Z8UbTSwmqL+ogUnU1XR6HYj+fZyzWKaYBg0H
         dVgwlBwMz2WH2C0pNi8gfFrAeWdYQ7F9YOF8WWenkal5nV8cNI1DpA5b1GpSJ1g9wz1Z
         XV241t+08tv/Vv2yxS5v38BGEd3zyV0e3aEMSujV0WqvrXmfpxJ+2Dz7YpsPh6Dzhxyk
         AS7ZgRvLXI6I9Ccsf65LfCbfZAmzjj+P5GO/7jDZ6izeAunVy+cQv2nZ/1oX2Fokahh6
         vxFg==
X-Gm-Message-State: AOAM531R102naSX72PbqVU4tlY0sSKU1AG6ydGWI1kOz3ZzLqsirJgkk
	pFCyDuwX3GihEcUo4/Lb3atTOVJtBX89XA==
X-Google-Smtp-Source: ABdhPJxUk97nbxlK0mz+YLyOC1EoBtJPNFXJsC96dK2vlgVYR1qqryceFYhdz70Jux+k06jgJB9G2w==
X-Received: by 2002:a63:381:: with SMTP id 123mr231839pgd.112.1604530074597;
        Wed, 04 Nov 2020 14:47:54 -0800 (PST)
Return-Path: <william.hauser@meraki.net>
Received: from localhost.localdomain (192-195-83-200.static.monkeybrains.net. [192.195.83.200])
        by smtp.gmail.com with ESMTPSA id w63sm3663899pfw.0.2020.11.04.14.47.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2020 14:47:53 -0800 (PST)
From: "William Hauser" <william.hauser@meraki.net>
X-Google-Original-From: William Hauser <whauser@meraki.com>
To: openembedded-core@lists.openembedded.org
Cc: William Hauser <whauser@meraki.com>,
	William Hauser <william.hauser@meraki.com>
Subject: [PATCH] package.bbclass: fix image_debugfs symlinks
Date: Wed,  4 Nov 2020 14:47:43 -0800
Message-Id: <20201104224743.74488-1-whauser@meraki.com>
X-Mailer: git-send-email 2.15.1

Allow symlinks to be made in the debugfs by removing an incorrect check that
would always prevent symlinks from being transferred over.

The comment in this code indicates that the code is meant to ensure symlinks
are only copied to the debugfs if their target has already been copied, but
instead checks for the existence of the symlink that has yet to be created.
As a result this check always fails.

This check is safe to get rid of since we will only attempt to copy a
symlink to the debugfs if it's original target exists and is an ELF. It
is, however, still possible for a dead symlink to end up in the debugfs
if its original target was stripped.

Signed-off-by: William Hauser <william.hauser@meraki.com>
---
 meta/classes/package.bbclass | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index e6236c0bb2..47f3df2e13 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1258,14 +1258,6 @@ python split_and_strip_files () {
             src = file[len(dvar):]
             dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(src) + debugappend
             fpath = dvar + dest
-            # Skip it if the target doesn't exist
-            try:
-                s = os.stat(fpath)
-            except OSError as e:
-                (err, strerror) = e.args
-                if err != errno.ENOENT:
-                    raise
-                continue
 
             ltarget = symlinks[file]
             lpath = os.path.dirname(ltarget)
-- 
2.15.1

