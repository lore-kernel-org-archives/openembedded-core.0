Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web12.1657.1596608093333426641
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2020 23:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IoWb/mG0;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id g33so6416727pgb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2020 23:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9+Eze62MmYFDqePu2mB9qskd6m0O4+P+FDTflMHYzYM=;
        b=IoWb/mG0Xe0V9o538C4uwUZSdbu3qSHlIhXVCmt0lP/l3nJxXbpKCrWaaxoEvSlH0Q
         eG9bVVb2K23efZY+okq7i1XkolFiqkTfByfK69xHT4hcWjjJDuWbv5gQdktJlaG6mqz/
         PSEasKuGGGoEYWl0e/2PrFyVKz2RW8LmFNUAydT1n2ENi7usqPZONof0jqCHLt/9Lho3
         4FlS8T2/hYHRjWQuM01WM4O1T4Ir9N1Kqv7dqgp07vAtKrE4Xyr+x76bjTx2/o3vg1Ce
         jBz9GjhOW1M8AfqzFqjiIbmwkDUqZWUYwlEjAZm0DuBhD6MJYaEpqvPMaRpAC6O286re
         puhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9+Eze62MmYFDqePu2mB9qskd6m0O4+P+FDTflMHYzYM=;
        b=YHZGxC7NDLliyiEHG2fxBoGj2jJY4Myjc8NXFwxYLhti1nIWfr0CdQ9TqezQmTUfT1
         Yptne4v1ryTTrz/PSilygDAaLxAMsA0OfKbCxWds6wkrsJb8xs1xnD9HLTz7rlYcXTe6
         DBBbslux4q3zVKpifqopIRzItiAinXvGLDolXxk196whXaDhIth9pd4CzAWTrzIgDvTB
         XKiXT9YI+Uf4LrurYS/u/aNvciIINPdoXOIHgAI0Of+Ek6Ph5OkMWz4RYdTqrj2YyGRe
         n2MKoU+0jWwt3oCZ7aaI4+7PWYzeTx+z3Gmz1RJ1K77W6sFBANHajfmIpjEVha1Ke7z4
         6VqQ==
X-Gm-Message-State: AOAM5338onDJY6H5MVboPQYnEz3Rw7HphpVPiZYbNX5Y4rDtOq9lpcz2
	33OPmLTHmxhvfhuzUUWKSpiabED4OaE=
X-Google-Smtp-Source: ABdhPJyKCKTFSUh0HIvcJPZLTHuutLq8H3hD8Hwoh86Y7aU+LHbyFa1brVQ1uz83DExJFpzlI5LFsw==
X-Received: by 2002:a63:1f04:: with SMTP id f4mr1663259pgf.34.1596608092460;
        Tue, 04 Aug 2020 23:14:52 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id a134sm1608405pfd.219.2020.08.04.23.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 23:14:52 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] dhcp: Use -fcommon compiler option
Date: Tue,  4 Aug 2020 23:14:49 -0700
Message-Id: <20200805061449.1029166-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200805061449.1029166-1-raj.khem@gmail.com>
References: <20200805061449.1029166-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This ensures -fcommon is still used when compiler defaults to
-fno-common in gcc10 and clang11

Fixes
dhcp-4.4.2/server/mdb.c:70: multiple definition of `dhcp_type_host'; dhcpd-omapi.o:/usr/src/debug/dhcp/4.4.2-r0/dhcp-4.4.2/server/omapi.c:50: first defined here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb b/meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb
index b56a204821..cf4af82609 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb
@@ -19,3 +19,5 @@ LDFLAGS_append = " -pthread"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[bind-httpstats] = "--with-libxml2,--without-libxml2,libxml2"
+
+CFLAGS += "-fcommon"
-- 
2.28.0

