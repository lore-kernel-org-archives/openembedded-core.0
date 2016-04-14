Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id E76B46FFC8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 13:31:39 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id n3so126331699wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 06:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=wBP4LaUzY9NpwludbEksBBBNwmWTVT7sjChQw+PpfvU=;
	b=qxZQgO2KZiGzKgWZb1IyZSCoaih9skpm53EThrr6ZWEIVaA6K5Xh8Bby7FNFSLaZ9b
	HS4Jo95cqb6ArY6PjhAI6FE5PhmtCT7kBOYZzPGj9z1bu4xY7xIzTp827q94D5iEbygZ
	9rgUESbLwp0u3udWjblw3N5APqsVXpPfzlEAflUpUj+3lU9+K8ohmqAbIrb9NDJf+wl/
	ysCWK7mWaUMdCdWbNuE3uK454DGHn2z9j/dxciZ22vficllugM7Ilxt+608hE0J67pEu
	bUy20w9iYXDt6HEAb0E1439gLnNeEw1Kyn5pocyTfLPsqwq+R30lYRvn1+cDBwZdUqEK
	pVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=wBP4LaUzY9NpwludbEksBBBNwmWTVT7sjChQw+PpfvU=;
	b=XiNkeke7Q6S67Wrl/JSwwW8VbkBKb91RPcPAW352Jt0u7UDKjfyhKDh+x5bzERtEQ2
	u1N0xuRwFrEHKnTHumg2trR5C1nHZ95QcA3Fc44p/JQUHifGKZh/IC3m2zcWQQvDpDsO
	gRUPs7FJ7A+XV4r3gAKXq8AzDABAQrDYO44sArshpXyVqPp0o+gcx2HYMyamDJf1UXye
	Jd3Yn4YQxoPFopGgjukIv/053WUULUr2BkQzR5Ty4oq6ggC9UFK+UV7VINtceIDR/7i+
	xOFIluAzHJG76oq3KWUL/q9qcH4w/5YpQ0kSIa4rrFRfQNvlEEPtOcCFFK7sMEFThLAr
	4DBw==
X-Gm-Message-State: AD7BkJL3pQ4pjqqUHKf6ASEpnn+YXjUAjlp0cuckoaB0ILDanwrzzFStYp6hCu84ayIHBd++
X-Received: by 10.28.27.87 with SMTP id b84mr38357927wmb.7.1460640699446;
	Thu, 14 Apr 2016 06:31:39 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i206sm33380957wmf.1.2016.04.14.06.31.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Apr 2016 06:31:38 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Apr 2016 14:31:35 +0100
Message-Id: <1460640696-16164-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH 1/2] buildhistory: don't alter SDK creation stamps
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Apr 2016 13:31:40 -0000

This class adds functions to the SDK creation hooks, so ensure that they're
ignored in task stamps.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/buildhistory.bbclass | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 0fa9b16..581d532 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -582,12 +582,16 @@ ROOTFS_POSTUNINSTALL_COMMAND += " buildhistory_list_installed_image ;\
 IMAGE_POSTPROCESS_COMMAND += " buildhistory_get_imageinfo ; "
 
 # We want these to be the last run so that we get called after complementary package installation
-POPULATE_SDK_POST_TARGET_COMMAND_append = " buildhistory_list_installed_sdk_target ;\
-                                            buildhistory_get_sdk_installed_target ; "
-POPULATE_SDK_POST_HOST_COMMAND_append = " buildhistory_list_installed_sdk_host ;\
-                                          buildhistory_get_sdk_installed_host ; "
+POPULATE_SDK_POST_TARGET_COMMAND_append = " buildhistory_list_installed_sdk_target;"
+POPULATE_SDK_POST_TARGET_COMMAND_append = " buildhistory_get_sdk_installed_target;"
+POPULATE_SDK_POST_TARGET_COMMAND[vardepvalueexclude] .= "| buildhistory_list_installed_sdk_target;| buildhistory_get_sdk_installed_target;"
+
+POPULATE_SDK_POST_HOST_COMMAND_append = " buildhistory_list_installed_sdk_host;"
+POPULATE_SDK_POST_HOST_COMMAND_append = " buildhistory_get_sdk_installed_host;"
+POPULATE_SDK_POST_HOST_COMMAND[vardepvalueexclude] .= "| buildhistory_list_installed_sdk_host;| buildhistory_get_sdk_installed_host;"
 
 SDK_POSTPROCESS_COMMAND_append = " buildhistory_get_sdkinfo ; buildhistory_get_extra_sdkinfo; "
+SDK_POSTPROCESS_COMMAND[vardepvalueexclude] .= "| buildhistory_get_sdkinfo ; buildhistory_get_extra_sdkinfo; "
 
 def buildhistory_get_build_id(d):
     if d.getVar('BB_WORKERCONTEXT', True) != '1':
-- 
2.8.0.rc3


