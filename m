Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 993086FF73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 16:10:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v4VGAYSX008469
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 09:10:34 -0700
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 31 May 2017 09:10:33 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20170530211436.16397-1-dev@codyps.com>
	<CAPoQQ-1uznmcUSkXs3iLYyK-Bm8gDaT5de_Bi-jF4Su6+KjKvw@mail.gmail.com>
	<CADkTA4MoY27QPks7oJVP-tfs1+Yr1yY9StmXToNT5Rrs9mYJAA@mail.gmail.com>
	<CAPoQQ-00id+nBQ1_n=b=7RNrixOxPZb_5puOvCFmOspQB=O3rw@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <7bed8363-bd79-0233-3e91-1a74f26fca37@windriver.com>
Date: Wed, 31 May 2017 11:10:32 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAPoQQ-00id+nBQ1_n=b=7RNrixOxPZb_5puOvCFmOspQB=O3rw@mail.gmail.com>
Subject: Re: [PATCH] runqemu-export-rootfs: don't change RPC ports
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
X-List-Received-Date: Wed, 31 May 2017 16:10:33 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/31/17 11:07 AM, Cody P Schafer wrote:
>> There's a patch that we've had for years to allow alternate RPC ports
>> to work with userspace NFS and co-exist with existing NFS servers.
> 
> Ah, I see (I should have checked that sooner). "NFS: allow nfs root
> mount to use alternate rpc ports". I can likely just pull that into my
> kernel and have things work fine without changes to
> runqemu-export-rootfs.
> 
>> This would have an impact on that functionality, so if we do need to
>> change those ports, the existing ones should be maintained with some
>> sort of option to change the nfsroot line.
> 
> Yep, that makes sense.
> 
> That said: it isn't completely clear to me that a seperate rpc program
> number (aka RPC port) is needed to avoid conflicts between 2 nfs
> instances in this case:
> 
>  - we don't have unfsd register with rpcbind (-p option), so the rpc
> program numbers won't conflict there.
>  - using nfsroot implicitly adds the 'nolock' option, so there isn't a
> conflict there
>  - I did my tests with the nfs kernel server running. There wasn't an
> immdiate issue observed with mounting and accessing both a kernel
> provided export & a unfsd provided export (using
> runqemu-export-rootfs) at the same time.
> 
> Still, I'm not too familiar with all of the ins and outs of nfs. Is
> there somewhere I've overlooked where the program numbers could
> conflict?
> 

Non-root user can't create privileged ports.

Multiple nfs-servers and/or developers on the same machine could end up with
port conflicts, so we need to make sure the ports can 'change'.

Of course running this on a machine that has a traditional NFS server will also
cause a conflict.   The various rpmbind and other options may reduce the
likelihood of a conflict -- but they can still occur.  It's better to use unique
port information on a per-use basis to avoid any potential conflicts or
privileged port requirements.

--Mark

