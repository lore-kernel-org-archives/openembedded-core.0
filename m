Received: from atl4mhfb01.myregisteredsite.com ([209.17.115.55])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1UD9eo-0008QF-Ls
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 09:25:04 +0100
Received: from atl4mhob14.myregisteredsite.com
	(atl4mhob14.myregisteredsite.com [209.17.115.52])
	by atl4mhfb01.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r2688X4s032115 for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Mar 2013 03:08:34 -0500
Received: from mailpod.hostingplatform.com (mail.networksolutionsemail.com
	[205.178.146.50])
	by atl4mhob14.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r2688Vxs021100 for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Mar 2013 03:08:31 -0500
Received: (qmail 2172 invoked by uid 0); 6 Mar 2013 08:08:31 -0000
Received: from unknown (HELO ?10.0.0.14?)
	(mike@milosoftware.com@85.150.144.104)
	by 0 with ESMTPA; 6 Mar 2013 08:08:31 -0000
Message-ID: <5136F97E.1030906@topic.nl>
Date: Wed, 06 Mar 2013 09:08:30 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <20130228231551.3998F5022B@opal> <20130306062358.GC14869@jama>
In-Reply-To: <20130306062358.GC14869@jama>
Subject: Re: [oe-commits] MiLo : util-linux: Add package for libmount
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
X-List-Received-Date: Wed, 06 Mar 2013 08:25:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2013 07:23 AM, Martin Jansa wrote:
> On Thu, Feb 28, 2013 at 11:15:51PM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 2e79110e31da940728d42411cad3d019d570fc31
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=2e79110e31da940728d42411cad3d019d570fc31
>>
>> Author: MiLo <milo-software@users.sourceforge.net>
>> Date:   Tue Feb 19 18:23:15 2013 +0100
>>
>> util-linux: Add package for libmount
>>
>> The libmount shared library was part of util-linux. This caused
>> util-linux-mount to RDEPEND on util-linux, so including that would
>> also drag in all of util-linux and all its recommendations.
>>
>> To break this circular dependency, add a libmount package that holds
>> the libmount.so.* files, just like the other libraries built by util-
>> linux.
>
> Breaks upgrade path:
>
>   * check_data_file_clashes: Package libmount1 wants to install file
>   * /lib/libmount.so.1.1.0
>          But that file is already provided by package  * util-linux
>   * check_data_file_clashes: Package libmount1 wants to install file
>   * /lib/libmount.so.1
>          But that file is already provided by package  * util-linux
>
> RREPLACES is probably needed.

Indeed, I can reproduce that too. But I'm not sure how to fix this, as I 
cannot bluntly claim that libmount replaces util-linux, because it 
really doesn't. So RREPLACES_util-linux-libmount = "util-linux" is 
probably not the way to go here. Or is it? It does not "feel" right 
anyway, because the old situation should have never happened.

Prior to the libmount patch, it was not possible to remove util-linux 
from any system that installed util-linux-mount (or any other that 
requires libmount), without applying "force". And util-linux itself 
depends on packages that in turn depend on util-linux. That's the circle 
I wanted to break out of.

How does one properly inform opkg that a file has moved from one 
(installed) package to another?



>>
>> Signed-off-by: MiLo <milo-software@users.sourceforge.net>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>
>> ---
>>
>>   meta/recipes-core/util-linux/util-linux.inc       |    3 +++
>>   meta/recipes-core/util-linux/util-linux_2.22.2.bb |    2 +-
>>   2 files changed, 4 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
>> index 10439c0..bd7b089 100644
>> --- a/meta/recipes-core/util-linux/util-linux.inc
>> +++ b/meta/recipes-core/util-linux/util-linux.inc
>> @@ -31,6 +31,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
>>   PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
>>                util-linux-swaponoff util-linux-losetup util-linux-umount \
>>                util-linux-mount util-linux-readprofile util-linux-libblkid \
>> +             util-linux-libmount util-linux-libmount-dev \
>>                util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
>>                util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
>>                util-linux-mkfs util-linux-mcookie util-linux-reset"
>> @@ -64,6 +65,8 @@ FILES_util-linux-reset = "${base_bindir}/reset"
>>
>>   FILES_util-linux-libblkid = "${base_libdir}/libblkid.so.*"
>>   FILES_util-linux-libblkid-dev = "${base_libdir}/libblkid.so ${base_libdir}/libblkid.la ${includedir}/blkid ${libdir}/pkgconfig/blkid.pc"
>> +FILES_util-linux-libmount = "${base_libdir}/libmount.so.*"
>> +FILES_util-linux-libmount-dev = "${base_libdir}/libmount.so ${base_libdir}/libmount.la ${includedir}/libmount ${libdir}/pkgconfig/mount.pc"
>>   FILES_util-linux-libuuid = "${base_libdir}/libuuid.so.*"
>>   FILES_util-linux-libuuid-dev = "${base_libdir}/libuuid.so ${base_libdir}/libuuid.la ${includedir}/uuid ${libdir}/pkgconfig/uuid.pc"
>>   FILES_util-linux-lscpu = "${bindir}/lscpu"
>> diff --git a/meta/recipes-core/util-linux/util-linux_2.22.2.bb b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
>> index dd95573..f91784b 100644
>> --- a/meta/recipes-core/util-linux/util-linux_2.22.2.bb
>> +++ b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
>> @@ -1,5 +1,5 @@
>>   MAJOR_VERSION = "2.22"
>> -PR = "r0"
>> +PR = "r1"
>>   require util-linux.inc
>>
>>   # note that `lscpu' is under GPLv3+
>>
>>
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>


-- 
Mike Looijmans - Topic Automation


