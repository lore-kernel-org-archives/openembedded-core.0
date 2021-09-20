Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.11110.1632141989593328105
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 05:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T4+AsNUd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id q11so29320086wrr.9
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 05:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4cf3+KdOJVeun0iORvk5HUwVR3t19NmAt7APa/dmBPg=;
        b=T4+AsNUdpK/YYM2Yl3N721E94XWch0d97WNdNK1CghZVHlI7IkJEnGY6xVVlvOOfTY
         oNWCGuUcPHkDFIc3/sqOkpQfaRkpW84dvxmjOca5ssgbVR+GtnZGsLTfdi0bg3Gm6UWi
         qDVMwNmaYrHNVtWvViTVj02KP4I6u4Va1EuBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4cf3+KdOJVeun0iORvk5HUwVR3t19NmAt7APa/dmBPg=;
        b=Y2oCA3eNK7KagaFWnkl2R6TkZwAhuMM3NeSnChU0VpSEmX+GuiTFPn3EDFidL/8EVD
         2b0kSBD1ntqd7qsavAuKlXRjax3CskPTd69e3eCbm997KaYJfDB5USf5Gz4uQ3Of1l1R
         8oiagC8X25VJdp1T+CxkHRQ9Q/J/+Gm/c11eJmgsqqLOCGiVDCCt/RYaASdH0tHaRGUf
         eR15HwVUY17knlvbc+NWih+S2YN+HMO1smR+lb9aTyXyTvCTgnsk330Zdz5vs0NYosOJ
         5fbr2alnrfB8EYJl/wcowqzrPtavmKqKh87T/5bCO/DER8CSvk37EomoUmZE4rR4TV4s
         5WbA==
X-Gm-Message-State: AOAM533X36HGDAE17X4QV86ymX5ydZKGVhViXriTtiBiach770UCE9W4
	dU1RHCYVrurtrXBEzf285oUCgn4miJRG0ZjR
X-Google-Smtp-Source: ABdhPJwyixBOSe//M+yO7sHtTC4eiuN2MeZ/3aSDXvAQTzUf523XnnkxMeIlmptcWGuGIGLkcOUNNw==
X-Received: by 2002:a7b:c930:: with SMTP id h16mr28852860wml.156.1632141987951;
        Mon, 20 Sep 2021 05:46:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7173:466e:b128:3e8b])
        by smtp.gmail.com with ESMTPSA id j21sm15773514wrd.48.2021.09.20.05.46.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 05:46:27 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/14] staging: Mark deploy an sstate task
Date: Mon, 20 Sep 2021 13:46:14 +0100
Message-Id: <20210920124621.1576702-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Deploy is a tricky task as it isn't in SSTATETASKS as it isn't always
present. We do need to ensure dependency chains around do_deploy tasks
are correctly handled as sstate tasks though. For now add to the list of
sstate tasks manually (like the other locale task reference).

Without this, missing manifest files could be reported now that do_deploy
tasks no longer have their dependencies added by the depvalid function.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index af3397bab6f..65a6cd5120b 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -306,6 +306,7 @@ python extend_recipe_sysroot() {
     sstatetasks = d.getVar("SSTATETASKS").split()
     # Add recipe specific tasks referenced by setscene_depvalid()
     sstatetasks.append("do_stash_locale")
+    sstatetasks.append("do_deploy")
 
     def print_dep_tree(deptree):
         data = ""
-- 
2.32.0

