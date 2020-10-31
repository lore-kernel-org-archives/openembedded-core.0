Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web12.7957.1604187940416097169
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 16:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SiO+8R+4;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id k3so13555503ejj.10
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 16:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LoaBNGZoeQkFyLVFdtESEAmuHSEWSNelkoOTbXW/NTk=;
        b=SiO+8R+4FOeS4DYrR8gWZBolHX/H+vu2LfGgUNOc84YfQWyeF7jUxBo81LImL2ppJw
         Qd8eMN6L2iGPH+KKerHMhGe+cD1dWQiQNK/bI9F69OtB2Ex2jSufjWx1Kn8I39Y3GJp2
         evd579Xi1P4HzVmucjQvYJqsxeAx98uhFIphgeTbu/znTXseEahy73xSrAxKmmzGcZqs
         IAktT9SK6DMSN1UCwY61tA/XRgnZZYAdYBdt4OKO2j84FSgLKmxUNbE3NrQRtbB3tHOc
         HWUDN6trA/hQFS3jMUTlXiMupvwq5TNLa/41ziAqA9tSTNgJ3nZDg1Ima+8EdWVGEVbh
         mWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LoaBNGZoeQkFyLVFdtESEAmuHSEWSNelkoOTbXW/NTk=;
        b=mxcnX3VKCASgQhuwHGxKQXetityA8FNsoI9dCH0QjFHQu6R2eGKlbFLkyfbfSrRFNy
         RQFUdQLeIncJkTv/BRZtqIz3wmyyySfa9fkiybuIOlJwZaKolZMvcfRg98TFKzMFqcOQ
         dr2fFWmzQs5lfZTjrq7VeRXqyjUnU89X40/TTvjwdPCot5xCd9Sh/5HTNv/Quz5Btpto
         gqCC/XB7YTqcTzEh2sy+mLDT0yhpAjs6/9UIzqXn/CKPqxiu7pq6HIfRkjge3tcBsc1W
         j2iNvPG+jEGHPD43jeKctOze4mQRpGLD/Gts1xuEaDbH7A0dB+rLyrETYL3VgY4Z0Lg2
         TQlg==
X-Gm-Message-State: AOAM53167UmR4ZpQxGN9xicsEmhCJcisjh499vYvl1VcrOhnhPHVdQcA
	LRbwp/+y7YEqBn5pOpB54ddDPUD6ih0=
X-Google-Smtp-Source: ABdhPJyww+CKGc/WFonk/3DtEt4qy2KYOp4xQezV1yoVVY7+HHNGfdQpxRRgt4MlPdTixjZ/8SWY1Q==
X-Received: by 2002:a17:906:c149:: with SMTP id dp9mr9464679ejc.88.1604187938640;
        Sat, 31 Oct 2020 16:45:38 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id v14sm6001507ejh.6.2020.10.31.16.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 16:45:38 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 2/3] lib/oe/patch: GitApplyTree: save 1 echo in commit-msg hook
Date: Sun,  1 Nov 2020 00:45:32 +0100
Message-Id: <20201031234533.4017117-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201031234533.4017117-1-Martin.Jansa@gmail.com>
References: <20201031234533.4017117-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* also remove the extra blank lines which is often added to patches
  when refreshed with devtool (GitApplyTree.patch_line_prefix lines
  are ignored when refreshing .patch files, but newly added blank
  lines aren't - the leading blank line wasneeded for patches with
  just the subject line (to prevent the GitApplyTree.patch_line_prefix
  line ending appended to the commit summary), but we can add it
  in prepareCommit instead

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/patch.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index fa92abe248..bb1c40aa1e 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -508,8 +508,7 @@ class GitApplyTree(PatchTree):
         with open(commithook, 'w') as f:
             # NOTE: the formatting here is significant; if you change it you'll also need to
             # change other places which read it back
-            f.write('echo >> $1\n')
-            f.write('echo "%s: $PATCHFILE" >> $1\n' % GitApplyTree.patch_line_prefix)
+            f.write('echo "\n%s: $PATCHFILE" >> $1' % GitApplyTree.patch_line_prefix)
         os.chmod(commithook, 0o755)
         shutil.copy2(commithook, applyhook)
         try:
-- 
2.27.0

