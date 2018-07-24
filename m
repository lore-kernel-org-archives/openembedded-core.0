Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 67C8775114
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 02:32:22 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id m16-v6so1038218pls.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 19:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kfy8NFhL7i0pni0irqi6doudoF7xkC8Ae57AP67r78A=;
	b=hu4UW+cVNFQLP71lDSdbTNSa4XsfkrjjuUrmPYqhBU8QXv5eWrANmOZ3aVB0/wpZgJ
	qmFO4drOxOc9CTOcjWfmAgRohZgrZaUeq40M6jTYcxrRpOV5pRvV9eubgbKQDRnT3Lgs
	moaSIGC8rbQypUDBeDEK3xE2zf8AIm1MqOSMQZOmK3yge/NczUrd2eZO66XOKvQxR4Mg
	hzJXH5INQhcLjCeVf+xh+lIsfgnjGOPzOFb8atifGOmhuVGeb8HB/RT+rTiIIo952N+o
	lYHck5NZ26YsWr50mEI+0rAYNDtBAfVzELxhhPMd2R3yRUPjrD3YYWBs0JvTsX+FKFOz
	eDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kfy8NFhL7i0pni0irqi6doudoF7xkC8Ae57AP67r78A=;
	b=dc1K+szLWIuy8FcMtpeK34ACdgM/dK02pQa4unHEMpS0jezBqcutm1bMUUQ6b/myk6
	okGVAZH4RGI39PE+KTeSC46qixVtOHRZ74Isb1X0OS0w1y+2vLbc8cZShrZ/nsQ21x0E
	env68BlVTmjZMDVFS/6kbuPGo7GtEOVDifL9qimtC5L55MTZcEUjdt/aGqm/SHFrMgva
	ZrxBx0d3boBf+9ef5RgRcJBf6XpKgqlgKBYKQd+nsFfJSlAv1+pWZqx4FbYu7WeXx1nH
	Oh85TS1lOTpzyra3lQAY4I610eqy8cGTCTMcoGqpen1lxPmzrgBh5b679scKobhxVFLK
	aAYg==
X-Gm-Message-State: AOUpUlHXR1FdQZ191r0q9voXAHr6JNadNkGtzSi758lPuzVg/SsRoCi7
	5PGICKAc/yAVj2thwn/KrHQUSS/U
X-Google-Smtp-Source: AAOMgpf/hENpv+w49fGnf0T35Z18+IdROEYiPrFtzRgg6x5TCDH8SMwgrLLjCyhDUPd/TzSi80CIQg==
X-Received: by 2002:a17:902:76c2:: with SMTP id
	j2-v6mr15049606plt.19.1532399543309; 
	Mon, 23 Jul 2018 19:32:23 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	g11-v6sm13126527pfh.63.2018.07.23.19.32.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jul 2018 19:32:22 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2018 19:32:18 -0700
Message-Id: <1532399538-32084-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] autotools.bbclass: fix autoreconf bbnote commandline arguments
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
X-List-Received-Date: Tue, 24 Jul 2018 02:32:22 -0000

Leaving -Wcross out of the bbnote version of the autoreconf command
seems to be a long standing inconsistency (dating back to the very
first commit in oe-core) but there's no obvious reason to do so.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/autotools.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index cc857ac..81d3674 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -225,7 +225,7 @@ autotools_do_configure() {
 			find ${S} -ignore_readdir_race -name $i -delete
 		done
 
-		bbnote Executing ACLOCAL=\"$ACLOCAL\" autoreconf --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
+		bbnote Executing ACLOCAL=\"$ACLOCAL\" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
 		ACLOCAL="$ACLOCAL" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || die "autoreconf execution failed."
 		cd $olddir
 	fi
-- 
1.9.1


