Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3CC61724B9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 16:09:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t2VG9lF9011736
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 09:09:47 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.224.2; Tue, 31 Mar 2015 09:09:47 -0700
Message-ID: <551AC6CA.7030500@windriver.com>
Date: Tue, 31 Mar 2015 11:09:46 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1427759396-24932-1-git-send-email-ed.bartosh@linux.intel.com>
	<1427761001-25332-1-git-send-email-ed.bartosh@linux.intel.com>
In-Reply-To: <1427761001-25332-1-git-send-email-ed.bartosh@linux.intel.com>
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
X-List-Received-Date: Tue, 31 Mar 2015 16:09:47 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/30/15 7:16 PM, Ed Bartosh wrote:
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

I'd suggest that the dbpath be made arch specific.... this would eliminate any
serialization that may occur with even simple DB locks.

--dbpath %s/%s ....

--Mark

>  
>              rpm_dirs_found = True
>  
> 


