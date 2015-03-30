Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9AA046013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 09:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2U9BQXt026693; Mon, 30 Mar 2015 10:11:26 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id q-dAfKQM1iaA; Mon, 30 Mar 2015 10:11:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2U9BDmj026689
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 30 Mar 2015 10:11:25 +0100
Message-ID: <1427706673.14020.246.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Date: Mon, 30 Mar 2015 10:11:13 +0100
In-Reply-To: <1427706018-1695-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1427706018-1695-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package_manager: Run createrepo sequentially
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
X-List-Received-Date: Mon, 30 Mar 2015 09:11:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-03-30 at 12:00 +0300, Ed Bartosh wrote:
> Running multiple createrepo in parallel can cause raice conditions
> when creating/accessing rpm database. Createrepo fails with the
> error "package_manager: rpmdb: BDB0060 PANIC: fatal region error detected"
> in such cases.
> 
> Running createrepo sequentially should fix the race as rpm database
> will not be accessed by multiple createrepo at the same time.
> 
> [YOCTO #6571]
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/lib/oe/package_manager.py | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index c9a8084..c956116 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -108,25 +108,22 @@ class RpmIndexer(Indexer):
>          archs = archs.union(set(sdk_pkg_archs))
>  
>          rpm_createrepo = bb.utils.which(os.getenv('PATH'), "createrepo")
> -        index_cmds = []
>          rpm_dirs_found = False
>          for arch in archs:
>              arch_dir = os.path.join(self.deploy_dir, arch)
>              if not os.path.isdir(arch_dir):
>                  continue
>  
> -            index_cmds.append("%s --update -q %s" % (rpm_createrepo, arch_dir))
> -
>              rpm_dirs_found = True
>  
> +            result = create_index("%s --update -q %s" % (rpm_createrepo, arch_dir))
> +            if result:
> +                bb.fatal(result)
> +
>          if not rpm_dirs_found:
>              bb.note("There are no packages in %s" % self.deploy_dir)
>              return
>  
> -        result = oe.utils.multiprocess_exec(index_cmds, create_index)
> -        if result:
> -            bb.fatal('%s' % ('\n'.join(result)))
> -
>  
>  class OpkgIndexer(Indexer):
>      def write_index(self):

Running these in parallel gives us a significant speed improvement.
Could we instead point them at separate directories for the RPM database
(within WORKDIR to address the previous issue too)?

Cheers,

Richard


