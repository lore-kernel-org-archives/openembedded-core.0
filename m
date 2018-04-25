Return-Path: <jpuhlman@mvista.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id CC02460191
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 21:18:33 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a14so5788356pfi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 14:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=io3s5r8+yJl73HPQPcAEiii/QvxV30E+RIIh5UqoFJE=;
	b=ptjBFHDjMdzTGo2Kc9DeOQQ4mKytK9y5yB3s3Ko21NFb3pLl2lyfmzhd7lbM5Gx4LU
	/liWRvqzz0U0nu2mHZuSg1n6cXrZk4KFllcFNonzbt4HNcQ0i/tF2hOKscxbQ8UDJfUy
	TcJWnp4Ufb2PJZipNqUE86EchLdEbyWtSnloxjSDDcB0TQOUwQhjSjreaMwWgsgxvm1n
	5UfhrlqbEBs0Rc1uDPb3K4ywfKROoU050fXZywzQUT4k6W5o7ZdMCcp7p8BKufP8fCjK
	vcPMzBu/SzlQqssq5BMMrkMJQil2xEY+ZpoO/7qtJfIsws4t+R9PPM2qxS8BkXXO7CRW
	gFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=io3s5r8+yJl73HPQPcAEiii/QvxV30E+RIIh5UqoFJE=;
	b=f1krchPnuRzzsn1U2B5Md1DRd9Bb5OtST6gBiYbtHZe6mSgkvwYrUsMVfQMnsWD1wu
	4AOpy1q7NCS0wvaGJmRy79QOkq9Ax1YcHQaabaYIh8diru26Fn2gF2GgJjFO7xEjJJp4
	mq+v0YJgBphTThgGPqDE9ytp/VvVnHQJ16vOzYlZNke8TqtzLZh2M3X/vvTCr+4KiVN2
	dF8I4XX9eLa45ETBBf8hFuxFk0JA4NrtqPoFjbSg3fD+RI4GpN6GVluKsSCyqy2u0+ou
	C6K2DBB/oZ9x9sfP8Y8iRse9vk7DcmcQkBETRcEY7JpB1JvPi0OYbE9li8nJcCD+myrj
	TDGg==
X-Gm-Message-State: ALQs6tDvBMF5GejEZW39opMyRvlAnUxmvBaMsx4r9rxSiqF8GclGYNlp
	cGsR1m6l9sy+aU4xVaGMmia8GoWb
X-Google-Smtp-Source: AIpwx4/G0Aoj09UT6u++0+C6Cq7F3lDpU2Mj3UpaVe/Z2G8eM3fu80HaBbekmJeKQ5MzQTyu2vo7cg==
X-Received: by 2002:a17:902:1025:: with SMTP id
	b34-v6mr30859581pla.324.1524691114395; 
	Wed, 25 Apr 2018 14:18:34 -0700 (PDT)
Received: from localhost.localdomain
	(99-0-9-164.lightspeed.frokca.sbcglobal.net. [99.0.9.164])
	by smtp.gmail.com with ESMTPSA id
	v12sm36256632pfd.7.2018.04.25.14.18.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Apr 2018 14:18:33 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2018 14:18:27 -0700
Message-Id: <20180425211827.23866-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.11.1
Subject: [PATCH] Only add uninative and checksum if inherited uninative class
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
X-List-Received-Date: Wed, 25 Apr 2018 21:18:34 -0000

The checksum value is only calculated if the uninative class is
inherited, so check for inherit before adding it to local.conf

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta/classes/populate_sdk_ext.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index e1bba49eaf..8dfb8df52e 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -325,8 +325,9 @@ python copy_buildsystem () {
             f.write('TCLIBCAPPEND = ""\n')
             f.write('DL_DIR = "${TOPDIR}/downloads"\n')
 
-            f.write('INHERIT += "%s"\n' % 'uninative')
-            f.write('UNINATIVE_CHECKSUM[%s] = "%s"\n\n' % (d.getVar('BUILD_ARCH'), uninative_checksum))
+            if bb.data.inherits_class('uninative', d):
+               f.write('INHERIT += "%s"\n' % 'uninative')
+               f.write('UNINATIVE_CHECKSUM[%s] = "%s"\n\n' % (d.getVar('BUILD_ARCH'), uninative_checksum))
             f.write('CONF_VERSION = "%s"\n\n' % d.getVar('CONF_VERSION', False))
 
             # Some classes are not suitable for SDK, remove them from INHERIT
-- 
2.11.1


