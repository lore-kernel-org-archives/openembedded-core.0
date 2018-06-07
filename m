Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 65E9260043
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 18:48:46 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id p9-v6so5164828pgc.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jun 2018 11:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qqs+W0+nnovy+USKQvi4/s8xyRMjE6K/0dodcW43jng=;
	b=l7TbupSINw1DEV5GlFsboh5FC/t6KEoZo3gtyvqBRW9wmq6fGQMHouMaXSpzqcIe6Z
	UEm2SxnDWy5uVUglak8h4XDEudHQtigp49F38grQq125Hkn/E265ql+IUOu1c0gqO8zV
	u3p6FNEJAlB4cYjM0JTt9F/srr6/Zgx7k6aW1pSWRRIl1Q3E46yHbyyl6aWXXSv3Nfsb
	Wv5DWtQ8xqiyxObKlSGOmJ20diOrJUkI+8H585o0/qMhb3Lo05bjKcLwoBJi1lNVRpDg
	Bo6XTQ6nm2bPbJK0nQTjl7PolYTrSnrntykV05GJXC8GAsJsGVrn5IsZ7SzAxh4B9lsj
	BHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qqs+W0+nnovy+USKQvi4/s8xyRMjE6K/0dodcW43jng=;
	b=eREKkgHvLMXhlZvnNi9zZojnLdVK5zusSM0MWSOgpmmh0SyPQRDs4dDuBuNvR0yYPU
	o1b2AbTnuOAYgHwdwsBoq058S/HPk7kdiwXEJUMkKr/PovQuCqKeq4Yr9c7AlUJX6LJ4
	ZPXTuWOai8Zxm8DsbnjNkS6765kHentcQ9jDrfb+df5ilf+yWQG5h5TKXDxe8Jy+n6cj
	SRMnqbVjxqVM77IJ3w++gm1RQqLllP9WLBef9MvHKw0P8MOC/MW19ZoLegi3pUNwem6g
	591RXfE/6lxrzeuDhofOjEio1LC/as4dKFWp1e+js9onPAXAw4GNLPLnX/S5OLzYEAVX
	4RZg==
X-Gm-Message-State: APt69E1tfjFF3lWTBke3uOf2UUIcVeINn0QhqFn7Vtrrcdmai5bUYzfg
	0F7r7HsApjpcvMXKYO7RAL6Y8A==
X-Google-Smtp-Source: ADUXVKJdVmRMu07lAvgEbPGy/jsRFzpGIdhbMPY14WstvlSWlbxXs2Sn1C40129pT2SnPk3Pu4e+4g==
X-Received: by 2002:a63:744a:: with SMTP id
	e10-v6mr2526278pgn.275.1528397327367; 
	Thu, 07 Jun 2018 11:48:47 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	f30-v6sm27103558pgn.76.2018.06.07.11.48.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jun 2018 11:48:46 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2018 11:48:34 -0700
Message-Id: <1528397320-32269-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/7] openssh: stop adding -D__FILE_OFFSET_BITS=64 to CFLAGS
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
X-List-Received-Date: Thu, 07 Jun 2018 18:48:46 -0000

Openssh takes care of enabling large-file support automatically via
the AC_SYS_LARGEFILE in the configure.ac, so additional help from the
recipe is not required.

Even if it were once required, defining __FILE_OFFSET_BITS (ie with
double leading underscores) looks like a typo and probably never had
any effect anyway?

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh_7.7p1.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
index 7b6ee5c..7cf34eb 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
@@ -46,9 +46,6 @@ SYSTEMD_SERVICE_${PN}-sshd = "sshd.socket"
 
 inherit autotools-brokensep ptest
 
-# LFS support:
-CFLAGS += "-D__FILE_OFFSET_BITS=64"
-
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
 # login path is hardcoded in sshd
-- 
1.9.1


