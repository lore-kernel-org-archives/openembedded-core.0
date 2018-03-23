Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id E3ACD78447
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 00:07:22 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id l3so13117597iog.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 17:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=aEQRxkbjl57lpqe0C497hFnmDjp6nJ9fvs85bnzo3yI=;
	b=CSfdtnU2HjVlkyBB1Qq52N9Zm8olInTvTAOas3IC+ossDe7SbvfDgCqO94oxvsGxFi
	s3gYbzA6rGatlmvWMK/qQImzi6FV7naAlRrxdxhGSzxV0odK5mHBd1ODtlB1aNNqrRLz
	EWf0y1XwJoyNIqNcdRWxEu7ud10UKtyc/W4EFr1winSgk6ARgdISCbGSXgK8P0s4gzTV
	XbBAMwCWXKIj3oBCGOTxO6hhwgofmafzkCQmupZVCFn+9R83PWa4ZU5tE+aHxDU7Q2zP
	P/GwxmzNvpJzN3exN2XYewNfkXxK2VQNThuP0k0bAcaVrhW2td47BhC9ijCO3aSbalWw
	3PqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=aEQRxkbjl57lpqe0C497hFnmDjp6nJ9fvs85bnzo3yI=;
	b=GDk0/OV7E2cOABUrPjYNVzh/3rG4vzx19OH6Ap6UE75kWaIjYFQfbOkHgarLJMq7+p
	tImAWDAEK0NuNb60Wx+S0+p/rvQ8uAGaROImOtOoPH1suueX/D/leQ1AvnjlQmz7FpfV
	tHw45beXGJKpWrTmK+u4Gkv7/zfdxAs630GFmafWAyPxa7Nl18rP/NdQcwI9YzRrFeOc
	umcog8YpIhdiRldsZgCxnRNmx5fFbeap06tYwJE6gO8NDz9O2mRPK0aqQQZanMMY8kmJ
	HG3IHFsXR/MPZIWhyM6G9BVvyG3AtTtIsVEtolrF+cgUuOvpKu3zCfzYA5i/Qgn9C4i9
	+D8g==
X-Gm-Message-State: AElRT7EXWx4p4lDLAc9STdFLDaiumOvHncPM9jjwGZ9gvgMMmwlb+5go
	tmL0IG2tZgcsE4I2u7P7uJuNShZY
X-Google-Smtp-Source: AG47ELuNMZGh/u5UbGDH5s4ZCYHTdBrsP9UDFWhW+CxCbB9cgqKfvjvbblXunhsA/1kw4VlLclpbmQ==
X-Received: by 10.107.11.198 with SMTP id 67mr27150330iol.43.1521763643527;
	Thu, 22 Mar 2018 17:07:23 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	b185-v6sm5507431itb.8.2018.03.22.17.07.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 22 Mar 2018 17:07:22 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2018 20:07:06 -0400
Message-Id: <20180323000707.17584-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.14.1.459.g238e487ea
Subject: [PATCH 1/2] mesa.inc: make PROVIDES conditional on PACKAGECONFIG
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
X-List-Received-Date: Fri, 23 Mar 2018 00:07:23 -0000

Mesa only PROVIDES these features if they are enabled via PACKAGECONFIG.
Therefore make the PROVIDES conditional depending on whether or not these
features have been enabled.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 23ae651f7d..1a45601fdc 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -16,7 +16,12 @@ PE = "2"
 
 DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native"
 EXTRANATIVEPATH += "chrpath-native"
-PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl virtual/mesa"
+PROVIDES = " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virtual/libgles2', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
+    virtual/mesa \
+    "
 
 inherit autotools pkgconfig python3native gettext distro_features_check
 
-- 
2.14.1.459.g238e487ea


