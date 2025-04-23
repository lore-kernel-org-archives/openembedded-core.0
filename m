Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB96C369DC
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 13:20:47 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.8320.1745414444187383769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 06:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FCAUWwBl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736b0c68092so5463269b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 06:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745414443; x=1746019243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lpguYIQdFUttBaspyDl8KHq1/6UYYTIh0mhRF2wXAIs=;
        b=FCAUWwBlMhAdl15G6tRpiHcHCoDZ2ioSLnJ0oqD3BDJWi71dJfkTTEMwDm3E+Lk+kD
         +Z9HYpnCdxpYNQg6/eMFDG8vkiw1WvK/866UpdDwKi0gsmP4JuLS5fenLAgsKykn8tUi
         d9cwwjearmSq+r0/TkJNuOWmrjx30pLy12yrdmPgUsmf6/kfYor0kt8VyYs0cRLWUO+u
         PRLiJO4MxoM+TL469o6Kv6PLQMx7+w6kl1xWL64sbyID//XNuQF3PlgH6oEP1B8edDWy
         eIoY8OzN5b8f2sc0h2CkRLFWcQaSdk1A+IKzX10DZz74vhVYSSGqyYxOlHJIz3g7oCVS
         xxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745414443; x=1746019243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpguYIQdFUttBaspyDl8KHq1/6UYYTIh0mhRF2wXAIs=;
        b=WK5wUmJdPtZikI/GWaAz0cwpP1JJuu5pZT285w7vcfJiriHiiWf5cwPK710B902tGJ
         nHWcvSOzMiZBWSLaSUUB4OoCyQQnJLbGVO+TvHdZUUqFN+Kkd/lgcWjoWPFVrYn6RzMQ
         Q4LhpxBrC96HtzAKq3IbwbqtUj2Akm80mYTUFe0Ekf6pZOc34ly9tT/+cEaRFZJP7NqC
         4EFmxd8Gad/5SPV2A3p/Zv13fsLpCP9QMUe7DdtWYUhhjSZs2zAXObhSR/tEUJOt62fr
         fow1E8AqZJrYEATPpHTrvVTscMQZsSS/yIXsTm1cnSgTrN/nrVuk6Q9ohsaDsh/SglaG
         V/gw==
X-Gm-Message-State: AOJu0YzCXzAOVGcCoAyj7pc8DmDa8K4uEKltEmR4vo4TFuUWpElAbsLP
	V5HqkDbKBY2z3iTfb47ADNiMUIlIvZiZZTsRa0Mo4SSX5rp+ZNZa+vhb0BTqLYJ8cdzIl1Jj1DR
	Y
X-Gm-Gg: ASbGnct9kcm176g4/BPdXmW6bB0ThhfmtGpx4LGqIGj4oek7JVyAR5VXHhXA6HcuPXz
	ZUwdwobnuD/JkTug+lyVIVDS+1JIq1jEUsPnBL/QY4SKbx+aCR0XT+6JIKjKgZRMQkyo670ltRo
	BXb9udflSmYAkmVuwn+W6phFndOc0wbQkt66q4DylLrqccDeaTn3IdoXaw6uAIf9/uPrNsWHbmJ
	V0uRY8JMYnhNo3VxFJwB7/PoRjT/MxrEOYcE2WE6WLBAqysWhuohQoOOEdRUsUB+8Bey91nNicd
	cQMldbvYcps6iEu1gf1IrrKrwXyOWxxBiBPyMzrKqQ==
X-Google-Smtp-Source: AGHT+IFdwpo+A0i56gmgRdIbIsXw3RCF3XBre94Y76IeEdkpdplQFACuTzxQrxXaVd9WRaFQnmyqxA==
X-Received: by 2002:a05:6a00:3a06:b0:736:5725:59b9 with SMTP id d2e1a72fcca58-73dc14573e9mr25656245b3a.2.1745414443411;
        Wed, 23 Apr 2025 06:20:43 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:371e:10cb:f3ce:33f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e510bsm10898037b3a.66.2025.04.23.06.20.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:20:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/14] binutils: patch CVE-2025-1182
Date: Wed, 23 Apr 2025 06:20:17 -0700
Message-ID: <d27416eb05643afcd80435dd7ed27d6cd3d85650.1745356684.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745356684.git.steve@sakoman.com>
References: <cover.1745356684.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 13:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215299

From: Ashish Sharma <asharma@mvista.com>

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=b425859021d17adf62f06fb904797cf8642986ad]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/binutils/CVE-2025-1182.patch     | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 758bd8dcce..9fc29301f0 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -44,5 +44,6 @@ SRC_URI = "\
      file://CVE-2024-57360.patch \
      file://CVE-2025-1181-pre.patch \
      file://CVE-2025-1181.patch \
+     file://CVE-2025-1182.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch
new file mode 100644
index 0000000000..15b40fddb6
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch
@@ -0,0 +1,33 @@
+From b425859021d17adf62f06fb904797cf8642986ad Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 5 Feb 2025 16:27:38 +0000
+Subject: [PATCH] Fix another illegal memory access triggered by corrupt ELF
+ input files.
+
+PR 32644
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=b425859021d17adf62f06fb904797cf8642986ad]
+CVE: CVE-2025-1182
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ bfd/elflink.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index bf940942ec3..df6eb250961 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -15116,6 +15116,10 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma offset, void *cookie)
+ 	}
+       else
+ 	{
++	  if (r_symndx >= rcookie->locsymcount)
++	    /* This can happen with corrupt input.  */
++	    return false;
++
+ 	  /* It's not a relocation against a global symbol,
+ 	     but it could be a relocation against a local
+ 	     symbol for a discarded section.  */
+-- 
+2.43.5
+
-- 
2.43.0


