Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 294A960119
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 10:44:28 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id u206so22329746wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 03:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=O1KMN0gHDRyxwHr9Qeir2hLUl84N2mz3qj45GD5LhEk=;
	b=Hr1Vkc7x+hIVjgCkiQcWHLs04McomRJOERV7V8LG2WjU0eqwuVkz8BEd6/4rYT4CB3
	n5aHSPT8j0v8zSV46Z1hh9NcgLCNGKWaegMfQcm29f9fX+UsIihc6RdZLI5SFGf+pgps
	hCjHHdG/TX7sFqMV1UhdC72gY7scBd/GMesx6i7SHqjsmQYT4/cJ9IhtDc6IjKqhuysr
	ICK0mBtCbst5XaE4dyshPAVUJXVMAZzyJ6xz0+Tib6LIiyH20i0yxsAQjOKNQV03ABUR
	NBvh669EorOjI3YO58EpCN90PQu7nw71J+7tAh5J5MoTyILA86JsuuuWaGyPFasfBCBu
	639g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=O1KMN0gHDRyxwHr9Qeir2hLUl84N2mz3qj45GD5LhEk=;
	b=WfDcTWsNApwOS5GxHy0hgXMrR0BzmD0Dau5J/nThah6avdluKXdocufRzQCZt76ZNs
	1lf2wVrW1YhQa4Nv3XBB0JYRxDDzaevlPNVQ9senXua/pPfYLVYIBTvTMyfEj+V//oo9
	A5L/rNM+r8CZJlaqt/tBGUDTHlybY8T1tc/BazurguNN+ETN0HFX2PtGVVhuEq0cZEXX
	HqVhvxzzXerCLM3D10Lu8WjW4tMY+MP7pjDC4izFHV1AvNa8YPPi+I7kbwuUXvZ3Dppx
	PkCzEMtKTCUJO1c+uDM1GErbaxjs0I0omtxjTjozSv+nayBEV/QfVM0GLOmHXc5YcXLZ
	HPDQ==
X-Gm-Message-State: AOPr4FUWFgBipCEa50Y8TCQYB1fbATsdVox2IFE4DJIad09DTTp2eZc0GZg4CngLW99j//cp
X-Received: by 10.194.112.167 with SMTP id ir7mr2801496wjb.14.1460457868634;
	Tue, 12 Apr 2016 03:44:28 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	m6sm32568995wje.21.2016.04.12.03.44.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Apr 2016 03:44:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 11:44:25 +0100
Message-Id: <1460457865-21399-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] image.bbclass: use max() instead of indexing booleans
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
X-List-Received-Date: Tue, 12 Apr 2016 10:44:30 -0000

There's some code dotted around OE that uses (a, b)[foo < bar] instead of the
more idiomatic "test and a or b".  Or in this case, just max().

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/image.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index ea77ab8..039feec 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -455,8 +455,7 @@ def get_rootfs_size(d):
                                       d.getVar('IMAGE_ROOTFS', True)])
     size_kb = int(output.split()[0])
     base_size = size_kb * overhead_factor
-    base_size = (base_size, rootfs_req_size)[base_size < rootfs_req_size] + \
-        rootfs_extra_space
+    base_size = max(base_size, rootfs_req_size) + rootfs_extra_space
 
     if base_size != int(base_size):
         base_size = int(base_size + 1)
@@ -544,4 +543,3 @@ do_bundle_initramfs () {
 	:
 }
 addtask bundle_initramfs after do_image_complete
-
-- 
2.8.0.rc3


