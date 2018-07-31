Return-Path: <armccurdy@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id D508B78D51
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 01:28:11 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id y10-v6so5321204pfn.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 18:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=AaNZitdS+k6RtZCzpj+jITC5HNnhY9EefS6F3LX8PN8=;
	b=EK4AEK9TDiuVS3eYtulKT6a274XNVW8fMX8Gh4ANQhYaY1RwxXDI2C1QbnVqY2v8Oa
	2UhWa7PsOx0oRnKdT4h0vkz6sA6RBXt3up3CDVEGU/d3q66PKnQYA2Bi7RR5i1ep+jwj
	VnUtTKlemYxcS7J8ZW/cHQJtk3fCptsmSjq1f5tLSYJ2aIOo4GqsOMG6V1omymqY47AG
	P/YtfwBMmIhVzHgxrumyAK6qIR/Ax8KdHwX17cbYP9I+imGE7bHB3kY44xUoKY5fzPnZ
	1efMF7FyY9/eWY7trgUmgm7x5+sNnCOzoQuszG5W305IpWyDniftqLzLB6PxOz6RNJzl
	Qo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AaNZitdS+k6RtZCzpj+jITC5HNnhY9EefS6F3LX8PN8=;
	b=rfxQm9WhjX/v7Qvrwx8KabV+xiwvIlxZEqJQ5dX6Tj2Y7s3vi9F6n+Fn1nAj4gtwEB
	T7o9CFZK53exeBQRvRGgkQjdPBAqS4G+zKsVNgAkm5yptY2ONdEcHp1pWzt9PHNt3nYr
	bmpm4DqZuq9BI0pQiw46NsklJ8vUmTvhNzMG1dmz6D3QcoGbC2k7UKs4lmJuf4+JV2ch
	VnKY6Z9TIjJtf47ImJ4txayOBErvUjqrZ44sZSZhzby/KTGTypYplCKJtnz23KS4b20E
	h59DqAPBxg27tBRILYUrqKS0O1pbRbZOPOcgXdm3/QSFOYqax6VdMdanG2+uV73cMRYa
	AQtQ==
X-Gm-Message-State: AOUpUlEaea+rvDLlO/N6ImZ1dghetlmiMWRtoRe/h1XfKLuvnzGMgM4Z
	wC7RSEsLaxH/ZF6Cs5LPSzRGkAHj
X-Google-Smtp-Source: AAOMgpcAdOyOO0hsnHhxYdyNrYnIk+FrG4nXyW8aEd9lO6lz+xI8EWQosxTPELfA2PkXlGmoQ22qdw==
X-Received: by 2002:a63:844:: with SMTP id
	65-v6mr18887841pgi.406.1533000492845; 
	Mon, 30 Jul 2018 18:28:12 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	m81-v6sm26148368pfa.188.2018.07.30.18.28.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Jul 2018 18:28:12 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2018 18:28:07 -0700
Message-Id: <1533000487-12738-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] openssl_1.0: drop unnecessary dependency on makedepend-native
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
X-List-Received-Date: Tue, 31 Jul 2018 01:28:12 -0000

The openssl Configure script will only select standalone makedepend
(vs running "$CC -M") when building with gcc < 3.x or with an Apple
Xcode version which predates the switch to clang (in approx 2010?).
Neither of these cases are possible when building under OE, therefore
the dependency on makedepend-native can be dropped (ie align the
openssl 1.0 recipe with the 1.1 recipe, which has dropped the
makedepend-native dependency already).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2o.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index f5d3274..78c8552 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -8,7 +8,7 @@ SECTION = "libs/network"
 LICENSE = "openssl"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f475368924827d06d4b416111c8bdb77"
 
-DEPENDS = "makedepend-native hostperl-runtime-native"
+DEPENDS = "hostperl-runtime-native"
 DEPENDS_append_class-target = " openssl-native"
 
 PROVIDES += "openssl10"
-- 
1.9.1


