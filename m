Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1Qr5UF-0000px-Sd
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 11:54:08 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7A9naPU008219
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 02:49:36 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 10 Aug 2011 02:49:36 -0700
Message-ID: <cover.1312967662.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 10 Aug 2011 17:14:22 +0800
Date: Wed, 10 Aug 2011 17:49:38 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/1] rootfs_rpm: Fix bug 936
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
X-List-Received-Date: Wed, 10 Aug 2011 09:54:08 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

"update-alternatives" installed: one in /usr/sbin from chkconfig (symlinked to
"alternatives"), and the other in /usr/bin from update-alternatives-cworth. It
appears for whatever reason that the one from chkconfig is run during postinst
processing but if you run the script from the command line it gets the other
one; this is due to differences in the PATH environment variable.

The following is the sequence to call scripts after kernel booting
inittab
-->rcS
  -->./S40networking(PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin)
  -->S98configure(call rpm-postinstall)
     #"/usr/sbin" is found prior to "/usr/bin", so update-alternatives from chkconfig is run in this script
  -->rc5.d
  -->profile(profile:4:PATH="/usr/local/bin:/usr/bin:/bin"
             profile:15: PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin)
     #"/usr/bin/" is found prior to "/usr/sbin", so update-alternatives from update-alternatives-cworth is run in this script

So I remove the symlink for solving this problem. 

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/rootfs_rpm
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/rootfs_rpm

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (1):
  rootfs_rpm: Fix bug 936

 .../recipes-extended/chkconfig/chkconfig_1.3.52.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)



