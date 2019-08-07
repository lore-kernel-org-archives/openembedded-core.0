Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id C26767F45C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 11:08:10 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id g17so90919217wrr.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2019 04:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CUytF6zdEkS2vT7wlsT2q/kwn0p0dU+f7DE8a1raM+M=;
	b=KP9lD/wcCRBQyFQjNkDkngXmMCNTFG88Vdy6DMO2hU8iOMHLz78erJrtuvOz34sjrt
	rNsiA5jpUnlkCl/w5zpUlskGJt3GnI8lLWM+Z2aW2TXsOZZ5Km5TPTDcaOe89o4yu17z
	KfJu+xtETkwENfY0t7gUNhSfkXlnVZMELncumG6LcUfaDHkZYIjLJOuIxPDTa/CQI1Gk
	dvVvHren+EIxHz0FPj36L2EcTtCeYhx8BB27gWG3YJw64iXHdGZbrD+ds+hS9xd4GVOJ
	PyEcUByRs/KweqV0ePCk+AIP5iR04ybxvL11JuhnTVT7gMUajZ0SaXWBY22W/NHYlJX8
	BWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CUytF6zdEkS2vT7wlsT2q/kwn0p0dU+f7DE8a1raM+M=;
	b=DA1wl7As76jvfyRIlcv9RemdsdiiVT4bQIY3nbQ+eDXSo1cB+eSJOJ+xaLlISuszt3
	CuKNtQeurriwgMJTY2uzKlKMmNwWtse3YGFWwnnF9BIzNfdRO0O7VMgMk7P7IVreE5X6
	1vuAK9eosAhUUZPLZzrN/OGj9EaRQ3t0cOFyMf7KVTTawPYNFaA+vN6/n3ejoZIrpofB
	VDrTkFyslyQpFekZoOyxYt6XQxVdmDwzItc7YPZSnK48F8ocIjMphfNZWhlNLdmipk2k
	INXjD8mASKGu0rXmsRUBDUAwsTHw4itfL+mH7iXyhRFHEfbr3QRyg3dUviUHB+Dj6IxU
	lz7Q==
X-Gm-Message-State: APjAAAW3eYrWvl80WkLguIulfQ5y4JC9uXKHA7cOL4EnYUY17ZZzJ2NW
	owEV2cGKabiX3FhMAFvYnhDeWczz9s8=
X-Google-Smtp-Source: APXvYqyaJwmodKnKOKjFbNKcQnC/E//jqwY94JmhhepqgTSY/gYXizd2QQ+qBs3hcUsFOv1WbUWZzA==
X-Received: by 2002:adf:ec4f:: with SMTP id w15mr7705572wrn.311.1565176091215; 
	Wed, 07 Aug 2019 04:08:11 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i66sm164045670wmi.11.2019.08.07.04.08.09
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 07 Aug 2019 04:08:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Aug 2019 12:08:05 +0100
Message-Id: <20190807110805.1879-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH][thud] buildhistory: call a dependency parser only on actual dependency lists
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
X-List-Received-Date: Wed, 07 Aug 2019 11:08:11 -0000
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Previously it was also called on filelists and possibly other items which
broke the parser.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/buildhistory_analysis.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index ad7fceb8bbc..d3cde4f6509 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -127,7 +127,7 @@ class ChangeRecord:
             removed = list(set(aitems) - set(bitems))
             added = list(set(bitems) - set(aitems))
 
-            if not removed and not added:
+            if not removed and not added and self.fieldname in ['RPROVIDES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RREPLACES', 'RCONFLICTS']:
                 depvera = bb.utils.explode_dep_versions2(self.oldvalue, sort=False)
                 depverb = bb.utils.explode_dep_versions2(self.newvalue, sort=False)
                 for i, j in zip(depvera.items(), depverb.items()):
-- 
2.20.1


