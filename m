Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8615179540
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 08:25:00 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id m27-v6so3863995wrf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 01:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=JEUQZjVxvZHsHWRx+EoyIyIEmkrpPd6ATvsbXRNHt7Q=;
	b=UcW7dCE9v3VFSJFrfly/XwUaYxngAFTFy6uIrlo8E/jKagVZeXkaC9cmqNpJjzBhAA
	vdme1XzIvVuRuPkxRFAehCW6g1jvqNASm/vnRBL54UxwnyBnUP/KSffE45qY5QPEzroh
	FcCWxd1TKRE1RHqJ6Xx4LBka5hEe3yxhodGac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=JEUQZjVxvZHsHWRx+EoyIyIEmkrpPd6ATvsbXRNHt7Q=;
	b=jzlRL6sya90YrvWtb7eGPOm0IjRVUjFf0Dt5ZEUtjRHuVLfh/xK35CNL132Eiv8tWH
	7geWViqpm3DNG/j/kvCAB7+cUdWXxF9w7iExMBr+R6osUSkBOrGyQGlD7Qx8TP3q28+J
	THTqquuZoBkJnp3HKdspDB5KEtjTIw3P5Ogkh/LTnHrQe8qdr2DixR9AVh+c0/JWEBBp
	mh5OpFiAG3xn8WG7xA8xNkCLZ+tD9YqV7OteWundY9cI8vKpUk4ErZhZlP5wdeyUPZ2s
	hS/53pdyl0MjMWRPSofJbihbepcFvsPquskyqSCkkXMvsrBcdcbtBIgeLfibwhcw1APh
	+7gg==
X-Gm-Message-State: APzg51DiOIMyegGsSw+nAaCvSBOAHNoJv7foNLUZdTn98gwEM2+M3OtW
	L1GlHJt2zGFGn1lNbHtqnjaJpWuWIQI=
X-Google-Smtp-Source: ANB0VdZoohsfKxbCSxF8Fb84ifjkXGjoeWjbclFrvLuF17qEUB3J2tz5lRljMR6cJl7TK0arrglmfA==
X-Received: by 2002:adf:84e5:: with SMTP id 92-v6mr3577961wrg.9.1535012700978; 
	Thu, 23 Aug 2018 01:25:00 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p11-v6sm1316860wrd.74.2018.08.23.01.24.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 01:24:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2018 09:24:54 +0100
Message-Id: <20180823082457.32062-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180823082457.32062-1-richard.purdie@linuxfoundation.org>
References: <20180823082457.32062-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/5] glibc: Improve ldd loader specification
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
X-List-Received-Date: Thu, 23 Aug 2018 08:25:01 -0000

Currently if a tune isn't specified in the table, the loader defaults for the
architecture are used which may or may not match our path specification. This
leads to general confusion.

Change the code to use the linuxloader class which works of architecture, not
tune.

This still isn't perfect as n32/x32 aren't covered but its an improvement
to listing all tunes here.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc-ld.inc | 35 ++++++++--------------------
 1 file changed, 10 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-ld.inc b/meta/recipes-core/glibc/glibc-ld.inc
index c1d635dc8df..9b1d94a11e6 100644
--- a/meta/recipes-core/glibc/glibc-ld.inc
+++ b/meta/recipes-core/glibc/glibc-ld.inc
@@ -1,43 +1,28 @@
-def ld_append_if_tune_exists(d, infos, dict):
-    tune = d.getVar("DEFAULTTUNE") or ""
-    libdir = d.getVar("base_libdir") or ""
-    if tune in dict:
-        infos['ldconfig'].add('{"' + libdir + '/' + dict[tune][0] + '",' + dict[tune][1] + ' }')
-        infos['lddrewrite'].add(libdir+'/'+dict[tune][0])
+inherit linuxloader
 
-def glibc_dl_info(d):
-    ld_info_all = {
-        "mipsarch": ["ld.so.1", "FLAG_ELF_LIBC6"],
-        "mipsarchr6": ["ld-linux-mipsn8.so.1", "FLAG_ELF_LIBC6"],
-        "powerpc": ["ld.so.1", "FLAG_ELF_LIBC6"],
-        "powerpc-nf": ["ld.so.1", "FLAG_ELF_LIBC6"],
-        "powerpc64": ["ld64.so.1", "FLAG_ELF_LIBC6"],
-        "powerpc64-nf": ["ld64.so.1", "FLAG_ELF_LIBC6"],
-        "core2-32": ["ld-linux.so.2", "FLAG_ELF_LIBC6"],
-        "core2-64": ["ld-linux-x86-64.so.2", "FLAG_ELF_LIBC6"],
-        "x86": ["ld-linux.so.2", "FLAG_ELF_LIBC6"],
-        "x86-64": ["ld-linux-x86-64.so.2", "FLAG_ELF_LIBC6"],
-        "i586": ["ld-linux.so.2", "FLAG_ELF_LIBC6"],
-        "corei7-32": ["ld-linux.so.2", "FLAG_ELF_LIBC6"],
-        "corei7-64": ["ld-linux-x86-64.so.2", "FLAG_ELF_LIBC6"],
-    }
+def ld_append_if_tune_exists(d, infos):
+    loader = get_linuxloader(d)
+    if loader:
+        infos['ldconfig'].add('{"' + loader + '",' + "FLAG_ELF_LIBC6" + ' }')
+        infos['lddrewrite'].add(loader)
 
+def glibc_dl_info(d):
     infos = {'ldconfig':set(), 'lddrewrite':set()}
-    ld_append_if_tune_exists(d, infos, ld_info_all)
+    ld_append_if_tune_exists(d, infos)
 
     #DEFAULTTUNE_MULTILIB_ORIGINAL
     original_tune=d.getVar("DEFAULTTUNE_MULTILIB_ORIGINAL")
     if original_tune:
         localdata = bb.data.createCopy(d)
         localdata.setVar("DEFAULTTUNE", original_tune)
-        ld_append_if_tune_exists(localdata, infos, ld_info_all)
+        ld_append_if_tune_exists(localdata, infos)
 
     variants = d.getVar("MULTILIB_VARIANTS") or ""
     for item in variants.split():
         localdata = bb.data.createCopy(d)
         overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
         localdata.setVar("OVERRIDES", overrides)
-        ld_append_if_tune_exists(localdata, infos, ld_info_all)
+        ld_append_if_tune_exists(localdata, infos)
     infos['ldconfig'] = ','.join(infos['ldconfig'])
     infos['lddrewrite'] = ' '.join(infos['lddrewrite'])
     return infos
-- 
2.17.1


