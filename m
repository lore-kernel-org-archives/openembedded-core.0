Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28400C44501
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:51:59 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9344.1783835512196357045
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=K3wJZOij;
 spf=pass (domain: underview.tech, ip: 74.125.224.50, mailfrom: vince@underview.tech)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-664d530fcfdso4244305d50.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835511; x=1784440311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ZE5V+q19E5+KhibF5eu0YBz+rNt1AuLLXF7vNizyN4=;
        b=K3wJZOija6zfN1guBNwgyS5pzX4m80Ud0mYe1IOUK8ZeUsz8Bs1umxWUU8GBZMux09
         AVA41cfSW/q4GNAYhv43/IgqaBMjKJLeR7F/F+h56+vcOQQDswBE3CTXcVE+hRaxB2V5
         sY51pwc44ZEZD0PwurNmkuWL+vdIh12VIdv2RbZYtzfn0K16acJhhXBhV06R+L5VpJEv
         bweU7e71tI8e+HRB1u5VTUJ1lZWT1ZUX1dZGp7cEEcmU3uc9DY67Atvs8UofH5HPrnsF
         Xf/rbYKnpy0Kl2sVbnto9lUOX0UTLANCt+k8A44+Eb1tPfxMDBVTaUK5HlaUBB8ZhBu3
         RCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835511; x=1784440311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ZE5V+q19E5+KhibF5eu0YBz+rNt1AuLLXF7vNizyN4=;
        b=WC+u+0+PSOKQpA18xKXCokDb9pTyT5rhYgGvJgjjSfRpX96Ac+ELigco7QPDvHpEIj
         RGx3W59VVGEJfCUc+pd025jLuJ/izqFYLekumZZLjR8WkUkTt/PSaR6B+D086nQ0NR/Y
         bxTitb55+gKBTPNbWF7/AOiR7/MF/vIUYmRezh8l5IOeBdlrCSAAtt94Jd0ujhbxlU7R
         AUqkS0KBZSzSgyjy8f+NbXbTQV3kAS+Pd5cGbBOwrBQBU4UNwKJw1mf5YbpAtIhT7sg9
         HgpAlV6C9/9qgL0oWE7v6GJGDXOLikaXuBDyHEKEjn5qgJIboCBwPAfuKK89hLStLuJb
         cRgQ==
X-Gm-Message-State: AOJu0Yy7AOp7pVYHklmdH4yDhyFF54amMtAsqPMvu4I6jEEly6i+xa+V
	++WsOBn+UQw8tBvhyx3/S1WPpARfWHS5sxKyaFTR4K20AVih5QxO3tMUb4jqiT6dDk0t/bMtK01
	3jSU/Xdc=
X-Gm-Gg: AfdE7cn8g37BzuHmwHqT3Rczuq8OdPRR45636IcGjyvJ9GuAc0pVGhqfTElewm8TQNK
	2Vu2gI25SZ+T34MCR0zrWbArtyHO5+VX55cqjEVjdQB0DOkHHXx7Ih3tGbhTxo8g9ZL61vIKvmf
	JZ7oMmRp3mzEoNHoDDwRG/quXqGYutq673F8FxwNVUzxqsia8RCRoeijRwvbRl0nQReAcvBc/8J
	xxuKB1hjDlOWacU3hNsvbvaQrDnsEgs5EcJiFAzvblbYJ6j+Mk8hZEA40yEeHuEMm0M0YksSvSQ
	XcN0LEs1OPP9HuexF50Mdki9gpXni8EtKqC3ZHF2blCRZdkHWLqK6GCdaN9caYZSDL+se7fOKkf
	DNggtXZMljOazW1/RDNHuKeixw3OAc6c7YkE5if/2BDFiVldFXbEAJEaDVJl4Cau1kTaoA1t1sz
	rVmAiTNldznQo4kw==
X-Received: by 2002:a05:690e:138f:b0:667:db66:eb59 with SMTP id 956f58d0204a3-667db66f471mr2994297d50.22.1783835511309;
        Sat, 11 Jul 2026 22:51:51 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:50 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 21/26] ltp: rename kernel prefix
Date: Sun, 12 Jul 2026 01:49:49 -0400
Message-ID: <20260712054954.4063745-21-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712054954.4063745-1-vince@underview.tech>
References: <20260712054954.4063745-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240746

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-extended/ltp/ltp_20260529.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ltp/ltp_20260529.bb b/meta/recipes-extended/ltp/ltp_20260529.bb
index e863503200..58763f5d13 100644
--- a/meta/recipes-extended/ltp/ltp_20260529.bb
+++ b/meta/recipes-extended/ltp/ltp_20260529.bb
@@ -121,7 +121,7 @@ RDEPENDS:${PN} = "\
     tar \
 "
 
-RRECOMMENDS:${PN} += "kernel-module-loop"
+RRECOMMENDS:${PN} += "${KERNEL_PACKAGE_NAME}-module-loop"
 
 FILES:${PN} += "${prefix}/* ${prefix}/runtest/* ${prefix}/scenario_groups/* ${prefix}/testcases/bin/* ${prefix}/testcases/bin/*/bin/* ${prefix}/testscripts/* ${prefix}/testcases/open_posix_testsuite/* ${prefix}/testcases/open_posix_testsuite/conformance/* ${prefix}/testcases/open_posix_testsuite/Documentation/* ${prefix}/testcases/open_posix_testsuite/functional/* ${prefix}/testcases/open_posix_testsuite/include/* ${prefix}/testcases/open_posix_testsuite/scripts/* ${prefix}/testcases/open_posix_testsuite/stress/* ${prefix}/testcases/open_posix_testsuite/tools/* ${prefix}/testcases/data/nm01/lib.a ${prefix}/lib/libmem.a"
 
-- 
2.43.0


