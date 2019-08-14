Return-Path: <prvs=122d025a4=Michael.Ho@bmw.de>
X-Greylist: delayed 425 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 14 Aug 2019 15:12:25 UTC
Received: from esa4.bmw.c3s2.iphmx.com (esa4.bmw.c3s2.iphmx.com
	[68.232.139.62])
	by mail.openembedded.org (Postfix) with ESMTP id A03CB74769
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 15:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1565795547; x=1597331547;
	h=from:to:subject:date:message-id:mime-version;
	bh=SXAp8eH40/xnwbAAcqDRg/xTJzE6nQf2XQ5vJfwHHJg=;
	b=ZI2H9/mCnJ7+S2GrMVE8ajo2m+liqfmdumB6h/WjvqZCSvDC47JGovre
	B6UzmCyTmK+uSag4U03BRK0yRvFuipmC0ugFviaDvukgxfmLIWrSoDCcw
	tYJ3rUJnDqY4Fuf3w31pVrVXdK0c71JZqUXT4CTavhFFWwOMD4vzdwi9T g=;
IronPort-SDR: xyNDjwFHVGJwu8PFZFtZHisJsTXa1ilSz3r9eCnc8nxFRVhCY0r1xpXoYtQYCASo1yTFuzRnWL
	uihDydeZAV+l5Pc9Mc9I9wX4S/2TLOkhuAK2oatwkBL2RrrZrwYSzfWY6pY/+aAeEqes3tQTmh
	GMakJfuwwuuG8WzMWuQUtS6DNX7OrTBu5HibxjihKnBY/yRcFnjwJmYYNPdtUmzT1/7EZZIsdf
	xhMHhIiq7kz50BO+v/Cs1+hHMyIHZt7Hkbz6b7EPwTYeDEARpQHF6LAegq98W53NGPosAII9C/
	t68=
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
	esa4.bmw.c3s2.iphmx.com with ESMTP/TLS; 14 Aug 2019 17:05:21 +0200
Received: from esabb5.muc ([160.50.100.47])  by esagw2.muc with ESMTP/TLS;
	14 Aug 2019 17:05:21 +0200
Received: from smucm09k.bmwgroup.net (HELO smucm09k.europe.bmw.corp)
	([160.48.96.43])
	by esabb5.muc with ESMTP/TLS; 14 Aug 2019 17:05:20 +0200
Received: from michael-pc.bmw-carit.intra (192.168.221.45) by
	smucm09k.europe.bmw.corp
	(160.48.96.43) with Microsoft SMTP Server (TLS;
	Wed, 14 Aug 2019 17:05:20 +0200
From: Michael Ho <Michael.Ho@bmw.de>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Aug 2019 17:05:14 +0200
Message-ID: <1565795115-1581-1-git-send-email-Michael.Ho@bmw.de>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [192.168.221.45]
X-ClientProxiedBy: smucm19k.europe.bmw.corp (160.48.96.83) To
	smucm09k.europe.bmw.corp (160.48.96.43)
Subject: cmake find_program and hosttools_dir
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
X-List-Received-Date: Wed, 14 Aug 2019 15:12:26 -0000
Content-Type: text/plain


Hi all,

I wanted to ask what would be a good way to fix an issue with cmake
find_program and the tools listed in ASSUME_PROVIDED. I checked against the
Warrior branch and it seems that currently find_program does not search the
hosttools directory for programs because HOSTTOOLS_DIR is not listed in the
CMAKE_FIND_ROOT_PATH variable (in cmake.bbclass). This means if you call
find_program to get the path to the git binary, it will fail to find the
program. I've attached a minimal recipe and CMakeLists.txt to demonstrate.

If you attempt to compile the recipe, you'll see:
| CMake Error at CMakeLists.txt:6 (message):
|   No git binary found

If I modify the cmake.bbclass and add this directory to CMAKE_FIND_ROOT_PATH,
it still fails because by default it wants to only search in the
subdirectories bin and usr/bin. If I then modify base.bbclass to generate a
"bin" symlink in the hosttools directory that points back to the hosttools
directory, it is enough to trick cmake. I also found a second solution where
if I instead add a default definition to CMAKE_PROGRAM_PATH to include the
root directory, this works also. I've included this second fix in the patch
I've sent.

Is this a good solution or is there something I'm missing here?

Thanks.

Kind regards,
Michael Ho

$ cat files/CMakeLists.txt
cmake_minimum_required (VERSION 2.6)
project (Tutorial)

find_program(HOST_GIT git)
if(NOT HOST_GIT)
    message(FATAL_ERROR "No git binary found")
endif()

$ cat find-git.bb
SUMMARY = "Example recipe to test find_program and git-native"
LICENSE = "CLOSED"

DEPENDS = "git-native"

SRC_URI = "file://CMakeLists.txt"
S = "${WORKDIR}"

inherit cmake

do_install() {
    :
}

