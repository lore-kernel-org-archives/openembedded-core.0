Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9E64865D00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 14:56:44 +0000 (UTC)
Received: by wgxm20 with SMTP id m20so10927667wgx.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 07:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YxcG3lcplxH1AzxsTlNoiW02jiZWYdBdGoN8CxgTTb8=;
	b=SnSMoltR5zxg7Ptod70+I3hn0dHQ1sulFejG5xr7vipn0Tt1k/GVUa5z9OlYl2cVi5
	y+Cl/aAOyQwxvB5kvzqkAnaF9UXsiRpAFCERsg4mTQ/eG6simiW46rAY0FHAu9+zgze+
	6zEI6WjFrhYGXbcxFScIwBaXoqh08YS0C8EzKboi6+98fUFLoUFLoLU8PVrf3LJY0fAj
	ijcbozoQk3ZpmaHUdA2lmus5rliyf23mAxhSnfAKmpnbQIx5Vr0+/It88SG7quXNDu7x
	iD4VRuW/Lizc/53pEkwdLdOn0WlthiC1EFvPAvHiIGlk9PoINXCY7TtQzwmwXHvYsO/q
	UrFQ==
X-Gm-Message-State: ALoCoQlu0au5AvWDePsHByHnnh8Lg+v8JB0aNpZfuWgtHGZDYYbhT6yZ6N0FTzAEktxVRtvAaZdB
X-Received: by 10.180.73.145 with SMTP id l17mr6448645wiv.39.1436885804331;
	Tue, 14 Jul 2015 07:56:44 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	lj14sm3644571wic.18.2015.07.14.07.56.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Jul 2015 07:56:43 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 15:51:01 +0100
Message-Id: <1436885463-4577-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1436885463-4577-1-git-send-email-ross.burton@intel.com>
References: <1436885463-4577-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 5/7] dmidecode: use absolute paths in fixup task
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
X-List-Received-Date: Tue, 14 Jul 2015 14:56:47 -0000

The calls to sed use relative paths so they depend on the directory the task
starts in.  To clarify the code, use absolute paths.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/dmidecode/dmidecode_2.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb b/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
index b5151b8..4c16556 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
@@ -12,7 +12,7 @@ do_install() {
 }
 
 do_unpack_extra() {
-	sed -i -e '/^prefix/s:/usr/local:${exec_prefix}:' Makefile
+	sed -i -e '/^prefix/s:/usr/local:${exec_prefix}:' ${S}/Makefile
 }
 addtask unpack_extra after do_unpack before do_patch
 
-- 
2.1.4


