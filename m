Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3B37865D00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 16:01:12 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id ig19so18384108igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 09:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=alCWRq91z3nYCWe/sDHOIXL5QMYEMLo+zJBGv8CXBws=;
	b=Uq6d4Nn3/RZuHW3TGjbBiswKpC9K0zjE0f9NhM8M7Fc3ckk6/XVwD+CxZgfYuWqZpD
	kpsyFci1ejwW2o4HHrMp/Cq4U+E8OmwdjrHTMWIrXGsVi7oFV1xG8NiSEL/E6ikdgyQu
	esOal7NYa7ckeetP7ROmFv+kAX9K9ZGM3uwchN6eVw+WhTKRIscJt3ZQV6ZN+s2G6d9k
	yvYkXTOru3/NSQfAGfNsZlV/A1uMKsOWiyxniP8cZQh2BiftwM55gcPH2TGziOoMGYpL
	04cVnzMtfgoDXWghVw8htuwS6QjR7NpQyZP/8uwsO9iWnT9T6IKBJSIfzyiCke6OPaGK
	LmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=alCWRq91z3nYCWe/sDHOIXL5QMYEMLo+zJBGv8CXBws=;
	b=enOjQkeIsk3D0VUZVvS4wxOJN9NLCOSBxNng3kjD4zze7sXxlYJflrLdcD8dCW7Q3s
	4uuU0ulIZWuulN4NF5bOrzfU+ODCuqbAMlovqI3NqEnkXE5+Br8HgSQTWHMYesfvrg8b
	QzXOcdgpkIONBzf7oflnRvZwu5OQP0H46rCHJHJmv94lAGnSg5ttg5zKS7I6WOMRVazM
	b9/GmkkNhoS3OMfm4xtttNhs2npOodg/K3XhYqzT9dvUHxSMVt8JBM/+qhfQdsS8qUR4
	iRZXklazai7MwR8nbi0Pwcgt69CBTmdq7xUsvtwZ7mpfU/jSxIhN/sjwfXUSTcu3KD0y
	9hCA==
X-Gm-Message-State: AD7BkJLVdVswfAyBP1HpHKYkSH1J+4M50bYop7agKbu49Efl0ZQhdUMW/U+o2NTw666JCd4m
X-Received: by 10.50.142.73 with SMTP id ru9mr6792121igb.45.1458230473397;
	Thu, 17 Mar 2016 09:01:13 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A57A7E.dip0.t-ipconnect.de.
	[87.165.122.126])
	by smtp.gmail.com with ESMTPSA id 8sm3878001ioe.8.2016.03.17.09.01.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Mar 2016 09:01:12 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 17:00:56 +0100
Message-Id: <1458230457-18785-2-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1458230457-18785-1-git-send-email-patrick.ohly@intel.com>
References: <1458230457-18785-1-git-send-email-patrick.ohly@intel.com>
Subject: [PATCH 2/3] sanity.bbclass: fix success message when config file was updated
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
X-List-Received-Date: Thu, 17 Mar 2016 16:01:14 -0000

The code now iterates over different config files, but always printed a
message about conf/bblayers.conf for each file.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 334e362..2539bd8 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -559,7 +559,7 @@ def sanity_check_conffiles(status, d):
                 success = False
                 status.addresult(e.msg)
             if success:
-                bb.note("Your conf/bblayers.conf has been automatically updated.")
+                bb.note("Your %s file has been automatically updated." % conffile)
                 status.reparse = True
 
 def sanity_handle_abichanges(status, d):
-- 
2.1.4


