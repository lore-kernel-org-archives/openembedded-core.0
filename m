Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6500B6BDB7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 12:26:58 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id cb5so3247571wib.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2013 05:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7pKm7foSTIrGJ1CrvblICTHenK6aWUFR6xbvVHy0PlU=;
	b=Lqc8P/q4e6Am+Oj4Uw2zDKGrVGrhWIYIqq/DNCACI4WGunvhwX4sCHu5DK1D+Xm6xH
	ycGHRELkje9iEK9fhh5doy5v8nQAbL7TkkLblaOT/8lS1lIiWNB6IlD+h72uIizb0eWl
	9FH1I0C/b3mo+EE8dDZb4keWkBMf5RbjZX9xshfywufAu3KfQ1KVWp8Umy2WygU09/8F
	r5LR3IQmQcx/nQ85WVm9DbK4TbHluTWGTH/7ySAEnBcnKVB2gOwTbnUXDvrK2UV7XjyC
	BGVdNrpjE+jJC6kQ+OZh+x1u34nbzJJCcAVzixL++SDniDNSJK22m30nAwDaf6Nx2Cw6
	EbUA==
X-Gm-Message-State: ALoCoQnyqK5TD5mtsdxRPqSEhaFgCuj4Y6MSQ8KvaC/XL32M4Cha29DNkO3YMae1QCbHtR0tRIE9
X-Received: by 10.180.9.69 with SMTP id x5mr8277773wia.41.1378729619809;
	Mon, 09 Sep 2013 05:26:59 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ey2sm17355304wib.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Sep 2013 05:26:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Sep 2013 13:26:54 +0100
Message-Id: <1378729614-11794-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [RFC][PATCH] mesa-gl: add GL-only Mesa recipe
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
X-List-Received-Date: Mon, 09 Sep 2013 12:26:58 -0000

Some machines have hardware-specific GL drivers that do EGL and GLES (many ARM
boards).  Others have their own EGL/GLES drivers and provide a Mesa DRI driver
(EMGD).  Previously adding Mesa, for software GL/GLX rendering in the first case
and hardware GLX in the second, involved bbappends and changing Mesa to be
machine-specific.

By adding a just-GL Mesa the machine definition can combine it with the hardware
drivers cleanly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb |    5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb

diff --git a/meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb b/meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb
new file mode 100644
index 0000000..521a830
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb
@@ -0,0 +1,5 @@
+require mesa_${PV}.bb
+
+FILESPATH = "${FILE_DIRNAME}/mesa-${PV}:${FILE_DIRNAME}/mesa"
+
+PACKAGECONFIG ??= "dri gl"
-- 
1.7.10.4


