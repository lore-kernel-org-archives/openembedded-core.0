Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id C2242607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 16:40:59 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id f126so76826561wma.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 09:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jsGTUhMp9IFeRijvLg11YfjMfJhW2Y+zCi3kaEJIKY8=;
	b=cL9Q8RI9zbaSFPDpkBVlpZc7LPI1U2KkV4m8huF+hkyoorAjOhUdq92G6APtrvDtQX
	wzGMYMIngYiYseN5P+cvE8+rSHUCZIqwo7WjkqCdcNV/ihm8gCt/g4nP0UrHUi4Ypikk
	oQsvHGpzZHqXIHDpqzEsytmvkokv7/oSQ2qckRkR3Imw892dFUUZ2l15tD+uepMZbiry
	n7s5IQBR4L+fmqbxaT17D7tKamYyNKrmi9CU8AIqZWEFqsfQ+LtWv7EwOKqjJBUVf9ad
	wm6BwpLr01WsfiVtI9f67uS8sOC+3nBxLJMzq2VEIUafLJCGU8oF9aHVi1od1P6CjwdO
	BsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jsGTUhMp9IFeRijvLg11YfjMfJhW2Y+zCi3kaEJIKY8=;
	b=HQMkDvHaTNz5+KEzVb4sciXli2+6hvtkDsPxyEvuUA0P8uybLbVRTtW5Lhg3WO5Sw0
	3A/DdZicH40xRVxaOA/Tc487F5IMiQNjQzt1KDFtg4bWC2uM4l619lv/lH/PefiLYoc+
	7vlE4rokX0JgRgKzJ55RM9JvZpMMdZq0YyzQVLYcF0dn2zYwkxyTpBfr0rs/HGAODlJI
	TQ5EM1sx247gD930sf6jrSwShZwD9j+nGXfP2dxRPByFJEpmng/8yJfqztU3cPWpvPIY
	4xaD+1gKTeRMeSIV8BNOftvXE1JAlfX8nUxJs2pJWyYaPPnkCiW28KSm2r0EZ/qs/zIt
	w0mQ==
X-Gm-Message-State: ALyK8tJiIL+oNbOCEaE+5/fg3IMyflWQOoXM3dnMYWjfn25HrFBtryphW1Ju0vHnStbXdrIK
X-Received: by 10.28.95.196 with SMTP id t187mr12593928wmb.89.1466440860205;
	Mon, 20 Jun 2016 09:41:00 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id kc8sm659236wjb.0.2016.06.20.09.40.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Jun 2016 09:40:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jun 2016 17:40:53 +0100
Message-Id: <1466440854-16120-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1466440854-16120-1-git-send-email-ross.burton@intel.com>
References: <1466440854-16120-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] oeqa/targetbuild: add extra_cmds argument to run_configure
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
X-List-Received-Date: Mon, 20 Jun 2016 16:41:01 -0000

Some upstreams need more than just gnu-configize ran before ./configure works,
such as ./autogen.sh or autoreconf.  Add extra_args (defaulting to
gnu-configize) so that this can be done in test cases.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/utils/targetbuild.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
index 6177a12..f087670 100644
--- a/meta/lib/oeqa/utils/targetbuild.py
+++ b/meta/lib/oeqa/utils/targetbuild.py
@@ -119,8 +119,8 @@ class SDKBuildProject(BuildProject):
         #Change targetdir to project folder
         self.targetdir = self.targetdir + self.fname
 
-    def run_configure(self, configure_args=''):
-        return super(SDKBuildProject, self).run_configure(configure_args=(configure_args or '$CONFIGURE_FLAGS'), extra_cmds=' gnu-configize; ')
+    def run_configure(self, configure_args='', extra_cmds=' gnu-configize; '):
+        return super(SDKBuildProject, self).run_configure(configure_args=(configure_args or '$CONFIGURE_FLAGS'), extra_cmds=extra_cmds)
 
     def run_install(self, install_args=''):
         return super(SDKBuildProject, self).run_install(install_args=(install_args or "DESTDIR=%s/../install" % self.targetdir))
@@ -133,4 +133,3 @@ class SDKBuildProject(BuildProject):
     def _run(self, cmd):
         self.log("Running . %s; " % self.sdkenv + cmd)
         return subprocess.call(". %s; " % self.sdkenv + cmd, shell=True)
-
-- 
2.8.1


