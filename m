Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T3OOd-0002Ny-GC
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 11:35:43 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7K9Ncgp028846
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Aug 2012 02:23:38 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Mon, 20 Aug 2012 02:23:38 -0700
Message-ID: <50320219.50202@windriver.com>
Date: Mon, 20 Aug 2012 17:23:37 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1345448324.git.liezhi.yang@windriver.com>
	<1ded166f81d3da0781956c21750eb89fee7a4c07.1345448324.git.liezhi.yang@windriver.com>
	<20120820084211.GD3063@jama.jama.net>
In-Reply-To: <20120820084211.GD3063@jama.jama.net>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sstate-cache-management.sh: update for the SSTATE_MIRRORS
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
X-List-Received-Date: Mon, 20 Aug 2012 09:35:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/20/2012 04:42 PM, Martin Jansa wrote:
> On Mon, Aug 20, 2012 at 04:29:46PM +0800, Robert Yang wrote:
>> Several fixes:
>> * We have put the sstate file to SSTATE_DIR/??/ currently, but the
>>    sstate file on the SSTATE_MIRRORS or the obsolete one is still in
>>    SSTATE_DIR/ (no subdir), update the script to support manage them.
>
> Does this work with native/cross which are in SSTATE_DIR/LSB/??/ ?
>

Yes, it works, it doesn't care about the files' layout, the "native/cross"
is a part of PN, it doesn't mix them with the target recipe, for example,
sstate-perl-native doesn't mix with sstate-perl, they are two kinds of
sstate files, and will be handled separately.

// Robert

> Cheers,
>
>>
>> * Remove the related ".done" file in the SSTATE_DIR.
>>
>> * Add a "-L, --follow-symlink" which will remove both the symbol link and
>>    the destination file
>>
>> * Change the "ls -u file_list" (access time) to "ls -t file_list"
>>    (change tiem), since the "ls -u" and readlink will change the
>>    symlink's access time, which would make the result inconsistent.
>>    A solution is save the access time before every "ls -u" and "readlink",
>>    save it back after the command, but this would cause performance lost
>>    since it needs check each file and modify the symlink's status. Use
>>    the "-t" doesn't cause much different.
>>
>> [YOCTO #2897]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   scripts/sstate-cache-management.sh |   82 +++++++++++++++++++++++++++++------
>>   1 files changed, 68 insertions(+), 14 deletions(-)
>>
>> diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
>> index c3791d2..3a5980c 100755
>> --- a/scripts/sstate-cache-management.sh
>> +++ b/scripts/sstate-cache-management.sh
>> @@ -19,6 +19,7 @@
>>   # Global vars
>>   cache_dir=
>>   confirm=
>> +fsym=
>>   total_deleted=0
>>   verbose=
>>
>> @@ -58,6 +59,9 @@ Options:
>>
>>           Conflicts with --remove-duplicated.
>>
>> +  -L, --follow-symlink
>> +        Rmove both the symbol link and the destination file, default: no.
>> +
>>     -y, --yes
>>           Automatic yes to prompts; assume "yes" as answer to all prompts
>>           and run non-interactively.
>> @@ -104,6 +108,47 @@ echo_error () {
>>     exit 1
>>   }
>>
>> +# Generate the remove list:
>> +#
>> +# * Add .done/.siginfo to the remove list
>> +# * Add destination of symlink to the remove list
>> +#
>> +# $1: output file, others: sstate cache file (.tgz)
>> +gen_rmlist (){
>> +  local rmlist_file="$1"
>> +  shift
>> +  local files="$@"
>> +  for i in $files; do
>> +      echo $i >> $rmlist_file
>> +      # Add the ".siginfo"
>> +      if [ -e $i.siginfo ]; then
>> +          echo $i.siginfo >> $rmlist_file
>> +      fi
>> +      # Add the destination of symlink
>> +      if [ -L "$i" ]; then
>> +          if [ "$fsym" = "y" ]; then
>> +              dest="`readlink -e $i`"
>> +              if [ -n "$dest" ]; then
>> +                  echo $dest >> $rmlist_file
>> +                  # Remove the .siginfo when .tgz is removed
>> +                  if [ -f "$dest.siginfo" ]; then
>> +                      echo $dest.siginfo >> $rmlist_file
>> +                  fi
>> +              fi
>> +          fi
>> +          # Add the ".tgz.done" and ".siginfo.done" (may exist in the future)
>> +          base_fn="${i##/*/}"
>> +          t_fn="$base_fn.done"
>> +          s_fn="$base_fn.siginfo.done"
>> +          for d in $t_fn $s_fn; do
>> +              if [ -f $cache_dir/$d ]; then
>> +                  echo $cache_dir/$d >> $rmlist_file
>> +              fi
>> +          done
>> +      fi
>> +  done
>> +}
>> +
>>   # Remove the duplicated cache files for the pkg, keep the newest one
>>   remove_duplicated () {
>>
>> @@ -134,7 +179,7 @@ remove_duplicated () {
>>
>>     # Save all the sstate files in a file
>>     sstate_list=`mktemp` || exit 1
>> -  find $cache_dir -path '*/??/sstate-*.tgz' >$sstate_list
>> +  find $cache_dir -name 'sstate-*.tgz' >$sstate_list
>>     echo -n "Figuring out the archs in the sstate cache dir ... "
>>     for arch in $all_archs; do
>>         grep -q "\-$arch-" $sstate_list
>> @@ -156,21 +201,22 @@ remove_duplicated () {
>>         # There are at list 6 dashes (-) after arch, use this to avoid the
>>         # greedy match of sed.
>>         file_names=`for arch in $ava_archs; do
>> -          sed -ne 's#.*/../\(sstate-.*\)-'"$arch"'-.*-.*-.*-.*-.*-.*#\1#p' $list_suffix
>> +          sed -ne 's#.*/\(sstate-.*\)-'"$arch"'-.*-.*-.*-.*-.*-.*#\1#p' $list_suffix
>>         done | sort -u`
>>
>>         fn_tmp=`mktemp` || exit 1
>> +      rm_list="$remove_listdir/sstate-xxx_$suffix"
>>         for fn in $file_names; do
>>             [ -z "$verbose" ] || echo "Analyzing $fn-xxx_$suffix.tgz"
>>             for arch in $ava_archs; do
>> -              grep -h "/../$fn-$arch-" $list_suffix >>$fn_tmp
>> +              grep -h "/$fn-$arch-" $list_suffix >>$fn_tmp
>>             done
>>             # Use the access time, also delete the .siginfo file
>> -          to_del=$(ls -u $(cat $fn_tmp) | sed -n '1!p' | sed -e 'p' -e 's/$/.siginfo/')
>> -          [ "$to_del" = "" ] || echo $to_del >>$remove_listdir/sstate-xxx_$suffix
>> -          let deleted=$deleted+`echo $to_del | wc -w`
>> +          to_del=$(ls -t $(cat $fn_tmp) | sed -n '1!p')
>>             rm -f $fn_tmp
>> +          gen_rmlist $rm_list "$to_del"
>>         done
>> +      [ ! -s "$rm_list" ] || deleted=`cat $rm_list | wc -l`
>>         echo "($deleted files will be removed)"
>>         let total_deleted=$total_deleted+$deleted
>>     done
>> @@ -213,33 +259,37 @@ rm_by_stamps (){
>>     # Figure out all the md5sums in the stamps dir.
>>     echo -n "Figuring out all the md5sums in stamps dir ... "
>>     for i in $suffixes; do
>> -      sums=`find $stamps -maxdepth 2 -name "*\.do_$i\.sigdata.*" | \
>> -        sed 's#.*\.sigdata\.##' | sort -u`
>> +      # There is no "\.sigdata" but "_setcene" when it is mirrored
>> +      # from the SSTATE_MIRRORS, use them to figure out the sum.
>> +      sums=`find $stamps -maxdepth 2 -name "*.do_$i.*" \
>> +        -o -name "*.do_${i}_setscene.*" | \
>> +        sed -ne 's#.*_setscene\.##p' -e 's#.*\.sigdata\.##p' | \
>> +        sed -e 's#\..*##' | sort -u`
>>         all_sums="$all_sums $sums"
>>     done
>>     echo "Done"
>>
>>     # Save all the state file list to a file
>> -  find $cache_dir -path '*/??/sstate-*.tgz' | sort -u -o $cache_list
>> +  find $cache_dir -name 'sstate-*.tgz' | sort -u -o $cache_list
>>
>>     echo -n "Figuring out the files which will be removed ... "
>>     for i in $all_sums; do
>> -      grep ".*-$i.*" $cache_list >>$keep_list
>> +      grep ".*-${i}_*" $cache_list >>$keep_list
>>     done
>>     echo "Done"
>>
>>     if [ -s $keep_list ]; then
>>         sort -u $keep_list -o $keep_list
>> -      comm -1 -3 $keep_list $cache_list > $rm_list
>> -      let total_deleted=(`cat $rm_list | wc -w`)*2
>> -
>> +      to_del=`comm -1 -3 $keep_list $cache_list`
>> +      gen_rmlist $rm_list "$to_del"
>> +      let total_deleted=(`cat $rm_list | wc -w`)
>>         if [ $total_deleted -gt 0 ]; then
>>             read_confirm
>>             if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
>>                 echo "Removing sstate cache files ... ($total_deleted files)"
>>                 # Remove them one by one to avoid the argument list too long error
>>                 for i in `cat $rm_list`; do
>> -                  rm -f $verbose $i $i.siginfo
>> +                  rm -f $verbose $i
>>                 done
>>                 echo "$total_deleted files have been removed"
>>             else
>> @@ -273,6 +323,10 @@ while [ -n "$1" ]; do
>>         confirm="y"
>>         shift
>>           ;;
>> +    --follow-symlink|-L)
>> +      fsym="y"
>> +      shift
>> +        ;;
>>       --extra-layer=*)
>>         extra_layers=`echo $1 | sed -e 's#^--extra-layer=##' -e 's#,# #g'`
>>         [ -n "$extra_layers" ] || echo_error "Invalid extra layer $i"
>> --
>> 1.7.1
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


