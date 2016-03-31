Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B85F760722
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 10:07:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2VA7X3I028291
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 03:07:33 -0700
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 31 Mar 2016 03:07:32 -0700
To: Bruce Ashfield <bruce.ashfield@windriver.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <56FCF6E3.7090109@windriver.com>
Date: Thu, 31 Mar 2016 18:07:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: aufs missing in kernel 4.4
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
X-List-Received-Date: Thu, 31 Mar 2016 10:07:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bruce,

In kernel 4.1, it supports aufs:
http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-4.1/tree/fs/aufs?h=standard/base

But it does not exist in kernel 4.4:
http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-4.4/tree/fs?h=standard/base

It caused ISO's rootfs is readonly.

In meta/recipes-core/initrdscripts/files/init-live.sh:
-----------------
174     elif grep -q -w "aufs" /proc/filesystems; then
175         union_fs_type="aufs"
[snip]
204         "aufs")
205             mkdir -p /rootfs.ro /rootfs.rw
206             if ! mount -n --move $ROOT_MOUNT /rootfs.ro; then
207                 rm -rf /rootfs.ro /rootfs.rw
208                 fatal "Could not move rootfs mount point"
209             else
210                 mount -t tmpfs -o rw,noatime,mode=755 tmpfs /rootfs.rw
211                 mount -t aufs -o "dirs=/rootfs.rw=rw:/rootfs.ro=ro" 
aufs $ROOT_MOUNT
212                 mkdir -p $ROOT_MOUNT/rootfs.ro $ROOT_MOUNT/rootfs.rw
213                 mount --move /rootfs.ro $ROOT_MOUNT/rootfs.ro
214                 mount --move /rootfs.rw $ROOT_MOUNT/rootfs.rw
215             fi
216             ;;
-----------------

Would you please update kernel 4.4 to support aufs?

//Hongxu


