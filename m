Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 27AB9724DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 12:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2VC6NW9011621; Tue, 31 Mar 2015 13:06:23 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ITQQpe3VkksL; Tue, 31 Mar 2015 13:06:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2VC6AS7011598
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 31 Mar 2015 13:06:22 +0100
Message-ID: <1427803570.14020.356.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Date: Tue, 31 Mar 2015 13:06:10 +0100
In-Reply-To: <1427761001-25332-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1427759396-24932-1-git-send-email-ed.bartosh@linux.intel.com>
	<1427761001-25332-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package_manager: call createrepo with --dbpath pointing inside WORKDIR
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
X-List-Received-Date: Tue, 31 Mar 2015 12:06:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-03-31 at 03:16 +0300, Ed Bartosh wrote:
> Rpm database in staging area is used only by createrepo.
> createrepo fails with the error
> "rpmdb: BDB0060 PANIC: fatal region error detected"
> if rpm database is broken during previous run of createrepo.
> 
> Made createrepo to create rpm db in $WORKDIR/rpmdb/ from scratch
> for every build. This should potentially fix the failure.
> 
> [YOCTO #6571]
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/lib/oe/package_manager.py | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index 743c7cb..2461acd 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -110,12 +110,16 @@ class RpmIndexer(Indexer):
>          rpm_createrepo = bb.utils.which(os.getenv('PATH'), "createrepo")
>          index_cmds = []
>          rpm_dirs_found = False
> +        dbpath = os.path.join(self.d.getVar('WORKDIR', True), 'rpmdb')
> +        if os.path.exists(dbpath):
> +            bb.utils.remove(dbpath, True)
>          for arch in archs:
>              arch_dir = os.path.join(self.deploy_dir, arch)
>              if not os.path.isdir(arch_dir):
>                  continue
>  
> -            index_cmds.append("%s --update -q %s" % (rpm_createrepo, arch_dir))
> +            index_cmds.append("%s --dbpath %s --update -q %s" % \
> +                             (rpm_createrepo, dbpath, arch_dir))
>  
>              rpm_dirs_found = True

Do we need to add arch to dbpath here to avoid races between the
separate createrepo processes?

Cheers,

Richard



