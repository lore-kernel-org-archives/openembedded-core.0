Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SWOUq-00038Y-IR
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 11:01:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4L8pWIc019873
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 01:51:33 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 21 May 2012 01:51:32 -0700
From: <xiaofeng.yan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 May 2012 16:51:29 +0800
Message-ID: <cover.1337589526.git.xiaofeng.yan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] ncurses: Avoid occasional builling failure when having parallel processable task
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
X-List-Received-Date: Mon, 21 May 2012 09:01:45 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

| tic: error while loading shared libraries: /srv/home/pokybuild \
/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/build/tmp/\
work/x86_64-linux/ncurses-native-5.9-r8.1/ncurses-5.9/narrowc/lib\
/libtinfo.so.5: file too short
| ? tic could not build /srv/home/pokybuild/yocto-autobuilder/\
yocto-slave/nightly-non-gpl3/build/build/tmp/work/x86_64-linux/\
ncurses-native-5.9-r8.1/image/srv/home/pokybuild/yocto-autobuilder\
/yocto-slave/nightly-non-gpl3/build/build/tmp/sysroots/x86_64-linux\
/usr/share/terminfo
| make[1]: *** [install.data] Error 1

This is a race issue which is caused by
install.libs and install.data:

1) install.data needs run tic
2) tic needs libtinfo.so
3) install.libs would regenerate libtinfo.so
4) but install.data doesn't depend on install.libs, and they can run
   parallelly

So there would be errors in a very critical condition: tic is begining
to run at the same time when install.libs is generating libtinfo.so, and
this libtinfo.so is not integrity, then there would be the  above error.

Let task install.libs run before install.data for fixing this bug.

The following changes since commit b4c8c74a45e386f99344cf9799eb5294ad6c9e3e:
  Joshua Lock (1):
        hob: update required pygtk to 2.22.0 and gtk+ to 2.20.0

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib xiaofeng/2298
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/2298

Xiaofeng Yan (1):
  ncurses: Avoid occasional builling failure when having parallel
    processable task

 meta/recipes-core/ncurses/ncurses.inc |   23 ++++++++++++++++++-----
 1 files changed, 18 insertions(+), 5 deletions(-)



