Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.8713.1613486589157456810
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 06:43:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cUc3VCBL;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id i3so11443930oif.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 06:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z7hPywepPy4nAeBaiuuVRT9007Sg+ZuZ4O5CVIYlF60=;
        b=cUc3VCBL2H0VOgsexNN1eJxj3AgEkuoB2LzYE637vbrmActyTJ6KgHVscBsfQuju2M
         XghiOYg1Ilc/c01px5uQIVyALuTAJPn/im6AGjpMFWgDb6Sg2BW5LZBlxNtfdwQxJoNY
         0Q7tK3DXUdpQzxviYJRsOvmkWujgsKzZKH9WBjc3aRQceuWq8DW5RbwUGr4+/SpJnKYl
         H7EImiyCIraTHuuaBnXzBvDeARaXYmGmmr7Qe9NKHTOlArcK0p4tZm56c2w6PTyEWgde
         +vXh3PKTaXIBxfnRtmI+3sMfhg3aC/4ZXlXhinap7dzf482WjCjQmvdGtHU15jd64UiB
         2gIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z7hPywepPy4nAeBaiuuVRT9007Sg+ZuZ4O5CVIYlF60=;
        b=Ll4eZhEogueqg2CRVqX5AZijNImY5LZ+mR+SgTMA/kMMihuYLMhQrjvWv3CGJ7ocSa
         L2QL0Ssap2QhbTca4eUflRtYTN/2YWxt+ZLQhCxPU2CO9Lg+SUPjF3lIBtlPAUJlXFlB
         gegnqPFMbM7B/yyumFEgqMFcpNE7cDVsOCgqL5Nlk+m0k+e0bvWLk/Fzx++RdVu3VM4z
         hiS5XAMNYfP+w4nEZ6MZUtNiuq6nSvBNXDpFTYi4p76n0hxvh/a0JgvOAJ93JSEo8yAm
         /ykcdJfcL6zfr+sjIUf9I3lIPtw+S+pCHf/I9M+MBAoefrIlWG9go8QtYjkYQbMXYTbW
         x0Jg==
X-Gm-Message-State: AOAM532vuANjOiWN56ErVQrHlu9CgwM7MzB3trKY7Ydg0PG2pHr/19yP
	whrJGAJATZTUydFgTgmk/raYJsppGGw=
X-Google-Smtp-Source: ABdhPJzGaTZqQPQAuFBqm2wwJ+HtHC+xC0iuAl16rNS3aWOsXnr6pI2Q2gXwQ07vZZjNWiJ3rBULRQ==
X-Received: by 2002:aca:52c3:: with SMTP id g186mr2763920oib.136.1613486588312;
        Tue, 16 Feb 2021 06:43:08 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id z24sm4291909ote.1.2021.02.16.06.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 06:43:07 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 2/2] acpica: Fix reproducibility issues
Date: Tue, 16 Feb 2021 08:43:03 -0600
Message-Id: <20210216144303.33986-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216144303.33986-1-JPEWhacker@gmail.com>
References: <20210216144303.33986-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes reproducibility when build acpica yacc sources by instructing
bison on how to do the file prefix mapping

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py    | 1 -
 meta/recipes-extended/acpica/acpica_20210105.bb | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 99497522d2..29cb0cfd37 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -25,7 +25,6 @@ import datetime
 # https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201203-sua0pzvc/
 # (both packages/ and packages-excluded/)
 exclude_packages = [
-	'acpica-src',
 	'babeltrace2-ptest',
 	'bootchart2-doc',
 	'cups',
diff --git a/meta/recipes-extended/acpica/acpica_20210105.bb b/meta/recipes-extended/acpica/acpica_20210105.bb
index 48b560db53..0188dc8a1b 100644
--- a/meta/recipes-extended/acpica/acpica_20210105.bb
+++ b/meta/recipes-extended/acpica/acpica_20210105.bb
@@ -34,6 +34,8 @@ EXTRA_OEMAKE = "CC='${CC}' \
                 PREFIX=${prefix} \
                 INSTALLDIR=${bindir} \
                 INSTALLFLAGS= \
+                YACC=bison \
+                YFLAGS='-y --file-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}' \
                 "
 
 do_install() {
-- 
2.30.0

