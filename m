Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3A07D74765
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 16:52:31 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id t25-v6so8444763wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 09:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zmQ+asCAJCYwZjGbrgYTlpfbejau4G7oV3bHBIH4uoI=;
	b=YoDgdfwrS6dBYg83lZ08e2AVvGzkmAeweg7WfrNb+/mvEsNCNbD8F4O01ZEpI0xebs
	ZwguLp5jeKyqDuHs3NSzQzI0sgEezTe8E3oEGMNfHbVWd476WdjmGsVYFRL/MzLfN+o0
	b/hhruqtturxsWbCHaJeJEsk89Xqw93Z5RIG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zmQ+asCAJCYwZjGbrgYTlpfbejau4G7oV3bHBIH4uoI=;
	b=Y9AuEyCK3kC/RVrleYDh0lPH4XH97oTfM2p+WVXDibTymU+5sK6L2EPuPdZun6Ew8U
	XOMrYu7GhsEU09CWDvaS/iaCbxpf0j4gsoPxhJdYPVxKz8D74OvN7FwjBjs3GbpiF3gr
	/jMfBOj1H/fo16gBNUZ2Ep8y2sGTJi3NKmNft5Gnbl5P07ZbEgdffD/RA51tEkZMApt5
	FUwTZwT6ypY+h96WJPigUijjhbWNhnfLxlZk/NgTfOJD2EyfUGKhV1Ax6FDoz5tyqJvc
	XLb9hxz9ENbE/g+fD5f76p9V0XWLgTxrYJf3L5oN3ZnuT/mkopqJ57ho2PxsjmTFcTev
	jT7Q==
X-Gm-Message-State: APzg51D21R8/GHCg+pQF0xq+khrpAixNXWZFMWa7/pTIWTTl0M3epdoO
	6rzfzPD6qdVpZD/N/YRgJpW2AZF0Xh0=
X-Google-Smtp-Source: ANB0VdZ9tbq0TbV0SsyjY17SqITV4hUYnFuGEGm/cudW0BnWKvM20D4ExnyPe7N/HF3itgk2qfTfUA==
X-Received: by 2002:a1c:de05:: with SMTP id v5-v6mr765343wmg.127.1536166351643;
	Wed, 05 Sep 2018 09:52:31 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u65-v6sm3476169wmd.31.2018.09.05.09.52.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 09:52:30 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2018 17:52:21 +0100
Message-Id: <20180905165227.29435-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
References: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
Cc: Joshua Lock <joshua.g.lock@intel.com>
Subject: [PATCH 2/8] os-release: fix to install in the expected location
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
X-List-Received-Date: Wed, 05 Sep 2018 16:52:31 -0000

From: Joshua Lock <joshua.g.lock@intel.com>

os-release (5) recommends that the os-release file be installed in
/usr/lib/os-release and that /etc/os-release be a relative symlink to it.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/os-release/os-release.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index f9887047561..dae5748ba7a 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -1,7 +1,7 @@
 inherit allarch
 
 SUMMARY = "Operating system identification"
-DESCRIPTION = "The /etc/os-release file contains operating system identification data."
+DESCRIPTION = "The /usr/lib/os-release file contains operating system identification data."
 LICENSE = "MIT"
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -42,6 +42,9 @@ python do_compile () {
 do_compile[vardeps] += "${OS_RELEASE_FIELDS}"
 
 do_install () {
-    install -d ${D}${sysconfdir}
-    install -m 0644 os-release ${D}${sysconfdir}/
+    install -d ${D}${libdir} ${D}${sysconfdir}
+    install -m 0644 os-release ${D}${libdir}/
+    lnr ${D}${libdir}/os-release ${D}${sysconfdir}/os-relea
 }
+
+FILES_${PN} += "${libdir}/os-release"
-- 
2.17.1


