Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBD3C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 11:17:19 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28910.1785151038542670759
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 04:17:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M7k3gjKz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4758bd3731bso1878733f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 04:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785151036; x=1785755836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0e4QM9JYS0jDNsVgi5WL5RByi0zf/OmbScNkURTAwGY=;
        b=M7k3gjKz0sXHLRsGGysIv+Ks0m9A/FH6G/0D3jXC8p3tiQRSJw88zIVvm9KazhgBf6
         XL5EZAhSSBuXjwfHwDI0MDC2AO+jZOZqK/Ejbl2m6gspRMc81ko3byIux849NU0LZxhA
         +i3vB0JsMD+RlvNzAoA+Mi886YLBc5j0ibBvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785151036; x=1785755836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0e4QM9JYS0jDNsVgi5WL5RByi0zf/OmbScNkURTAwGY=;
        b=htHs6/nUp/PiYWwr6aUOPKUEETF0XiKZAW7N0F6PuOwyI0SKPd4Gp6IYCjKYm5WF1c
         hzjg67dOycQWdhrBvzR0n6tGzxgexhKdTRwzfA06T3lGhTswkSdFn6R7k/RaArIyGGJA
         d2b1bDj5Z2HA6Er/OkplUvd1Menxaqm08uc9Cfi7afeYiOzcQySzfYgr9rAtEvdIbEPj
         96/LLya7AwRJ/L8+gAeOi6c8M0kLsD6D5X54Piqh7DVe5+3XA+tGyl36lg6b8LPKrEan
         R1F5awFVJGx7x+OR3KXW5YA0Om+mvqQc/2Y+0nlGNOSDbuyJYNYJuA05hKlN55ETouEi
         IApw==
X-Gm-Message-State: AOJu0YzdiH0qrnNrNhq4JjrYXESfs8PuaxXZx2Sj/R+vd5mp+DcfYLuL
	OyS/lBODJsYJo5tS89ENd7F3cEyyiJIE8d71sDEZCxLo3mBmkVU/9Son3bFpAneyBsyb7LfijmK
	9HomMqZ8=
X-Gm-Gg: AR+sD11eqwp+KisOLfe42D2PKap5N6ZYoTwNRDfyjOj99I7OCY6JlJtydPttTj6+b7J
	nzRt+zTokd/F0QtR7quorP9HTubH6WYQ/Xq015tFCsJbVsmpxwqbbMVdMSWrqX+RgjpcWbA75+p
	Vu6tlQ8ki8QN6Fp6ED8yfrNF0rcFc7xg+2bWIk8yfxISHK5z8SwjDttOIDpf4dHUzqrSgFa7r9/
	BfmK3SpZXF9qtWPIYEtrxk/cMdm+A3JNIJdraKGnEfhAc0/xFlri/ASZp+Dzh2dwv8qr7he63DT
	5nfZCs7yj0rRZ5tN8SvEsP66pjnHEpjulrtpUL46i+Em+wHyv3PUqcsCl1V5DIjiTaP+fNnDRZn
	DxisdfUkJC3VYl5djWxwWSIuuUVRW1Iq9nYLa5qFKGqvz5m4Q+Twpr8g7nP1LQUzzgsYKEq7smu
	6q5uVwCDgXctAaxNpc2Nf6ZgPf3rn/K25cAgRgobzd
X-Received: by 2002:a05:6000:2304:b0:47f:8fda:1af0 with SMTP id ffacd0b85a97d-47f9cdaf475mr13563455f8f.4.1785151036316;
        Mon, 27 Jul 2026 04:17:16 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3a01:52d:1da2:a363])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5c4sm48444047f8f.8.2026.07.27.04.17.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:17:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstate: Update unpack touch code to be consistent
Date: Mon, 27 Jul 2026 12:17:14 +0100
Message-ID: <20260727111714.4115172-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 11:17:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242085

When we unpack sstate files, we want to update the mtime+atime of the sstate
object and any sig/siginfo files, both for the files themselves and symlinks.

The logic was getting a bit hard to follow and wasn't entirely consistent with
only a time in some cases.

Clean it up and be consistent for all the files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 9037d209270..6ee83717bba 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -932,12 +932,13 @@ sstate_unpack_package () {
 	fi
 
 	tar -I "$ZSTD" -xvpf ${SSTATE_PKG}
-	# update .siginfo atime on local/NFS mirror if it is a symbolic link
-	[ ! -h ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo 2>/dev/null || true
-	# update each symbolic link instead of any referenced file
-	touch --no-dereference ${SSTATE_PKG} 2>/dev/null || true
-	[ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig 2>/dev/null || true
-	[ ! -e ${SSTATE_PKG}.siginfo ] || touch --no-dereference ${SSTATE_PKG}.siginfo 2>/dev/null || true
+
+	# Update both any file and any symlink pointing to the file for sigs as well as the file
+	for file in ${SSTATE_PKG} ${SSTATE_PKG}.sig ${SSTATE_PKG}.siginfo
+	do
+		[ ! -e $file ] || touch $file 2>/dev/null || true
+		[ ! -e $file ] || touch --no-dereference $file 2>/dev/null || true
+	done
 }
 
 BB_HASHCHECK_FUNCTION = "sstate_checkhashes"

