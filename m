Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF44DC64EBF
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:01 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web08.38695.1650283889712170044
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 05:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ekh/0FVF;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650283887; i=@fujitsu.com;
	bh=beROafBe2dVqJ7KkjO9sHHh0JiYLUMa/yHRgZ/nKG4s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ekh/0FVFiHQfl+T3hMiWh4rnDafS4mfWxxxLS65yVn64V6wy56+6cBe2WfE36uZlj
	 rwKNDfuwYuce+tZv0up+TG7O1QPbaofXNFO+s/TjQqm8eEGp/Mt7uOyCgkCHNg3lH2
	 LXM7Ltw4QrnN+K72DrjobGqhrduxaFnqcNL47KcFYGaEx2KVs7jkzr/CgvVVT/vs4/
	 wOXuR5pK7wuckP4IJgwLnlnKcDVTTfPyVHZ0J+eZ7wkQ4rOzCNYeMC4uJzlL4rF4LE
	 Np0TfHOxx24+yiiWuLY8E2pSTghlf9rQ5vUkHjcG0dFfasPE6D65VfQifvxQqIJWCz
	 OwFofzamPFhsA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSTcvNDb
  J4Og0K4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePiqlvsBbukKjr/z2dsYJwq3sXIxSEk8JhR
  YnPrRyYI5zyTxMtrn6GcPYwSSxasZ+xi5ORgE1CTmH7rBmsXIweHiICexNV/oiBhZgEViRe/e
  9hBwsIC5hJL1wuDhFkEVCU+zmxnBbF5BZwkZt7eBmZLCChITHn4nhnE5hRwlji8bw4LiC0EVL
  Po1CI2iHpBiZMzn7BAjJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MELaaxNVzm5gnMArOQtI+C0n
  7AkamVYxWSUWZ6RkluYmZObqGBga6hoamusa6hpaWeolVuol6qaW65anFJbqGeonlxXqpxcV6
  xZW5yTkpenmpJZsYgSGcUsx8fAfjlL6feocYJTmYlER5//vGJgnxJeWnVGYkFmfEF5XmpBYfY
  pTh4FCS4G0JAMoJFqWmp1akZeYA4wkmLcHBoyTCyxEIlOYtLkjMLc5Mh0idYlSUEud9EgyUEA
  BJZJTmwbXBYvgSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFe0RCgKTyZeSVw018BLWYCWrx
  9fiTI4pJEhJRUA9OexxkHVevTvxzZmKbxxMrRVGmbdcwh/UNs0g8rpjkrrHgR3bB2wq7SdYc8
  tp2r2r9JfOl0s6Nf17LeERIPyu4PfW31oqfFZ4eY8wRLrvOcv/uXTrsZ9mueeGpV7LWAyL33s
  or8d1f3HHq3KX/xzGyTWfkzrqrs7tr20nfbqcW+p6c1sfVffcDktkDgV3nVu3l9HetvVn0+Pe
  19Go/AT68Zr97HL2RecThOVZhrwpK/e1j26R+oUp3yfm7pw01vn62yqWsvdWIwebaq5EzwXYa
  IlwYsC/e8eCzfYXko3XNdQPuGuUe9rnF7qB2zLfGekCy3WmUF/3r9fYe4gvI5ni/P52kTvcUl
  VhN0+m3SdeM4JZbijERDLeai4kQA2Phi7FwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-585.messagelabs.com!1650283886!202260!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7928 invoked from network); 18 Apr 2022 12:11:26 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Apr 2022 12:11:26 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 7E2AC10047B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:11:26 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 71037100451
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:11:26 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 18 Apr 2022 13:11:10 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] json-c: upgrade 0.15 -> 0.16
Date: Mon, 18 Apr 2022 20:10:55 +0800
Message-ID: <1650283855-16427-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650283855-16427-1-git-send-email-wangmy@fujitsu.com>
References: <1650283855-16427-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164589

Changelog:
==========
Deprecated and removed features:
--------------------------------
* JSON_C_OBJECT_KEY_IS_CONSTANT is deprecated in favor of
  JSON_C_OBJECT_ADD_CONSTANT_KEY
* Direct access to lh_table and lh_entry structure members is deprecated.  
  Use access functions instead, lh_table_head(), lh_entry_next(), etc...
* Drop REFCOUNT_DEBUG code.

New features
------------
* The 0.16 release introduces no new features

Build changes
-------------
* Add a DISABLE_EXTRA_LIBS option to skip using libbsd
* Add a DISABLE_JSON_POINTER option to skip compiling in json_pointer support.

Significant changes and bug fixes
---------------------------------
* Cap string length at INT_MAX to avoid various issues with very long strings.
* json_object_deep_copy: fix deep copy of strings containing '\0'
* Fix read past end of buffer in the "json_parse" command
* Avoid out of memory accesses in the locally provided vasprintf() function
  (for those platforms that use it)
* Handle allocation failure in json_tokener_new_ex
* Fix use-after-free in json_tokener_new_ex() in the event of printbuf_new() returning NULL
* printbuf_memset(): set gaps to zero - areas within the print buffer which
  have not been initialized by using printbuf_memset
* printbuf: return -1 on invalid arguments (len < 0 or total buffer > INT_MAX)
* sprintbuf(): propagate printbuf_memappend errors back to the caller

Optimizations
--------------
* Speed up parsing by replacing ctype functions with simplified, faster 
  non-locale-sensitive ones in json_tokener and json_object_to_json_string.
* Neither vertical tab nor formfeed are considered whitespace per the JSON spec
* json_object: speed up creation of objects, calloc() -> malloc() + set fields
* Avoid needless extra strlen() call in json_c_shallow_copy_default() and
  json_object_equal() when the object is known to be a json_type_string.

Other changes
-------------
* Validate size arguments in arraylist functions.
* Use getrandom() if available; with GRND_NONBLOCK to allow use of json-c
  very early during boot, such as part of cryptsetup.
* Use arc4random() if it's available.
* random_seed: on error, continue to next method instead of exiting the process
* Close file when unable to read from /dev/urandom in get_dev_random_seed()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/json-c/{json-c_0.15.bb => json-c_0.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/json-c/{json-c_0.15.bb => json-c_0.16.bb} (87%)

diff --git a/meta/recipes-devtools/json-c/json-c_0.15.bb b/meta/recipes-devtools/json-c/json-c_0.16.bb
similarity index 87%
rename from meta/recipes-devtools/json-c/json-c_0.15.bb
rename to meta/recipes-devtools/json-c/json-c_0.16.bb
index a4673a2f0e..fdec5ec9af 100644
--- a/meta/recipes-devtools/json-c/json-c_0.15.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.16.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 
 SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "b8d80a1ddb718b3ba7492916237bbf86609e9709fb007e7f7d4322f02341a4c6"
+SRC_URI[sha256sum] = "8e45ac8f96ec7791eaf3bb7ee50e9c2100bbbc87b8d0f1d030c5ba8a0288d96b"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
 UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
-- 
2.25.1


