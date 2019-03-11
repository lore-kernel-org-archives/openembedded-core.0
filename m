Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 886797CF3E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 04:20:52 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id p17so2819249iol.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 21:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1HvKtwzpHPvNgbLGf5IWGNr0GJIC3GuCf+kyv7S06i4=;
	b=lXykoxQs6AfUk0C9BP+a93ehXLDuk4aw6NXE1spwjcRto55A1XzfDp5EopZXvB9qnM
	MiFr7oaUFSbvvnqk29PKLmlJk7XMHPGrPucn7fnY2dkAN59qDEatIWpwCRYZNqP8fAAn
	iqmVfPFnEVa/qzNXwzcIYfHrT6oVEU2/vtX3C8qnFGSZlUZcmnP1o6ZnuLoFEomhWpgN
	WpPcKHd8TB/M8/7gToEN7CzEMZ1t9koZyIhUZ3GeaN7mSG/JERl8owDiQGwXazlgHNaf
	7qPLCbb2jmnWkH04tTj4+8UU5es48aT1sHJgUTTUs1R2LZmSk1ND+eTBd4nKD15aEDwx
	FvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1HvKtwzpHPvNgbLGf5IWGNr0GJIC3GuCf+kyv7S06i4=;
	b=QIMY6w1aaIRAunL4Xhhp3hlfdgVjVqHcigvepJrtC4/TLj98IB4s44QxWWbu+QXJJJ
	Res3gDh3kgZaKFWb7gNAsd5mfrI86DsBoeGXzSneOkGegausITXoss8kGG4/+2g2CmoA
	m3YFBzseIB4TRm5t5sl5XlRZBUnF1R1ATYv2orDCHfwwxJOF52KEKifwk5xxDDATPBue
	yJhsdSyrSqE7xvnDVXpYL7A2XRbsg6eQBs2mAXJgYpCeX1+Z5L2q/gU1XWdOYBw0YRiM
	l6uX8oJwrSNy+QS/5DorRGudJ0mAK4nrnepYv78T1ep0+Qd54KL56MqWu4r8fcDYFYgI
	Ij2Q==
X-Gm-Message-State: APjAAAUVMm/uqbHKM74lQXhkbxBY68TcCKfC0N3xxhXbkWqK+91hZ583
	cA8jUqIilTLRwDlNIhbrvMs=
X-Google-Smtp-Source: APXvYqwkSwJXeTgqqs7hKogfkzGSv9CKbDmw0fv2mKQf0CjYANQ5asvoMBv+daBzLLzufCmd7AhUHA==
X-Received: by 2002:a6b:f319:: with SMTP id m25mr1219315ioh.161.1552278053234; 
	Sun, 10 Mar 2019 21:20:53 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195]) by smtp.gmail.com with ESMTPSA id
	i198sm7622003iti.18.2019.03.10.21.20.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Mar 2019 21:20:52 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Mon, 11 Mar 2019 00:20:51 -0400
Message-Id: <20190311042051.61762-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto: fix SRC_URI patching with unified repos
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
X-List-Received-Date: Mon, 11 Mar 2019 04:20:52 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

As reported by Paul Barker, my attempt to allow the patching
of kernel meta data broke other repository configurations, since
the meta data patch routing was matching too broadly and the
same repo would end up being patched twice.

Using his suggested fix, we are up and running with both types
of repos again.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index bd7a957583..ed9bcfa57c 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -15,7 +15,7 @@ def find_patches(d,subdir):
         patchdir = ''
         if "patchdir" in parm:
             patchdir = parm["patchdir"]
-        if patchdir:
+        if subdir:
             if subdir == patchdir:
                 patch_list.append(local)
         else:
-- 
2.19.1


