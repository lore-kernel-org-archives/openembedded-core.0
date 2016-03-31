Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 831F360797
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 10:31:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2VAVHEi019531
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 03:31:17 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 31 Mar 2016 03:31:16 -0700
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <56FCF6E3.7090109@windriver.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <56FCFC74.4080001@windriver.com>
Date: Thu, 31 Mar 2016 18:31:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56FCF6E3.7090109@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: aufs missing in kernel 4.4
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
X-List-Received-Date: Thu, 31 Mar 2016 10:31:19 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/31/2016 06:07 PM, Hongxu Jia wrote:
> Hi Bruce,
>
> In kernel 4.1, it supports aufs:
> http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-4.1/tree/fs/aufs?h=standard/base 
>
>
> But it does not exist in kernel 4.4:
> http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-4.4/tree/fs?h=standard/base 
>
>
> It caused ISO's rootfs is readonly.
>
> In meta/recipes-core/initrdscripts/files/init-live.sh:
> -----------------
> 174     elif grep -q -w "aufs" /proc/filesystems; then
> 175         union_fs_type="aufs"
> [snip]
> 204         "aufs")
> 205             mkdir -p /rootfs.ro /rootfs.rw
> 206             if ! mount -n --move $ROOT_MOUNT /rootfs.ro; then
> 207                 rm -rf /rootfs.ro /rootfs.rw
> 208                 fatal "Could not move rootfs mount point"
> 209             else
> 210                 mount -t tmpfs -o rw,noatime,mode=755 tmpfs 
> /rootfs.rw
> 211                 mount -t aufs -o 
> "dirs=/rootfs.rw=rw:/rootfs.ro=ro" aufs $ROOT_MOUNT
> 212                 mkdir -p $ROOT_MOUNT/rootfs.ro $ROOT_MOUNT/rootfs.rw
> 213                 mount --move /rootfs.ro $ROOT_MOUNT/rootfs.ro
> 214                 mount --move /rootfs.rw $ROOT_MOUNT/rootfs.rw
> 215             fi
> 216             ;;
> -----------------
>
> Would you please update kernel 4.4 to support aufs?

Or with Robert's patch in mailing list also could fix this issue.

[OE-core] [PATCH 1/1] linux-yocto 4.4: enable overlayfs

//Hongxu

>
> //Hongxu
>


