Return-Path: <jatedev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98DF8CD5BAF
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 01:37:31 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8617.1779413842495403664
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 18:37:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Fp3pvVzE;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: jatedev@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7cd35604a95so60289317b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 18:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779413841; x=1780018641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eIBZLB256yHrSogLnPaFJhoqHWzYR/Hg1+eNfSKQDZE=;
        b=Fp3pvVzEP51d+g6k4AYRzPWFIpNBW+Aav/MS4w+rmN5fvMelt+xzWEprNB+qj2zPkv
         I9K0s1tLIfeyBaksc7BxYRuUuAifVURyi0f0uK5GBr1967C/Xo3O4ig87W9s99+um2op
         DHC6rXWkfrx/us1Ytvp4D8ars0PW7bLlrEBEv0i9UywoTcVaAEgGH4Z0DAR+EB5dIYTB
         vNAgLrVcPo+07rl1CxWZev7kKHBPgfK26TBkSdLUkZroJBmGvX9vKi7JHtuTFl7Cgwqc
         HtMWl5RpC3OqP0F3EsCvGswkrVaSLUUJgE62gp0JG1JHHknOF7oJOPDbiIUE+RicbsIq
         hL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779413841; x=1780018641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIBZLB256yHrSogLnPaFJhoqHWzYR/Hg1+eNfSKQDZE=;
        b=Izx9VpNHeoTDFcBOSgZ/RPDEfQjzDaEQDm5RcDnO+hfCJT9L4+tEg7wz+wR1AoDFaR
         UWBLw1ukq2D+295H05I43NymasipOglVyvYznK1p7tunIWckg+aPErcKI2eNWQ6zqqCf
         lZZLc0/LwHJhr7MxWua31hqPa9mGsbkgk/CDQ75GT+PrFatWs6GRewW0Fan/AWGRBZme
         a4GLbWzeBsDZhIrqjyJigq32icn48p+XdKZY8aaO+MKNS7JpwA/iFTa0BKeRt3mCv0Tq
         S7T1WysPp0RUQ08XfXBOGwDFs4pej/+T90XOF+vhyWROE+vqIkmCm9ttruLEQNFBGg+U
         IqDA==
X-Gm-Message-State: AOJu0YyzaWHHCkhhmfZYD+oV8Nm/lHpQTQ9p4auYGfld9rCP5M1iHneB
	jxQVZyXwaMZkiBCqQ9Qww7ZY0QwFaBksVcyNVgu0EnoQoysA906hlLzO4Zx7yg==
X-Gm-Gg: Acq92OHfFqEVOs0JIpfjnt/CxI2WvzV9s7VXvRP9nZGf6YorgTIH7b86GnEI3L4bqHh
	jKagxu2O0ZvxL/h0l9UkWt6FfoCyW+9FyJAce0R49eqp9jamhQX5xgU0rfsR4fxbOpwTyUBQ0kL
	7hlAyHguEQWtSt7ruIjwgIfCPvDYFayKyXbHGmiTXR9mQmMCvUdPH/AJrzcBgwu380p6D55krNo
	qqX3pA1CHvPHH3x0nHXhEb3chppGB22ccj2OcvQ1H0+BB7NaLbTDWlbs3enJTiGIu/ainblvlTy
	Gin5O7idZ0Qt+dOSyE5LLdEAfBmbiMGq1HW/slhbX+iqC4nLnqCXlKFlDBd7S482O+6Kubl0OP4
	fbz8sbgrW4noVOp/w7MJSxPeQjkO+b4g3TPoMsDUOnw3tZgHsQs6+oiKYw9x9nXc/JUaPSfebAT
	LpNH/8ZMHD542sFJ9sHlbrIyP6oLyeuL2b73XG3x9aVF6RHG3NZ7gLET0Q8dkxOw==
X-Received: by 2002:a05:690c:a60e:b0:7d0:bc:3aac with SMTP id 00721157ae682-7d355e3171bmr8970367b3.8.1779413841587;
        Thu, 21 May 2026 18:37:21 -0700 (PDT)
Received: from L-FZCJQ13.home (71-209-79-120.chyn.qwest.net. [71.209.79.120])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38c43bfc8sm1919937b3.42.2026.05.21.18.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 18:37:21 -0700 (PDT)
From: Jate Sujjavanich <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jate Sujjavanich <jatedev@gmail.com>
Subject: [PATCH] udev-extraconf: use -H for unmount tmpfile find
Date: Thu, 21 May 2026 21:37:14 -0400
Message-Id: <20260522013714.1847784-1-jatedev@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 01:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237523

Add -H option to find of automount files in /tmp to allow find to
follow /tmp if it is a symlink to a volatile file system. This option
also avoids following any links within /tmp.

Otherwise the find for the automount tmp file does not work which
prevents the removal of the automount directory. Then subsequent
auto-mounts fail.

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 3ddee84b78..81c5d1c58c 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -207,7 +207,7 @@ fi
 
 if [ "$ACTION" = "remove" ] || [ "$ACTION" = "change" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
     name="`basename "$DEVNAME"`"
-    tmpfile=`find /tmp | grep "\.automount-.*${name}$"`
+    tmpfile=`find -H /tmp | grep "\.automount-.*${name}$"`
     if [ ! -e "/sys/$DEVPATH" -a -e "$tmpfile" ]; then
         logger "mount.sh/remove" "cleaning up $DEVNAME, was mounted by the auto-mounter"
         for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `
-- 
2.39.5


