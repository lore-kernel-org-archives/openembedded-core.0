Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45392C54E67
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 05:27:17 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.1448.1711430832255215706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 22:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m38OjeE8;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1e0f2798cd8so1407895ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Mar 2024 22:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711430831; x=1712035631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/nibe54IG4+Ng/v1W3buxbNogkMcdPnMo9iwMbPJ9I0=;
        b=m38OjeE8R4x1GtW4BrcB/IcV4X+O4wvVvza8TrWmbb3HgdlTrAt6Thrm+hnsLTkiEE
         CDnUa/FQriXeeFPQTEg6RWIDl65K/X2+ykp1fCsXbzTBt5lTZ1/88JmiKetiRMU1DnrP
         Z2WqHicz/jQ4P6QeR7EOrG12Uaq/FMMT3adKK3eMjGS+GPON9bF/5xNA2+3io3nZW5UA
         zipiqYDE+u7DMpHw0m9mPCitzuaQXcL7WCqiL7UtwQWpAChGhXtQPh1Sg5vQBMhpmPcX
         KPILzz34NldD5PpXhO+CF+Kc4Zk2F4chrW6tv+buhBkysc73kBakh0xkGf2nyluB2SHu
         aGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711430831; x=1712035631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/nibe54IG4+Ng/v1W3buxbNogkMcdPnMo9iwMbPJ9I0=;
        b=GxF1trLMFdv9bOeVbJ0BxtwxjiNFqZvPfYuA/8xGkMOFoXjZUdZZaLCFnmJq+/jQby
         34egKM7wSbg52SZXDNVgeDFlgeyYGgRGvjrV7qIuZ7xaV03KIoyhv672uxu5f6WRdXgn
         Lt7PABxjQMJkLFxSoXPdxmm4bpgO8Josdqh4gUhyytCmYaym49NkVwKiBgRDrQYrtsBW
         Ukc8UAl7M5nYYSlIS6CXWPpKuoCLZ7cGisWHKR/luATrO7mBM/TdTUGYWTOuul9hM8sN
         lzGqbNgKfDO7oJNEfmVaFe+isnX42xrisoW3uOKbAHhmwApGstF6B1GXufM07JZkQf19
         Qlfw==
X-Gm-Message-State: AOJu0YwsozPu7k7B1cxY4VLxbC7nPxwq03ayBatN4rU7wbLbFyFaEnIn
	BVTk14sElA1//pt2Wu0Cfh79Vz+eghe1MxWqcX6YJWvMLKjzqqpGgOojOdIa
X-Google-Smtp-Source: AGHT+IGdmh/eRv4AoVH/Py9xDzYG0JGslHAjtu21KO2Tn36FCf8n9KvqZmNAPvpmwoMcfUrlaW9teQ==
X-Received: by 2002:a17:902:ab85:b0:1e0:b871:53ed with SMTP id f5-20020a170902ab8500b001e0b87153edmr1662726plr.40.1711430831279;
        Mon, 25 Mar 2024 22:27:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7a27])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902650600b001def18c0cedsm5905384plk.179.2024.03.25.22.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 22:27:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH] tcl: Forward port skip logic for musl ptests
Date: Mon, 25 Mar 2024 22:27:08 -0700
Message-ID: <20240326052708.3109288-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 05:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197525

commit 9d1df0596f6f3db6f63ae83559fbea3cc372503a overhauled
run-ptest script which did not consider the edits being
done from recipe especially for musl ptests. Bring the skip
editing to follow the new logic in run-ptest

Fixes Failed ptests:
{'tcl': ['unixInit.test']}

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.14.bb b/meta/recipes-devtools/tcltk/tcl_8.6.14.bb
index 964824e434a..de4f5b878f6 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.14.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.14.bb
@@ -87,7 +87,7 @@ do_install_ptest() {
 
 do_install_ptest:append:libc-musl () {
 	# Assumes locales other than provided by musl-locales
-	sed -i -e "s|SKIPPED_TESTS='|SKIPPED_TESTS='unixInit-3* |" ${D}${PTEST_PATH}/run-ptest
+	sed -i '/SKIP="$SKIP socket.*$/a # unixInit-3* is suppressed due to hardcoded locale assumptions\nSKIP="$SKIP unixInit-3\\\*"' ${D}${PTEST_PATH}/run-ptest
 }
 
 # Fix some paths that might be used by Tcl extensions
-- 
2.44.0


