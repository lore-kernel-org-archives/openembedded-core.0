Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.1073.1611991201238182524
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 23:20:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mZaF3g5N;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id b8so6701421plh.12
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 23:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YHuU0DG814WEHPLxb2s4ad7M7Rz2b7QD1CzQ+/nXeyU=;
        b=mZaF3g5NQreBmlOBXmE7z9JJrkVlxVls3Hkt2JNCsJnOWTHQ1+Cc2b5BPk2VqOXGq2
         SgZfn/RrsLklxhp4M7p2RjPFm4jL/3wBdXO5uOzhZj3JeanPbiIqM9sYKiUoKfC5kQxc
         M4wd8X+0PKQGR4Ka5OiPGKgzrjqdCcQqs1FF+4TfILcBQUNNNJ44pjh25KRlz60n3F6r
         hFOIdHt4Z1LdXf2FMkg6GumK7R7wCnkuMtkIxIoAyK455s8ZYx3T9edJOxNWjd1Hcku+
         bOJuqaD80O3Tmz4q0gi2fbEw3xHYakc3+TCMRxKhMI03IeojoaIM/zWKKXJKN7GKgyBR
         wJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YHuU0DG814WEHPLxb2s4ad7M7Rz2b7QD1CzQ+/nXeyU=;
        b=QjCk7GevjYN9SpjcTUem0HN86eENWZJ1ecV7Npxc08cecgwpu6rp88D5xqR6NIzbIJ
         eCs2WuHVSHSbDwLt4qbTXy999femSDLHMjxTXFbvMEZRL2cmyNf+xXrNCpqq1i1H/ICS
         W8dTJuexlQLp2ivINGdFkGbjNsWhI+OkRArJnISEXINsRD7tRZ6pU5SIafFd6sI7o/y3
         hSQfWVPsTEOgd/xGFwLgIsy1Zyh4iS3Zr5TIpCTD2vDd/qnl5zi+ypiYNaSVq2b9mVH9
         gZHzlnoJDn+NPvs91G+uGRtdN2s3a3EnhGeD1LL3h/sWjAFyWwvxrmdyKl6wI/p7WTn9
         f67w==
X-Gm-Message-State: AOAM53282/rHA6zT/RezO982eQ/AKCnzV7NlHim9KMMwkovdGUjnf3YR
	J/x/Ef59PODZIr4myd8eFEvmalCay9RxHw==
X-Google-Smtp-Source: ABdhPJz/ZZzf+KC79Xa5XyS3xG6hTnRnq+8SqrnJcr5JwpS9B3ADnE83ptgO2nAhhbDLCvqF97/Q6Q==
X-Received: by 2002:a17:902:ea94:b029:df:edfe:fac3 with SMTP id x20-20020a170902ea94b02900dfedfefac3mr8561877plb.61.1611991200499;
        Fri, 29 Jan 2021 23:20:00 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9296])
        by smtp.gmail.com with ESMTPSA id m18sm10797221pfd.206.2021.01.29.23.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 23:19:59 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/5] binutils: Disable parallel install for target binutils
Date: Fri, 29 Jan 2021 23:19:52 -0800
Message-Id: <20210130071954.2695419-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210130071954.2695419-1-raj.khem@gmail.com>
References: <20210130071954.2695419-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

2.36 has a build race between libctf and libbfd

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils_2.36.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.36.bb b/meta/recipes-devtools/binutils/binutils_2.36.bb
index 976e49765a..7caddfd1b9 100644
--- a/meta/recipes-devtools/binutils/binutils_2.36.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.36.bb
@@ -52,6 +52,9 @@ do_install_class-native () {
 	rmdir ${D}/${libdir}64 || :
 }
 
+# libctf races with libbfd
+PARALLEL_MAKEINST_class-target = ""
+
 # Split out libbfd-*.so and libopcodes-*.so so including perf doesn't include
 # extra stuff
 PACKAGE_BEFORE_PN += "libbfd libopcodes"
-- 
2.30.0

