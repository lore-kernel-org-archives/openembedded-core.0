Received: from mail-vc0-f169.google.com ([209.85.220.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1Ue2Zr-0006e8-3W
	for openembedded-core@lists.openembedded.org;
	Sun, 19 May 2013 14:19:05 +0200
Received: by mail-vc0-f169.google.com with SMTP id kw10so4742146vcb.28
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2013 05:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:from:date:x-google-sender-auth
	:message-id:subject:to:content-type;
	bh=pLv+cTEULVwkZaHDU2hg46SBNiTZQA6aZdKLsJ7O6fI=;
	b=uJLf5lAYRVP+uvhgeSf1KGd/ytQuVxoUBc22t/c5GTm9ghfouwdFmhlJgCn5i47Xbe
	MYtQ5RL5GPgZMPQ/2LHlW0MrxOTEoX1AJvq9Tc+gqkXoffTD/uBN9ub/2uPPQtLeXQRz
	KKVl8pS14OEN/h3WbS0yFxNNikq+manJXJuz1goYQDs+Si9jFD7tF2J++3sN0vkuX+Z0
	w1f+TXp2j8oRChFjkoF66znWnZoIuC8Smet7Pmn7KcjpIe+FrmhEyXoZI7Y7CHGPxLLI
	uJlY4vgU726wex5UnEQ6rLPiJcx+jUJZ43QWWhKz3tIfOdiRZGL7HXcBICpMPO9xjerl
	81Qw==
X-Received: by 10.58.243.102 with SMTP id wx6mr23067791vec.26.1368964844156;
	Sun, 19 May 2013 05:00:44 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.48.5 with HTTP; Sun, 19 May 2013 05:00:24 -0700 (PDT)
From: Paul Barker <paul@paulbarker.me.uk>
Date: Sun, 19 May 2013 13:00:24 +0100
X-Google-Sender-Auth: mU8fA47vR28V-Mhwq1NkzCeCdOE
Message-ID: <CANyK_8eXDE0PFgtzrBdXw3=eXrn5H_hdZ6ivVj4+TRQbnC1+eg@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Clashing man pages
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
X-List-Received-Date: Sun, 19 May 2013 12:19:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm generating a rootfs image which I intend to be usable
interactively so I've added IMAGE_FEATURES += "doc-pkgs" to my image
recipe. do_rootfs fails with the following clashes:

|  * check_data_file_clashes: Package ncurses-doc wants to install
file /home/pbarker/build/20130518_wych/build/tmp/work/qemuarm-wych-linux-gnueabi/wych-image-full/1.0-r0/rootfs/usr/share/man/man1/reset.1
| But that file is already provided by package  * util-linux-doc
|  * opkg_install_cmd: Cannot install package ncurses-doc.
|  * check_data_file_clashes: Package coreutils-doc wants to install
file /home/pbarker/build/20130518_wych/build/tmp/work/qemuarm-wych-linux-gnueabi/wych-image-full/1.0-r0/rootfs/usr/share/man/man1/kill.1
| But that file is already provided by package  * util-linux-doc
|  * opkg_install_cmd: Cannot install package coreutils-doc.
|  * check_data_file_clashes: Package shadow-doc wants to install file
/home/pbarker/build/20130518_wych/build/tmp/work/qemuarm-wych-linux-gnueabi/wych-image-full/1.0-r0/rootfs/usr/share/man/man5/passwd.5
| But that file is already provided by package  * man-pages
|  * check_data_file_clashes: Package shadow-doc wants to install file
/home/pbarker/build/20130518_wych/build/tmp/work/qemuarm-wych-linux-gnueabi/wych-image-full/1.0-r0/rootfs/usr/share/man/man3/getspnam.3
| But that file is already provided by package  * man-pages
|  * opkg_install_cmd: Cannot install package shadow-doc.

I've explicitly said I want coreutils and man-pages, the rest is being
pulled in implicitly as dependencies of something. There's nothing in
qa.log or the bitbake output to suggest that installed files are
clashing so I'm not sure if this could have been reported earlier.

The best fix I can think of at the minute is to add a bbappend to my
layer which removes the clashing man pages from one of the packages in
each case, leaving the files just in the package I do want to take
precedence. If anyone has any better ideas let me know.

I know we have update-alternatives for executables but is there a way
to link this with the relevant man page? So for example when I select
kill from coreutils, kill.1 is provided by coreutils as well, when I
select kill from util-linux, kill.1 is provided by util-linux as well.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


