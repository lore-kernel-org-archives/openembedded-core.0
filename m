Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 560D572041
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 23:48:18 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id ex7so19227469wid.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Dec 2014 15:48:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=WP3+w/5EcGo2EviFaG4lK3SxDey5Y6+2C9pjGbvkBNY=;
	b=Rr37bSfMz25Ek/JNMWHhauXiA3F9DSHfDVbjt/oUDnlWKQoJF314QQEDwt68hfM9mp
	B9OXMV3b/PD0nuCqJ/A7o3V7AtEJKS269TmY2mPVbjeRKJMqe6LByQIXqGHDJQouT1cw
	n65rrnVGuk1UQcbR1VuRw7GfN2YF+Ye9ej49q05RQTjSMGLONnhTN7qskR6sLTfzn9Et
	VAz7yB+2W+XTHoIhLcXXJFEolg4t5zkBJHWmsw5J/SwY/mos6dw184wW9ZjpcrWM830M
	zKrPCLyNx5hRn950VX291w3QMiaFpuZ227ZAexpJOKwUjM5j7+seTV4AA5w+NdUg3Nt7
	U4Ew==
X-Gm-Message-State: ALoCoQk8+ppYl4c9wa6EboIb59UABOHRQ0EiVRMVIF1w34Dtl/hLz7FnTUKBwx7vXt9MqsNMB4H6
X-Received: by 10.194.175.69 with SMTP id by5mr20684861wjc.32.1417477699067;
	Mon, 01 Dec 2014 15:48:19 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	he3sm29570430wjc.15.2014.12.01.15.48.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Dec 2014 15:48:18 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Dec 2014 23:47:46 +0000
Message-Id: <d779d741e939fed8fd27110b2dd35cc9107d0060.1417477584.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1417477584.git.ross.burton@intel.com>
References: <cover.1417477584.git.ross.burton@intel.com>
In-Reply-To: <cover.1417477584.git.ross.burton@intel.com>
References: <cover.1417477584.git.ross.burton@intel.com>
Subject: [PATCH 3/4] scripts: don't skip defaultval
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
X-List-Received-Date: Mon, 01 Dec 2014 23:48:24 -0000

This field is now internal and won't be seen.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/contrib/list-packageconfig-flags.py |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/contrib/list-packageconfig-flags.py b/scripts/contrib/list-packageconfig-flags.py
index 598b5c3..2f3b8b0 100755
--- a/scripts/contrib/list-packageconfig-flags.py
+++ b/scripts/contrib/list-packageconfig-flags.py
@@ -65,7 +65,6 @@ def get_recipesdata(bbhandler, preferred):
         data = bb.cache.Cache.loadDataFull(fn, bbhandler.cooker.collection.get_file_appends(fn), bbhandler.config_data)
         flags = data.getVarFlags("PACKAGECONFIG")
         flags.pop('doc', None)
-        flags.pop('defaultval', None)
         if flags:
             data_dict[fn] = data
 
@@ -78,7 +77,6 @@ def collect_pkgs(data_dict):
     for fn in data_dict:
         pkgconfigflags = data_dict[fn].getVarFlags("PACKAGECONFIG")
         pkgconfigflags.pop('doc', None)
-        pkgconfigflags.pop('defaultval', None)
         pkgname = data_dict[fn].getVar("P", True)
         pkg_dict[pkgname] = sorted(pkgconfigflags.keys())
 
@@ -135,7 +133,7 @@ def display_all(data_dict):
         print('PACKAGECONFIG %s' % packageconfig)
 
         for flag,flag_val in data_dict[fn].getVarFlags("PACKAGECONFIG").iteritems():
-            if flag in ["defaultval", "doc"]:
+            if flag == "doc":
                 continue
             print('PACKAGECONFIG[%s] %s' % (flag, flag_val))
         print ''
-- 
1.7.10.4


