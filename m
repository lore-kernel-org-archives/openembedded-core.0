Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id BAAB67F394
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 20:37:25 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id s15so46133787wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 13:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=clocniWax+N9fQmgQc3cuLSgPsP4Xm2vobtBRX/YtR0=;
	b=vXcBJxvH4eH0t5SPlBffqW+D6hyFFRaPDKjMeMIVw+G4ssJz//HQy/j4KuMH3lR4TC
	H1ZgmMUJI54xvLAHXnQlZ+cQM3LyaPtPFC/Ie5U+fCTacfVLpW4koG2n9qwSBx2dk4zg
	pYAHj6HWLoo6q7VAp6F0GycdMOECrHMB9258MQMDFXVDXFkp6R10SiU2AVhfdJO1NhfY
	3bacJLBlcywJqw/dacMTLjIoFpsWBJOuj0i0BWEIGJll8qBeuhDO5dDf4zOJCnR8MeuB
	5OhW+4ng7Ws+J7qwJlckSUW/kBlcUxQgrAPTBOQ4tcplYA8hDxCjS+W3CA7Rqh08uf/B
	xGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=clocniWax+N9fQmgQc3cuLSgPsP4Xm2vobtBRX/YtR0=;
	b=n/lZgLDyz01p7bCoKGd+LO1nnUFHPW9I7I0gQuUOEu0XIVa9GtTXkOwrDjbPCBlLjA
	i7TGtn3WVwknw4ze5kWc4pJVkgsbHcEDnrceKAs/jUm4jelLJMi2lcjcz6de+m3X9Inn
	KcLRHJ8HAnipmb3T65t61uNbHnPGGuSeAp6p302wKhSu+nsIeGMA+1jtjxb6Bf5xBXqy
	qy+j7BREMT4mjQKk4jTST5z1eEHUaBl2hqDOnOxsFJgbvKe4xqQmYFjKmMXVe2qBkyU5
	1thIC5jqwbGS1Sie8RSskL0MJfbmzom8ayD4654iRCLFFsf9a/ZNEFIqYj0lZwOV0/Vk
	dEUA==
X-Gm-Message-State: APjAAAVD8xFauQbMoyA+rPAxiNDHLuZi1n2X2a5SDplPEQlm8iNRYCvJ
	tfcqlJ8/wOaopeS2QIZlxXUe0Pu3FNg=
X-Google-Smtp-Source: APXvYqzpDnB15HjKqjylgDzoija0QmMa7LdQFuhO10AgEHd3joZm5Ie28qXnbBvkpEcoWCNSQiPkrg==
X-Received: by 2002:a1c:345:: with SMTP id 66mr5826889wmd.8.1564778246354;
	Fri, 02 Aug 2019 13:37:26 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n1sm59083910wrx.39.2019.08.02.13.37.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 13:37:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2019 21:37:14 +0100
Message-Id: <20190802203719.20437-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802203719.20437-1-ross.burton@intel.com>
References: <20190802203719.20437-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/9] xdpyinfo: don't depend on DGA
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
X-List-Received-Date: Fri, 02 Aug 2019 20:37:26 -0000
Content-Transfer-Encoding: 8bit

DGA (Direct Graphics Access) is an obsolete extension that neither modern X
drivers nor applications support.  We'll remove the client library, so remove
the optional dependency on DGA in xdpyinfo.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-app/xdpyinfo_1.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.2.bb b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.2.bb
index a09e220f9d0..2d10b7acca7 100644
--- a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.2.bb
+++ b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.2.bb
@@ -9,7 +9,7 @@ clients and the server, and the different types of screens and visuals \
 that are available."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f3d09e6b9e203a1af489e16c708f4fb3"
-DEPENDS += "libxtst libxext libxxf86vm libxxf86dga libxi libxrender libxinerama libdmx libxau libxcomposite"
+DEPENDS += "libxtst libxext libxxf86vm libxi libxrender libxinerama libdmx libxau libxcomposite"
 PE = "1"
 
 SRC_URI += "file://disable-xkb.patch"
-- 
2.20.1


