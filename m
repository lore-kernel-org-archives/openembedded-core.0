Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxGYl-0005pK-AF
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 13:33:36 +0100
Received: from mail-bk0-f71.google.com ([209.85.214.71])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 04:17:37 -0800
Received: by mail-bk0-f71.google.com with SMTP id jm19so6571832bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 04:17:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=K2M9dpBFf0R7N1vAHdgNX8HkMWdL684CYtDhNoPPma0=;
	b=KGHX2hhfMPDbvdtjPqOyiD+peEcNLCceRh4AwSf7P/yFtwwZK+Y/PMj7OASa1Ku4d1
	YDRzklje4ewRnoMXSZXJax/4mIIHtzhCBOFyqf5wwU7FvLLMc7l2/jaNsyQY5qM7a+KO
	eidJL5sptoZbcaRNO5VnqRoE50gMX/Q8HrmdU+tJaBEg3K5iXyaGhWvPL8jDndhMKqOV
	tryWykfNKUHu17E18+vhzQ7+o6YkNGrl+NKaml2J4q7iG5omHJd+cWs2HKkVeJyzT1tf
	dadasUUAidnUzSg9ct5FDTF0LVZ6jAvmtR8AfOvbtZKEjvIeLAnhPHD9VCTdIZb63JOR
	LgJA==
X-Received: by 10.180.79.194 with SMTP id l2mr15135011wix.22.1358770654996;
	Mon, 21 Jan 2013 04:17:34 -0800 (PST)
X-Received: by 10.180.79.194 with SMTP id l2mr15134998wix.22.1358770654918;
	Mon, 21 Jan 2013 04:17:34 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id s10sm18415972wiw.4.2013.01.21.04.17.33
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 04:17:34 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 12:15:31 +0000
Message-Id: <986f484dfe24209632a147a8133192ec7c743f0d.1358770449.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <53d6b4110f4e12cfde4dcfbef992cc44d8c58c1e.1358770449.git.ross.burton@intel.com>
References: <53d6b4110f4e12cfde4dcfbef992cc44d8c58c1e.1358770449.git.ross.burton@intel.com>
In-Reply-To: <cover.1358770449.git.ross.burton@intel.com>
References: <cover.1358770449.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnwtEaVy5RPlB+sxRWFPVaPJ2Fw0peNhPsvuac2JahwfSUkBrRMi5hNOg8f4hvCL3gEMSditZ2/FVOoDKWEndH5O3sSuULyXuzE/MkkXeAy5PUFKygRukqOiM8O4oEtp9TFRfYiZWB0A+VRDNM2x3gea/MU5Azn7R9vNpCVUV+IgyI5IkPMs2fgLHt6QVT4mqweimAD
Subject: [PATCH 2/5] udev: skip in systemd distros, to fix world builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2013 12:33:39 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/udev/udev.inc |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 9f60b17..facad0c 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -99,3 +99,9 @@ do_install_append () {
 
 	echo 'udev_run="/var/run/udev"' >> ${D}${sysconfdir}/udev/udev.conf
 }
+
+# As systemd also builds udev, skip this package if we're doing a systemd build.
+python () {
+    if oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
+        raise bb.parse.SkipPackage("'systemd' in DISTRO_FEATURES")
+}
-- 
1.7.10.4



