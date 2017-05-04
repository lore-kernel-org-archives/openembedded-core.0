Return-Path: <dev@codyps.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5FB5C77C31
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 17:50:44 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id 131so2551146itz.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 May 2017 10:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=uM0kUUpk5Z3RGbOo6qpYWlWp8O16ZXt2ufEqjHZ5Rhw=;
	b=dWhPayeOJuS8rYl5Tz/x6SC7C4HugjtiwcsuBGsMq4Aqouiq4x20Li0xfwsgwaCOLV
	O/pPktFf89U5ZxgMwA2alc0x5ogK/KLMcoWyYClNKE6xp/ZQ50vjldhOwPYghJOCjSUB
	uou4opfsQliY+hEO//PNDWFWCfZda5WHKxYSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uM0kUUpk5Z3RGbOo6qpYWlWp8O16ZXt2ufEqjHZ5Rhw=;
	b=se7LwC7U3vWWyRwDxixYB2MnyT7BbQXQUMc43p23ras0TmdhE8Sowhbq3QB6n/P+UO
	KCRpYRpNwen9Kvt43uaNNyAyNPvesHPyq42fyOmAnG6fEAQilEdypOAmxzWwiFwv0mNt
	jy+hFnXlGGgArt7AzkCRdzAW1cJoBvwjDWQVbrDMvgopAFhxrj9QLdbYK5e00DECNnFa
	rxbG38K7MQOafT9RK5ChrX0qELe5Qi8o035Xs1zQw3R+UrBh9KIQsHQrcqJI36PAKjpQ
	fuPiv9z5FLbiyAlrnZzW9Gtoe0ak8BRzBLkX1VQ1BmdkTlR6xgd79NFPltn3AnmgeLXT
	1hpg==
X-Gm-Message-State: AN3rC/4/HIC63f/A23gCqbRFPeEzNA/S1jgI/Pj+3XaXIr++rfSKyLPp
	ih9JmMrsQlPdtw==
X-Received: by 10.36.173.70 with SMTP id a6mr3611035itj.110.1493920246256;
	Thu, 04 May 2017 10:50:46 -0700 (PDT)
Received: from localhost (static-72-74-84-52.bstnma.fios.verizon.net.
	[72.74.84.52]) by smtp.gmail.com with ESMTPSA id
	u187sm687459ita.27.2017.05.04.10.50.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 04 May 2017 10:50:45 -0700 (PDT)
From: Cody P Schafer <dev@codyps.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 May 2017 13:50:41 -0400
Message-Id: <20170504175042.3164-1-dev@codyps.com>
X-Mailer: git-send-email 2.12.2
Subject: [PATCH v2 1/2] cmake.bbclass: remove unneded cd ${B}
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
X-List-Received-Date: Thu, 04 May 2017 17:50:45 -0000

The default dir for do_compile & do_configure is already ${B}, no need
to cd (other than broken appends)

CC: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Cody P Schafer <dev@codyps.com>
---
 meta/classes/cmake.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 12df617ad8..8b5f18d8e0 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -135,12 +135,10 @@ cmake_do_configure() {
 
 do_compile[progress] = "percent"
 cmake_do_compile()  {
-	cd ${B}
 	base_do_compile VERBOSE=1
 }
 
 cmake_do_install() {
-	cd ${B}
 	oe_runmake 'DESTDIR=${D}' install
 }
 
-- 
2.12.2


