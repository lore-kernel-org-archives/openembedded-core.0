Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86507C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 14:23:41 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9905.1783520611556885736
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 07:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=AJzkdCwR;
 spf=pass (domain: baylibre.com, ip: 209.85.128.46, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c7902f47so5669025e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 07:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783520610; x=1784125410; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0A1vzlBTa1+SIkc1iLMi1a7pabGVN9Lvk5d9ZUbspU=;
        b=AJzkdCwR6lSNiwbBvgiWN49wlLlumtLCO5hjePM/aziJUnm2Bidh4jbJOkyXnE4Z7Z
         yT7icPcUwS0vGLF9iq4bIs5JUIsW3SUc1N3YzqYkBJqO5b8AfRjXxi4peDfhtNxiPgJ/
         ONa9pqsxRosjFpN33ReW3HQ5kTBVnuU0qBxhvOvQtWM8oojoqnDZTjV8Nch3j2ck2z+9
         yoBGsmChoECUhyiqSDGxVQS3hVxhxDkEe4qoPm1lDmfENQcuwjlS2GvKgJKn7pDSLo3h
         G/9hPGjauIyGohczi3xMpUY0JJqkiOxL9AzjA7nEuxOeTXDuNHyK8PjWUwJUw5/4GqMl
         PBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520610; x=1784125410;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C0A1vzlBTa1+SIkc1iLMi1a7pabGVN9Lvk5d9ZUbspU=;
        b=I+4bKWKjLL26o/3YnwWDYh5G76EqVZjpHXnfgaWxfY6NOWtTXUqSISo1lo+ilCmu78
         waIfMoXh7E6z7igFeQS3/s9rWlzfSp6hu3uCi6738Un35AQ57NRk60iq9TPyQek3oSHL
         LaG/9WHhLAkKQTrsrCjLA1LcjvI2i7cYlvwlVJKH6qyTFR71GUuwaicbMKU4w+QT6Ize
         O0Bl0dDGj5JI2EgSy/RD8mhEDnGjnhwYCALKmC3Z+YBsTKx6qwbx0lPlk5p+X8ZjP9ww
         LlaG/gEoDCCR3dA4kvujHq2ilSUb5mJAZcmUnDIG7GUOMCLI8WXl7l3Pn18QQSeQT/S4
         qpmA==
X-Gm-Message-State: AOJu0YyLRgvI5vGM3nHVwZ0Gn8LYflY78qVtY2eNt7zB86zKHIt32jjk
	e8gd8qaphVVSgIg0zgd/LGGREc5Pa+0M0yCJA/+JDIQNDnMsaclO8gXvyhpYwDkUMwyq8nklTxu
	xgx9P2sA=
X-Gm-Gg: AfdE7cn8q4bQOukQKBKD3WWvMxnP1R659Eyvyftjb0w8goEUTdTJ8Fg9utxzTR2TAl7
	bZ7HtqvTRTVgW0ngHzVOd3qanGKszqm2iIKmwRGOeI8dfXihSI9qoeEDrHkxPR0miLUaTkpoG2p
	47j5R0vTrS1++yknIXgGqgupX576mYMldo5nlYl90Amj63PPwFQ+fw4Hh8Sk6/qNfUJunKbjhqK
	u2Zsxnss7NdkphMriXRZ4gWW7q2oLKM6d514WTi3gScYo5g3QrP1eOnP7vS9EjtH3qYf1GCEvMY
	hq+aaHZS8VDA/z0lJ4HHGnWHG+SrOJLT5rWqw8mSBZaTZqmPc5WNTsF889HObbl1g1aYpOb2MRd
	t7ofLs2hsbksn0A9sn5FAfAnyBG9B1IGpW2OFXucnheG+ehZuJ0PDVYdcNul5T8YmdTEwwtqrPt
	iTPNd3xDL1OPY1qpdtGiso
X-Received: by 2002:a05:600c:8b53:b0:492:67df:3dfa with SMTP id 5b1f17b1804b1-493e6875dc0mr29820325e9.34.1783520609910;
        Wed, 08 Jul 2026 07:23:29 -0700 (PDT)
Received: from ban.tailbdf2c4.ts.net ([80.233.37.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f41014sm143586895e9.6.2026.07.08.07.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:23:29 -0700 (PDT)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	=?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [wrynose][PATCH] ovmf: fix tpm PACKAGECONFIG to use TPM2_ENABLE
Date: Wed,  8 Jul 2026 15:23:26 +0100
Message-ID: <20260708142326.916446-1-pidge@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 14:23:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240486

The tpm PACKAGECONFIG passed "-D TPM_ENABLE=TRUE/FALSE", but ovmf
renamed that macro to TPM2_ENABLE in edk2 commit 4de8d61bcec0
("OvmfPkg: rework TPM configuration", first released in
edk2-stable202202). Since then TPM_ENABLE has been an unknown macro
that edk2 ignores, so TPM2 support was never compiled in, even for
MACHINEs with 'tpm'/'tpm2' in MACHINE_FEATURES.

Use TPM2_ENABLE (as defined in
OvmfPkg/Include/Dsc/OvmfTpmDefines.dsc.inc and consumed by
OvmfPkgX64.dsc) so the tpm PACKAGECONFIG actually enables TPM2 support.

The same commit also added a separate TPM1_ENABLE macro (TPM 1.2
support, default TRUE), but its dsc.inc snippets are only included
inside OvmfPkgX64.dsc's "!if $(TPM2_ENABLE) == TRUE" block, so it has
no effect unless TPM2_ENABLE is TRUE. No separate PACKAGECONFIG knob is
needed.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 19bcc4a96f..01f840c215 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -14,7 +14,7 @@ PACKAGECONFIG += "${@bb.utils.contains('MACHINE_FEATURES', 'tpm', 'tpm', '', d)}
 PACKAGECONFIG += "${@bb.utils.contains('MACHINE_FEATURES', 'tpm2', 'tpm', '', d)}"
 PACKAGECONFIG[debug] = ",,,"
 PACKAGECONFIG[secureboot] = ",,,"
-PACKAGECONFIG[tpm] = "-D TPM_ENABLE=TRUE,-D TPM_ENABLE=FALSE,,"
+PACKAGECONFIG[tpm] = "-D TPM2_ENABLE=TRUE,-D TPM2_ENABLE=FALSE,,"
 
 # GCC12 trips on it
 #see https://src.fedoraproject.org/rpms/edk2/blob/rawhide/f/0032-Basetools-turn-off-gcc12-warning.patch
-- 
2.43.0


