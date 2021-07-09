Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web09.9616.1625830366080373989
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 09 Jul 2021 04:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XQRWf0dw;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: uvv.mail@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id k11so12091327ioa.5
        for <Openembedded-core@lists.openembedded.org>; Fri, 09 Jul 2021 04:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vAEfBaXNse5l7mIe/9xZLHM8pPnmoMNHvjUfTfkzK3k=;
        b=XQRWf0dw+YKEcPxITbAVublK3usc4WaRWakm21LrGxxDQPrcydX3K7zn5YDnY8uA2q
         P5axlVB3kUwVAHUXTk/FgwzUD7CaCd/bUmcQ9wyn/ZMdMdWin4VqIxLcQVPZncMvunVA
         9ePdnpuXD7hF0R4x7nAllRvf9pQJEm9sLr1rWqtbJ8zv8dHS7w/22LzjqjW+GwNIUaTH
         eZpqE4g36ES9h3tFfXHtHP6/WkTXeiVf37E8ra8a+9wxqOYjfI5IYBD0YH9bEBAQo3PM
         PjZKKlHk8WfTJGOgOKaV/JmBxZLInX2zFRK2oeSq65KzCLM/fn1lnGuT8CQIq4c+hwQ/
         6A2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vAEfBaXNse5l7mIe/9xZLHM8pPnmoMNHvjUfTfkzK3k=;
        b=gk+1flGBpT7T158UhjNL7EkVyIv4aTFiju11UhJCE8/h3zJHNRiHeEjpBfJRKlLTv/
         iaS70d2EfuAMIiQJ/8AKuVQo7JZWTnrc7d9VipiRsj3vMME8Q7EPO209sTWXHR3131Zm
         jqExqWRYAtxflIaydn0PafQ8dIN7rO/iJo2qV7/xevbMjmTYzAeH9nFnJi9QvzziX9Sd
         tahdqiWtkJRDQPgMKrpgRTnnzZhwTeT2M5sY2w1jTJYza7dJ383F1Ux70Z7rAeYaUVEa
         5bDrHl+uf1YzJIRTf5y+5ikfJXXvZZaZjz8hM4k7+9umjujVlc7NrFO13TiN/cQOYnsX
         qfHQ==
X-Gm-Message-State: AOAM532VytDgJdmBHzPImI7hFPM3nKUoJ34i/pG4nySYFGCz9ETOMndd
	IQnZHQ4FJl+OnanpSXF8f7TP1qUz+Vwc4g==
X-Google-Smtp-Source: ABdhPJyFs2MIByMv+W9JAse7gNM6tFcUfnlwcDIqWfJFGvSWSXaurdyw7nQLVD/22z/YDG80fOjnRQ==
X-Received: by 2002:a02:a38f:: with SMTP id y15mr6762236jak.108.1625830365236;
        Fri, 09 Jul 2021 04:32:45 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([37.120.205.173])
        by smtp.gmail.com with ESMTPSA id q7sm2570463ilv.17.2021.07.09.04.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 04:32:44 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 1/8] overlayfs-qa: common functions for overlayfs
Date: Fri,  9 Jul 2021 13:31:39 +0200
Message-Id: <20210709113146.69020-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This class provides commom functions for overlayfs and its QA check,
which is performed in ROOTFS_POSTPROCESS_COMMAND

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes/overlayfs-qa.bbclass | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/classes/overlayfs-qa.bbclass

diff --git a/meta/classes/overlayfs-qa.bbclass b/meta/classes/overlayfs-qa.bbclass
new file mode 100644
index 0000000000..54fa8316a2
--- /dev/null
+++ b/meta/classes/overlayfs-qa.bbclass
@@ -0,0 +1,14 @@
+# This class contains common functions for overlayfs and its QA check,
+# which is performed in ROOTFS_POSTPROCESS_COMMAND
+
+# this function is based on https://github.com/systemd/systemd/blob/main/src/basic/unit-name.c
+def escapeSystemdUnitName(path):
+    escapeMap = {
+        '/': '-',
+        '-': "\\x2d",
+        '\\': "\\x5d"
+    }
+    return "".join([escapeMap.get(c, c) for c in path.strip('/')])
+
+def mountUnitName(unit):
+    return escapeSystemdUnitName(unit) + '.mount'
-- 
2.28.0

