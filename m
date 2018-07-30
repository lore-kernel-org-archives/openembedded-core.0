Return-Path: <joel.stan@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6415978D55
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 04:42:10 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id y10-v6so3945959pfn.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2018 21:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=RUPtyTWMeLFo9ltP2ZuCHd45mvZd3pDer51N92gQKI0=;
	b=OY6bJXsBZqMcF8gmxqi0vWnJqJfcvwPfp+YmMTAjlHrThdhgnL06QuKmIpb49YfXvr
	Tn3VnZNqYN/kFMZWwJHxXOiYWs2Jb65j6XbKKHB870X+A7k8pKY7EJreV5edwVvDvvC6
	js/NorZ+/xXmst0fVuWoH1mxAncuBNlkOxv9qh0jOVqyCPaVWgEKFswdahhY4mH9KxWt
	OQ9YngCgq2/f7FuCnmmRwX2koDgE+slzQtKoer2AECjWSnmwDCB7fWXAl+aMF8v/LqYu
	5UW5fDwNiHLQ/uRfJTIPIJRU3h575/EPjv4vkAh7qTYCYtapvVG8KuNza5De109Azy9W
	lCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=RUPtyTWMeLFo9ltP2ZuCHd45mvZd3pDer51N92gQKI0=;
	b=aXpjllsXZAAbvGiyKBYwxW/MdjvvvSbjG8bbc0QyiT7BCrhXmuqMqizZudsASTjPsd
	5BMHPsPfp8bsjEvfJk+1DJBDRcPmKJQ5hZYxbHA7z5xzpZtVSsnPicFfUPlhLQUiFu5b
	521w7Glmy3Hx1aQeuMWVuU0ey6xepRu3pzrUKruUUWWrBQW1sT2dHMIMVKSD1/kntWLm
	wmGO67AJv68MyicQPwtw/BSxEwxJMRwdwuvv+l4nppIpJL8ec7am+dnZOFTXPDgH51kd
	K0XCTMSPBdC3XeSlfk4sqtIHrTP/lpp4ij81wegaelg73whtgzl/JyHyt03GI//Hn7St
	76zA==
X-Gm-Message-State: AOUpUlHXVcmWHTAjcZlQGEg0gUknIB4iLDhx25XrCwS/X3jeK60bQKbW
	2kRpxB0KO3cH4khDrS4a7Z6FE/p/
X-Google-Smtp-Source: AAOMgpfdVttZluBoIWZN4diQ4/jcbmsTaA3Vc6qJaQ6Iizw7XzPeQr8UOkeQmv5SMnhKZTMvVOIqVQ==
X-Received: by 2002:a63:5922:: with SMTP id
	n34-v6mr14991017pgb.113.1532925731070; 
	Sun, 29 Jul 2018 21:42:11 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	137-v6sm10731070pfu.121.2018.07.29.21.42.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 29 Jul 2018 21:42:09 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Mon, 30 Jul 2018 14:12:04 +0930
From: Joel Stanley <joel@jms.id.au>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2018 14:11:58 +0930
Message-Id: <20180730044200.3164-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 0/2] GCC 7.3 fixes
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
X-List-Received-Date: Mon, 30 Jul 2018 04:42:10 -0000

This series has a pair of patches that we have been using in OpenBMC's
Yocto tree for a few weeks. The build fix is required to compile from
our ppc64le build machines.

The std::pair fix reduces memory requirements from many gigabytes down
to something reasonable.

Joel Stanley (2):
  gcc-7.3: Fix build on ppc64le hosts
  gcc-7.3: Backport fixes for std::pair high memory usage

 meta/recipes-devtools/gcc/gcc-7.3.inc         |  2 +
 ...c64le-build-Partial-backport-r256656.patch | 40 +++++++++++++
 ...-PR-c-80290-memory-hog-with-std-pair.patch | 58 +++++++++++++++++++
 3 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-ppc64le-build-Partial-backport-r256656.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0001-PR-c-80290-memory-hog-with-std-pair.patch

-- 
2.17.1


