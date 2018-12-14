Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9BAF37BDB5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 18:15:37 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a18so6727184wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 10:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=dkQstY4hk/YGjfiUo/TmSkjJI3NvAbZkDoNXIPHOJR0=;
	b=Gii47lGge9zvp/b5kgTXOGC6G+6wonVRU5y9sBYOvk1knhHnj9qSJka9ml1SkzPcqt
	e9jb6U4xD+sn8i3kGsJOQ5H97SznUd3GItCjTFShL0oCjtrB2Ns2bvx7ZOuw9McZ+kKh
	B3cCiYuI+oxuPQ0Uw9XTv7XLO8hX/DdpC+jqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dkQstY4hk/YGjfiUo/TmSkjJI3NvAbZkDoNXIPHOJR0=;
	b=Kn02ThUnW93nsr/UhCwvVCt2/OjF+hfOsaGxId6dOMItATiAsHzpuoW7wAbOJdUmIJ
	tZZhBfFs1Ka8pQhqX5ZUos0SXPTfL2WopEB4VWa0gx1DxZS2EzrLARMQN4vma2HQyntt
	yuNMSAI+VFNACI18sgGgBCFIaylKgYEwe7gDL+XYD6ZPdr+tRiI56GzRX7ejrYLjypuu
	5BDg/5hmfA80xDFv7NPCILkwDxIuA+2Xf4Vf8qe0H4bityA80zkg5LyLETNT3sKkt39I
	dGTR7DcWN4DSceR2xocsp6EVOIzQIJ4mDe0FW1FB5RMgojcLy7EQuwi4bpqHlnLj+c7u
	2HmQ==
X-Gm-Message-State: AA+aEWZW4AoXFw+6kw+CyLlkCEa/jm3EoTyVcWZoUggVhYoqYMUn0bn9
	tXjhT4bUMT42SQ7z6RhlO6KbQQMTmVyjQg==
X-Google-Smtp-Source: AFSGD/WBv6mvbLkAe/yhI9IvbCUM6ReM3Fk3bb9uF6K4XojQM1lqdBYlJCTmhYS+jul3z4ZS8AI0dw==
X-Received: by 2002:a1c:4955:: with SMTP id w82mr4271708wma.33.1544811338157; 
	Fri, 14 Dec 2018 10:15:38 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f2sm3885653wre.34.2018.12.14.10.15.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Dec 2018 10:15:37 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 18:15:35 +0000
Message-Id: <20181214181535.9186-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181214181535.9186-1-richard.purdie@linuxfoundation.org>
References: <20181214181535.9186-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] oeqa/selftest/distrodata: Port to use the new recipeutils.get_recipe_upgrade_status() function
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
X-List-Received-Date: Fri, 14 Dec 2018 18:15:38 -0000
Content-Transfer-Encoding: 8bit

Rather than use the obsolete do_checkpkg function, use the new recipeutils
function which uses tinfoil to get the data rather than needing csv file
manipulation.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/distrodata.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index a862d30b10e..824e29e01b5 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -4,6 +4,8 @@ from oeqa.utils.decorators import testcase
 from oeqa.utils.ftools import write_file
 from oeqa.core.decorator.oeid import OETestID
 
+import oe.recipeutils
+
 class Distrodata(OESelftestTestCase):
 
     @OETestID(1902)
@@ -17,11 +19,11 @@ class Distrodata(OESelftestTestCase):
         feature = 'INHERIT += "distrodata"\n'
         feature += 'LICENSE_FLAGS_WHITELIST += " commercial"\n'
         self.write_config(feature)
-        bitbake('-c checkpkg world')
 
-        checkpkg_result = open(os.path.join(get_bb_var("LOG_DIR"), "checkpkg.csv")).readlines()[1:]
-        regressed_failures = [pkg_data[0] for pkg_data in [pkg_line.split('\t') for pkg_line in checkpkg_result] if pkg_data[11] == 'UNKNOWN_BROKEN']
-        regressed_successes = [pkg_data[0] for pkg_data in [pkg_line.split('\t') for pkg_line in checkpkg_result] if pkg_data[11] == 'KNOWN_BROKEN']
+        pkgs = oe.recipeutils.get_recipe_upgrade_status()
+
+        regressed_failures = [pkg[0] for pkg in pkgs if pkg[1] == 'UNKNOWN_BROKEN']
+        regressed_successes = [pkg[0] for pkg in pkgs if pkg[1] == 'KNOWN_BROKEN']
         msg = ""
         if len(regressed_failures) > 0:
             msg = msg + """
-- 
2.19.1


