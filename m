Received: from mail-wi0-f174.google.com ([209.85.212.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U6LKJ-0003Cl-Oe
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Feb 2013 14:27:45 +0100
Received: by mail-wi0-f174.google.com with SMTP id hi8so1128339wib.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2013 05:11:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=Cjn9qu4T2YCWDZNsJswG1gxUNJpvZDbjCj3nKVavzgE=;
	b=WdtsCau3UIJz4yB5nC9Ej6h/8PDFrouocq4p2dQOogzYIZ40JBaP8sgaxGJa3KvUHQ
	Jlv+Rmjdrq8I+Mc5QwwR6hwoXNTsl8vzzt7mQP6BgUWnswQ81MKgOVV5bV836QbKhJ8h
	YL7JCqdGGPY7T1X9lFDjbRMMDLiJixUdYW9N8xrEI9QZTzifxlB4dl42dt+Iu2B5vt+2
	ePApDuB6VTLbc32YN/kSUfOcOXCRrVNLekmGyjHoRNq6+g2yX3rUsEoi9yES6cL+eWs8
	4VzhaS50LuM38KCK8Q3Hq2zWXcoa0NY85UXfcPLN4d4BiL5mIHVoCCALIlK4IqVHBD/w
	sNgw==
X-Received: by 10.180.84.199 with SMTP id b7mr4034506wiz.22.1360933900400;
	Fri, 15 Feb 2013 05:11:40 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id j4sm2923857wiz.10.2013.02.15.05.11.39
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 15 Feb 2013 05:11:39 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Feb 2013 13:09:19 +0000
Message-Id: <d10840601395769e8147ad9c22b03cc263469e8d.1360933659.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360933659.git.ross.burton@intel.com>
References: <cover.1360933659.git.ross.burton@intel.com>
In-Reply-To: <cover.1360933659.git.ross.burton@intel.com>
References: <cover.1360933659.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQm8IVpcH2xafs5Wx09RBWK+xdjfoFt00EFvLSmJK2V1penAOwlvn4DnCBnUYwBJbxOJ5UsQ
Subject: [PATCH 2/4] package_deb: check CONFFILES exist before adding them to metadata
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
X-List-Received-Date: Fri, 15 Feb 2013 13:27:47 -0000

dpkg-deb verifies that conffiles exist, so verify that the specified files
actually exist before writing them to conffiles.

This mirrors the behaviour of FILES and package_rpm's CONFFILES handling.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/package_deb.bbclass |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 5740948..b44eb2d 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -411,7 +411,8 @@ python do_package_deb () {
                 bb.utils.unlockfile(lf)
                 raise bb.build.FuncFailed("unable to open conffiles for writing.")
             for f in conffiles_str.split():
-                conffiles.write('%s\n' % f)
+                if os.path.exists(oe.path.join(root, f)):
+                    conffiles.write('%s\n' % f)
             conffiles.close()
 
         os.chdir(basedir)
-- 
1.7.10.4



