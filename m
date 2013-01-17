Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TvuMT-0006dj-5H
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 19:38:52 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2013 10:23:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,486,1355126400"; d="scan'208";a="245199551"
Received: from unknown (HELO [10.252.123.149]) ([10.252.123.149])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2013 10:23:23 -0800
Message-ID: <50F8419A.5000500@intel.com>
Date: Thu, 17 Jan 2013 20:23:22 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <20130116125428.8B76B1036C@opal> <20130117174412.GL3067@jama>
In-Reply-To: <20130117174412.GL3067@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Laurentiu Palcu : update-rc.d: check also that symlinks are valid
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
X-List-Received-Date: Thu, 17 Jan 2013 18:38:52 -0000
X-List-Received-Date: Thu, 17 Jan 2013 18:38:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/17/2013 07:44 PM, Martin Jansa wrote:
> On Wed, Jan 16, 2013 at 12:54:28PM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 4b63e73422ea25aba1bde0beddb02bc04948e13c
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=4b63e73422ea25aba1bde0beddb02bc04948e13c
>>
>> Author: Laurentiu Palcu <laurentiu.palcu@intel.com>
>> Date:   Wed Jan 16 13:58:55 2013 +0200
>>
>> update-rc.d: check also that symlinks are valid
>>
> 
> now every update-rc.d call on target fails with
> /usr/sbin/update-rc.d: line 151: [: argument expected
Addressed. Sent a patch for that. I guess I never tested when root was
not set... :(

Thanks,
Laurentiu
> 
>> Running:
>>
>> update-rc.d -r /path/to/target/rootfs basename defaults
>>
>> at do_rootfs time in package postinstall stage, when
>> /path/to/target/rootfs/etc/init.d/basename is a symlink and points to some path
>> on target (for example: /etc/init.d/basename.some_package), would fail and the
>> postinstall execution would be postponed for first boot, on target.
>>
>> This patch adds the posibility to verify whether the file the symlink
>> points to actually exists in the target rootfs.
>>
>> [YOCTO #3716]
>>
>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> ---
>>
>>  .../update-rc.d/check-if-symlinks-are-valid.patch  |   53 ++++++++++++++++++++
>>  meta/recipes-core/update-rc.d/update-rc.d_0.7.bb   |    6 ++-
>>  2 files changed, 57 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/update-rc.d/update-rc.d/check-if-symlinks-are-valid.patch b/meta/recipes-core/update-rc.d/update-rc.d/check-if-symlinks-are-valid.patch
>> new file mode 100644
>> index 0000000..4476e91
>> --- /dev/null
>> +++ b/meta/recipes-core/update-rc.d/update-rc.d/check-if-symlinks-are-valid.patch
>> @@ -0,0 +1,53 @@
>> +Check if symlinks are valid
>> +
>> +When using root option and $initd/$bn is a symlink, the script would fail because
>> +the symlink points to a path on target. For example:
>> +
>> +/path/to/target/rootfs/etc/init.d/syslog -> /etc/init.d/syslog.busybox
>> +
>> +Hence, [ -f /path/to/target/rootfs/etc/init.d/syslog ] condition would return
>> +false.
>> +
>> +This patch adds the posibility to check whether the file the symlink points to
>> +actually exists in rootfs path and then continue.
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com> 
>> +
>> +Index: git/update-rc.d
>> +===================================================================
>> +--- git.orig/update-rc.d	2013-01-16 12:12:58.349814356 +0200
>> ++++ git/update-rc.d	2013-01-16 13:02:42.490864939 +0200
>> +@@ -147,13 +147,29 @@
>> + bn=$1
>> + shift
>> + 
>> ++sn=$initd/$bn
>> ++if [ -L "$sn" -a -n $root ]; then
>> ++	readlink=$(which readlink)
>> ++
>> ++	if [ -n $readlink ]; then
>> ++		sn=$($readlink "$sn")
>> ++		case "$sn" in
>> ++			/*) sn=${root}${sn} ;;
>> ++			*)  sn=$initd/$sn ;;
>> ++		esac
>> ++	else
>> ++		echo "update-rc.d: readlink tool not present, cannot check whether \
>> ++				$sn symlink points to a valid file." >&2
>> ++	fi
>> ++fi
>> ++
>> + if [ $1 != "remove" ]; then
>> +-	if [ ! -f "$initd/$bn" ]; then
>> ++	if [ ! -f "$sn" ]; then
>> + 		echo "update-rc.d: $initd/$bn: file does not exist" >&2
>> + 		exit 1
>> + 	fi
>> + else
>> +-	if [ -f "$initd/$bn" ]; then
>> ++	if [ -f "$sn" ]; then
>> + 		if [ $force -eq 1 ]; then
>> + 			echo "update-rc.d: $initd/$bn exists during rc.d purge (continuing)" >&2
>> + 		else
>> diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
>> index 0aac5fa..bfcbd97 100644
>> --- a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
>> +++ b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
>> @@ -5,13 +5,15 @@ SECTION = "base"
>>  LICENSE = "GPLv2+"
>>  LIC_FILES_CHKSUM = "file://update-rc.d;beginline=5;endline=15;md5=148a48321b10eb37c1fa3ee02b940a75"
>>  
>> -PR = "r4"
>> +PR = "r5"
>>  
>>  # Revision corresponding to tag update-rc.d_0.7
>>  SRCREV = "eca680ddf28d024954895f59a241a622dd575c11"
>>  
>>  SRC_URI = "git://github.com/philb/update-rc.d.git;protocol=git \
>> -           file://add-verbose.patch;"
>> +           file://add-verbose.patch \
>> +           file://check-if-symlinks-are-valid.patch \
>> +          "
>>  
>>  S = "${WORKDIR}/git"
>>  
>>
>>
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
> 


