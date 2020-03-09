Return-Path: <pbarker@konsulko.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2C65461082
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 14:21:52 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t11so11419936wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2020 07:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OIXAIXQoW7yKYZiov9G3HLpaiyWnrfTSgQPJahFaK2A=;
	b=LSUf/qA+fVcUXsYQkrqDnQ0hBKSvCoS49EZIcbzNFMe0QQeAa8P5M6oukcmH+F3KaE
	88VFdT9CnZHbY4ptFQgpArwXP1okF3jt+icH8AXjqNkFCmqkstEB7DqE1z1+z1ozqb2I
	tOs38Fqyrxad47THkSQZW0BW52gVFr62cIvaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OIXAIXQoW7yKYZiov9G3HLpaiyWnrfTSgQPJahFaK2A=;
	b=IU5if60prmRsAASc+OcAw6XPONJbvevd2GkS5c9T24iAVR+X4NdgLrJ8YiX1vJhTZH
	0U3uCCh5zHJSUFSpR6edlx/yOhhjFmUNthCoSLVCS4mcr9zTjBNDamjXitZrcFXaCU3A
	clyJvOcXIhKO2vWBFTgU1YX8TkdrrxpNuXwqrcrlIUh1te6edVB/FSRKfLe69qrtNhbl
	SaBKLBn083fuoQtpdTmBaaF702M9CVF1b3htOskYWbyMU4yoHB7DZIvygR0zhxkGbCia
	/NL5ZphSb0UuW/N6KdgOGTmEtnx54VNCgEiGq1RW75PFJtuoamrAuVqZp8S7lCi9D+Lu
	dJXQ==
X-Gm-Message-State: ANhLgQ0eLVsNtDC7z1hkb5qzeKvcWR9OR0VVwEYuKQ+AZf5K2IST1bJf
	e9LYL+v+j8A+mva2xqLlCYtahDPma47I791L
X-Google-Smtp-Source: ADFU+vvyd7Ibx33vT3I1O8CdYQDAjZEiMEIZlOCA05Q2znvtem25sHE22HMuv/HnibGyuPbc1Nsv4A==
X-Received: by 2002:adf:ed91:: with SMTP id c17mr19654241wro.388.1583763712332;
	Mon, 09 Mar 2020 07:21:52 -0700 (PDT)
Received: from ub1910.Hitronhub.home ([213.48.11.149])
	by smtp.gmail.com with ESMTPSA id
	z10sm25780577wmk.31.2020.03.09.07.21.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Mar 2020 07:21:51 -0700 (PDT)
From: Paul Barker <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2020 14:21:36 +0000
Message-Id: <20200309142139.15741-3-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309142139.15741-1-pbarker@konsulko.com>
References: <20200309142139.15741-1-pbarker@konsulko.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] archiver.bbclass: Make do_deploy_archives a recursive dependency
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
X-List-Received-Date: Mon, 09 Mar 2020 14:21:53 -0000
Content-Transfer-Encoding: 8bit

To ensure that archives are captured for all dependencies of a typical
bitbake build we add do_deploy_archives to the list of recursive
dependencies of do_build. Without this, archives may be missed for
recipes such as gcc-source which do not create packages or populate a
sysroot.

do_deploy_archives is also added to the recursive dependencies of
do_populate_sdk so that all sources required for an SDK can be captured.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/classes/archiver.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index fef7ad4f62..c11d36d708 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -604,7 +604,9 @@ addtask do_ar_configured after do_unpack_and_patch
 addtask do_ar_mirror after do_fetch
 addtask do_dumpdata
 addtask do_ar_recipe
-addtask do_deploy_archives before do_build
+addtask do_deploy_archives
+do_build[recrdeptask] += "do_deploy_archives"
+do_populate_sdk[recrdeptask] += "do_deploy_archives"
 
 python () {
     # Add tasks in the correct order, specifically for linux-yocto to avoid race condition.
-- 
2.20.1


