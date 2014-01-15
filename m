Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 66628610CA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 12:13:58 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id x55so1690196wes.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 04:13:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xmaLoXD8b88SvPIgZXeAJhsuwK6UQBiUdQ5G36ATi38=;
	b=duc2OiAZE5jgC1engviDxaGCMcTM2sPpEzCvhSg0s3DigP8Tsm3XCWxQvSXSEnl43W
	Xcw9TdMAJPk0QlVQ/9FVurazykIUECB3MH9d1xOJHtI/OKQw0mbK6s85R/9LnYmNN1mx
	BWM5qB1RoVgc3tPjEJ5SnkGfzeAH1dmQyjRUQ1uQxowUdyiJUQPljbhiulH1lKlKKEYJ
	xaP103orhYlSEfZfOQXHCilr0E4EF/MvRxLiG9COxI71RYVciYgMTdvXTHokQLs3tKUs
	npHdGVSc1/5TFz8IZs8Dlnfa9fRFBl88E6TBprmEZBggx7EP/eNtHoS1uph6McNbg2Zu
	iT3g==
X-Gm-Message-State: ALoCoQl/JqB1Md5va3SsLcWDf78uaH6p4bqva/nn4iZzMHeyZtTt9+Z7+qNvLxBAJsCGh3cPEMUs
X-Received: by 10.180.84.166 with SMTP id a6mr1892993wiz.49.1389788038535;
	Wed, 15 Jan 2014 04:13:58 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id k10sm3115213wjf.11.2014.01.15.04.13.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 04:13:57 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2014 12:13:54 +0000
Message-Id: <1389788034-3426-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] dbus-ptest: disable systemd
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
X-List-Received-Date: Wed, 15 Jan 2014 12:14:00 -0000

Explicitly disable systemd support so that it isn't a floating dependency and
libsystemd-login doesn't become a runtime dependency on non-systemd images.

Also don't bother setting the systemd unit directory as we're not installing
anything.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/dbus/dbus-ptest_1.6.18.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb b/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
index c54e957..567d995 100644
--- a/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
+++ b/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
@@ -39,7 +39,8 @@ EXTRA_OECONF = "--enable-tests \
                 --disable-doxygen-docs \
                 --disable-libaudit \
                 --with-xml=expat \
-                --with-systemdsystemunitdir=${systemd_unitdir}/system/ \
+                --without-systemd \
+                --without-systemdsystemunitdir \
                 --with-dbus-test-dir=${PTEST_PATH} \
                 ${EXTRA_OECONF_X}"
 
-- 
1.7.10.4


