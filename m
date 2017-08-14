Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EAC7C71AD6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 10:38:22 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7EAcI0B026433
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 14 Aug 2017 11:38:19 +0100
Message-ID: <1502707098.13978.3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Aug 2017 11:38:18 +0100
In-Reply-To: <CAHiDW_EycsMUfCykDicgHuVzykCT0YYQHE9EY8i6yFqJsbbSJQ@mail.gmail.com>
References: <CAHiDW_EycsMUfCykDicgHuVzykCT0YYQHE9EY8i6yFqJsbbSJQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 14 Aug 2017 11:38:20 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: native sysroot race with rpmbuild
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
X-List-Received-Date: Mon, 14 Aug 2017 10:38:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-08-14 at 11:33 +0300, Jussi Kukkonen wrote:
> I'm seeing lots of this failure in my last build:
> 
> | DEBUG: PKGWRITEDIR: /mnt/extra-ssd/tmp/work/all-poky-linux/adwaita-
> icon-theme/3.24.0-r0/deploy-rpms/noarch
> | DEBUG: SITE files ['endian-little', 'bit-32', 'common-linux',
> 'common-glibc', 'allarch-linux', 'common']
> | DEBUG: Executing shell function BUILDSPEC
> | /mnt/extra-ssd/tmp/work/all-poky-linux/adwaita-icon-theme/3.24.0-
> r0/recipe-sysroot-native/usr/bin/rpmbuild: error while loading shared
> libraries: libdw.so.1: cannot open shared object file: No such file
> or directory
> | WARNING: exit code 127 from a shell command.
> | DEBUG: Python function do_package_rpm finished
> | DEBUG: Python function do_package_write_rpm finished
> | ERROR: Function failed: BUILDSPEC (log file is located at
> /mnt/extra-ssd/tmp/work/all-poky-linux/adwaita-icon-theme/3.24.0-
> r0/temp/log.do_package_write_rpm.21827)
> ERROR: Task (/home/jku/src/poky/meta/recipes-gnome/gnome/adwaita-
> icon-theme_3.24.0.bb:do_package_write_rpm) failed with exit code '1'
> 
> * libdw.so.1 isn't found when rpmbuild runs
> * seems to be a race as the library is there when I check (and
> building again works)
> * Seems to mostly happen with allarch recipes (maybe they're just
> fast enough): sysvinit-inittab, adwaita, xcursor-transparent-theme,
> iso-codes
> 
> Any ideas?

Could you tar up /mnt/extra-ssd/tmp/work/all-poky-linux/adwaita-icon-
theme/3.24.0-r0/temp/log* and share somewhere please?

Not sure what is going on there, it seems odd :( What other tasks were
running when this happened?

I had a go at reproducing this locally but couldn't.

Cheers,

Richard

