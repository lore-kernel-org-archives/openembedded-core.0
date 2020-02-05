Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0D1E2605F2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 23:13:03 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id x1so3675766qkl.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 15:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Cwwz/3Cgi4/T3NwTNGFFDDDdDxNQv5m0K8Tvm+TV+Do=;
	b=TCgia9a80PytsvS6pSkN/b5OQSKH6PG9zNx9YPDWjbb4RMNzO9UTAH78YDtagJv1bT
	13vcR+tWHQrdkHvRCTZFVmiR5kuBQuBfufy+ltNQ8+bAaUYcOYS8UJEIou+AJB8X5eFP
	FaQMs8m3RrgAVLB3krdWMZQWePAITfN2+LEpvxduuUzFhZpCk2CnBFFMNh+UBbQ9icKe
	+jVHMZM49lVJ0yHIJRKZsKmPYL2KETiv3b2BcdKT5UHH4lp5mQPCqj6Wxn8Nc3nryqmR
	urJB31Z6cJGG6ecT1ux5opMbrr7SwBxBQf/pYI4Cu65bqXuuq1zDHHQVPMnhjA7kXf2/
	zudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Cwwz/3Cgi4/T3NwTNGFFDDDdDxNQv5m0K8Tvm+TV+Do=;
	b=dJYn2N1Fkiv4WRSVE0I1BgPLAICVRm0wEwq7r2AciCAfT/31S+/r1Z2ONGwL+mHOue
	8UqqcDpurvPT8BC/poNJ8groujtjgWpSAZQTk6DWoQtPQUDroCXe6T7auXZf1D7tbhzX
	FpBR5WMtT+r4arnECS3dyAF4Io+u8UggihPzlqsAwpTZKZS2Kz5XtB1d2r43mk4Jgvkn
	ZcDKoC3Q7LwnW8ewPvcpD5Lh13CsuHvzbNoLsVAU91/152RCSQV8i8UAvvv/uZ/twLgl
	jzIXsfcgWPngDdpJe/ub+Pwt50N4z5HX1DfSMu1w3q4/a/2re3SSk3O9+RhnXQOqyfcS
	LaLQ==
X-Gm-Message-State: APjAAAXamrfr4Z0HulVuWFG+Rg0G7lW9CRqkM6306M0SiiP959n2zlU0
	vIio6epu8uDFUkfSxSG/nSETbHL2nvgpEw==
X-Google-Smtp-Source: APXvYqwR6p9pqyUJ4k5XwdDy6W4ETqkO+UPsFdGNC6e943Lv8NvU4pRh5puWLSEgtr75p+tFTz8VDQ==
X-Received: by 2002:a05:620a:88b:: with SMTP id
	b11mr102671qka.429.1580944383192; 
	Wed, 05 Feb 2020 15:13:03 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95])
	by smtp.gmail.com with ESMTPSA id o17sm696332qtj.80.2020.02.05.15.13.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 15:13:02 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  5 Feb 2020 18:12:50 -0500
Message-Id: <36300ff0f34f374ade66d2a35d0f9771a187ec7e.1580944129.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1580944129.git.bruce.ashfield@gmail.com>
References: <cover.1580944129.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] kernel-yocto: fix defconfig detection in find_sccs()
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
X-List-Received-Date: Wed, 05 Feb 2020 23:13:04 -0000
Content-Transfer-Encoding: 8bit

From: Gavin Li <gavinli@thegavinli.com>

The current code would cause a file like "config.bin" to added to the
config sources list. I am sure the intention was to add any files with
defconfig in its name and not the other way around.

Signed-off-by: Gavin Li <gavinli@thegavinli.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index d961901b74..918d101d3d 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -47,7 +47,7 @@ def find_sccs(d):
         base, ext = os.path.splitext(os.path.basename(s))
         if ext and ext in [".scc", ".cfg"]:
             sources_list.append(s)
-        elif base and base in 'defconfig':
+        elif base and 'defconfig' in base:
             sources_list.append(s)
 
     return sources_list
-- 
2.19.1


