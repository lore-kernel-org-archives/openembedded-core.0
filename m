Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3E6AC74DDA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 00:14:47 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id p9-v6so13545906pgc.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 17:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rDjOx9JKZd+yZsuc/wtqNsuwD+B0Vx+tt4bnYcGFwMk=;
	b=WHZDmImhnj57r4G8MHfShGiWJcqxjUwTStPl42dAVSjCXBEWvl/uqYbI2oPxFj8pYL
	ANR23XfCoLXObUb6siw+ZN2e1Ucsq1MrJ2f3F9TYHmqBDJ/TEbAnrOG8svto9M3lB/Go
	4D4oJO/M3P07yS+p7HemQ6VMmOu0pwOn33m7ABhWAA6kRgOCxYCMT695fHqNCz3wEksv
	efLkSrEDC3Ybss+HjM+OFhUl+wy8m+ETKe9YCyhw/K7rFsqgOLxPpNddvJwkyqh3cFJ0
	q6X6In7Jryv2RTl0fRS+DQo6ujjKQ4rNJZL/QKavM5TlOddbK5wvye0WJu1MEhly65eW
	j3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rDjOx9JKZd+yZsuc/wtqNsuwD+B0Vx+tt4bnYcGFwMk=;
	b=LPFSO+ettd/+rAcplviDmPIqiPSCmtXUq/lKVg79ckfDEwQF33g3O5spwM3by/ZIC+
	FwY6uK0wC1qG8o7rAHXUhpL5BvZBvP/+C4c74mI5lJpO6vSbfeX01+KZlmgOAICEHQEq
	DUgfp8UXAXUft1b/ULmuG+tdWJB7Z3kArbDClzBHFoO1UyNbWAEGbZwhP5yO52gsvNEN
	PkssfT48/o01jbz36eMvKQWOUyttjIt3PQtKV5ets6ErC0sG9HtVI+vTFM0xy/a+G9ef
	yGxzjwgAuOwAmzfhpPn4WVvWYWs9b2x3AgOqrMN1K/N8YvFHR+xPEtqTY8/DBPHYLZya
	yz8Q==
X-Gm-Message-State: ALQs6tDleDhTbs/QxXuUSUbuwFE3ITZ2LWch+4pwkMPlSlqcW7HA2LPF
	pdwQ/jsoLzgkhzIkmrUZ6uE4xA==
X-Google-Smtp-Source: AB8JxZrli3y/Lf8FcVfSCDFHvg9OkZbsSzLSAsr2liXCLv0ltucx6h9Z/JDTOW3qSVlEpnU+75pTyA==
X-Received: by 2002:a65:45c2:: with SMTP id
	m2-v6mr23834500pgr.433.1525479288204; 
	Fri, 04 May 2018 17:14:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	o88sm36468559pfa.29.2018.05.04.17.14.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 May 2018 17:14:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 17:14:16 -0700
Message-Id: <d7cb3c04d9e69a4cabba9460b53072bebf53603e.1525478935.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525478935.git.raj.khem@gmail.com>
References: <cover.1525478935.git.raj.khem@gmail.com>
Subject: [PATCH 22/27] allarch.bbclass: Exclude package_do_shlibs from do_package signature
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
X-List-Received-Date: Sat, 05 May 2018 00:14:47 -0000

shlibs is largely useless for allarch, the particular usecase where it
fails is when DISTRO_FEATURE is changing due to libc being different e.g.

Variable package_do_shlibs value changed:
-DISTRO_FEATURES{ldconfig} = Set
+DISTRO_FEATURES{ldconfig} = Unset

musl -> glibc or other way around 'ldconfig' gets added or deleted to
DISTRO_FEATURE set, neither this distro feature nor the shlibs processing
during packaging is of interest to allarch packages which are largely
arch independent scripts

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/allarch.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 51ba509cd0..1eebe0bf2e 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -45,6 +45,7 @@ python () {
         # These multilib values shouldn't change allarch packages so exclude them
         d.appendVarFlag("emit_pkgdata", "vardepsexclude", " MULTILIB_VARIANTS")
         d.appendVarFlag("write_specfile", "vardepsexclude", " MULTILIBS")
+        d.appendVarFlag("do_package", "vardepsexclude", " package_do_shlibs")
     elif bb.data.inherits_class('packagegroup', d) and not bb.data.inherits_class('nativesdk', d):
         bb.error("Please ensure recipe %s sets PACKAGE_ARCH before inherit packagegroup" % d.getVar("FILE"))
 }
-- 
2.17.0


