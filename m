Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1FFDD77941
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 12:26:24 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id g138so92936960itb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 05:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=dY0ppv8k+Oa2nhhPVlDZXaAFUnw3bNwqdU2hd8Kk5yY=;
	b=Nj8vKUP6lc5Xt1lNULn8ZdMnP7h2ow20E3QJojwKi64XlCd1sOSlh/i5qR2G434dEv
	ylsvrAakJ7UiN5MM1OKIkz3CphgJRbc+NrDyVu3nTTjCJBqykhvnQtr6gjg0GbchA6vi
	S5sRg6zt4En0bKoQayTxYtG6AAGVhVWOhTa+1twql193fCmJFy5XWYlsbrwwemD0ySzR
	W/mp5SNCdWuIco/I4+V2M6VhA7HObyxYFZ3h+Zv6XeNgum24rDKNJ+hPYFWI1GnSrNGn
	Rlji4vIdJbNZCiMuI8SESfR98wNRLmMg/H7+lwem3qOiePtx4zvf1UnD+G331e3e6XoS
	gJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dY0ppv8k+Oa2nhhPVlDZXaAFUnw3bNwqdU2hd8Kk5yY=;
	b=s7f/qsJAxM9eY6SbTrCQn5amMsV4wE0s7dgK3VxQYCSOi1uQ7JCiGmcvTROzO7fM2i
	5O3x7IbeS/j/SPvBmkXseTLLLl5wXP4N8WLPaAOx0iiGcz7AM9cv7c9JHl+70MGKN8Ea
	bY8qQFK4QjdeEabXbGHOmJoksWu3dGtt6iZi2lH/cNZnj+Hn83HxOnk/mvzX+QUfwErA
	ceN/nyiyGcS0tNxRS/pd+x7jzYo/WNBV3V6P3GxmwLU0VmiIObbZwfN7RrbTWMYEjFf7
	zKAkYli4JtF43yiMoi08113JNqOJPOhoFoOgBrfVwLHybLnbaVs3dEf06/EdhFcs6ePw
	UGRA==
X-Gm-Message-State: AFeK/H324HKdMZSHNS3y9A1IBURKSWl1b7tTE3QQMXnPBj508H6giuOKPSWaCjd74NeJEB01
X-Received: by 10.107.134.234 with SMTP id q103mr25199080ioi.82.1490012785496; 
	Mon, 20 Mar 2017 05:26:25 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8C233.dip0.t-ipconnect.de.
	[93.232.194.51]) by smtp.gmail.com with ESMTPSA id
	i96sm8476988iod.46.2017.03.20.05.26.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Mar 2017 05:26:24 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 13:26:18 +0100
Message-Id: <30bea167e7c204be52b3f5af24e43d5f339e98b7.1490012754.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] image-buildinfo.bbclass: configurable location for build file
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
X-List-Received-Date: Mon, 20 Mar 2017 12:26:25 -0000

In a stateless image, /etc is not a good place for the "build"
file. By definining the location with a variable it becomes possible
to have the file created elsewhere on a per-image basis. The default
is the same as before.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/image-buildinfo.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buildinfo.bbclass
index 85626f0..213fb9c 100644
--- a/meta/classes/image-buildinfo.bbclass
+++ b/meta/classes/image-buildinfo.bbclass
@@ -12,6 +12,9 @@
 # Desired variables to display 
 IMAGE_BUILDINFO_VARS ?= "DISTRO DISTRO_VERSION"
 
+# Desired location of the output file in the image.
+IMAGE_BUILDINFO_FILE ??= "${sysconfdir}/build"
+
 # From buildhistory.bbclass
 def image_buildinfo_outputvars(vars, listvars, d): 
     vars = vars.split()
@@ -61,7 +64,7 @@ def buildinfo_target(d):
 
 # Write build information to target filesystem
 python buildinfo () {
-    with open(d.expand('${IMAGE_ROOTFS}${sysconfdir}/build'), 'w') as build:
+    with open(d.expand('${IMAGE_ROOTFS}${IMAGE_BUILDINFO_FILE}'), 'w') as build:
         build.writelines((
             '''-----------------------
 Build Configuration:  |

base-commit: 6b9dd7a589537b12da648be50298cf7d36461797
-- 
git-series 0.9.1

