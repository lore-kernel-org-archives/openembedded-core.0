Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1Tv1fz-0001G6-IR
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 09:15:23 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0F7GVUU021252
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2013 23:16:32 -0800 (PST)
Received: from jesse-wrs-desktop.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 14 Jan 2013 23:16:30 -0800
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jan 2013 15:16:47 +0800
Message-ID: <1358234208-6177-1-git-send-email-sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
Subject: [PATCH] coreutils: remove dependency on coreutils-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jan 2013 08:15:24 -0000
Content-Type: text/plain

Hi,

In builds that exclude GPLv3 packages, such errors will frequently appear:

    make[6]: execvp: rm: Text file busy
Or
    libtool: ...tmp/sysroots/x86_64-linux//bin/mv: Text file busy

And some others in various forms.

It's caused by coreutils-6.9's dependency on coreutils-native, which overrides
host commands and causes these ETXTBSY errors in parallel builds.

This dependency doesn't seem to be necessary, and the GPLv3 recipe doesn't have
it either.

It's also possible to use ASSUME_PROVIDED to exclude coreutils-native, but I
think this might be better.

Jesse Zhang (1):
  coreutils: remove dependency on coreutils-native

 meta/recipes-core/coreutils/coreutils_6.9.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
1.7.11.7



