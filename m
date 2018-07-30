Return-Path: <joel.stan@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id A720278D6E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 05:10:48 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id s17-v6so4965319plp.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2018 22:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=SUda+6Bj29pq343U3FzAQAll9dSDgDPVZ9r9t6OAs5Q=;
	b=J8hj5x0KtZekZxCjxQ9XLL8SfLA/7azUEieW0VnZhanRH+sFrCGILmpgpGj3gbJpzy
	xr5KIoGIS9f/sK2MgP/Yxehe8sFplaR86QikRUFGb+LaocRHVKxA1LqB005T/RgA7/VG
	csimqzmS31BVL+gGSzkLgW7YAo9SjLmyfiGtGGhem+sYb9ARYrnpJ+sr9IrT92GeVEtc
	OMa2KZjyWVqGh9tbtAPZSmLxVTpteLgmyyt5nbNkPydHlotk9Ei17TN/aGLYQEf/pT0v
	EJwsaWxauSSBmYd6Qja3Ud1cTxwuGsxaZy5nEXuCIZ5lECsbNmzvQXCig81TKri8Suts
	zy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=SUda+6Bj29pq343U3FzAQAll9dSDgDPVZ9r9t6OAs5Q=;
	b=SmOoT+VmLHjI1UKusxgZET24OMEMKGunP0PrtdxOs5TTK1Cv10ydbkiNNIJdEJ4uAg
	AyCGq4vElhZigfC2SsixE07w2GGmcYw7/zAOAKgq/Q5ZR6M4mO2yBE6X3l2rhQRNzlyi
	bZ3qg47oKsq7mYpwe6LHLvglLvqO/XQGRheuSH+h4fao0atkBmnRNkf1tevAB4KRzNs2
	RS1erjEqMOONwTAlq4ZvAxDs5XyZjugDtlkBTLqqyxRqijn+mQbKyIps0LR7wFdsf+nl
	iSngQipTuqn8D25s9EDZCQ1eJLTFrc0nU4PMardfaAGoooXcYHykcri83NpJrYuCY4/h
	iwMw==
X-Gm-Message-State: AOUpUlEYtMxQfu/lOiukyOoD9IMq+gFlhtLPz4fMqwJoFtStmkOehL4u
	J+zi3gsJzv2FuDJ/KhWFmadTT/g0
X-Google-Smtp-Source: AAOMgpdFidW71U/1+6tl+nn4WpVA3SMxNJNKUpqIXkuGg4463tzc2yJ4WUywyxpE4tDt7BNuOySoXw==
X-Received: by 2002:a17:902:5281:: with SMTP id
	a1-v6mr14932479pli.73.1532927449561; 
	Sun, 29 Jul 2018 22:10:49 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	g85-v6sm27225559pfk.39.2018.07.29.22.10.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 29 Jul 2018 22:10:43 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Mon, 30 Jul 2018 14:40:38 +0930
From: Joel Stanley <joel@jms.id.au>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2018 14:40:27 +0930
Message-Id: <20180730051029.5530-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2 0/2] GCC 7.3 fixes
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
X-List-Received-Date: Mon, 30 Jul 2018 05:10:48 -0000

v2: Add Upstream-Status tags

This series has a pair of patches that we have been using in OpenBMC's
Yocto tree for a few weeks. The build fix is required to compile from
our ppc64le build machines.

The std::pair fix reduces memory requirements from many gigabytes down
to something reasonable.

Joel Stanley (2):
  gcc-7.3: Fix build on ppc64le hosts
  gcc-7.3: Backport fixes for std::pair high memory usage

 meta/recipes-devtools/gcc/gcc-7.3.inc         |  2 +
 ...c64le-build-Partial-backport-r256656.patch | 36 ++++++++++++
 ...-PR-c-80290-memory-hog-with-std-pair.patch | 57 +++++++++++++++++++
 3 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-ppc64le-build-Partial-backport-r256656.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0001-PR-c-80290-memory-hog-with-std-pair.patch

-- 
2.17.1


