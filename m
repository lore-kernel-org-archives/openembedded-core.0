Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.2811.1596705314905814162
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2020 02:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Pbnlhy6D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id k8so8965342wma.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2020 02:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5OcA4r9D3ugJrV0bJ/2gwPjpvty1T5bQ/p8uTtMsyY8=;
        b=Pbnlhy6DKXhLS/qpeB1CdSltqyniFnR0IsLscImplwrBRyzPxyaDPIqzkFOY/2pyEH
         YvUinTc9DRvBRq8nuSiCfEu0GuSQNJ0fTqbw+GL4k/RGKTOkV7CZnsYvQEemCB2bGNPH
         jGGsENQOgziMVpUMg66DjMLMZbYcMEP+tzLpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5OcA4r9D3ugJrV0bJ/2gwPjpvty1T5bQ/p8uTtMsyY8=;
        b=AMJ9NDPz4vKFAbb6u5nrPRC1LIz7yVpCgphl6rUSL3VgoYv3EhTZ+jmDmu7NtFaYdz
         wMiNCX+w4B30wvXWflxrpJhbur3xGAqcgU3vwWdauKRKR/cVnKwrvy33vaJCsPqDKqWq
         P43JwiCuKn4Z7/DLWvbZVLcpzDYodlUjoJ5t0y8xui8uf7eH74h7OUjWceJi1KTWCiTq
         gEpmJkEoM7yZLCEwTUCQt+offps4qPRfmytJg8tk2U29Vcq/4FJynsuRr5uDNymQ04rL
         7Y9KZBN3cSBJt5L/WGUYUKtAlY5d6/2KM46lFbPCJIApC7Nq7Z7/UajLeuHISbSRuM3K
         Visg==
X-Gm-Message-State: AOAM531Lm2Ye9YLaqv3o/vkKFh/zb/TNNdZiGC2scFg8gVEn8uZ3kmFR
	1blrQ4ChbrH41pS8fTCJczHybocXPEvFoQ==
X-Google-Smtp-Source: ABdhPJwKVZ5nyMbZCMI8z0Qe79B2RX+eK2M0oZjYfAUFBMLB0QUDR7yNk/0wmToTR/jRq5bXZWAkqw==
X-Received: by 2002:a1c:e244:: with SMTP id z65mr6993422wmg.34.1596705312957;
        Thu, 06 Aug 2020 02:15:12 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (b.f.9.1.0.8.f.d.f.5.0.d.7.c.1.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1c7:d05f:df80:19fb])
        by smtp.gmail.com with ESMTPSA id f63sm5806626wmf.9.2020.08.06.02.15.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 02:15:12 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel-yocto: Fix bb.debug to add missing log level
Date: Thu,  6 Aug 2020 10:15:12 +0100
Message-Id: <20200806091512.691613-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes warnings like:

WARNING: linux-intel-5.4.50+gitAUTOINC+caafbdfe38_89e6c056f3-r0 do_kernel_configcheck: Passed invalid debug level 'outfile size is: /home/pokybuild/yocto-worker/meta-intel/build/build/tmp/work-shared/intel-corei7-64/kernel-source/.kernel-meta/cfg/mismatch.txt 767' to bb.debug

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 3c428c0782e..7f870a6cc61 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -515,7 +515,7 @@ python do_kernel_configcheck() {
         with open(outfile, 'w+') as f:
             f.write( analysis )
 
-        bb.debug( "outfile size is: %s %s" % (outfile,os.stat(outfile).st_size))
+        bb.debug(1, "outfile size is: %s %s" % (outfile,os.stat(outfile).st_size))
         if config_check_visibility and os.stat(outfile).st_size > 0:
             with open (outfile, "r") as myfile:
                 results = myfile.read()
-- 
2.25.1

