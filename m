Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 22C7A605C2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 22:27:54 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id l6-v6so7019704wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 15:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=avIbErgUV43vYv4PdschtA6ASXirrkwTgNgsQbnNEuQ=;
	b=cqUk5SUAHpyoyWOsNad7IIQ530RZsjbmxqHdcs8/tPFbCCCPGoyToMyTKc5Di0XMe+
	aMqhUAS+G6cK4M8nLg/glDUvY4Bx3aYjrZAvaGhnfY8PlvxAjKTe6rGWfmF9anVaB7JC
	q4kvT9VNmKDyHYovnT6N2SWTSYsxSei4FtdoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=avIbErgUV43vYv4PdschtA6ASXirrkwTgNgsQbnNEuQ=;
	b=QPjXum6RTnz8O7yrhfmK9eT0X1mpRYzuY44oTrovo1sKvAbiOpqOY2afgqSnaqLQKd
	aYGknmdcJkwyGJz1hXH19OuVzP/CFyocSziA0Cvvvrr0YgzZMOEC8xZVqQtC/xYr086J
	7Y66XvpDdP6/T/whg9PlkezUk428LuEUz7tMCMC7ytkP8TomUOL/TxKYrCHl3EWaMDf+
	Bk79XNPNKAr1WO9v3lPu33ma0h611srtbXQsRSewJ9yIZwmCP4aWgqqUG2NLowJR706q
	q/iNgCvTT1tTwwn91T8l4ZlbMFL0BSd00zhXeqTDgeydfeixc+Y+3KpgSizxzfjdHje+
	ULQw==
X-Gm-Message-State: ABuFfohyq0AW4myUQzazzwElXRhg+Qfakdk6kU7VRQF+pUgpE+niWaSR
	WviaTmHDo8zGMY9HcRSzeI3h56Tl3M0=
X-Google-Smtp-Source: ACcGV6381s4H8RO5keT20D4hAgvkHjExecXnCQE+nrfUPkOoUd84hcsv3IoMjL6s8Vh9s4poY+HIlA==
X-Received: by 2002:a5d:6707:: with SMTP id
	o7-v6mr25758864wru.326.1539210475460; 
	Wed, 10 Oct 2018 15:27:55 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y76-v6sm9441673wmd.37.2018.10.10.15.27.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 15:27:54 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Oct 2018 23:27:50 +0100
Message-Id: <20181010222750.378-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181010222750.378-1-richard.purdie@linuxfoundation.org>
References: <20181010222750.378-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/3] testimage: Ensure package-index is triggered for opkg/apt tests
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
X-List-Received-Date: Wed, 10 Oct 2018 22:27:55 -0000

If the opkg/apt tests are run without a package-index they will fail.
Trigger this here for now as a dependency until the code can be improved.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testimage.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 859b5f485ab..aaf5f44f061 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -87,8 +87,8 @@ TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-native:d
 TESTIMAGEDEPENDS_append_qemuall = " ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS_append_qemuall =  "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'createrepo-c-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'dnf-native:do_populate_sysroot', '', d)}"
-TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'ipk', 'opkg-utils-native:do_populate_sysroot', '', d)}"
-TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'deb', 'apt-native:do_populate_sysroot', '', d)}"
+TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'ipk', 'opkg-utils-native:do_populate_sysroot package-index:do_package_index', '', d)}"
+TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'deb', 'apt-native:do_populate_sysroot  package-index:do_package_index', '', d)}"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'createrepo-c-native:do_populate_sysroot', '', d)}"
 
 TESTIMAGELOCK = "${TMPDIR}/testimage.lock"
-- 
2.17.1


