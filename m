Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BF2F06A9E3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 08:20:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r688KLHu022569
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Jul 2013 01:20:21 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 8 Jul 2013 01:20:21 -0700
Message-ID: <51DA7667.7050207@windriver.com>
Date: Mon, 8 Jul 2013 16:20:55 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1372826827.git.Qi.Chen@windriver.com>
	<61d58e6bfc00142957a77a3a1747c9848710917a.1372826827.git.Qi.Chen@windriver.com>
	<20130706102728.GA30517@jama>
In-Reply-To: <20130706102728.GA30517@jama>
X-Originating-IP: [128.224.162.233]
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] busybox: fix the on-target upgrade problem
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
X-List-Received-Date: Mon, 08 Jul 2013 08:20:22 -0000
X-Groupsio-MsgNum: 41586
Content-Type: multipart/mixed; boundary="------------070406010605010101070801"

--------------070406010605010101070801
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/06/2013 06:27 PM, Martin Jansa wrote:
> On Wed, Jul 03, 2013 at 12:48:12PM +0800, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> We now can have a 'one-binary' version of busybox, or 'two-binary'
>> version of busybox, controlled by the 'BUSYBOX_SPLIT_SUID' variable.
>> This makes on-target upgrade a problem, as we have to support the
>> following four upgrading paths.
>>
>> For convenience, in the following context, A is used to denote a
>> 'two-binary' version of busybox while B is used to denote a 'one-binary'
>> version of busybox.
>>
>> A --(upgrade)--> B
>> B --(upgrade)--> A
>> A --(upgrade)--> A
>> B --(upgrade)--> B
>>
>> This patch makes effort to support the above four situations.
> Thanks for looking into it (it's more complicated then I've first
> expected) and it looks like there is more issues probably caused
> by applet path moved in latest busybox upgrade (but ip looks weird) :/
>
> update-alternatives: Error: cannot register alternative addgroup to
> /usr/sbin/addgroup since it is already registered to /bin/addgroup
> update-alternatives: Error: cannot register alternative adduser to
> /usr/sbin/adduser since it is already registered to /bin/adduser
>
> update-alternatives: Error: cannot register alternative delgroup to
> /usr/sbin/delgroup since it is already registered to /bin/delgroup
> update-alternatives: Error: cannot register alternative deluser to
> /usr/sbin/deluser since it is already registered to /bin/deluser
>
> update-alternatives: Error: cannot register alternative ip to /sbin/ip
> since it is already registered to /bin/ip
>
> SHR root@gjama ~ $ cat /var/lib/opkg/alternatives/ip
> /bin/ip
> busybox 50
> /bin/busybox 50
> /bin/busybox.nosuid 50
> SHR root@gjama ~ $ cat /var/lib/opkg/alternatives/adduser
> /bin/adduser
> /bin/busybox.nosuid 50
> SHR root@gjama ~ $ cat /var/lib/opkg/alternatives/addgroup
> /bin/addgroup
> /bin/busybox.nosuid 50
> SHR root@gjama ~ $ cat /var/lib/opkg/alternatives/delgroup
> /bin/delgroup
> /bin/busybox.nosuid 50
> SHR root@gjama ~ $ cat /var/lib/opkg/alternatives/deluser
> /bin/deluser
> /bin/busybox.nosuid 50
Hi Martin,

The problem roots in opkg's update-alternatives.
opkg's update-alternatives cannot handle following situations.
/bin/<cmd> --> /bin/<cmd>.<pkgA>
/usr/bin/<cmd> --> /usr/bin/<cmd>.<pkgB>.
[Let's denote this situation as situationA, we have different links and 
different targets in situationA.]

It has a simple assumption in its design, that is, the links for the 
same command should be the same.

In case of our busybox upgrade, we have:
/bin/deluser --> /bin/busybox.nosuid
/usr/sbin/deluser --> /bin/busybox.nosuid
[Let's denote this situation as situationB, we have different links but 
the same target in situationB.]

The links are different, /bin/deluser and /usr/sbin/deluser, so opkg's 
update-alternatives rendered an error while registering the alternative.

According to its assumption, opkg's update-alternatives should not 
support situationA and situationB.
But I think it should at least be able to deal with situationB. Because 
it's not unusual in Yocto/OE to create symlinks via update-alternatives 
and situationB might indicate an on-device upgrade.
I've just made a patch to support this situationB. I'm still doing some 
tests on this patch. Please see attachment for more details.

Any thoughts on this problem?

Best Regards,
Chen Qi
>> [YOCTO #4802]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-core/busybox/busybox.inc |   48 +++++++++++++++++++++++++++++++++
>>   1 file changed, 48 insertions(+)
>>
>> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
>> index 8567d64..acd2bfb 100644
>> --- a/meta/recipes-core/busybox/busybox.inc
>> +++ b/meta/recipes-core/busybox/busybox.inc
>> @@ -190,6 +190,10 @@ do_install () {
>>   			install -m 0644 ${S}/busybox.links.suid ${D}${sysconfdir}
>>   			install -m 0644 ${S}/busybox.links.nosuid ${D}${sysconfdir}
>>   			ln -sf busybox.nosuid ${D}${base_bindir}/sh
>> +			# Keep a default busybox for people who want to invoke busybox directly.
>> +			# This is also useful for the on device upgrade. Because we want
>> +			# to use the busybox command in postinst.
>> +			ln -sf busybox.nosuid ${D}${base_bindir}/busybox
>>   		else
>>   			if grep -q "CONFIG_FEATURE_SUID=y" ${B}/.config; then
>>   				install -m 4755 ${B}/busybox ${D}${base_bindir}
>> @@ -198,6 +202,12 @@ do_install () {
>>   			fi
>>   			install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
>>   			ln -sf busybox ${D}${base_bindir}/sh
>> +			# We make this symlink here to eliminate the error when upgrading together
>> +			# with busybox-syslog. Without this symlink, the opkg may think of the
>> +			# busybox.nosuid as obsolete and remove it, resulting in dead links like
>> +			# /bin/sed -> /bin/busybox.nosuid. This will make upgrading busybox-syslog fail.
>> +			# This symlink will be safely deleted in postinst, thus no negative effect.
>> +			ln -sf busybox ${D}${base_bindir}/busybox.nosuid
>>   		fi
>>   	else
>>   		install -d ${D}${base_bindir} ${D}${base_sbindir}
>> @@ -306,6 +316,44 @@ python do_package_prepend () {
>>           set_alternative_vars("/etc/busybox.links.suid", "/bin/busybox.suid")
>>   }
>>   
>> +pkg_postinst_${PN} () {
>> +	# This part of code is dedicated to the on target upgrade problem.
>> +	# It's known that if we don't make appropriate symlinks before update-alternatives calls,
>> +	# there will be errors indicating missing commands such as 'sed'.
>> +	# These symlinks will later be updated by update-alternatives calls.
>> +	test -n 2 > /dev/null || alias test='busybox test'
>> +	if test "x$D" = "x"; then
>> +		# Remove busybox.nosuid if it's a symlink, because this situation indicates
>> +		# that we're installing or upgrading to a one-binary busybox.
>> +		if test -h /bin/busybox.nosuid; then
>> +			rm -f /bin/busybox.nosuid
>> +		fi
>> +		for suffix in "" ".nosuid" ".suid"; do
>> +			if test -e /etc/busybox.links$suffix; then
>> +				while read link; do
>> +					if test ! -e "$link"; then
>> +						case "$link" in
>> +							/*/*/*)
>> +								to="../../bin/busybox$suffix"
>> +								;;
>> +							/bin/*)
>> +								to="busybox$suffix"
>> +								;;
>> +							/*/*)
>> +								to="../bin/busybox$suffix"
>> +								;;
>> +						esac
>> +						# we can use busybox here because even if we are using splitted busybox
>> +						# we've made a symlink from /bin/busybox to /bin/busybox.nosuid.
>> +						busybox rm -f $link
>> +						busybox ln -s $to $link
>> +					fi
>> +				done < /etc/busybox.links$suffix
>> +			fi
>> +		done
>> +	fi
>> +}
>> +
>>   pkg_prerm_${PN} () {
>>   	# This is so you can make busybox commit suicide - removing busybox with no other packages
>>   	# providing its files, this will make update-alternatives work, but the update-rc.d part
>> -- 
>> 1.7.9.5
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--------------070406010605010101070801
Content-Type: text/x-patch;
	name="0001-opkg-fix-update-alternatives-to-handle-on-device-upg.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename*0="0001-opkg-fix-update-alternatives-to-handle-on-device-upg.pa";
	filename*1="tch"

From 02f2bba4d3d92daf870f86ae02a206af51a53b1d Mon Sep 17 00:00:00 2001
From: Chen Qi <qi.chen@windriver.com>
Date: Mon, 8 Jul 2013 04:13:14 -0400
Subject: [PATCH] opkg: fix update-alternatives to handle on-device upgrade

---
 ...ate-alternatives-fix-register_alt-process.patch |   61 ++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_svn.bb             |    3 +-
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-update-alternatives-fix-register_alt-process.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0001-update-alternatives-fix-register_alt-process.patch b/meta/recipes-devtools/opkg/opkg/0001-update-alternatives-fix-register_alt-process.patch
new file mode 100644
index 0000000..2903dfd
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0001-update-alternatives-fix-register_alt-process.patch
@@ -0,0 +1,61 @@
+From da31772150f764ee2cb11de38a4e7b6278105423 Mon Sep 17 00:00:00 2001
+From: Chen Qi <qi.chen@windriver.com>
+Date: Mon, 8 Jul 2013 03:32:42 -0400
+Subject: [PATCH] update-alternatives: fix register_alt process
+
+---
+ utils/update-alternatives.in |   24 +++++++++++++++++++++---
+ 1 file changed, 21 insertions(+), 3 deletions(-)
+
+diff --git a/utils/update-alternatives.in b/utils/update-alternatives.in
+index 2a6f6cc..3d592b2 100644
+--- a/utils/update-alternatives.in
++++ b/utils/update-alternatives.in
+@@ -46,6 +46,7 @@ register_alt() {
+ 	[ $# -lt 2 ] && return 1
+ 	local name="$1"
+ 	local link="$2"
++	local path="$3"
+ 
+ 	if [ ! -d $ad ]; then
+ 		mkdir -p $ad
+@@ -54,8 +55,25 @@ register_alt() {
+ 	if [ -e "$ad/$name" ]; then
+ 		local olink=`head -n 1 $ad/$name`
+ 		if [ "$link" != "$olink" ]; then
+-			echo "update-alternatives: Error: cannot register alternative $name to $link since it is already registered to $olink" >&2
+-			return 1
++			local target_conflict="no"
++			if [ `wc -l $ad/$name | cut -d' ' -f1` != "2" ]; then
++				target_conflict="yes"
++			elif [ `tail -n 1 $ad/$name | cut -d' ' -f1` != "$path" ]; then
++				target_conflict="yes"
++			else
++				target_conflict="no"
++			fi
++			if [ "$target_conflict" = "yes" ]; then
++				echo "update-alternatives: Error: cannot register alternative $name to $link since it is already registered to $olink and there are more than one target" >&2
++				return 1
++			else
++				# Only one target for name and the link has changed.
++				echo "$link" > $ad/$name.new
++				tail -n 1 $ad/$name >> $ad/$name.new
++				mv $ad/$name.new $ad/$name
++				ln -snf $path $link
++				rm -f $olink
++			fi
+ 		fi
+ 	else
+ 		echo "$link" > "$ad/$name"
+@@ -137,7 +155,7 @@ do_install() {
+ 	# This is a bad hack, but I haven't thought of a cleaner solution yet...
+ 	[ -n "$OPKG_OFFLINE_ROOT" ] && path=`echo $path | sed "s|^$OPKG_OFFLINE_ROOT/*|/|"`
+ 
+-	register_alt $name $link
++	register_alt $name $link $path
+ 	add_alt $name $path $priority
+ 	find_best_alt $name
+ }
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 9f3512d..6ba6195 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -2,7 +2,8 @@ require opkg.inc
 
 SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
            file://obsolete_automake_macros.patch \
-	   file://0001-Fix-libopkg-header-installation.patch \
+           file://0001-Fix-libopkg-header-installation.patch \
+           file://0001-update-alternatives-fix-register_alt-process.patch \
 "
 
 S = "${WORKDIR}/trunk"
-- 
1.7.9.5


--------------070406010605010101070801--
