Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.33176.1620046481502705016
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 05:54:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N2J8+PF/;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id z5so3526449qts.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 May 2021 05:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/b9oA6HcMm4xjtsnJBWpYj7JR/6Z5eAjxzdACmdenks=;
        b=N2J8+PF/sKf48jpK9Rs9i3KADzxrEP3IFBihPmyd1xhnL3i4fqld3W9osibVijuQxT
         mY2rdcE04UtEJjDJrzY2IFvFb0IYtg6dOALb4LKLt+65QZMoQwG3Ee30g3vnnbcKJ6UF
         D5Pybp1RRPac1KCp8HYU5Vk1ySkGk78Xq5nl90OwP/6adOiGsA2UH4iPLEduZZI535Ci
         NKwHB9w1kw7T4qIHrcc99gC9AIq5kLR6hAd+oNTt8H816ToaN8EHAHprKEum7nys1adX
         M9bBjXHUMT/miEc46tXCkZ2pGJpD18K6Dytk2+aFpDdrquwmdJCrPloJVy5szCLLDqXz
         sx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/b9oA6HcMm4xjtsnJBWpYj7JR/6Z5eAjxzdACmdenks=;
        b=T3BmhXA9UOuLOsROXoNIGOiD9ARNfxaZuNbiGDywiovPDNv4wCSG3jca67MDex1bQ0
         nKxsnZBfD4jS/bk8+u38aDPLf7CXFLGyKIdXld80reVWIokhZQQlPYcHzb53GPOyYZbJ
         iKmC2vDLDqxTk4R3uMYAjXsE3xyFskYforvV3zQpD3vc1PtVmhhqQQF7KKhdIxz/gvqr
         PH1lEUsvG4DYxz8CoHDre3NRtSLrvxYILTuxonUwJUDuALWdcRbcZQ1cicW0cdgsXknD
         teMs71pd7Sh7t68QGyhbvWf9QJg1kSQq2gfmMwsxwvFWtSD+KTUo7FQsX3aXBzSKMcRO
         UzEg==
X-Gm-Message-State: AOAM531c5bq3YAql9suh/tj4DievtVadlB3VFAF4mX0UEoPTUkbuVxSQ
	p4X90TXmYP1TD4GyaFDcEx8=
X-Google-Smtp-Source: ABdhPJzUYLwwuoUyjOb+gH5GBjVWtVaC/amtftv1+7LC3qyF14Kx6XmivxUm28qhjj8TmFPH2OgcCw==
X-Received: by 2002:a05:622a:1354:: with SMTP id w20mr17301974qtk.223.1620046480696;
        Mon, 03 May 2021 05:54:40 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id 19sm1940867qkn.111.2021.05.03.05.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 05:54:40 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] perf: fix python-audit RDEPENDS
Date: Mon,  3 May 2021 08:54:31 -0400
Message-Id: <4c9309d3f4ddc08266c1cf564e0433327e9858cc.1620046297.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1620046297.git.bruce.ashfield@gmail.com>
References: <cover.1620046297.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

When doing the perf python3 conversion, the audit-python RDEPENDS
was caught up in the regex replacement and was incorrectly changed.

The audit recipe continues to produce a package called audit-python
and it is that package we should have as a RDEPENDS.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index e5e5a0d267..2dfd798ef7 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -322,7 +322,7 @@ PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
 
 RDEPENDS_${PN} += "elfutils bash"
 RDEPENDS_${PN}-archive =+ "bash"
-RDEPENDS_${PN}-python =+ "bash python3 python3-modules ${@bb.utils.contains('PACKAGECONFIG', 'audit', 'audit-python3', '', d)}"
+RDEPENDS_${PN}-python =+ "bash python3 python3-modules ${@bb.utils.contains('PACKAGECONFIG', 'audit', 'audit-python', '', d)}"
 RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
 RDEPENDS_${PN}-tests =+ "python3 bash"
 
-- 
2.19.1

