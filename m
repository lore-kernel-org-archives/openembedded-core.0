Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id ABDE260167
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 12:44:52 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id r20so11812299wiv.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 04:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:date:content-type:mime-version
	:content-transfer-encoding;
	bh=xVExlX4Gi2QSc6EGwNJ4ASfhMyw0V7a2X6WhXosqKwk=;
	b=hjqSf3wrYEJmtH/wvpniWZgVFo8b31Ubb6YBqWJHhEYxZskh2z/P+7qbfpW0uPfpDV
	vb9OyVHeM/jr11WFH9CYOd9G8F5Pgh9LR4RIfGCVLN1pDn7kZ7OsApITjRzsgYu/lp11
	m4LMi1x+6bA7XaMDh7DEyzszQMDdlrTsNQIu1VfCl/o79N1rqgSPa5P9O3x2EuQmGpIt
	s4JLyooV88xf/zu/8vZldzvcjJ+4MZuMcYfm3MqqeD8HbKbJtmLeGShOOvx6abCHALg3
	HQ3rcgVfnfNkwT3D+e8lky2O1Jzrm9ROmfuaIEifwIaq6K7gz97bUcgptCcUoGsn1mzX
	X+Xg==
X-Received: by 10.194.122.233 with SMTP id lv9mr12521097wjb.95.1423831493712; 
	Fri, 13 Feb 2015 04:44:53 -0800 (PST)
Received: from [192.168.0.7] (212-41-70-184.adsl.solnet.ch. [212.41.70.184])
	by mx.google.com with ESMTPSA id
	cf12sm9972386wjb.10.2015.02.13.04.44.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Feb 2015 04:44:53 -0800 (PST)
Message-ID: <1423831491.5765.25.camel@Saturn.local.all>
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Feb 2015 13:44:51 +0100
X-Mailer: Evolution 3.10.4 
Mime-Version: 1.0
Subject: Recipe which builds for ARCH '${TUNE_PKGARCH}' and 'all' fail
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
X-List-Received-Date: Fri, 13 Feb 2015 12:44:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi

If a recipe builds a package for the default ARCH (I think this is
${TUNE_PKGARCH}) and one for ARCH 'all' then this fails when building
in the same directory a second time for a machine with different
${TUNE_PKGARCH}.
Observed with dizzy (armv7at2hf-vfp vs armv7at2hf-vfp-neon) and
master (MACHINE=qemux86-64 vs qemuarm)


ERROR: The recipe mixed-arch-test is trying to install files into a
shared area when those files already exist. Those files and their
manifest location are:
   /mnt/sdc2/oe-disk/oe-core_master/oe-core/build/tmp-glibc/deploy/ipk/all/mixed-arch-test-a_1.0-r0_all.ipk
 Matched in manifest-core2-64-mixed-arch-test.package_write_ipk


An example in the wild is meta-java/recipes-core/rhino/rhino_1.7r4.bb
which builds: rhino_1.7r4-r0_armv7at2hf-vfp.ipk and
librhino-java_1.7r4-r0_all.ipk.

See below for a simple test recipe which reproduces the error.


Is this intended behavior or an issue oe-core?


Simple workaround:
- don't build machines with different architectures in the same build
directory.

Workarounds at recipe level:
- build all packages for TUNE_PKGARCH, even if the nature of the package
would be 'all'.
- have two recipes, one providing packages to TUNE_PKGARCH, the other
one to 'all'.


Regards
Max


>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
SUMMARY = "Test build of packages of different ARCHs"
DESCRIPTION = "This recipe builds a package with ARCH '${TUNE_PKGARCH}'
and one with 'all' " \
              "When building this in the same build directory for
MACHINES with different " \
              "TUNE_PKGARCH" do_package_write_ipk fails for the second
build "

#Successful build for armv7at2hf-vfp, second build for
armv7at2hf-vfp-neon
#ERROR: The recipe mixed-arch-test is trying to install files into a 
#   shared area when those files already exist.
#   Those files and their manifest location are:
#   /build/krm/oe-core_V2.4/build/out-glibc/deploy/ipk/all/mixed-arch-test-a_1.0-r0_all.ipk
#   Matched in manifest-armv7at2hf-vfp-mixed-arch-test.package_write_ipk

LICENSE = "MIT"
LIC_FILES_CHKSUM = \
"file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

DEPENDS = ""

SRC_URI = ""

PACKAGES = "${PN} ${PN}-a"

PACKAGE_ARCH_${PN}-a ="all"
FILES_${PN} = "${datadir}/file1.txt"
FILES_${PN}-a = "${datadir}/file2.txt"

do_compile() {
    touch file1.txt
    touch file2.txt
}

do_install() {
    install -d ${D}${datadir}
    install -m 0644 ${WORKDIR}/file1.txt ${D}${datadir}
    install -m 0644 ${WORKDIR}/file2.txt ${D}${datadir}
}

S = "${WORKDIR}"
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<



