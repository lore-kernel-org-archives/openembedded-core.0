Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.12877.1611672185482721352
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:43:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BlLGHGEq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id u15so686142plf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mR94WhzW8B1tc+7biAk75UvSNmPpztNsXHYDFrlzgHw=;
        b=BlLGHGEqRosMhduFeRPq6vT08aZbOXP0+6u8k41XCUk1MtsrjuS06UkM5fIVRlItQA
         jXpzQrFeFwzxZ6xOvvuPxwScI836sJninlkFQ9Yaqd5/knUvJjZeTvW6mkHdWhgtl62i
         GBfX4MO45rQoJggQu6jSLKax2GmmJSMZbGYzmK95J9kboNsXCJnkjmoUAIhSUXyOe+6a
         bbDFd8IhQgZjrRPqWwrj52X7IKYxnazg7Cyr7vTzhcIl47ktAzvyNJaKTqX7EYyCAuC8
         Ks3k/6k0Pnz6r4zuodBhaBsOiTLUlqmYfGHxGTV7lwni6gZx9dd0yBtRLUH62jX0gH0A
         +jDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mR94WhzW8B1tc+7biAk75UvSNmPpztNsXHYDFrlzgHw=;
        b=azKu1cV/GE1+xrKcnjKPxDrNrJa9Qrp1dePnwzEJujPH3yGqqNjWNG+q3HN2Cgh2Eb
         Dwab8lGzYI/E4FR2GffzgJBEcn7D2AoaNEramq+k2A/X1M0pcw02dMi4uoJHjv/5MQjt
         yxY0J5jrgUMLQaV9j4QUM2R5q8coKOeUNcQN7mVSHVqIp5nmNBaoNgsLWolEcyxU5gtq
         MQLsv1GhuPeR+APVyrBh18TW/boYLssvl2yAGkiGzVdwexf+ST83GG/+MFTN4Lw/jt0p
         7UKFeFF5X0emJpRk5v3ccwsfYKPxVz7SdSH/dO70imeUo94J8KGhB8YpHSBlm+oH4DdD
         EBkA==
X-Gm-Message-State: AOAM532n+ONix8xBP8by3+spaMQ37fPONiqVMxv3VTwbDZz3xWjCRPP2
	rMHgx+5KJKMg5HumtVyLDtOE2Ty4vgcTO0ifixA=
X-Google-Smtp-Source: ABdhPJzq8i8EtInbEPvDtg/k59abTk4cI+i2jTNphUOJnZXxC1SfP06XW9gj6+3LXDr/YL9kHBr92g==
X-Received: by 2002:a17:903:1c3:b029:de:6b19:e72e with SMTP id e3-20020a17090301c3b02900de6b19e72emr6302208plh.63.1611672184361;
        Tue, 26 Jan 2021 06:43:04 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.43.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:43:03 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 19/46] abi_version,sanity: Tell users TMPDIR must be clean after pseudo changes
Date: Tue, 26 Jan 2021 04:41:30 -1000
Message-Id: <15a1d11b517299894545735aacd7c08540dfe006.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

After the recent path ignore changes, there are invalid entries in exiting
pseudo databases which will trip up users with the new abort() (proving
how common the pseudo potential corrpution is!). Inform them a clean TMPDIR
is needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 016ee90e210c9b15b80e8370d83f41a14867a413)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sanity.bbclass | 3 +++
 meta/conf/abi_version.conf  | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 1486cce357..cdef8e0c7d 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -619,6 +619,9 @@ def sanity_handle_abichanges(status, d):
                 f.write(current_abi)
         elif int(abi) <= 11 and current_abi == "12":
             status.addresult("The layout of TMPDIR changed for Recipe Specific Sysroots.\nConversion doesn't make sense and this change will rebuild everything so please delete TMPDIR (%s).\n" % d.getVar("TMPDIR"))
+        elif int(abi) <= 13 and current_abi == "14":
+            status.addresult("TMPDIR changed to include path filtering from the pseudo database.\nIt is recommended to use a clean TMPDIR with the new pseudo path filtering so TMPDIR (%s) would need to be removed to continue.\n" % d.getVar("TMPDIR"))
+
         elif (abi != current_abi):
             # Code to convert from one ABI to another could go here if possible.
             status.addresult("Error, TMPDIR has changed its layout version number (%s to %s) and you need to either rebuild, revert or adjust it at your own risk.\n" % (abi, current_abi))
diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
index 0a3fb307c8..251d43bb21 100644
--- a/meta/conf/abi_version.conf
+++ b/meta/conf/abi_version.conf
@@ -4,7 +4,7 @@
 # that breaks the format and have been previously discussed on the mailing list 
 # with general agreement from the core team.
 #
-OELAYOUT_ABI = "12"
+OELAYOUT_ABI = "14"
 
 #
 # HASHEQUIV_HASH_VERSION is injected into the output hash calculation used by
-- 
2.25.1

