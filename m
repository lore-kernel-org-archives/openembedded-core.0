Received: from mail.bmw-carit.de ([62.245.222.98] helo=linuxmail.bmw-carit.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas.bulwahn@oss.bmw-carit.de>) id 1TkxvD-0001nw-P4
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 15:13:30 +0100
Received: from AFplatform.bmw-carit.intra (afplatform.bmw-carit.intra
	[192.168.101.3])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id B35DA40283
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2012 14:22:15 +0100 (CET)
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 14:58:38 +0100
Message-Id: <1355839120-12142-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: git-send-email 1.7.9.5
Subject: python packages that are installed with easyinstall require an accumulated easyinstall.pth in the rootfs
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
X-List-Received-Date: Tue, 18 Dec 2012 14:13:30 -0000

Hi all,

here are two very preliminary patches addressing an issue with python's easyinstall.

When installing python packages that are installed with python's easyinstall, the installation creates easyinstall.pth files. This file must exist in the root filesystem so that python 2.7 can locate and import the installed modules in the host system.

As I am still a novice writing recipes, I do not know the best practice to handle the issue above.
I have a first implementation that
  - uses a new class easyinstall
  - creates the easyinstall.pth if it did not exists or adds the entry in postinst script of the package
  - and requires the user to manually state what must be added

The related useradd recipe makes the impression that there are many further problems to think of that I am not aware of yet.
Is the postinst script of the package the correct place to write the easyinstall.pth file or is there possibly a better hook to use?

Probably, it would be best if what must be added is automatically extracted after the installation of the python module, and this routine is completely added to distutils class?

Undoubtedly the patch is only a very preliminary try addressing this issue with easyinstall.pth, but I wanted to get some feedback first.

Thank you for further help and advice.

Lukas



