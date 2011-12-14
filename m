Received: from e06smtp15.uk.ibm.com ([195.75.94.111])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ken.werner@linaro.org>) id 1Ray3I-00074Z-4F
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 00:15:56 +0100
Received: from /spool/local
	by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <openembedded-core@lists.openembedded.org> from
	<ken.werner@linaro.org>; Wed, 14 Dec 2011 22:58:50 -0000
Received: from d06nrmr1707.portsmouth.uk.ibm.com ([9.149.39.225])
	by e06smtp15.uk.ibm.com ([192.168.101.145]) with IBM ESMTP SMTP
	Gateway: Authorized Use Only! Violators will be prosecuted; 
	Wed, 14 Dec 2011 22:58:48 -0000
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com
	[9.149.37.213])
	by d06nrmr1707.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id pBEMwlej2547734
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2011 22:58:47 GMT
Received: from d06av03.portsmouth.uk.ibm.com (localhost.localdomain
	[127.0.0.1])
	by d06av03.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with
	ESMTP id pBEMwkrW024431
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2011 15:58:47 -0700
Received: from bolide.boeblingen.de.ibm.com
	(dyn-9-152-224-84.boeblingen.de.ibm.com [9.152.224.84])
	by d06av03.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with
	ESMTP id pBEMwkDo024425; Wed, 14 Dec 2011 15:58:46 -0700
From: Ken Werner <ken.werner@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2011 23:58:29 +0100
Message-Id: <1323903512-7344-1-git-send-email-ken.werner@linaro.org>
X-Mailer: git-send-email 1.7.5.4
x-cbid: 11121422-0342-0000-0000-00000059051C
Subject: [PATCH 0/3] Initial configuration for the CSL 2011.03 external toolchain for ARM
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Dec 2011 23:15:56 -0000

Hi there,
 
I've spent some time on getting OE-Core compiled with the CSL 2011.03 external 
binary toolchain for ARM GNUEABI. I've started with the existent csl recipe 
and the steps that Tom documented [*] which have been very useful. It turned 
out that only one change to OE-Core was needed to get the minimal image 
working. The pre-configuration step of the libc-package needs to be override-
able by other recipes - just like Tom described. Here is what I've added to my 
local.conf for building the core-image-minimal:
  TCMODE = "external-csl-arm-2011.03"
  ENABLE_BINARY_LOCALE_GENERATION = "0"

In order to build the sato and Qt4-demo images I need a small change to the 
cmake.bbclass that allows cmake to find the binaries of the external toolchain. 
In addition I had to disable localization support to prevent the system to pull
in a dependency to eglibc-locale:
  PACKAGE_NO_LOCALE = "1"
  PACKAGE_NO_GCONV = "1"
  IMAGE_LINGUAS = ""
  LIMIT_BUILT_LOCALES = "POSIX"

Please note that currently the libc is provided by the sysroot of the external 
toolchain. This might not be ideal and as time permits I'd like to find a way 
to get eglibc build instead.

I'm still learning about OpenEmbedded and appreciate any suggestions.

Ken Werner (3):
  Rename do_configure_prepend to do_pre_configure and add it before
    do_configure
  Add EXTERNAL_TOOLCHAIN to CMAKE_FIND_ROOT_PATH
  Add the Sourcery G++ Lite 2011.03 external toolchain for ARM

 meta/classes/cmake.bbclass                         |    2 +-
 meta/classes/libc-package.bbclass                  |    4 +-
 .../include/tcmode-external-csl-arm-2011.03.inc    |   33 +++++
 .../meta/external-csl-toolchain_arm-2011.03.bb     |  137 ++++++++++++++++++++
 4 files changed, 173 insertions(+), 3 deletions(-)
 create mode 100644 meta/conf/distro/include/tcmode-external-csl-arm-2011.03.inc
 create mode 100644 meta/recipes-core/meta/external-csl-toolchain_arm-2011.03.bb

Regards
Ken

[*] http://lists.linuxtogo.org/pipermail/openembedded-core/2011-June/005221.html
-- 
1.7.5.4



