Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0F89B6013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 08:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2U8rxr4025293; Mon, 30 Mar 2015 09:53:59 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zPwSbK_gbitZ; Mon, 30 Mar 2015 09:53:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2U8riwJ025289
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 30 Mar 2015 09:53:55 +0100
Message-ID: <1427705624.14020.244.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Date: Mon, 30 Mar 2015 09:53:44 +0100
In-Reply-To: <1427704212-1179-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1427704212-1179-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rootfs.py: Remove rpm database from staging area
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
X-List-Received-Date: Mon, 30 Mar 2015 08:54:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-03-30 at 11:30 +0300, Ed Bartosh wrote:
> Rpm database in staging area is used only by createrepo.
> createrepo fails with the error
> "rpmdb: BDB0060 PANIC: fatal region error detected"
> if rpm database is broken from the previous run of createrepo.
> 
> Removing the databae before running createrepo can hopefully
> prevent this failure to happen.
> 
> [YOCTO #6571]
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/lib/oe/rootfs.py | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index 4e4e6eb..9f7dc65 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -306,6 +306,9 @@ class RpmRootfs(Rootfs):
>              bb.utils.remove(self.image_rootfs, True)
>          else:
>              self.pm.recovery_packaging_data()
> +        dbpath = os.path.join(self.d.getVar('STAGING_DIR_NATIVE', True),
> +                              'var/lib/rpm/*')
> +        bb.utils.remove(dbpath, recurse=True)
>          bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS', True), True)
>  
>          self.pm.crea

This patch helps me see the problem a lot. I'd never realised there was
an rpm database in the native sysroot that was getting corrupted, I'd
always assumed it was the target rootfs one.

I'm a little worried about what happens if you have multiple images
generating at the same time as this change as above may delete something
being worked on by another process.

I'm wondering why is it getting into the sysroot at all? Rather than
delete it here, could we either not generate it at all, or place it
somewhere in WORKDIR (so that other tasks can't see it or race against
it)?

Cheers,

Richard


