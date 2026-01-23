Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE09D74EFC
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 16:29:09 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.259.1769185742641355374
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 08:29:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=MbV+Q0Fv;
 spf=pass (domain: baylibre.com, ip: 209.85.219.50, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-89461ccc46eso46686456d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 08:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769185741; x=1769790541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tJuBkBxHDYRlQVEUoLugeJ+t0KwZm7IPwn4iPhMlaTI=;
        b=MbV+Q0FvL+gRE0h9NSqvdiafoa1NGqtQrp2iAM15IhiGlIjNKBnzhqjcPaFfMcPYA/
         hC9qGZsYl8n1buDiD3buNGZx3HcPKlzMnKxWn6goJZORJwDxnT2Ak14sfFo9ihwajDdD
         HM/uFqV/o80Hf1ynVS04HYHG2PCVzOqlWXwJwBOWxw6g3jcztAKEmjgU+raAoT0qwz/D
         bZBMYJpUQ9VpxAQ8L6cc77QTNDb9WxbeuUUF48ap/ftMHQShGRqxJZTMqq9S+kZ3hgl2
         zXw3jNFqa8DFGLGM1/k7kv1rUYQvnEwLryrM89/BB8ayqfs+fgf8ZRa9RzSwwS3PG5ll
         2KIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769185741; x=1769790541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJuBkBxHDYRlQVEUoLugeJ+t0KwZm7IPwn4iPhMlaTI=;
        b=ZXfNBLMU6aK2XSZOw4W4KWXIN+V1sTcpYWfAlr6r27kj4L0PYfawP09pg6GEgJgU/F
         aV4zEZqqlH5d0w4LF6oSybfnRBezWFZoqqv3lvc0KO8by8ZlaVQjyIYmLEdtY7tonPCw
         /uPIjMdKKEJnszFqDMycTtvnu8hGKwOaFlcVt8PEWnAWHT53ksqWfE4vBFpG8sp9V98a
         x9bNCIE1fW8R48qhBv5qR56KEaGdFqlNksyQkrorFxw9t0J6OxgnZ239Z6CukXfRM8XC
         6V4ZTsv+a7af64bE/wMLGpXZMZcHa6lNfrB4zWAqhKepPIbr15F4AmjqphtjmkjezK87
         DBxA==
X-Gm-Message-State: AOJu0YyPZA4RsHsQeDtJ/TPkaofAKRLnvO0S7b48ODFy4hYJF9P8O3Ps
	EvqKyD19aMsaW5ONEJfNtZrmu/IKjZE+1Mw8rzBcOuDD+e4xor0vmmN8RAdIn0C/eIqctZN/55q
	2hsEX
X-Gm-Gg: AZuq6aIorN+DU+3VRW8yfuvpYgDURhz5x8Z0wLo0lbytOHgBXC/RWQUEHnuCp7kNuza
	aSCzro4CS3FOMNlLQzvZW3uJPT9R0mYzBR8RzofOgXe79omxKP2H3kxgB38GJao2cWBv/EAU/4i
	DdDaKVTM+0QlLS1PdzIQWdc3KvnXV3a4lBdNbyHXu2LXXL5lZ9hhI0Gf7W2PRULq9v5aVyzEtnN
	B6Abt0LX/deCnMZW9WnLl+iAwkzkL7rhbnw/91kXoiPntSGP5u7UgMzNBp+LSHO0qN622wRk+Tn
	yRk1+D5r4XR7m6sixugBRHLG/pmxmTK88Y30v1ECKW0SEamhqgl1dWbUW795IBJaLIokzt1gq5M
	kYbrSaFErWMcmTuXEK74pVgYzRH1RxXKfYH/t9KXTO79Bxf17QY9LYVqje4WZUqWdcP/peIv5Wj
	V2M1cBVCTaHeFmcVk=
X-Received: by 2002:ad4:5745:0:b0:894:67d8:293 with SMTP id 6a1803df08f44-8949021c349mr54443116d6.57.1769185740871;
        Fri, 23 Jan 2026 08:29:00 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e38700c8sm200021785a.52.2026.01.23.08.29.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 08:29:00 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] qemurunner.py: replace 'codecs.open()' with 'open()'
Date: Fri, 23 Jan 2026 11:28:58 -0500
Message-ID: <20260123162858.1905837-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 16:29:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229897

With newer Python versions, codecs.open() is deprecated, leading to the
following warning:

|Stderr:
|/srv/pokybuild/tgamblin-qemux86/openembedded-core/meta/lib/oeqa/utils/qemurunner.py:133: DeprecationWarning: codecs.open() is deprecated. Use open() instead.
|  with codecs.open(self.logfile + extension, "ab") as f:

Note that if we try to be explicit and make the 'errors' keyword
'strict' (as the codecs.open() call defaulted to), we see other
warnings:

|ValueError: binary mode doesn't take an errors argument

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index de26395bae..68e986150d 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -130,7 +130,7 @@ class QemuRunner:
 
     def log(self, msg, extension=""):
         if self.logfile:
-            with codecs.open(self.logfile + extension, "ab") as f:
+            with open(file=self.logfile + extension, mode="ab") as f:
                 f.write(msg)
         self.msg += self.decode_qemulog(msg)
 
-- 
2.52.0


