Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web11.9959.1614349529304261654
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:25:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BPV9YX3B;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.174, mailfrom: steve@sakoman.com)
Received: by mail-il1-f174.google.com with SMTP id v8so4504096ilh.12
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HUupVZtoWytq19L3hG/Ut+uIcEx04WATFl7Pe0Stlfc=;
        b=BPV9YX3BF0K5jPv6YmDdrTqNf4tAWjUHKa1SBy94NQ8k0RJVcwTCQ02tgSXE/Wsvd3
         JDpxTEYL6fY/UBR3JHcwHZF2oS8/vrUiXa3CDFmz+qQ5FyrrwxtrecdvEIkmgjgDLXi/
         K/5Acx3mAHpkHPvP8fSJ/qAsYEFWI7yWKJOXbA+iRYychpxXIcGWAiSK0hucRYadFgrU
         jEG/KpiNTxj8aUvP0dIVvhu2hB80CC5f1Dzz2fp1axEQXZ5tsZbjhlFQvOjjlJSZhUqk
         K82JvavtzmOHGrlmg7qE/cxnBoOfi8oLF1Lq4PfIJBmXYqsFEvNexeT4YWS/gG7OgQc+
         PUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HUupVZtoWytq19L3hG/Ut+uIcEx04WATFl7Pe0Stlfc=;
        b=JMXL9J6Wqb1gfKmKVgTyVzpWR3fg1/8qlkirNfXQMiG5NEH0/nGPc69rWujfmpwveg
         Z6cKNsUOb0F0Wh89vyUS40vdaBCP6qry7mMIAIzvi5TvV8Xu7dxboXFBiheeAv4qWUUb
         26L4KJ1zZ2e5ajBt08FGg1Laghx0JmmiiPFCFuHdT9+qYQ/Dbk+fepiZmZNqbmx/FK7O
         vBBs0AKymp0veuVoBgMtCuZI5feP7ICcwsMt4pDWNiYqFn+yA0Hh7KufH050JrgkRZJl
         xfSOMXzrdQVD7r9ZK7TAeJm4RGVWSKnazjltGRMTMqtOmc1mF0PCgBrgerlNq0/mER8I
         591Q==
X-Gm-Message-State: AOAM532mZwDY8sQW4Yp08haX6UY87qf0mfIxdy+CD4a+ZcpGkS4S+3ql
	NvOqK2zC2VWU86PGTOCyvSn0w7DtYBHVtiTS
X-Google-Smtp-Source: ABdhPJzs6k5RxReaTXgwsnwNR3EptL0f34qPAUQq8Tq+KGWEEz9YLmJuNs/WV33WqCdn2rRGvFeXjQ==
X-Received: by 2002:a05:6e02:1384:: with SMTP id d4mr2634098ilo.307.1614349528180;
        Fri, 26 Feb 2021 06:25:28 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.25.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:25:27 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/40] cve-check.bbclass: add layer to cve log
Date: Fri, 26 Feb 2021 04:23:49 -1000
Message-Id: <4281c88dd36d93fda5ca5e90722c98c061da25c6.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: akuster <akuster808@gmail.com>

Lets include whcih layer a package belongs to and
add it to the cve logs

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 00d965bb42dc427749a4c3985af56ceffff80457)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index edb704b187..8086cf05e9 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -335,6 +335,9 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
     """
 
     cve_file = d.getVar("CVE_CHECK_LOG")
+    fdir_name  = d.getVar("FILE_DIRNAME")
+    layer = fdir_name.split("/")[-3]
+
     nvd_link = "https://web.nvd.nist.gov/view/vuln/detail?vulnId="
     write_string = ""
     unpatched_cves = []
@@ -344,6 +347,7 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
         is_patched = cve in patched
         if is_patched and (d.getVar("CVE_CHECK_REPORT_PATCHED") != "1"):
             continue
+        write_string += "LAYER: %s\n" % layer
         write_string += "PACKAGE NAME: %s\n" % d.getVar("PN")
         write_string += "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDPE"), d.getVar("PV"))
         write_string += "CVE: %s\n" % cve
-- 
2.25.1

