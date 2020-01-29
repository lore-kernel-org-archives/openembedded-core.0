Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 29C48608CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 15:15:17 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b17so4688136wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 07:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=IIr367E/lmZGZ7jbGQbsSwBdiTjRSa/M/hn26kaeICg=;
	b=roLI9qslvhClF7iHUUPepQpql7wGsqeVrFZDMnNgsdJ4rU/tV76aR7i4wv9B+23W9H
	tOCbGxTOlawniuxY+9YW4acp9hHvsnRTGJseJPvXyBflj2fQ2igsB/TBRHkC4n0p2tqk
	ECHgUn8VWFXKhK9296s26cAXz3YyvIaR+vphpQZlCqNhiYiWzSLVsu/wBfy8ci/RQ+qp
	8MHOmglM55n3jI41QNaako6qmFPBPjBoCEAtKrSVFHoCBRtWZu/jEyooRjUJBL3zWAjT
	mQcvjNRbfyxnnvaDn2VnrW6d3oFkz6x1wlj9+2XVBid/5H0uf6LKRgSg/H6TrBEOLCGi
	Rbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IIr367E/lmZGZ7jbGQbsSwBdiTjRSa/M/hn26kaeICg=;
	b=Tqq/oPvChL2Cm/TL4U+A6WMECrJiNB1uQZq3iv2zUWRQzBzSpyF/BLKhFnPCyft6iM
	pRIqlo+qxXwiWo4Qy184QpReDIElRVONfO8nylBPYpwrx2PnxpYPkw8iOqOIiR0tjKJb
	5sVjVz9iKajKlCjCg40hY2uH8fUkbi/MVShfzNI9NCYQYFmVl8W/Abn57SIgyu8qOq/N
	W1EKeviS0N/qE6rT25Lya3gAaILGbeLa6aKXwItPW/1/UbZmTiEb+fId6qtK70Iv+00d
	ykgiEZZDuj1uBKFYh6kO/CLF6Pj0CvQNCcMMvroSaCj22NZfGR84OqcQAVHboTPUoU9a
	6drA==
X-Gm-Message-State: APjAAAV9CF6GCsBFbFT5oAlVc+/fOvEPpaoPrLOCSLn5Cd6RLZ4pqoH1
	mI6bCQAE1cn32n97LOkFFSAuz3m6
X-Google-Smtp-Source: APXvYqwZ9rUXQf7pPghT8PQAwoIzsQxZxW2BS2wkuVNQcxMSgil3KrdOOjPznYwo9+9jXmK4F7Lp9A==
X-Received: by 2002:a05:600c:230d:: with SMTP id
	13mr10729387wmo.13.1580288890198; 
	Wed, 29 Jan 2020 01:08:10 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	a62sm1550224wmh.33.2020.01.29.01.08.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 01:08:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2020 10:07:19 +0100
Message-Id: <20200129090738.1398-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129090738.1398-1-alex.kanavin@gmail.com>
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/24] shared-mime-info: fix (sort of) upstream version check
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:12 -0000
Content-Transfer-Encoding: 8bit

Upstream is using - to separate version components which
version checker at the moment can't deal with (i.e 1-15-1 when
1.15.1 is meant).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/shared-mime-info/shared-mime-info_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
index f0d5bc62e9e..7a060b09ad9 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
@@ -12,6 +12,9 @@ SRCREV = "829b26d85e7d89a0caee03046c3bce373f04c80a"
 PV = "1.15"
 S = "${WORKDIR}/git"
 
+UPSTREAM_CHECK_GITTAGREGEX = "Release-(?P<pver>(\d+(\-\d+)+))"
+UPSTREAM_VERSION_UNKNOWN = "1"
+
 inherit autotools pkgconfig gettext python3native mime
 
 EXTRA_OECONF = "--disable-update-mimedb"
-- 
2.25.0


