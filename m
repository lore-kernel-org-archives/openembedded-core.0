Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C6F8C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 20:36:56 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.1944.1633552614828219635
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 13:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id AA905E0004;
	Wed,  6 Oct 2021 20:36:52 +0000 (UTC)
Date: Wed, 6 Oct 2021 22:36:52 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Henry Kleynhans <henry.kleynhans@gmail.com>
Cc: openembedded-core@lists.openembedded.org, hkleynhans@fb.com,
	rmikey@fb.com
Subject: Re: [OE-core] [PATCH] sstate: Switch to ZStandard compressor support
Message-ID: <YV4I5JXAJJBPR4pZ@piout.net>
References: <20211004133858.159289-1-henry.kleynhans@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004133858.159289-1-henry.kleynhans@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 20:36:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156703

Hello Henry,

On 04/10/2021 14:38:58+0100, Henry Kleynhans wrote:
> From: Henry Kleynhans <hkleynhans@fb.com>
> 
> This patch switches the compressor from Gzip to ZStandard for ssate cache
> files.
> 
> Zstandard compression provides a significant improvement in
> decompression speed as well as improvement in compression speed and disk
> usage over the 'tgz' format in use.  Furthermore, its configurable
> compression level offers a trade-off between time spent compressing
> sstate cache files and disk space used by those files.  The reduced disk
> usage also contributes to saving network traffic for those sharing their
> sstate cache with others.
> 
> Zstandard should therefore be a good choice when:
> * disk space is at a premium
> * network speed / resources are limited
> * the CI server can sstate packages can be created at high compression
> * less CPU on the build server should be used for sstate decompression
> 
> Signed-off-by: Henry Kleynhans <hkleynhans@fb.com>
> ---
>  meta/classes/sstate.bbclass        | 29 ++++++++++++++--------
>  scripts/sstate-cache-management.sh | 40 +++++++++++++++---------------
>  2 files changed, 39 insertions(+), 30 deletions(-)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 92a73114bb..3a67aaba19 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -1,17 +1,19 @@
>  SSTATE_VERSION = "3"
>  
> +SSTATE_ZSTD_CLEVEL = "8"
> +
>  SSTATE_MANIFESTS ?= "${TMPDIR}/sstate-control"
>  SSTATE_MANFILEPREFIX = "${SSTATE_MANIFESTS}/manifest-${SSTATE_MANMACH}-${PN}"
>  
>  def generate_sstatefn(spec, hash, taskname, siginfo, d):
>      if taskname is None:
>         return ""
> -    extension = ".tgz"
> +    extension = ".tar.zst"
>      # 8 chars reserved for siginfo
>      limit = 254 - 8
>      if siginfo:
>          limit = 254
> -        extension = ".tgz.siginfo"
> +        extension = ".tar.zst.siginfo"
>      if not hash:
>          hash = "INVALID"
>      fn = spec + hash + "_" + taskname + extension
> @@ -37,7 +39,7 @@ SSTATE_PKGNAME    = "${SSTATE_EXTRAPATH}${@generate_sstatefn(d.getVar('SSTATE_PK
>  SSTATE_PKG        = "${SSTATE_DIR}/${SSTATE_PKGNAME}"
>  SSTATE_EXTRAPATH   = ""
>  SSTATE_EXTRAPATHWILDCARD = ""
> -SSTATE_PATHSPEC   = "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/*/${SSTATE_PKGSPEC}*_${SSTATE_PATH_CURRTASK}.tgz*"
> +SSTATE_PATHSPEC   = "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/*/${SSTATE_PKGSPEC}*_${SSTATE_PATH_CURRTASK}.tar.zst*"
>  

I believe this is the cause of those failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/2671/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/2640/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2662/steps/15/logs/stdio

2021-10-06 12:38:04,114 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/sstatetests.py", line 117, in test_cleansstate_task_distro_nonspecific
    self.run_test_cleansstate_task(['linux-libc-headers'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/sstatetests.py", line 102, in run_test_cleansstate_task
    self.assertTrue(tgz_created, msg="Could not find sstate .tgz files for: %s (%s)" % (', '.join(map(str, targets)), str(tgz_created)))
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.9/unittest/case.py", line 682, in assertTrue
    raise self.failureException(msg)
AssertionError: [] is not true : Could not find sstate .tgz files for: linux-libc-headers ([])

2021-10-06 12:40:57,420 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/sstatetests.py", line 158, in test_rebuild_distro_specific_sstate_cross_native_targets
    self.run_test_rebuild_distro_specific_sstate(['binutils-cross-' + self.tune_arch, 'binutils-native'], temp_sstate_location=True)
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/sstatetests.py", line 140, in run_test_rebuild_distro_specific_sstate
    self.assertTrue(len(file_tracker_1) >= len(targets), msg = "Not all sstate files were created for: %s" % ', '.join(map(str, targets)))
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.9/unittest/case.py", line 682, in assertTrue
    raise self.failureException(msg)
AssertionError: False is not true : Not all sstate files were created for: binutils-cross-x86_64, binutils-native


>  # explicitly make PV to depend on evaluated value of PV variable
>  PV[vardepvalue] = "${PV}"
> @@ -825,23 +827,24 @@ sstate_create_package () {
>  	mkdir --mode=0775 -p `dirname ${SSTATE_PKG}`
>  	TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
>  
> -	# Use pigz if available
> -	OPT="-czS"
> -	if [ -x "$(command -v pigz)" ]; then
> -		OPT="-I pigz -cS"
> +	OPT="-cS"
> +	ZSTD="zstd -${SSTATE_ZSTD_CLEVEL} -T${ZSTD_THREADS}"
> +	# Use pzstd if available
> +	if [ -x "$(command -v pzstd)" ]; then
> +		ZSTD="pzstd -${SSTATE_ZSTD_CLEVEL} -p ${ZSTD_THREADS}"
>  	fi
>  
>  	# Need to handle empty directories
>  	if [ "$(ls -A)" ]; then
>  		set +e
> -		tar $OPT -f $TFILE *
> +		tar -I "$ZSTD" $OPT -f $TFILE *
>  		ret=$?
>  		if [ $ret -ne 0 ] && [ $ret -ne 1 ]; then
>  			exit 1
>  		fi
>  		set -e
>  	else
> -		tar $OPT --file=$TFILE --files-from=/dev/null
> +		tar -I "$ZSTD" $OPT --file=$TFILE --files-from=/dev/null
>  	fi
>  	chmod 0664 $TFILE
>  	# Skip if it was already created by some other process
> @@ -880,7 +883,13 @@ python sstate_report_unihash() {
>  # Will be run from within SSTATE_INSTDIR.
>  #
>  sstate_unpack_package () {
> -	tar -xvzf ${SSTATE_PKG}
> +	ZSTD="zstd -T${ZSTD_THREADS}"
> +	# Use pzstd if available
> +	if [ -x "$(command -v pzstd)" ]; then
> +		ZSTD="pzstd -p ${ZSTD_THREADS}"
> +	fi
> +
> +	tar -I "$ZSTD" -xvf ${SSTATE_PKG}
>  	# update .siginfo atime on local/NFS mirror
>  	[ -O ${SSTATE_PKG}.siginfo ] && [ -w ${SSTATE_PKG}.siginfo ] && [ -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
>  	# Use "! -w ||" to return true for read only files
> diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
> index f1706a2229..d39671f7c6 100755
> --- a/scripts/sstate-cache-management.sh
> +++ b/scripts/sstate-cache-management.sh
> @@ -114,7 +114,7 @@ echo_error () {
>  # * Add .done/.siginfo to the remove list
>  # * Add destination of symlink to the remove list
>  #
> -# $1: output file, others: sstate cache file (.tgz)
> +# $1: output file, others: sstate cache file (.tar.zst)
>  gen_rmlist (){
>    local rmlist_file="$1"
>    shift
> @@ -131,13 +131,13 @@ gen_rmlist (){
>                dest="`readlink -e $i`"
>                if [ -n "$dest" ]; then
>                    echo $dest >> $rmlist_file
> -                  # Remove the .siginfo when .tgz is removed
> +                  # Remove the .siginfo when .tar.zst is removed
>                    if [ -f "$dest.siginfo" ]; then
>                        echo $dest.siginfo >> $rmlist_file
>                    fi
>                fi
>            fi
> -          # Add the ".tgz.done" and ".siginfo.done" (may exist in the future)
> +          # Add the ".tar.zst.done" and ".siginfo.done" (may exist in the future)
>            base_fn="${i##/*/}"
>            t_fn="$base_fn.done"
>            s_fn="$base_fn.siginfo.done"
> @@ -188,10 +188,10 @@ remove_duplicated () {
>    total_files=`find $cache_dir -name 'sstate*' | wc -l`
>    # Save all the sstate files in a file
>    sstate_files_list=`mktemp` || exit 1
> -  find $cache_dir -name 'sstate:*:*:*:*:*:*:*.tgz*' >$sstate_files_list
> +  find $cache_dir -iname 'sstate:*:*:*:*:*:*:*.tar.zst*' >$sstate_files_list
>  
>    echo "Figuring out the suffixes in the sstate cache dir ... "
> -  sstate_suffixes="`sed 's%.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tgz.*%\1%g' $sstate_files_list | sort -u`"
> +  sstate_suffixes="`sed 's%.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tar\.zst.*%\1%g' $sstate_files_list | sort -u`"
>    echo "Done"
>    echo "The following suffixes have been found in the cache dir:"
>    echo $sstate_suffixes
> @@ -200,10 +200,10 @@ remove_duplicated () {
>    # Using this SSTATE_PKGSPEC definition it's 6th colon separated field
>    # SSTATE_PKGSPEC    = "sstate:${PN}:${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}:${PV}:${PR}:${SSTATE_PKGARCH}:${SSTATE_VERSION}:"
>    for arch in $all_archs; do
> -      grep -q ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:$arch:[^:]*:[^:]*\.tgz$" $sstate_files_list
> +      grep -q ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:$arch:[^:]*:[^:]*\.tar\.zst$" $sstate_files_list
>        [ $? -eq 0 ] && ava_archs="$ava_archs $arch"
>        # ${builder_arch}_$arch used by toolchain sstate
> -      grep -q ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:${builder_arch}_$arch:[^:]*:[^:]*\.tgz$" $sstate_files_list
> +      grep -q ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:${builder_arch}_$arch:[^:]*:[^:]*\.tar\.zst$" $sstate_files_list
>        [ $? -eq 0 ] && ava_archs="$ava_archs ${builder_arch}_$arch"
>    done
>    echo "Done"
> @@ -219,13 +219,13 @@ remove_duplicated () {
>            continue
>        fi
>        # Total number of files including .siginfo and .done files
> -      total_files_suffix=`grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tgz.*" $sstate_files_list | wc -l 2>/dev/null`
> -      total_tgz_suffix=`grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tgz$" $sstate_files_list | wc -l 2>/dev/null`
> +      total_files_suffix=`grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tar\.zst.*" $sstate_files_list | wc -l 2>/dev/null`
> +      total_archive_suffix=`grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tar\.zst$" $sstate_files_list | wc -l 2>/dev/null`
>        # Save the file list to a file, some suffix's file may not exist
> -      grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tgz.*" $sstate_files_list >$list_suffix 2>/dev/null
> -      local deleted_tgz=0
> +      grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tar\.zst.*" $sstate_files_list >$list_suffix 2>/dev/null
> +      local deleted_archives=0
>        local deleted_files=0
> -      for ext in tgz tgz.siginfo tgz.done; do
> +      for ext in tar.zst tar.zst.siginfo tar.zst.done; do
>            echo "Figuring out the sstate:xxx_$suffix.$ext ... "
>            # Uniq BPNs
>            file_names=`for arch in $ava_archs ""; do
> @@ -268,19 +268,19 @@ remove_duplicated () {
>                done
>            done
>        done
> -      deleted_tgz=`cat $rm_list.* 2>/dev/null | grep ".tgz$" | wc -l`
> +      deleted_archives=`cat $rm_list.* 2>/dev/null | grep "\.tar\.zst$" | wc -l`
>        deleted_files=`cat $rm_list.* 2>/dev/null | wc -l`
>        [ "$deleted_files" -gt 0 -a $debug -gt 0 ] && cat $rm_list.*
> -      echo "($deleted_tgz out of $total_tgz_suffix .tgz files for $suffix suffix will be removed or $deleted_files out of $total_files_suffix when counting also .siginfo and .done files)"
> +      echo "($deleted_archives out of $total_archives_suffix .tar.zst files for $suffix suffix will be removed or $deleted_files out of $total_files_suffix when counting also .siginfo and .done files)"
>        let total_deleted=$total_deleted+$deleted_files
>    done
> -  deleted_tgz=0
> +  deleted_archives=0
>    rm_old_list=$remove_listdir/sstate-old-filenames
> -  find $cache_dir -name 'sstate-*.tgz' >$rm_old_list
> -  [ -s "$rm_old_list" ] && deleted_tgz=`cat $rm_old_list | grep ".tgz$" | wc -l`
> +  find $cache_dir -name 'sstate-*.tar.zst' >$rm_old_list
> +  [ -s "$rm_old_list" ] && deleted_archives=`cat $rm_old_list | grep "\.tar\.zst$" | wc -l`
>    [ -s "$rm_old_list" ] && deleted_files=`cat $rm_old_list | wc -l`
>    [ -s "$rm_old_list" -a $debug -gt 0 ] && cat $rm_old_list
> -  echo "($deleted_tgz .tgz files with old sstate-* filenames will be removed or $deleted_files when counting also .siginfo and .done files)"
> +  echo "($deleted_archives or .tar.zst files with old sstate-* filenames will be removed or $deleted_files when counting also .siginfo and .done files)"
>    let total_deleted=$total_deleted+$deleted_files
>  
>    rm -f $list_suffix
> @@ -289,7 +289,7 @@ remove_duplicated () {
>        read_confirm
>        if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
>            for list in `ls $remove_listdir/`; do
> -              echo "Removing $list.tgz (`cat $remove_listdir/$list | wc -w` files) ... "
> +              echo "Removing $list.tar.zst archive (`cat $remove_listdir/$list | wc -w` files) ... "
>                # Remove them one by one to avoid the argument list too long error
>                for i in `cat $remove_listdir/$list`; do
>                    rm -f $verbose $i
> @@ -322,7 +322,7 @@ rm_by_stamps (){
>    find $cache_dir -type f -name 'sstate*' | sort -u -o $cache_list
>  
>    echo "Figuring out the suffixes in the sstate cache dir ... "
> -  local sstate_suffixes="`sed 's%.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tgz.*%\1%g' $cache_list | sort -u`"
> +  local sstate_suffixes="`sed 's%.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tar\.zst.*%\1%g' $cache_list | sort -u`"
>    echo "Done"
>    echo "The following suffixes have been found in the cache dir:"
>    echo $sstate_suffixes
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156590): https://lists.openembedded.org/g/openembedded-core/message/156590
> Mute This Topic: https://lists.openembedded.org/mt/86066525/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

