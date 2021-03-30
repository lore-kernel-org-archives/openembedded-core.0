Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web08.2066.1617125262502796293
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Mar 2021 10:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eDgoW8s4;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: kergoth@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id g10so6521488plt.8
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Mar 2021 10:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3SWq6b1CnxRwIgnzulmlLlWwdA2NBvStURH5cjOjHNc=;
        b=eDgoW8s4k75Ug7ilE1Sw0ykPtX3lIxO0YS8XCNNbdRJ+X6V5ByJk2pvMf7/90hOe5l
         +fN+/bhCnkJubBlg0fveXmoLsZwC7OD9lZKOpPuVJY7dxdGqtJDmGylgnYxVWipB2Z9K
         6SDQ5IbH/atMjcfzqJgXsubkCwtrYfJ/iTtRXFI1NQRm6p2Rml2NOQ7Zdy1TSZUNsuZw
         vijlp+Tjaq4/Xvfo3c//ad3n8Y47Md+3efg3IEbRtNAmN5rQnI3ojGc7Rqbcw909ZArr
         /3qQbWyu9WYpaRA4lfRRFsC8VlpXzTINc4dVO0NAzdtO60Bou61ZY5aqcRilDY61G5Ww
         fEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=3SWq6b1CnxRwIgnzulmlLlWwdA2NBvStURH5cjOjHNc=;
        b=jR8k1PQOOfZgmQlM9iPmPRgLCz0Gqa//EgmzPNTR3YZ/wwBZ70BoJKBV3BNAjRgKhP
         0XkOxVEltuQALefr2qMiiqSNJpLFC/whDh7GbhywhQi1HuJQ8LWrJAlYICHm/jDdNRr2
         6bgialhFUxY2Sw3G3sU3l5MoZ6o6gIFtOD0M1/l7+EyKduGaW5yKOAixiwRoCXt5uvCY
         SoEi0KBser57HnwZjWwarkQT3DyA2d5SZbxBoOAhIe+O4GS84k/FOnONml8ZNVo2JrVe
         RimUtrnuJ7FlsN1lyHHK7z/7guJ/SMdI+bTVwH48OL6ORL4BwGmN7jYvCgFlZLrdJCXL
         ebbg==
X-Gm-Message-State: AOAM530JfyUe3xPHjD+NhhE4fJ2AyjgbnLRL+2VN1Kl1JMwReyoCvHis
	zJfpODFMobbQ5AJHl31pYs1vGnZ9TptKNA==
X-Google-Smtp-Source: ABdhPJx4AlIjxYX18QHEbDuJwoKtD6yWq4JAsh3fAz9kMLLscwnZCSnmnmMgLO9Ad0wp+PrIVg/JJQ==
X-Received: by 2002:a17:902:8544:b029:e7:3266:6bde with SMTP id d4-20020a1709028544b02900e732666bdemr22529320plo.14.1617125261548;
        Tue, 30 Mar 2021 10:27:41 -0700 (PDT)
Return-Path: <kergoth@gmail.com>
Received: from svr-pkl-eng-07.mentorg.com ([110.93.212.98])
        by smtp.gmail.com with ESMTPSA id t184sm2293515pgt.32.2021.03.30.10.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 10:27:41 -0700 (PDT)
Sender: Christopher Larson <kergoth@gmail.com>
From: "Christopher Larson" <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] buildhistory: add missing vardepsexcludes
Date: Tue, 30 Mar 2021 22:27:13 +0500
Message-Id: <20210330172713.1204-1-chris_larson@mentor.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For POPULATE_SDK_POST_TARGET_COMMAND, POPULATE_SDK_POST_HOST_COMMAND, and SDK_POSTPROCESS_COMMAND, the appropriate entries were added to vardepvalueexclude, but we want them in vardepsexclude as well.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/buildhistory.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 117a44eaf3..49af61c9c5 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -678,13 +678,16 @@ IMAGE_POSTPROCESS_COMMAND[vardepsexclude] += "buildhistory_get_imageinfo"
 POPULATE_SDK_POST_TARGET_COMMAND_append = " buildhistory_list_installed_sdk_target;"
 POPULATE_SDK_POST_TARGET_COMMAND_append = " buildhistory_get_sdk_installed_target;"
 POPULATE_SDK_POST_TARGET_COMMAND[vardepvalueexclude] .= "| buildhistory_list_installed_sdk_target;| buildhistory_get_sdk_installed_target;"
+POPULATE_SDK_POST_TARGET_COMMAND[vardepsexclude] += "buildhistory_list_installed_sdk_target buildhistory_get_sdk_installed_target"
 
 POPULATE_SDK_POST_HOST_COMMAND_append = " buildhistory_list_installed_sdk_host;"
 POPULATE_SDK_POST_HOST_COMMAND_append = " buildhistory_get_sdk_installed_host;"
 POPULATE_SDK_POST_HOST_COMMAND[vardepvalueexclude] .= "| buildhistory_list_installed_sdk_host;| buildhistory_get_sdk_installed_host;"
+POPULATE_SDK_POST_HOST_COMMAND[vardepsexclude] += "buildhistory_list_installed_sdk_host buildhistory_get_sdk_installed_host"
 
 SDK_POSTPROCESS_COMMAND_append = " buildhistory_get_sdkinfo ; buildhistory_get_extra_sdkinfo; "
 SDK_POSTPROCESS_COMMAND[vardepvalueexclude] .= "| buildhistory_get_sdkinfo ; buildhistory_get_extra_sdkinfo; "
+SDK_POSTPROCESS_COMMAND[vardepsexclude] += "buildhistory_get_sdkinfo buildhistory_get_extra_sdkinfo"
 
 python buildhistory_write_sigs() {
     if not "task" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
-- 
2.28.0

