Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF87C77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 16:14:03 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.37306.1683648835190573085
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 09:13:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ayCQXyuY;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-50bc075d6b2so11515093a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 09:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683648833; x=1686240833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AC2upMy89IOj399CB7oI9EnAqmWjl3TSQTL/GMNUeyU=;
        b=ayCQXyuYeFmP9N/q8oep1EfaZML6kfXkkewlUh0hfkDULYTOny1zA341o4/H/3af6y
         4F/T5Bh9s4m8+ITuf/HF2IESwTGeTN/Rs89x3NMlSZbzaiEIz6QsdSulaZp2Ufri+nBo
         AZoCBTB2W1hEzX2l5rAZWVGGsfAIsWzdrrsQvXwc2g11LVOX0kKAlAy7W02p5ONUckGU
         v4wW36nvFVuieAsNE4eflskPdYXPA+SlKa7RvOlpR69K2m9DoZEoKJVrXnepVYxYyDXk
         ZgSQm0QJIeVfWl8MBwd/lZ/LNPvI4J/rbYgpiFbdzpIZYTvifpb+kP61xsLnq6VInyNM
         dYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683648833; x=1686240833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AC2upMy89IOj399CB7oI9EnAqmWjl3TSQTL/GMNUeyU=;
        b=hpIJNGI47cSccAVitMu33Jr+RXM1en+UrKhUpOKECoF7Yf6TQ0/BnkZbLugL5eDcPU
         wbedugtKhStM30s1LY8IwZrUaYGn04iAwf+Gj/syfZF+NTHt6zUS9unV0nRerpd82SMS
         2Alsu9S1TzcST9VaoTRPA/NqkfPnCb7SHtAZe6015WKRnNCkYJ7fRoPrpA6///iqiK3A
         TcIGCNGBA6sZNOrx10dr1MDz3oBfr313tnyMx6JvvSus+yWfKBi1h1spCQR9IJUlU3jd
         u6tvzGb+oc5z+UdWXzs45tG3gg9m1l14BDm9GsWWFqMudTydij9wiIrMi057u4UNHGRJ
         hbYQ==
X-Gm-Message-State: AC+VfDzjByjxDs0WLzNqY+JXcCNM3eMYvzQFoUSVdwt1ohpsbTPa/e3A
	TY/ehKkz2/JDcFnDlp23aCQa4MwZxo8=
X-Google-Smtp-Source: ACHHUZ6+ZFC3+QWCyxBQHP7UKs9sH7yWyh0psffT0koOatSkKVwJxzD9ACFlCZSV+lhNy+IOj/4WhQ==
X-Received: by 2002:a17:907:60d2:b0:966:1284:e3e with SMTP id hv18-20020a17090760d200b0096612840e3emr11059219ejc.9.1683648833565;
        Tue, 09 May 2023 09:13:53 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id z19-20020aa7c653000000b0050bd2f16ef5sm903997edr.84.2023.05.09.09.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 09:13:52 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	raj.khem@gmail.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][Patch v2 2/3] perf: make pkg-config available
Date: Tue,  9 May 2023 18:13:09 +0200
Message-Id: <20230509161310.3839898-3-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230509161310.3839898-1-max.oss.09@gmail.com>
References: <20230509161310.3839898-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 16:14:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181051

From: Max Krummenacher <max.krummenacher@toradex.com>

Fixup the to be called pkg-config as $(CROSS_COMPILE)pkg-config doesn't
exist.
With kernels < 6.4 pkg-config is only used for the gtk+-2.0 integration
which is disabled in the OE config. Thus the issue wasn't exposed so
far. With kernel 6.4 pkg-config is additionally used for libtraceevent
and libtracefs.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 2f28d16fba..80199a4515 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -87,6 +87,7 @@ EXTRA_OEMAKE = '\
     perfexecdir=${libexecdir} \
     NO_GTK2=1 \
     ${PACKAGECONFIG_CONFARGS} \
+    PKG_CONFIG=pkg-config \
     TMPDIR="${B}" \
     LIBUNWIND_DIR=${STAGING_EXECPREFIXDIR} \
 '
@@ -287,6 +288,7 @@ do_configure:prepend () {
         sed -i 's,CC = $(CROSS_COMPILE)gcc,#CC,' ${S}/tools/perf/Makefile.perf
         sed -i 's,AR = $(CROSS_COMPILE)ar,#AR,' ${S}/tools/perf/Makefile.perf
         sed -i 's,LD = $(CROSS_COMPILE)ld,#LD,' ${S}/tools/perf/Makefile.perf
+        sed -i 's,PKG_CONFIG = $(CROSS_COMPILE)pkg-config,#PKG_CONFIG,' ${S}/tools/perf/Makefile.perf
     fi
     if [ -e "${S}/tools/lib/api/Makefile" ]; then
         sed -i 's,CC = $(CROSS_COMPILE)gcc,#CC,' ${S}/tools/lib/api/Makefile
-- 
2.35.3


