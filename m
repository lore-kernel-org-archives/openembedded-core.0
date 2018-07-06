Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7F09878868
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 05:07:07 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id bi1-v6so2295973plb.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 22:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Fh+aWED+gTYzLasJaVuTfRI/yCDQQ+Gv8251wglmMf4=;
	b=d4XmgL8cFGCJVR7EkRRnzBfRV+AmtQi80KQRJS8zSfTdszyPsCiPhhOGcw9cHcQL7l
	Ujrv9ChX/ajnSzhXJiow2Q+69e22wk80tYWYH/TUw6O1TspWFc13cwGSxbMNGDqcERVN
	FDPWSxHgMPl0lqzQjXqvideTaFd3jTJ4t3jfJPOBK2lQRtG52lA1asmc0KMvg83+XXJx
	6aBo2Xy2aTTttfm1+T8wPr0YjTNhlHUfqQQZzxRZvCE6PJQC0FgmMq/0Rgoqs5pfxWRi
	No1sh/F8FhLfah7KVECaa6yNi8A3LV0YTr0CYRsRGB/tqinLSfaOhKu1g4+X8GGGY+VW
	3xow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Fh+aWED+gTYzLasJaVuTfRI/yCDQQ+Gv8251wglmMf4=;
	b=kBAtLjvV4Y22YsE6Iq3NLqa+9nYg8pe/YzbK1F1qF0YqfHGqMPmuUE2PDVHxGZX3xz
	iN5XDp38xgvCo04scQR+o2GPHR+3oz/2/QFda9rVbaCOTzxA8tj6n9kTfSMrs1agYciH
	0CbbKqz5LdgooynVSydCU/j9pxvK7A8lk2R9KIF6K2tx3DNDuRRFFe/GnBdAE2MgolGe
	pWW5tdrREHimpJZxAEzEQMpKR3Leyg2NCJdxiWWgWDvDMSuOD1jxP2DE/zey8eA9VySs
	p87X9zoad29r8CFpLTS4GUrvdRtlv0xWA+NiSV38WpE93j5nHnW4pj+kaXLUM6GY3ltp
	l9+Q==
X-Gm-Message-State: APt69E25SYhWEH+0sEtPmM9SWIb5ej3CoNyEUHuzVG99yrmVu5fZt1tH
	yHTBCZqCAgLsS/eG/aUHFuB0gw==
X-Google-Smtp-Source: AAOMgpcFGvePNAf+BUYRAmfuPKagUGxjS84aL/9NEGp1I7eSMQqs09D3STJzEB9RBBFp2tk321+jag==
X-Received: by 2002:a17:902:7790:: with SMTP id
	o16-v6mr8847184pll.130.1530853628496; 
	Thu, 05 Jul 2018 22:07:08 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	b6-v6sm5967008pgc.85.2018.07.05.22.07.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jul 2018 22:07:08 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2018 22:07:02 -0700
Message-Id: <1530853622-5779-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] ca-certificates: avoid using += with an over-ride
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
X-List-Received-Date: Fri, 06 Jul 2018 05:07:07 -0000

Using += with an over-ride can be a source of confusion so try to
avoid the construct in core recipes.

In this case, the commit which added the over-ride seems to have been
buggy - the commit message mentions "add to SYSROOT_DIRS" rather than
a correct description of what the change actually did, ie "over-ride
SYSROOT_DIRS":

  http://git.openembedded.org/openembedded-core/commit/?id=355e49e19abb3e729c82a6de46ada8da8a257f58

The commit also appears to have been unnecessary as ${sysconfdir} is
appended to SYSROOT_DIRS for -native recipes by default from within
staging.bbclass.

To workaround the bug introduced by the first commit, a subsequent
commit later added ${datadir}/ca-certificates to the over-ride value
(which would not normally be necessary as ${datadir} is included in
the default value of SYSROOT_DIRS - ie the value which was lost due
to being over-ridden):

  http://git.openembedded.org/openembedded-core/commit/?id=09bb7718d74573be9a5db4d0737fb14126f6489c

Therefore the fix seem to be to remove the SYSROOT_DIRS over-ride
entirely - the default value of SYSROOT_DIRS set by staging.bbclass
includes both ${datadir} and ${sysconfdir} when building for -native.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/ca-certificates/ca-certificates_20170717.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb b/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
index 3502948..24d3a6e 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
@@ -26,7 +26,6 @@ SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https \
            "
 
 S = "${WORKDIR}/git"
-SYSROOT_DIRS_class-native += "${sysconfdir} ${datadir}/ca-certificates"
 
 inherit allarch
 
-- 
1.9.1


