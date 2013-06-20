Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id A9E056A96A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 16:41:55 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id p60so5566056wes.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 09:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=09v6rPw3Ju+nniMrjijbozBlVv0VtNSnbKUoUweajlg=;
	b=ZCnNZ5kySzbKy3mEE2T+bGDjXBmI7KnEKmTL2YVbXo0b6VjU+jKCUiIXWD7+tn8uaT
	aL3rMw4TLVDe8+4bcNt4zvemliwr/qgcp51aBOJILPOAvgmtISkBynzu3Lii6CXSkVNr
	dNzf0xD9Lpfu+Vm+rlQMyoEO8gAfB0oAKSGXFwwv/WWQdYGm5xlrfMvrhMesp/5ONzJk
	ek3B9zkeGYjiHfPALuBem8yURBPWdDaK44CO2FqwWRtBlZTSfYyneXtFSKDxn1V4I/UQ
	v1u9tFUxS/Ij9RR/N4yCgnmWzMBmygKO900PoCg3MF62+jXmhIosuk6pQVERKTQKkJ/w
	N+OA==
X-Received: by 10.195.12.18 with SMTP id em18mr6285865wjd.78.1371746515476;
	Thu, 20 Jun 2013 09:41:55 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	fu14sm17302497wic.8.2013.06.20.09.41.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 20 Jun 2013 09:41:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2013 17:38:24 +0100
Message-Id: <1371746304-16785-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371746304-16785-1-git-send-email-ross.burton@intel.com>
References: <1371746304-16785-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlRKgiJfOF4k3R1u/1czQa6Oii568IJqk3wXdRsVBrGiOlU9AizCnDndo711oq6lIx/guZf
Subject: [PATCH 2/2] libpam: check if PAM is enabled when building
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
X-List-Received-Date: Thu, 20 Jun 2013 16:41:56 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/pam/libpam_1.1.6.bb |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index 96133c3..f811f4c 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -99,3 +99,9 @@ do_install() {
 	# The lsb requires unix_chkpwd has setuid permission
 	chmod 4755 ${D}${sbindir}/unix_chkpwd
 }
+
+python do_pam_sanity () {
+    if "pam" not in d.getVar("DISTRO_FEATURES", True).split():
+        bb.warn("Building libpam but 'pam' isn't in DISTRO_FEATURES, PAM won't work correctly")
+}
+addtask pam_sanity before do_configure
-- 
1.7.10.4


