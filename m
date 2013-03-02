Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UBl2d-0004sf-BE for openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 12:55:52 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r22Bkqbg025641; Sat, 2 Mar 2013 11:46:52 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dHRd9+cHv3Ux; Sat,  2 Mar 2013 11:46:52 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r22Bkkg0025633
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sat, 2 Mar 2013 11:46:49 GMT
Message-ID: <1362224344.11004.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Sat, 02 Mar 2013 11:39:04 +0000
In-Reply-To: <cover.1362217827.git.liezhi.yang@windriver.com>
References: <cover.1362217827.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/2] Fully support ext3/ext4 rootfs generation
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
X-List-Received-Date: Sat, 02 Mar 2013 11:55:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-03-02 at 18:46 +0800, Robert Yang wrote:
> Replace genext2fs with populate-extfs.sh in image_types.bbclass to fully
> support ext3/ext4 rootfs.
> 
> Comments from Darren:
> We used genext2fs to create ext3/ext4 rootfs in the past, basically,
> genext2fs doesn't support creating ext4 filesystems. It creates, as I
> understand it, an ext2 filesystem, then adds a journal, and sets some
> bits. It can't support the newer features like extents. So what we end
> up with is a bit of a hack for a filesystem.
> 
> The ext tools (e2fsprogs) unfortunately don't provide an integrated
> solution for generating prepopulated filesystem images as many other
> mkfs* tools do. One thing missing was symlink support in libext2fs. I
> added that support and demonstrated a script which uses the e2fsprogs
> debugfs tool that can populate the newly formatted filesystem from a
> directory and without root privileges.
> 
> This patches integrate this stage of development into OE-Core. We can
> go about this in two ways. One is to just prototype this in a branch and
> use it to validate the functionality and not make any changes to oe-core
> image generation until mke2fs has initial directory support. The other
> is to merge this and get broader testing of the concept and later move
> to the full mke2fs implementation once it becomes available. I
> understand the resistance to the latter, but long term I think it will
> result in a more robust solution as we will have caught more of the
> corner cases and have been able to do a better job integrating into
> mke2fs the first time.
> 
> 
> * Impact:
>   + Rootfs generation time:
>     - For a core-image-minimal image, about more 3 seconds are needed
>     - For a core-image-sato image, about more 15 seconds are needed
> 
>   + Disk space usage:
>     - Nearly no changes:
>     $ ls -lh BEFORE.rootfs.ext3 AFTER.rootfs.ext3 | awk '{print $5"\t"$NF}'
>     357M BEFORE.rootfs.ext3
>     357M AFTER.rootfs.ext3
>     
>     $ du -sh BEFORE.rootfs.ext3 AFTER.rootfs.ext3
>     238M    BEFORE.rootfs.ext3
>     357M    AFTER.rootfs.ext3
>     # This is different because BEFORE.rootfs.ext3 has sparse files,
>     # they are very similar (less than 1M gap) after mount them and run
>     # "du -sh".

I can live with the performance issues however as I understand this
code, its breaking both sparse files and also likely hardlinked files.
I'm not sure we have many sparse ones but we do have packages with heavy
hardlinking (the sdk image toolchain packages for example).

Adding the script to e2fsprogs isn't a problem but I am tempted to wait
until this work is completed before we start using it instead of
genext2fs.

Cheers,

Richard




