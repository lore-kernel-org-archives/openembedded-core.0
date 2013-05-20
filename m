Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UeSzm-00056W-08
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 18:32:10 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4KGDEao029766
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 09:13:14 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 20 May 2013 09:13:12 -0700
Message-ID: <519A4B9E.30305@windriver.com>
Date: Mon, 20 May 2013 11:13:18 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CANyK_8eXDE0PFgtzrBdXw3=eXrn5H_hdZ6ivVj4+TRQbnC1+eg@mail.gmail.com>
In-Reply-To: <CANyK_8eXDE0PFgtzrBdXw3=eXrn5H_hdZ6ivVj4+TRQbnC1+eg@mail.gmail.com>
Subject: Re: Clashing man pages
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
X-List-Received-Date: Mon, 20 May 2013 16:32:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/13 7:00 AM, Paul Barker wrote:
> I'm generating a rootfs image which I intend to be usable
> interactively so I've added IMAGE_FEATURES += "doc-pkgs" to my image
> recipe. do_rootfs fails with the following clashes:
>
> |  * check_data_file_clashes: Package ncurses-doc wants to install
> file /home/pbarker/build/20130518_wych/build/tmp/work/qemuarm-wych-linux-gnueabi/wych-image-full/1.0-r0/rootfs/usr/share/man/man1/reset.1
> | But that file is already provided by package  * util-linux-doc
> |  * opkg_install_cmd: Cannot install package ncurses-doc.
> |  * check_data_file_clashes: Package coreutils-doc wants to install
> file /home/pbarker/build/20130518_wych/build/tmp/work/qemuarm-wych-linux-gnueabi/wych-image-full/1.0-r0/rootfs/usr/share/man/man1/kill.1
> | But that file is already provided by package  * util-linux-doc
> |  * opkg_install_cmd: Cannot install package coreutils-doc.
> |  * check_data_file_clashes: Package shadow-doc wants to install file
> /home/pbarker/build/20130518_wych/build/tmp/work/qemuarm-wych-linux-gnueabi/wych-image-full/1.0-r0/rootfs/usr/share/man/man5/passwd.5
> | But that file is already provided by package  * man-pages
> |  * check_data_file_clashes: Package shadow-doc wants to install file
> /home/pbarker/build/20130518_wych/build/tmp/work/qemuarm-wych-linux-gnueabi/wych-image-full/1.0-r0/rootfs/usr/share/man/man3/getspnam.3
> | But that file is already provided by package  * man-pages
> |  * opkg_install_cmd: Cannot install package shadow-doc.
>
> I've explicitly said I want coreutils and man-pages, the rest is being
> pulled in implicitly as dependencies of something. There's nothing in
> qa.log or the bitbake output to suggest that installed files are
> clashing so I'm not sure if this could have been reported earlier.
>
> The best fix I can think of at the minute is to add a bbappend to my
> layer which removes the clashing man pages from one of the packages in
> each case, leaving the files just in the package I do want to take
> precedence. If anyone has any better ideas let me know.
>
> I know we have update-alternatives for executables but is there a way
> to link this with the relevant man page? So for example when I select
> kill from coreutils, kill.1 is provided by coreutils as well, when I
> select kill from util-linux, kill.1 is provided by util-linux as well.

What we have advocated is the update-alternatives approach.  When the levels are 
set the same for the docs as the primary components (and renaming as well) then 
it makes the system much easier to deal with.

I.e. if you have:

kill.busybox
kill.coreutils
kill.util-linux

I want to be able to try man on each of those names, as well as 'kill' and get 
the right man page.

Also, with the RPM package manager, if the contents of the two files are the 
same no conflict is generated.  I don't know in this case if that is true or 
not.  But that could be an alternative approach for some of these packages -- 
ensure the files are the same and use RPM (or adapt ipk to compare file contents 
before reporting a conflict.)

--Mark


> --
> Paul Barker
>
> Email: paul@paulbarker.me.uk
> http://www.paulbarker.me.uk
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



