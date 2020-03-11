Return-Path: <jpuhlman@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 24BF861BE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 22:25:58 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id h11so1771267plk.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 15:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CMc6SOmW0Y3dedbDsD/2ZTaHFZJ0n5rduO1klAE01wk=;
	b=Jm0BcIUrnDHk0qguhhliA3EYUY3t2e6ncBXa32qV19V3W6wCj47kQYtYZNSoDQk8JM
	koHVDxqtPoHgsEfMSmMKcm0kehceRdFpY7DHVHQCLYnpUkyBpyrDUa6kgP/hcLEqWgFJ
	7js24sfJSRL6HswI4pV/nyNzbx3x44+14CrL5eJAQgPk3qpX3BUU+5Itx92HroLoKUcB
	QsiOLJtmW2TnPl/NsG9MhZ+NO682UFWBZhDwDeQF2Tdwjll+ryLrJ6bhFBoKElanGx+p
	kqCxIxR2PylqN1X8zPmB533GZyT3vZqj8jm+SSxySr4boLtQLOrxIQR3TFEWvT9b9Egx
	LwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=CMc6SOmW0Y3dedbDsD/2ZTaHFZJ0n5rduO1klAE01wk=;
	b=IuLVrkorRgAOfmFOWAlV3DxEagxAVt6wYtimEz6rHbjpnsL+L1n0T24WWiOkn9h+ob
	3pDhDEftLx9dS6THufHLna7GdfbiAZyFBp6itp4KvUUwumoa5ji+Ix4vCLn2xN0C2P9m
	ydbpVIFxS9YwwePcHWJcx8r+W8oAH+JZ3IuNT7sr6IAA1TShMPA+ZAilWwGlbQKhTvN4
	LcULeZDQ/ld2+yDCMH/+OVkOreK7e8iQVGrZGUe48XzsraXLJX3s6smt9XAbJI6nXRFQ
	eqXfDQhRMexWIINCqc6USyVkDUC/+FK2lUSGvB01/M0CzlVsTjnQVlRXG3PE5DIlURdu
	BpcA==
X-Gm-Message-State: ANhLgQ3sCQLLDhhF8U9gLnvstv89qSBuLjh+saBkl2NWgJVjiTx1Bb9F
	tRPauPpR6NMdNPHpQisgfJPkGnOlZoI=
X-Google-Smtp-Source: ADFU+vtYZdcmFCJlYMu9CH/UD2+3ffSRVv7c+6YtI1ylX7P5ycaqy6TqoTaI4tyvbv44ktBHHbPkWw==
X-Received: by 2002:a17:90a:37ea:: with SMTP id
	v97mr960664pjb.26.1583965558906; 
	Wed, 11 Mar 2020 15:25:58 -0700 (PDT)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	u5sm31064879pfb.153.2020.03.11.15.25.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 15:25:58 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id B10F32A05EB; Wed, 11 Mar 2020 15:25:57 -0700 (PDT)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2020 15:25:46 -0700
Message-Id: <20200311222546.30284-6-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20200311222546.30284-1-jpuhlman@mvista.com>
References: <20200311222546.30284-1-jpuhlman@mvista.com>
Subject: [PATCH 6/6] boost: fix reproducibilty issues
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
X-List-Received-Date: Wed, 11 Mar 2020 22:25:58 -0000

From: Jeremy Puhlman <jpuhlman@mvista.com>

fix cmake file references of image dir path

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-support/boost/boost.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index e15dce4e1d..8eb9494381 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -202,6 +202,11 @@ do_install() {
 		fi
 	done
 
+        # Cmake files reference full paths to image
+        find ${D}${libdir}/cmake -type f | \
+             grep 'cmake$' | \
+             xargs -n 1 sed -e 's,${D}${libdir}/cmake,${libdir}/cmake,' -i
+
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.13.3


