Return-Path: <ross.burton@intel.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id C64926AF53
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 14:41:24 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id e49so815056eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 07:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=+Sq3lhI6DOSW7LX1Z4JG6D04KBJH1BWGw84jQrz8t1E=;
	b=gEsd8UZmk6clDhDQm6nnjS35J2PMh/7OT478tsqQz1gy81sRs0A1QxzMfdDt3tWZBj
	ip5RacC/NpkbygI5Zd8Sli6rdvsiB6GnhOKq8S2L5g+6UPwCKUaDnAoXrdpKuvHd3kGc
	HhVD9rVVbSqskeiATuO25+3OO/oTorJrIjvhi73ZjHZl4S66FzxUaUKpWo6BBEK7E396
	rw4s5CMIzyj7ZnJR/WuKqBz4s0FrWZuJ5ku5aRpKWGxESnH+RRWMrz+ZFWhRQeOTWJb5
	3Kp2kvhMiSx5CkcLz99AKAlv9v1ceOU7Z9+LdtcpLqDStYUn6ghek3E2SV+KjpYjugpn
	zxFg==
X-Received: by 10.14.119.136 with SMTP id n8mr7357532eeh.1.1372948884676;
	Thu, 04 Jul 2013 07:41:24 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id cg12sm5498108eeb.7.2013.07.04.07.41.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 07:41:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2013 15:37:50 +0100
Message-Id: <1372948670-27365-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmPVR69sVW/ptnsR7lYe8jXgdWPaUoYLEMOMcvu8EDPa4hzDlWaOwVIKOwznh5n67YY0xIm
Subject: [PATCH] gtkdoc: set the default docdir to ${S}, not ${B}
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
X-List-Received-Date: Thu, 04 Jul 2013 14:41:25 -0000

Previously these directories were the same location, but with
seperatebuilddir.inc they are not and putting the file into ${B} means it goes
to the wrong place for autoreconf.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gtk-doc.bbclass |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass
index 4e0bd88..fb7863e 100644
--- a/meta/classes/gtk-doc.bbclass
+++ b/meta/classes/gtk-doc.bbclass
@@ -7,7 +7,8 @@
 # packages up any existing documentation (so from tarball builds).
 
 # The documentation directory, where the infrastructure will be copied.
-GTKDOC_DOCDIR ?= "${B}"
+# gtkdocize has a default of "." so to handle out-of-tree builds set this to $S.
+GTKDOC_DOCDIR ?= "${S}"
 
 DEPENDS_append = " gtk-doc-stub-native"
 
-- 
1.7.10.4


