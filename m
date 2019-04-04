Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 70F687D4E8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 22:17:00 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id v14so5130719wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 15:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TzsXPdLeVT9RiE1V3w3UloH84j7BaTunkWcNsjTVLlM=;
	b=sy5fmxvt4086PfKxgQmi709JMJQlPB99r0GFJHIH0VTXgNGYwe2SKd1hfSV/87tREo
	c+9JlEGeVMtetQTm2mA+NXRFvuTqOQzZPXLsJbaM+3uXHrpUXQA9me7RsfRaeqkpMtM7
	AyEdnyuRdbQ++KQwpRzhfvrZS4WgxJgupEAGZnkQ22ViRa2jwBl9gz9EFkd+LntJTPE9
	Bo6b7VNDI57lodYjVTb2nUEOAmQYBYBNqM83xkfttVPEs2lgbDhUtifzJF6Vc7ttIRH/
	uhc3+cEaTrn285FDVNKSpwLeA751Eqn3970V9h97nJHev6wrgj0M4QDjwzh1EfmMlqkL
	qY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=TzsXPdLeVT9RiE1V3w3UloH84j7BaTunkWcNsjTVLlM=;
	b=AAR9GJSwDsv5QaXtN2qoWMnbtXLR5lDBiCHKNOiyzdI6WcnDBgYVUzSVywNSpx0E19
	sU7PIBM6XRzyabBkGBKEibISNy/U8vZqZ+bANq9kN+xxF99j5Z/w/Jp6OLoYOsM9QXpQ
	PiuETNiWQJ333dGPQ6nZrs6fVUdamkezxSQbmF6n/g+CwjiiB7sc7C/E+ANp+YhNvx6+
	Q7wCiDnJIiqGOUSDTVinK5dknckJtR4paP3s/+slHq4e9/WwDztamssUEwKPW9itDv9O
	3sN93jIgIn3/sje77RcPe1mz8r/cmcY5vyVjTUGDadVgI5iFji8druMLnuSqSTtODqsl
	CEhQ==
X-Gm-Message-State: APjAAAXPrJ5pORcOhcoeJlTCjNjyVTb102Ll3QNbfVDq6Mu9pQWDSq0u
	tIjpwJQeDcxBrJ1WL85WbJRx9q7Fzxk=
X-Google-Smtp-Source: APXvYqzZgZNKl48jxXLCwLieN4T82Pv3DcrSZTFEvZ93faNSl0dvyeVbIO2Oq2EbZUd7tUij0yCsOA==
X-Received: by 2002:a1c:39d7:: with SMTP id g206mr5138088wma.99.1554416220828; 
	Thu, 04 Apr 2019 15:17:00 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d3sm305565wmf.46.2019.04.04.15.16.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Apr 2019 15:17:00 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2019 23:16:43 +0100
Message-Id: <20190404221644.20496-8-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190404221644.20496-1-ross.burton@intel.com>
References: <20190404221644.20496-1-ross.burton@intel.com>
Subject: [PATCH v2 8/9] xmlto: clean up RDEPENDS
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
X-List-Received-Date: Thu, 04 Apr 2019 22:17:00 -0000

Because of differences in how RDEPENDS works for native/target, add libxml2 and
libxslt to RDEPENDS (so that native dependencies work), but also add
libxml2-utils (for xmllint) and libxslt-bin (for xsltproc) to target RDEPENDS.

Also add libxml2-native to DEPENDS as that is needed for the
docbook-(xml,xsl)-native catalog to be generated.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index 06dc002083d..df798dfcdde 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -12,16 +12,18 @@ SRC_URI[md5sum] = "a1fefad9d83499a15576768f60f847c6"
 SRC_URI[sha256sum] = "2f986b7c9a0e9ac6728147668e776d405465284e13c74d4146c9cbc51fd8aad3"
 
 inherit autotools
-RDEPENDS_class-native = "libxslt-native"
 
-# xmlto needs getopt/xmllint/xsltproc/bash/tail at runtime
+DEPENDS = "libxml2-native"
+
 RDEPENDS_${PN} = "docbook-xml-dtd4 \
                   docbook-xsl-stylesheets \
                   util-linux \
                   libxml2 \
+                  libxslt \
                   bash \
 "
 RDEPENDS_${PN}_append_class-target = " \
+                  libxml2-utils \
                   libxslt-bin \
                   coreutils \
 "
-- 
2.11.0


