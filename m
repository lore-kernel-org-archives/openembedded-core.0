Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BE48671A72
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 01:48:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v5N1mYnC001969
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Jun 2017 18:48:34 -0700 (PDT)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 22 Jun 2017 18:48:33 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1498120161.git.liezhi.yang@windriver.com>
	<8134a5ecf72045c33cdfc80a0b647aee7674035e.1498120161.git.liezhi.yang@windriver.com>
	<CADkTA4M7BXya=y=WgsBwAKahTwR1esPSv2u+Zz-wT_GhjgfQSw@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <4fddad5f-f731-9601-46f5-554126757532@windriver.com>
Date: Fri, 23 Jun 2017 09:48:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4M7BXya=y=WgsBwAKahTwR1esPSv2u+Zz-wT_GhjgfQSw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] runqemu: drop RPC ports
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
X-List-Received-Date: Fri, 23 Jun 2017 01:48:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/22/2017 11:07 PM, Bruce Ashfield wrote:
>
>
> On Thu, Jun 22, 2017 at 4:30 AM, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     The following commit has removed rpc ports from runqemu-export-rootfs, so
>     runqemu should also remove them, otherwise "runqemu nfs" doesn't work. And use
>     abspath for nfsroot, otherwise it doesn't work when it is a relative path.
>
>
> That change in question was discussed on list and was supposed to be optional.
>
> Can you confirm that a non-root user can still do a NFS root with both of these
> changes applied ?

The runqemu-export-rootfs uses UNFS, no root privilege is required, I can 
confirm that both "runqemu slirp nfs" and "runqemu nfs" work well, so I assume
the answer is yes.

// Robert

>
> Bruce
>
>
>     commit 6bb9860ef7ba9c84fe9bd3a81aa6555f67ebd38e
>     Author: Cody P Schafer <dev@codyps.com <mailto:dev@codyps.com>>
>     Date:   Tue Jun 6 18:30:49 2017 -0400
>
>         runqemu-export-rootfs: don't change RPC ports
>
>     [YOCTO #11687]
>
>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>>
>     ---
>      scripts/runqemu | 8 ++------
>      1 file changed, 2 insertions(+), 6 deletions(-)
>
>     diff --git a/scripts/runqemu b/scripts/runqemu
>     index 26328e5b512..41b870c9f7c 100755
>     --- a/scripts/runqemu
>     +++ b/scripts/runqemu
>     @@ -784,16 +784,12 @@ class BaseConfig(object):
>                  all_instances.sort(key=int)
>                  self.nfs_instance = int(all_instances.pop()) + 1
>
>     -        mountd_rpcport = 21111 + self.nfs_instance
>     -        nfsd_rpcport = 11111 + self.nfs_instance
>              nfsd_port = 3049 + 2 * self.nfs_instance
>              mountd_port = 3048 + 2 * self.nfs_instance
>
>              # Export vars for runqemu-export-rootfs
>              export_dict = {
>                  'NFS_INSTANCE': self.nfs_instance,
>     -            'MOUNTD_RPCPORT': mountd_rpcport,
>     -            'NFSD_RPCPORT': nfsd_rpcport,
>                  'NFSD_PORT': nfsd_port,
>                  'MOUNTD_PORT': mountd_port,
>              }
>     @@ -801,7 +797,7 @@ class BaseConfig(object):
>                  # Use '%s' since they are integers
>                  os.putenv(k, '%s' % v)
>
>     -
>     self.unfs_opts="nfsvers=3,port=%s,mountprog=%s,nfsprog=%s,udp,mountport=%s"
>     % (nfsd_port, mountd_rpcport, nfsd_rpcport, mountd_port)
>     +        self.unfs_opts="nfsvers=3,port=%s,udp,mountport=%s" % (nfsd_port,
>     mountd_port)
>
>              # Extract .tar.bz2 or .tar.bz <http://tar.bz> if no nfs dir
>              if not (self.rootfs and os.path.isdir(self.rootfs)):
>     @@ -1006,7 +1002,7 @@ class BaseConfig(object):
>
>              if self.fstype == 'nfs':
>                  self.rootfs_options = ''
>     -            k_root = '/dev/nfs nfsroot=%s:%s,%s' % (self.nfs_server,
>     self.rootfs, self.unfs_opts)
>     +            k_root = '/dev/nfs nfsroot=%s:%s,%s' % (self.nfs_server,
>     os.path.abspath(self.rootfs), self.unfs_opts)
>                  self.kernel_cmdline = 'root=%s rw highres=off' % k_root
>
>              if self.fstype == 'none':
>     --
>     2.11.0
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its
> end"

