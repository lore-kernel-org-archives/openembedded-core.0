Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 208CB7C326
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 12:09:01 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id y21so1768959wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 05:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rbXkt8LDay3aZCkKvTKYoY19liozep0LfzuzM1Djgwg=;
	b=s8k5SkG5YtSpZau0U1dfHGncd8zuGjzPPjcVfmIdVG3a7C5jLUcnXhgWAJbG0sFCfM
	T6fySfUV2EvB28/AAhc05vL6ZKStrSCwxhTfZuWean+ELEss6OaCItrA3rsKbFN2whaE
	cET05OlBzuDSwA2fWvIQMOGygz4GjKmpzFzk9DJtrLkayTjcQdJuvmnylXauAr5YPO0b
	lEbSJBFDx3h/3Z1iec7kCnZT71ZotSFWU+RybiGwVPXAGDuxTHE1xOJ4SLD6hB8Wl3XV
	oWQ0oSTMcIL0Qjha3PuUVTkKQFyg6Qda6iuw3YiU79p1JAPLXoprMgx4yZFgax5g04al
	hNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rbXkt8LDay3aZCkKvTKYoY19liozep0LfzuzM1Djgwg=;
	b=m98GyJBHNa6NWPJsC8d9JW7+TSjvGeSYcTxdKtVquk85Cjz5MDKZ6alkmbg+26MbwV
	0mggUCVM8v3WyBN8TnpNFFS9fXcgYhTJFu9JM0lrOz6kq6Nv9FTZ7DbFDuGguPtvMEO3
	rz+KUlv/DNg4usI7eIAoB9JNVW8a8MvXdfsRrHvakkcFRmn+FLFcQbzcT6zi0aMsgmf5
	invYUVl5MtewcBKWMX1xqOPi7WKXvH3AbA1QghZFsS4MC5cexLuB8T30ZU7I/2HbBrYF
	YQyfbdh79JOK7mUhKhXXu/ThxJjtWgCneLY/wc9h6QFGDis7aW1DmJtdKxiEv4SGkp+c
	dGWg==
X-Gm-Message-State: APjAAAUBCsECUB3FsC3LXD87lTuVKWJB/rMGECDyysQelQkxPW5Iqc94
	1Xi3YrY9SrmG6OqIe915TkB7jYC1
X-Google-Smtp-Source: APXvYqzWS0rlUjL5Qycihya6v29qfbajsu+TK6qB65elKq+dymBERNuUOlLGoENBkOtvfp/O+YauDA==
X-Received: by 2002:a1c:9889:: with SMTP id a131mr2498651wme.38.1569326942310; 
	Tue, 24 Sep 2019 05:09:02 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	q66sm3110466wme.39.2019.09.24.05.09.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Sep 2019 05:09:01 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2019 14:08:44 +0200
Message-Id: <20190924120848.25479-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [sumo][PATCH v2 0/4] Fix build with host gcc9 / latest glibc
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
X-List-Received-Date: Tue, 24 Sep 2019 12:09:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Build errors popped up with Fedora 30

V1 -> V2:
    Corrected Upstream-Status

Andreas Müller (3):
  elfutils(-native): Add backported patch to fix build with host gcc9
  glib-2.0: Add patch from upstream to fix build with host gcc9
  cross-localedef-native: Fix build for hosts with recent glibc

Khem Raj (1):
  bison: Fix build break with glibc 2.28

 ...11-gdbus-Avoid-printing-null-strings.patch | 77 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.54.3.bb |  1 +
 .../glibc/cross-localedef-native_2.27.bb      |  1 +
 ...ll-_IO_fwide-if-_LIBC-is-not-defined.patch | 78 +++++++++++++++++++
 .../recipes-devtools/bison/bison/gnulib.patch | 21 +++++
 meta/recipes-devtools/bison/bison_3.0.4.bb    |  1 +
 .../elfutils/elfutils_0.170.bb                |  1 +
 ...-fsize-and-msize-with-const-attribut.patch | 42 ++++++++++
 8 files changed, 222 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0011-gdbus-Avoid-printing-null-strings.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0032-argp-do-not-call-_IO_fwide-if-_LIBC-is-not-defined.patch
 create mode 100644 meta/recipes-devtools/bison/bison/gnulib.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/0009-libelf-Mark-both-fsize-and-msize-with-const-attribut.patch

-- 
2.21.0


