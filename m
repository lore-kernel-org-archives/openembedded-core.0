Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f174.google.com (mail-it1-f174.google.com
	[209.85.166.174])
	by mail.openembedded.org (Postfix) with ESMTP id C825B7C038
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 15:28:23 +0000 (UTC)
Received: by mail-it1-f174.google.com with SMTP id c9so11530956itj.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2019 07:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bLPc+ovnPC8VCNlvBeQe0BXAkQ0VObEQUl0hr+bgwgU=;
	b=BNTlIv6MGrHiqTAEkuWKnylYVbO0cOBEiQWGHqa1uAAjITqA20hWccdNwcUrNq12eV
	zUXJIJuSwKraRvPnNcz5/YmmV0hLoRat+HS+IZCIAX20x7LlyG7eoNZJA8o06wWbFjcN
	9Qjfe3+stgWZm7QnhKvqljxl3IBMNCkrUTd49LvUKrC+t2PrnIi9n0ZqHKoBeIZSsAV0
	F4e3WrofZyoN9yBJnC9c2/5rfNJeTIuSgFiGvDaHwHdjHqmRbL2T3W93RAwLgf47X4dj
	yhhLu2DC7LE5fEH3GjndRBIfaIddhZag1z2e7F8OqOacSgXM1q3+ELpCURNIXGMOK98U
	Srsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bLPc+ovnPC8VCNlvBeQe0BXAkQ0VObEQUl0hr+bgwgU=;
	b=TB7nVTRGUfw0PXFHR2icGbDnlLPZhaxWCK8zfecTXxm2FRVw4p1oT+XE3RSYbYplg1
	mi9CWzwQiyFxGfmtiOt9I1CkBo+psJuTlQ5JKfFjt36edbXZA77B8lp3VquU+cn3imwx
	ylZQzhzB0vDboNS7E/8W7N6OY5bUOHrIYHc/qogIne4qC/gPHeGDEYLWys1uvK7P9O5/
	MiuHBHiK3hZK6kcLAze3G/OkGbMNn5LBVWmPRGynJeYNUezmQcQnEQ3jCnY5KOsHC2wb
	ElwFbG75cEo9lyl0kkSljLMM3hHJd7HjMhBsCQ3941eWdRM/6f5liU0ZSeDMALcEs2Mn
	A/QQ==
X-Gm-Message-State: AJcUukeRzvdVKUy03UW4tViiddjRMteY5r/QOeyuexK4dw3ZOaPAVlgY
	PBH2Bp7xIKL+/3AttEMO97Sp7PFzuWc=
X-Google-Smtp-Source: ALg8bN7kYNE6FZf631BdDGGVQLYCGZJzp9iPRh/RT0fYjvj1QixtwuTGX56V9ggS8Rb0ukFJ/Z2KNA==
X-Received: by 2002:a02:8cce:: with SMTP id n14mr4487325jal.125.1547047704626; 
	Wed, 09 Jan 2019 07:28:24 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	b18sm15809828ioh.28.2019.01.09.07.28.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 Jan 2019 07:28:23 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Jan 2019 09:28:18 -0600
Message-Id: <20190109152820.16845-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190109152820.16845-1-JPEWhacker@gmail.com>
References: <20190109152820.16845-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] classes/icecc: Check blacklist for BPN
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
X-List-Received-Date: Wed, 09 Jan 2019 15:28:24 -0000
Content-Transfer-Encoding: 8bit

If a given PN is listed in the icecream blacklist, there is a very good
chance that the native, nativesdk, and multilib variants should also be
skipped. Check the blacklist entries against BPN to cover them.

[YOCTO #13128]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/icecc.bbclass | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 7d94525d316..ed3f0d36e14 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -130,6 +130,13 @@ def use_icecc(bb,d):
         return "no"
 
     pn = d.getVar('PN')
+    bpn = d.getVar('BPN')
+
+    # Blacklist/whitelist checks are made against BPN, because there is a good
+    # chance that if icecc should be skipped for a recipe, it should be skipped
+    # for all the variants of that recipe. PN is still checked in case a user
+    # specified a more specific recipe.
+    check_pn = set([pn, bpn])
 
     system_class_blacklist = (d.getVar('ICECC_SYSTEM_CLASS_BL') or "").split()
     user_class_blacklist = (d.getVar('ICECC_USER_CLASS_BL') or "none").split()
@@ -145,11 +152,11 @@ def use_icecc(bb,d):
     user_package_whitelist = (d.getVar('ICECC_USER_PACKAGE_WL') or "").split()
     package_blacklist = system_package_blacklist + user_package_blacklist
 
-    if pn in package_blacklist:
+    if check_pn & set(package_blacklist):
         bb.debug(1, "%s: found in blacklist, disable icecc" % pn)
         return "no"
 
-    if pn in user_package_whitelist:
+    if check_pn & set(user_package_whitelist):
         bb.debug(1, "%s: found in whitelist, enable icecc" % pn)
         return "yes"
 
-- 
2.20.1


