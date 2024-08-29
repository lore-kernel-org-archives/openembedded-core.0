Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE54C83F0D
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 11:59:24 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.11631.1724932755807488582
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 04:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y/9Xl25K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3718ca50fd7so393211f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 04:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724932754; x=1725537554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XVI0vNXJ6J9mHmp5zJzw3wfVMfoZ47Gh1A3uU7hpcIw=;
        b=Y/9Xl25KLhpxwZxhfeanfiZzmGusaC5guoCqHMylgq/0VwAA1rLGDwZiRIiqwYnMTx
         ZLvXaK/zaLmx8ZeqbQhW5lKaHPsTByu2wFPp2nRvmlKZPsrqmRDWLszOmLivswrHZ8kA
         NUPhWKZYrBpOTH0tJ1ZeXGP/vdOdsm2s7AAHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724932754; x=1725537554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XVI0vNXJ6J9mHmp5zJzw3wfVMfoZ47Gh1A3uU7hpcIw=;
        b=bW7f03zO5Fi9l3YtxzSfbDDUQm21HMXN0umlcuczVKkibLbFZNR46mjF6jsE9iYu/D
         cugixXv9axPR02qRyZtcAI0Vm4CjzXyfv1/w405FWmzWJ535/Y2ELf3LcUwDWavmNNHS
         Zoh3rydzpqnO7RX0OpHp5FSmcAEWpBtlg+eIe3Io7PXrB+XVFya0ZHG0A2Gn7spE8ZrS
         RycilHTZqy8yUUMCNdWLRs4BF33rrnRNts3uYWXbAjPV/QrXTT+dfTJXq56eQgPlsHjl
         pDHqPfRGGhxF1hvvQnTNXjFvMilmWGxKZMY/2sHRo6h3Y628M0dV1x7Zpli8be6hi69N
         cZZQ==
X-Gm-Message-State: AOJu0YyiKbzWRIDHJAYl47P7VzdaVSLI+Dql3uggj0l8f4Z0PU0CT3Qw
	J3ENhboSDPhKlKjftNhDHGFV8f3PQajfHaqfpZ3yIuUqN+NrdiWk5+KaJoRKOku9Qae0LXY21O/
	I
X-Google-Smtp-Source: AGHT+IGo2v1YKbPt89/FxktKCCzG29ca7I+iM2YOSTEezrYTHK8+TRuvYBzaWrMJXPq/JVLEseIh2A==
X-Received: by 2002:adf:979d:0:b0:371:93a1:9d3 with SMTP id ffacd0b85a97d-3749b53163bmr1995022f8f.13.1724932753805;
        Thu, 29 Aug 2024 04:59:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:19db:d42a:7902:cfcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ef7ea91sm1227664f8f.78.2024.08.29.04.59.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 04:59:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] insane: Add missing vardepsexclude
Date: Thu, 29 Aug 2024 12:59:11 +0100
Message-ID: <20240829115912.4000512-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 11:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203914

If we improve the function dependency visibility in insane.bbclass, it
exposes some dependencies which were previously not seen causing variances
in the do_package_qa task checksums. Update vardepsexclude in a couple of
test cases to ensure the sstate hash selftests pass and the taskhashes
don't vary when we don't expect them too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/insane.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 4d9543f1e66..32adcc722b3 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -361,6 +361,7 @@ def package_qa_check_arch(path,name,d, elf):
     elif not ((littleendian == elf.isLittleEndian()) or is_bpf):
         oe.qa.handle_error("arch", "Endiannes did not match (%d, expected %d) in %s" % \
                  (elf.isLittleEndian(), littleendian, package_qa_clean_path(path, d, name)), d)
+package_qa_check_arch[vardepsexclude] = "DEFAULTTUNE"
 
 QAPATHTEST[desktop] = "package_qa_check_desktop"
 def package_qa_check_desktop(path, name, d, elf):
@@ -616,6 +617,7 @@ def check_32bit_symbols(path, packagename, d, elf):
                 for sym in usedapis:
                     oe.qa.handle_error('32bit-time', msgformat % sym, d)
                 oe.qa.handle_error('32bit-time', 'Suppress with INSANE_SKIP = "32bit-time"', d)
+check_32bit_symbols[vardepsexclude] = "OVERRIDES"
 
 # Check license variables
 do_populate_lic[postfuncs] += "populate_lic_qa_checksum"

