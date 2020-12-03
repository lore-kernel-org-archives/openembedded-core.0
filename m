Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.11386.1607008174391290322
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:09:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=XNkpQFTK;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id r9so1247282pjl.5
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=owxvk90NVecAUpA910lAsCP0k4buzUQyvuLpJ5pmRbU=;
        b=XNkpQFTKeFJpVbSQvriW0nrzIBxbcadioMY5gPBOviaiirGoSFA8gAV1EvjFOI9v0F
         q21ELSMWg0upntRA6/TwUFY627dW+MW6L/Lliv6ulQ/fM/F7Uk1bemdb5Zm8PC2JNFxC
         NysJ7E3Hg/SpZeK2IEtgtZ7AxyJnbGFx5kkGPRCmH3x8yavuMcKCFEt39dElU7bU0GW0
         UhzPjvLv9Rd6p8pwmWpvE4aHuMW/W8TSwK6Ew466qTz+mR2C6EQQVCPa/yAiqOccrWzW
         dnDjHN2Z4naGlNY2fD0h2/6f69NuzU//MeRgZKx/miNF9kAMtJvKl8IwiHwaPjfmVQGX
         QFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=owxvk90NVecAUpA910lAsCP0k4buzUQyvuLpJ5pmRbU=;
        b=f04zxnRI6HJ8NtUhqYP8YwVlS1kQTTlqQs1o3IwHQrPril2kQbb2MDOZmdS0Svstx7
         7x5GVRxZvcI5PAcmXtKrQUtw6mtXyLkcAwQODRDXEAfRL5PioA+vbRNaafSYQrEodJSD
         ycx1YE8iDkuMhbnAPsKRecgXFfCb1x6VcYbjV3TpJzxwBPNbDzOnzns9Lnczznx9F+UY
         sX/KlCWy3f05ceDdBOl9cqDocrWknNYGhk5e6GVp+K3J+wHUDspSeD7rB0GKggnifPDn
         u65vq4X3fBrzy4cVKgyPYR9zuWJOK7d7xszPgB4YxlgUAxsV8FYrQiPk4Hl2GaI+0UvB
         hVYg==
X-Gm-Message-State: AOAM530aNsg4tIq5JRqZgTNUmjHHOWJrANRNpkqO79CFcIjur8vIWEC4
	lxIiKRA03X6HXMNOTWXNYhbONOgkl2AQLQCS
X-Google-Smtp-Source: ABdhPJzA+BX2LtRhswHjfIAoTyEqwkF9aFfD02tj37dkzIsQPAfIERIgjmtSyFcWEtpxtrOOmRl+5w==
X-Received: by 2002:a17:90a:6809:: with SMTP id p9mr3327064pjj.112.1607008173549;
        Thu, 03 Dec 2020 07:09:33 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm1632320pju.37.2020.12.03.07.09.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:09:32 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/28] abi_version,sanity: Tell users TMPDIR must be clean after pseudo changes
Date: Thu,  3 Dec 2020 05:08:11 -1000
Message-Id: <43e2addd41b3f7230266f8b9daabfea9a4ab8f9f.1607007208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607007208.git.steve@sakoman.com>
References: <cover.1607007208.git.steve@sakoman.com>

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
2.17.1

