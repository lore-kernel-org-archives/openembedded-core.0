Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SohSh-0000pZ-9K
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 22:55:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6AKhwvS022099
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Jul 2012 13:43:58 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 10 Jul 2012 13:43:58 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <yocto@yoctoproject.org>, <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2012 15:54:37 -0500
Message-ID: <cover.1341953258.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: RFC: [PATCH 0/1] Build system/SDK/ADT differ in toolchain config
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
X-List-Received-Date: Tue, 10 Jul 2012 20:55:11 -0000
Content-Type: text/plain

(Yes this is intentionally cross posted to both the Yocto Project list and the
oe-core list.  The code affects the generated SDK, as well as potentially
ADT imported SDKs... so both sides need to be verified and commented on to
say if this is a reasonable change.)

The problem we found is that if you have a tune that specifies a
TUNE_LDARGS in such as "-m elf_x86_64", it was being added to the LDFLAGS in
the environment script.  When you went to run configure, the LDFLAGS were
loaded, but 'gcc' was used as ld.  Causing -m elf_x86_64 to spit out an error
that it was invalid..

Comparing the build system to the SDK/ADT export, it was clear that the
TUNE_*ARGS were being passed directly on the CC, LD, CXX, AS, etc lines
and not as part of their "optional" arguments.  The change in question
syncs up the build system and the SDK/ADT exports to be the same, ensuring
that CC= is the same within and externally to the build system.

I tested that the following works:

${CC} hello.c -o hello

make CC="${CC}"  (note the " is important!)

./configure ....
make

What I did -not- test was the ADT Installer/import tooling into eclipse or
any other frameworks.

The following changes since commit ce37c45abb4cf43e5009867f695982de2eb33450:

  subversion: do_install failed (parallel issue) (2012-07-10 20:34:41 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/sdk
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/sdk

Mark Hatle (1):
  toolchain-scripts: Sync the SDK/ADT values to the build system

 meta/classes/toolchain-scripts.bbclass |   63 +++++++++++++++++++++++---------
 1 files changed, 45 insertions(+), 18 deletions(-)

-- 
1.7.3.4



