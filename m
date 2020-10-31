Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web08.5712.1604177254523798477
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 13:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ixw7Ixrr;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: andrey.z@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id dk16so12708713ejb.12
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 13:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0k/euwloumRd+x8KNhabIlM0d6cYsVAGTCp5BPz3fYY=;
        b=ixw7IxrrerlO9BmyqVJnmgjfbKYYZC+gN4O0oIy7blV531tIyqwRXk9VBz1Poo1Yy/
         ws1c2sKOOI4b3V4PnVE2o+D0HM56ughmBgQU5Cw+OzFIuzyV4powZgOt6ZT2MqfqGAC5
         D0EqZrG/zpGcidtjwfIhSYbtJM3bNy5v5CKVsjytWrZR/RVIQVoUaKj4/p4R/Dzyw9QE
         c+NZ3naC4NGIBOsreM0vw5R4dxJ2vynqD1+bhGS3fEgx67vkdIkN7bFbAl0R0wRrLulB
         HxbRRWQMDAlfg2ljoxgwCuU5sGu1pWfvlO5wyiPBMCKmgfmKXZ5skBu0jiBMHY2RDLqB
         2ywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0k/euwloumRd+x8KNhabIlM0d6cYsVAGTCp5BPz3fYY=;
        b=Ta6pa0oD2xNNURLFpSvfHL/ubxF/DIW8EMnQI+Yy+xEUfaeLo6CBba1PQwBeyq1zWv
         ECAoMESPrtnOibgrqFSvcte7K/8d5N8YkKJ17epOVuJc5UCtJyDLdAMAstHe36HFSI11
         JHpIOLP7BMVkLS9bAM+tM/4kORf+M3Q+bPqgIlLwq030Z8t4LQJtukPECTYZfdQ9aSzK
         n9X4pNnaYMGb/oV/36ft4L0GZoOyuI9v9s22WfoiGKrB3+/ddO2n+HCRe7vxXAvc82hz
         HeL/ZwfvkYPgE8OKGN9IdvrXRWsiscSC2yQljkvop5+gJxN02UNx34lXvKILgRHkZkyU
         tBwQ==
X-Gm-Message-State: AOAM530ZEOnVddcgvmzWjsKJ/ZevxjXhkCb89c51yq7CaDhxGfedjjG0
	eQdXiALEyuDmZnjtaraW51X1xLIFobjC6k9n
X-Google-Smtp-Source: ABdhPJwDye7eXymR9PYpZUnq5He7JXcasV9fNxp3icz3ww5ksbD0PKqRcdnP0X+RNYcAraWTPBNFAg==
X-Received: by 2002:a17:906:3092:: with SMTP id 18mr8521112ejv.43.1604177252675;
        Sat, 31 Oct 2020 13:47:32 -0700 (PDT)
Return-Path: <andrey.z@gmail.com>
Received: from aherlnxbspsrv01.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id u18sm5639984ejn.122.2020.10.31.13.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 13:47:32 -0700 (PDT)
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
X-Google-Original-From: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] insane: add GitLab /archive/ tests
Date: Sat, 31 Oct 2020 20:47:09 +0000
Message-Id: <20201031204709.22065-1-andrey.zhizhikin@leica-geosystems.com>
X-Mailer: git-send-email 2.17.1

Archives produced by GitLab should be avoided in the same way as those
produced by GitHub.

Extend SRC_URI check to include GitLab and inform user that recipe
should be converted to use git protocol.

Link: https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg73109.html
Link: https://lists.openembedded.org/g/openembedded-core/message/144035
Cc: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
---
 meta/classes/insane.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index c6dff9659c..66c34abc95 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -976,8 +976,8 @@ def package_qa_check_src_uri(pn, d, messages):
         package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses PN not BPN" % pn, d)
 
     for url in d.getVar("SRC_URI").split():
-        if re.search(r"github\.com/.+/.+/archive/.+", url):
-            package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub archives" % pn, d)
+        if re.search(r"github|gitlab\.com/.+/.+/archive/.+", url):
+            package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub/GitLab archives, convert recipe to use git protocol" % pn, d)
 
 QARECIPETEST[unhandled-features-check] = "package_qa_check_unhandled_features_check"
 def package_qa_check_unhandled_features_check(pn, d, messages):
-- 
2.17.1

