Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web09.8084.1608795842484641886
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 23:44:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RlUv7SHo;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id x15so1351304ilq.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 23:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G2B1P9mXKOZ37ux4W3wJQqCGOmiGCWX1M0L2hza9kvc=;
        b=RlUv7SHoEgbMPNMKzUEUmF52JaDXxGS9wru4EkARkinHocq5q5uOGvHgDHW0C+zYLq
         1RU4tbsSfex4nvEPshNebwRtWJhw6d85d/S0yRDpPhrwaWEFMmKJrpQbv1aFc3TSvx1j
         1x1AHfEkRMThaKdMubMAnAERFLBXgArrUBlL5c+PVUrgRxdyq6O9b9sYyLYv0tCwQSG/
         pB/4BPTHgkFgFVCIdegSekrBEIDLiDq14nIg/x2CgGeKBJxCNp9vdO9/rX8xiNwIQcT4
         0t9v9P/Hh85fISfItnKX2kjr1GdaR8XwiXiuX8MbIigFHf6UcUa1TtJK3KKIMbI1oB0B
         7kmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G2B1P9mXKOZ37ux4W3wJQqCGOmiGCWX1M0L2hza9kvc=;
        b=JYLAniWF2ftvh+EmDo/C0nuU0wKJBpbW4NQTJUvh7Nj2CF2A7vdgLw/PVRLsmi+8rW
         ragMiqKc9zLaeY9JZ4Dw4E5gvmvH7Llfq1LoBRXn26nfr52RuOPwOEq83jWC55ZLq2Cq
         I8ea8Ub5fH/uhBmJFeT6VFnvQ/138hv1YLLDa+ZJTtpAFZqsWldrerLPtCAQfV6K63TJ
         Q1I1mh/0uEyPeC/ZUN/1SerCJ4NlQPpIubpqSXRzrTr9vt+WeMoCu/DgXZ46G3oC7G+l
         Oj8P8XWP6JMEYgdnDhdnwHQbnBG8Kszm4E9lDfA9rhzxyi7mJ3FbUiAskbQItVW7uPJS
         q1lw==
X-Gm-Message-State: AOAM5327iHEc6KT7UMzyjHNx7hd50Co4XBI/YzEQSydtsvl1R2FFoH9g
	Vhn/JK4w8YhELhN0+KNQSnQL3ep+2DDY8Q==
X-Google-Smtp-Source: ABdhPJxz1sr2DmVVFQ+sT8lUtI1HYmX1bx660YjnaWuyaufTcfcvfCl7W3s36gbNYFdIubiDbSy/QQ==
X-Received: by 2002:a05:6e02:104b:: with SMTP id p11mr29448349ilj.241.1608795841632;
        Wed, 23 Dec 2020 23:44:01 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id e1sm26181020iod.17.2020.12.23.23.44.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 23:44:01 -0800 (PST)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [master-next][PATCH 1/3] insane.bbclass: allow fifos
Date: Thu, 24 Dec 2020 02:43:52 -0500
Message-Id: <20201224074354.18751-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.30.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow recipes to create fifos. If insane.bbclass tries to read() a fifo,
the process will hang waiting for something to read(). Therefore, skip any
check that would try to read() the object, if the object is a fifo.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/classes/insane.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index cf2165c517..105d2a5ce8 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -87,7 +87,8 @@ def package_qa_add_message(messages, section, new_msg):
 
 QAPATHTEST[shebang-size] = "package_qa_check_shebang_size"
 def package_qa_check_shebang_size(path, name, d, elf, messages):
-    if os.path.islink(path) or elf:
+    import stat
+    if os.path.islink(path) or stat.S_ISFIFO(os.stat(path).st_mode) or elf:
         return
 
     try:
-- 
2.30.0.rc0

