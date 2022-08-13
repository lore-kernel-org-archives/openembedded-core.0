Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40CF7C25B0F
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 20:35:16 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.8726.1660422907521787658
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 13:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V47I9r1Y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id v3so4705435wrp.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 13:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=fiInH00GK9jkpm8Cx0VetHpuRkJgFr2ZgLQeb0pDF78=;
        b=V47I9r1YCXtWjljXEhi5qYoFBI/lrq6Yrn/RlneCPXGdfVzcTYVtCfVs+FUoiPklPZ
         Se9KgopK8yDkx79wM2AmlLv57hb7e3hpo2U3DH7Cl495z+kHOKhKDiV21v+xjMwJ10Ke
         5P/Yw9BLnLr7ZG6etsb9EgbGArNFS2iJTSFz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=fiInH00GK9jkpm8Cx0VetHpuRkJgFr2ZgLQeb0pDF78=;
        b=wLe8ONmeoa5HwzDAXfu+GMrFfMNQF0OGv4iGIxV4ezL6wxvq+ukpXGGziB3Jz39xE8
         3WAjzKzQzVup4seFA/oGXxYBGeNYKkjOQTEPjz8TwrdGPpPM3YsPtPrtL84htuVU6Fmv
         2A3zbbTtSTVXpLzom5QR4QqFnbROm2IfiTAR0eYSWmHuyl7AvA+tAv50F1pI6lXcKQVc
         02C+TDvfzJFxE9SzdNNNK1G7AkPuKjjUHG0i0VkmHDRhzW/x/0pFQ+4PMefjyQmTDVpq
         hQYwrjz9qK7E2GCSod7JenF0+v4gwXc/fTg5SwO84uUEg+jEzFz07PhYvupwAbZ0GRfZ
         HXSg==
X-Gm-Message-State: ACgBeo0yjExc4PqW0AfnpvtVYfRTlAeVYWe5lagSV9VUkJgqZiCPhEhD
	VDwFhGbjxshW69RJVBfqQ3wkPcgVS3gNaw==
X-Google-Smtp-Source: 
 AA6agR7xIJl/QJDQXvDfZxA7L6AJ427r67UJ60HN+tciMFPN1NryoQDcIrkZRgEz8tpEC3WOqTWqIQ==
X-Received: by 2002:a05:6000:2c1:b0:220:5f91:62de with SMTP id
 o1-20020a05600002c100b002205f9162demr5101999wry.715.1660422905755;
        Sat, 13 Aug 2022 13:35:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f6d8:ef31:d475:da8f])
        by smtp.gmail.com with ESMTPSA id
 l14-20020a05600c4f0e00b003a1980d55c4sm4182050wmq.47.2022.08.13.13.35.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 13:35:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] gcc-cross: Fix relative links
Date: Sat, 13 Aug 2022 21:35:01 +0100
Message-Id: <20220813203501.1111519-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220813203501.1111519-1-richard.purdie@linuxfoundation.org>
References: <20220813203501.1111519-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Aug 2022 20:35:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169317

Now that we're using absolute paths to run configure, there are absolute
path symlinks within gcc's output. Use our script that fixes these so
that the sstate objects work correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-cross.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 3ffa1f0c460..a540fb2434a 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -149,6 +149,7 @@ do_gcc_stash_builddir () {
 	# Makefile does move-if-change which can end up with 'timestamp' as file contents so break links to those files
 	rm $dest/gcc/include/*.h
 	cp gcc/include/*.h $dest/gcc/include/
+	sysroot-relativelinks.py $dest
 }
 addtask do_gcc_stash_builddir after do_compile before do_install
 SSTATETASKS += "do_gcc_stash_builddir"
-- 
2.34.1


