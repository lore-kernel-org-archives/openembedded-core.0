Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 96E8B6AC3D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 21:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t66LVUIT027844; Mon, 6 Jul 2015 22:31:30 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CkJZssMVdnaR; Mon,  6 Jul 2015 22:31:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t66LVFpM027827
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 6 Jul 2015 22:31:26 +0100
Message-ID: <1436218275.27597.136.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 06 Jul 2015 22:31:15 +0100
In-Reply-To: <CAP9ODKrJtfUJhjk1b9XbphqAdRFoL6Eu1EmrSOG8Hu8_84H0rQ@mail.gmail.com>
References: <cover.1436177709.git.alejandro.hernandez@linux.intel.com>
	<41e68bf09d809269524babaae2911a7c41e38351.1436177709.git.alejandro.hernandez@linux.intel.com>
	<20150706201018.GD2436@jama> <559AEEAC.8080005@linux.intel.com>
	<559AF033.6090904@mlbassoc.com>
	<CAP9ODKrJtfUJhjk1b9XbphqAdRFoL6Eu1EmrSOG8Hu8_84H0rQ@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Gary Thomas <gary@mlbassoc.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] opkg-build: Ignore tar error due to hardlinks issue when creating ipk files
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
X-List-Received-Date: Mon, 06 Jul 2015 21:31:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-07-06 at 18:20 -0300, Otavio Salvador wrote:
> Hello,
> 
> On Mon, Jul 6, 2015 at 6:16 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> > On 2015-07-06 15:10, Alejandro Hernandez wrote:
> >>
> >> On 06/07/15 15:10, Martin Jansa wrote:
> >>>
> >>> On Mon, Jul 06, 2015 at 10:17:19AM +0000, Alejandro Hernandez wrote:
> >>>
> >>> +
> >>> +This a similar behavior to the one on dpkg:
> >>>
> >>> +http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=40731942515ec8d80c727ad561174986d4f05818
> >>> +
> >>> +Upsteam-Status: Inappropriate
> >>> Typo and why is it inappropriate? Looks like bugfix to me, even for
> >>> issue which usually happens in OE way of using opkg-build.
> >>
> >>
> >> It seemed inappropriate to me, since this behavior is not expected (number
> >> of hardlinks changing), we can't say for sure that this error will be caused
> >> by this reason on when using
> >> opkg on another environment
> >>>
> >>> -SRC_URI = "git://git.yoctoproject.org/opkg-utils"
> >>> +SRC_URI = "git://git.yoctoproject.org/opkg-utils "
> >>> +
> >>> +SRC_URI_append_class-native = "file://tar_ignore_error.patch"
> >>> Add leading space in append not in original SRC_URI variable.
> >>>
> >>> Why is it applied only for native anyway?
> >>
> >>
> >> Same argument as before, modifying the number of hardlinks while the tar
> >> is created happens when building using bitbake, which should not happen on
> >> target, if files changed when
> >> creating an ipk for any other reason it shouldn't be ignored; space was a
> >> typo
> >
> >
> > Why is it happening when using bitbake?  This seems like an
> > error to me - one should not be generating the tarball (i.e.
> > packing up the final results) if the set of files being packaged
> > is changing in any way.
> >
> > Note: I'm pretty sure that error can also happen if the inode
> > changes in many different ways, not just the number of links
> > changing.
> 
> I fully agree with Gary; this also makes unreproducible the number of
> shared hard links in a final rootfs which is also important.
> 
> This (and dpkg related patch) seems to be covering the real bug.
> 
> (Adding Richard so he can also comment on this and to bring his
> attention to the concerns exposed here)

The issue here is some of the attempts to decrease disk usage and
increase the build speed. To do that we hardlink files in the package
directories rather than create individual copies in packages/ and
package-split/. There are cases where other parts of the build (e.g.
populate-sysroot) can create or remote copies of the hardlinked file
which changes the link count.

The files themselves do not change, only the link does and then only
rarely. We fixed dpkg a while ago for this issue, this is the same fix
being applied to opkg-build. The resulting packages will be the same
since the hardlink count is internal to the tarball and not related to
the number of original file copies. Since we control the build env, it
is safe to do what we're doing here, however I would agree with
Alejandro that it isn't something upstream would want to do.

Cheers,

Richard




