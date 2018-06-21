Return-Path: <kergoth@gmail.com>
Received: from mail-pl0-f53.google.com (mail-pl0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 81EEA7852C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 21:08:15 +0000 (UTC)
Received: by mail-pl0-f53.google.com with SMTP id 30-v6so2303561pld.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 14:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=nIfYp4siAtN29Y3nB2O2KSKU4rgxXwHVg2EBnw5bQNc=;
	b=aDStP/RWdhS7kumWI3VMAqBwTW4dW1m5WJegNC4ZhuENtLwDW9VWCvBcof4Mrm7lrA
	htwL46nahegN1QzUXyvH7Gba8JXlsK0Z8qEePPeKdkBiK7PkMozFihwG59LlukLt4jDb
	RGtr+FpDBRAe6uAcSADjxriHRlZ2YzwqevQJQPyqul+IOvIRwh9phbeYHgBBscj0GHJG
	MtWWahSJl6jITZDHcqvFbRS/ot/Mw9R2gVOuQ+JLs4Lt2Ygx05asXthZymc+M+lqKBGN
	X3gzeglk1Ko3+qGTJ7K6SxQmBnhCeG671GpKNRdxfNZvaj4oz2yFYwb8f3o9K2swXT6p
	hUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nIfYp4siAtN29Y3nB2O2KSKU4rgxXwHVg2EBnw5bQNc=;
	b=QwphFm42KjItR+z6tHMS/2l0xig2uOpS+4Rs5ZPQDwBQm0oI5KsZvpP1khaBLPc1ha
	KC96qnUWBQhkqRVt67w0NwXPll0J+16c0uTAB/DJ/orUrihwLpZsvIWov/JOxeRtQKf5
	FXYpfXQJxgK1sILvqBJX5CH8AhdTOnb47XBjHbk7KzPeNFJ96iSyOGwTeqEgWNhVj9ME
	89f8hPMCnI/V1xeBCjyoBbPMUHNx78AD6ZsPqahUUOpGRYMeMdK0BKuQcCut6Cs8JlVc
	rQPvTH/nkGgBIQTuGmb/1fZsG5KjxDcpQNEW+r/hs4z9/yZE5sayEsHFkkYQRGmcnSyk
	CFqQ==
X-Gm-Message-State: APt69E0zpXsOliZURCvWoQskhxvFHowb3F+nl4VvJ9BMGRT6vVtjCZUO
	e/79jQda/HQ+/7bhouMxaII/rhNm
X-Google-Smtp-Source: ADUXVKJfbyCVsGWmICn8sZUjOz17MAJ6k+sN7aZO2fKu0xWgDvdj8Kgq/KUoyrf/M4et1RqNVjbzaQ==
X-Received: by 2002:a17:902:42a3:: with SMTP id
	h32-v6mr29768533pld.72.1529615296399; 
	Thu, 21 Jun 2018 14:08:16 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	n85-v6sm9836546pfa.146.2018.06.21.14.08.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jun 2018 14:08:15 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2018 02:08:04 +0500
Message-Id: <cover.1529604975.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/2] rng-tools: start earlier in the boot process
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
X-List-Received-Date: Thu, 21 Jun 2018 21:08:15 -0000

From: Christopher Larson <chris_larson@mentor.com>

Entropy is needed earlier in the boot process in some cases, for example
connman can require it, and rgd doesn't require much, so move it earlier
in the boot process, 03 for sysvinit, and before sysinit for systemd.

The following changes since commit 83c9405df5748744ef673ac8757bb89d7050ad8d:

  alsa-tools: rewrite packaging (2018-06-15 11:18:15 +0100)

are available in the git repository at:

  git@github.com:kergoth/openembedded-core.git rng-tools-early

for you to fetch changes up to abb55c262e6dab31c0e77bf800e83cdba155fc13:

  rng-tools: start earlier in the boot process (2018-06-16 02:05:09 +0500)

----------------------------------------------------------------
Christopher Larson (2):
  rng-tools: drop unnecessary INHIBIT_UPDATERCD_BBCLASS
  rng-tools: start earlier in the boot process

 meta/recipes-support/rng-tools/rng-tools/rngd.service | 3 +++
 meta/recipes-support/rng-tools/rng-tools_5.bb         | 9 +--------
 2 files changed, 4 insertions(+), 8 deletions(-)

-- 
2.11.1


