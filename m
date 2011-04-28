Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QFYYb-0000ol-Qc
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Apr 2011 23:15:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p3SLCtPf001456
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2011 14:12:55 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 28 Apr 2011 14:12:55 -0700
Message-ID: <4DB9D856.7030709@windriver.com>
Date: Thu, 28 Apr 2011 16:12:54 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
Subject: OE-Core and MacOS X
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
X-List-Received-Date: Thu, 28 Apr 2011 21:15:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

I've started working on getting bitbake and OE-Core building on MacOS X.  So far
what I have are some pretty hacky patches.. but they should be a reasonable start.

I've pushed my changes to the git://git.pokylinux.org/poky-contrib.git
repository and the "mhatle/macosx/bitbake" and "mhatle/macosx/oe-core" branches.

The way I am doing builds is:

git clone git://git.pokylinux.org/poky-contrib.git oe-core
cd oe-core
git checkout mhatle/macosx/oe-core
git clone . bitbake
cd bitbake
git checkout mhatle/macosx/bitbake
cd ..
. ./oe-init-build-env build-macosx


Then you edit the conf/local.conf, add the following to the top of the file:

BUILD_ARCH = "x86_64"
TARGET_OS = "linux"

PREFERRED_VERSION_pseudo-native = "1.0+git%"
PSEUDOSRCREV = "481c6ff64f8aa6de01d3cb4042914f8e9f8d0abb"

PATCHRESOLVE = 'noop'

DISTRO = 'poky'


This allows me to build through the stage 1 part of the build (pseudo) and onto
the second stage.. it gets the 'gmp' and fails.

On my Mac OS X machine, I need to install the following items (beyond the normal
BSD tools):

gawk, git, mercurial, sed, tar and wget

--Mark


