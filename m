Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.10507.1628177766385041509
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=NVCK2CdJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.170, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f170.google.com with SMTP id o20so7847150oiw.12
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EhYj4FC/VcuqO3W6avt8uhukvvtQr9Ouos2XoBXq2f0=;
        b=NVCK2CdJ6NbVxgxI825FKjidHE++dZZiX7q0fwwdZFCc5EWT1mAWOSxY5McbOjo33O
         q2MWhCtUAowdkYKHTS48Yn6nWHuWDdOYNVqAbC3zj9FR6iSFzT6GKQAolfmJB9C8iBKT
         PL8W5bgNf6wnmMszntoN6BUZ16abakkltcvuipMTk4cbIJ1DWteyRQ7mdWn/jQPhjf3N
         auDhNKPsAocRhf2XcWrZkcKq7Sh8Rn0Kv5HYrqsealnfMt9ozvW/GquQqBFC6pX/CY2W
         75W+kSRFoYALzFgjkCxCZksp9k+kzMXCfSXTUxsR67qlodLt2ElF7++k5OMJj7CkVKnX
         dpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EhYj4FC/VcuqO3W6avt8uhukvvtQr9Ouos2XoBXq2f0=;
        b=tP7hEhXKj3zzr34hq0s+tLinZNaAJwkfsDEQg9Fvq22oJzmGVMq27iFDHeK+iaQ4Lv
         x/AZCpMJ8Ik9a3moC0SPAaLTQZXOYIc06yIHPmL76ppSSlCEFfQMb3iYWzlTMWo82XAu
         KJvkEa69Q75wxks/pW5T9ohk2JPUjUBeXx/h9lWoFAbhlqsl+Ie/ttMnPdR/8ndQjWms
         rrK0apCISXWKAvVVKmzV3vgMv/MpV2Gd8ABUxVa3ygNhR3pmSTJkKs0Iiz1jNr+1MA8/
         JnQ6knTEkIzD9r3fdQy2pZZVbnCwFAOpNcRSxLymwbCME6sy1pVFo6IHZQFPHiVN7Dcj
         puUQ==
X-Gm-Message-State: AOAM530go74KxJinftSajmDHuisaBVx5/m7PKDnJilSxRLUtWNrGb2LY
	0Kd7QA3hwlvcYOyI/BjKWMUJTUBeU9GSrXhL
X-Google-Smtp-Source: ABdhPJxrOTwzP4BUoaabrnszlL17SmPJYhi8bhxzdv7m2iXVnWWBoVgPdPORg8VsrjEm3yFvGX6WUg==
X-Received: by 2002:aca:31d8:: with SMTP id x207mr11436923oix.144.1628177765226;
        Thu, 05 Aug 2021 08:36:05 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.36.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:36:04 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/33] archiver.bbclass: Fix patch error for recipes that inherit dos2unix.
Date: Thu,  5 Aug 2021 05:33:48 -1000
Message-Id: <3e8cb257546e00a988136dfa6d7f5e6b7f7f16d8.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: leimaohui <leimaohui@fujitsu.com>

do_unpack_and_patch error happens for these recipes inherit dos2unix.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2ceda7c90c0087f52693c54d5ccab143b27f4d21)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/archiver.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 7ca35a573b..49717d4f57 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -484,6 +484,9 @@ python do_unpack_and_patch() {
         src_orig = '%s.orig' % src
         oe.path.copytree(src, src_orig)
 
+    if bb.data.inherits_class('dos2unix', d):
+        bb.build.exec_func('do_convert_crlf_to_lf', d)
+
     # Make sure gcc and kernel sources are patched only once
     if not (d.getVar('SRC_URI') == "" or is_work_shared(d)):
         bb.build.exec_func('do_patch', d)
-- 
2.25.1

