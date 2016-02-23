Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AB0B7772D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 03:35:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1N3ZDLk021703
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 22 Feb 2016 19:35:13 -0800
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 22 Feb 2016 19:35:12 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1456195451.git.kai.kang@windriver.com>
	<72d89d471771ecffc8eecc923581d3dcdcfdfa5e.1456195451.git.kai.kang@windriver.com>
	<CAMKF1spcmUmc-FA1e9wdwki4=Dm14xY5Dw=+thvZAAkZe10fsA@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <56CBD36E.8020908@windriver.com>
Date: Tue, 23 Feb 2016 11:35:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spcmUmc-FA1e9wdwki4=Dm14xY5Dw=+thvZAAkZe10fsA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] useradd_base.bbclass: fix simultaneous with flock
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
X-List-Received-Date: Tue, 23 Feb 2016 03:35:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016年02月23日 11:05, Khem Raj wrote:
> Patch subject is unclear. Patch itself looks ok

How about use the  title of Yocto #9022:

useradd_base.bbclass: replace retry logic with flock


Thanks,
Kai



>
> On Mon, Feb 22, 2016 at 9:45 PM,  <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> When perform useradd during populate sysroot, it locks files passwd.lock
>> and group.lock at same time. And then it meets a dead lock issue
>> randomly.
>>
>> Use flock to reslove it by using an universal lock file for all the
>> user and group related operations.
>>
>> [YOCTO #9022]
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/classes/useradd.bbclass      |   6 +-
>>   meta/classes/useradd_base.bbclass | 186 ++++++++------------------------------
>>   2 files changed, 40 insertions(+), 152 deletions(-)
>>
>> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
>> index c960656..0a6f2be 100644
>> --- a/meta/classes/useradd.bbclass
>> +++ b/meta/classes/useradd.bbclass
>> @@ -57,7 +57,7 @@ if test "x`echo $GROUPADD_PARAM | tr -d '[:space:]'`" != "x"; then
>>          opts=`echo "$GROUPADD_PARAM" | cut -d ';' -f 1`
>>          remaining=`echo "$GROUPADD_PARAM" | cut -d ';' -f 2-`
>>          while test "x$opts" != "x"; do
>> -               perform_groupadd "$SYSROOT" "$OPT $opts" 10
>> +               perform_groupadd "$SYSROOT" "$OPT $opts"
>>                  if test "x$opts" = "x$remaining"; then
>>                          break
>>                  fi
>> @@ -73,7 +73,7 @@ if test "x`echo $USERADD_PARAM | tr -d '[:space:]'`" != "x"; then
>>          opts=`echo "$USERADD_PARAM" | cut -d ';' -f 1`
>>          remaining=`echo "$USERADD_PARAM" | cut -d ';' -f 2-`
>>          while test "x$opts" != "x"; do
>> -               perform_useradd "$SYSROOT" "$OPT $opts" 10
>> +               perform_useradd "$SYSROOT" "$OPT $opts"
>>                  if test "x$opts" = "x$remaining"; then
>>                          break
>>                  fi
>> @@ -89,7 +89,7 @@ if test "x`echo $GROUPMEMS_PARAM | tr -d '[:space:]'`" != "x"; then
>>          opts=`echo "$GROUPMEMS_PARAM" | cut -d ';' -f 1`
>>          remaining=`echo "$GROUPMEMS_PARAM" | cut -d ';' -f 2-`
>>          while test "x$opts" != "x"; do
>> -               perform_groupmems "$SYSROOT" "$OPT $opts" 10
>> +               perform_groupmems "$SYSROOT" "$OPT $opts"
>>                  if test "x$opts" = "x$remaining"; then
>>                          break
>>                  fi
>> diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.bbclass
>> index ab3cd35..7c1cc13 100644
>> --- a/meta/classes/useradd_base.bbclass
>> +++ b/meta/classes/useradd_base.bbclass
>> @@ -4,7 +4,7 @@
>>
>>   # The following functions basically have similar logic.
>>   # *) Perform necessary checks before invoking the actual command
>> -# *) Invoke the actual command, make retries if necessary
>> +# *) Invoke the actual command with flock
>>   # *) Error out if an error occurs.
>>
>>   # Note that before invoking these functions, make sure the global variable
>> @@ -12,65 +12,32 @@
>>
>>   perform_groupadd () {
>>          local rootdir="$1"
>> -       local opts="$2"
>> -       local retries="$3"
>> -       bbnote "${PN}: Performing groupadd with [$opts] and $retries times of retry"
>> +       local opts=`echo $2 | sed s/\'/\"/g`
>> +       bbnote "${PN}: Performing groupadd with [$opts]"
>> +       eval flock -x -w 100 $rootdir${sysconfdir} -c \'$PSEUDO groupadd $opts\' || true
>>          local groupname=`echo "$opts" | awk '{ print $NF }'`
>> -       local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
>> +       local group_exists=`grep "^$groupname:" $rootdir/etc/group`
>>          if test "x$group_exists" = "x"; then
>> -               local count=0
>> -               while true; do
>> -                       eval $PSEUDO groupadd $opts || true
>> -                       group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
>> -                       if test "x$group_exists" = "x"; then
>> -                               bbwarn "${PN}: groupadd command did not succeed. Retrying..."
>> -                       else
>> -                               break
>> -                       fi
>> -                       count=`expr $count + 1`
>> -                       if test $count = $retries; then
>> -                               bbfatal "${PN}: Tried running groupadd command $retries times without success, giving up"
>> -                       fi
>> -                        sleep $count
>> -               done
>> -       else
>> -               bbnote "${PN}: group $groupname already exists, not re-creating it"
>> +               bbfatal "${PN}: groupadd command did not succeed."
>>          fi
>>   }
>>
>>   perform_useradd () {
>>          local rootdir="$1"
>> -       local opts="$2"
>> -       local retries="$3"
>> -       bbnote "${PN}: Performing useradd with [$opts] and $retries times of retry"
>> +       local opts=`echo $2 | sed s/\'/\"/g`
>> +       bbnote "${PN}: Performing useradd with [$opts]"
>> +       eval flock -x -w 100 $rootdir${sysconfdir} -c  \'$PSEUDO useradd $opts\' || true
>>          local username=`echo "$opts" | awk '{ print $NF }'`
>> -       local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
>> +       local user_exists=`grep "^$username:" $rootdir/etc/passwd`
>>          if test "x$user_exists" = "x"; then
>> -              local count=0
>> -              while true; do
>> -                      eval $PSEUDO useradd $opts || true
>> -                      user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
>> -                      if test "x$user_exists" = "x"; then
>> -                              bbwarn "${PN}: useradd command did not succeed. Retrying..."
>> -                      else
>> -                              break
>> -                      fi
>> -                      count=`expr $count + 1`
>> -                      if test $count = $retries; then
>> -                               bbfatal "${PN}: Tried running useradd command $retries times without success, giving up"
>> -                      fi
>> -                      sleep $count
>> -              done
>> -       else
>> -               bbnote "${PN}: user $username already exists, not re-creating it"
>> +               bbfatal "${PN}: useradd command did not succeed."
>>          fi
>>   }
>>
>>   perform_groupmems () {
>>          local rootdir="$1"
>>          local opts="$2"
>> -       local retries="$3"
>> -       bbnote "${PN}: Performing groupmems with [$opts] and $retries times of retry"
>> +       bbnote "${PN}: Performing groupmems with [$opts]"
>>          local groupname=`echo "$opts" | awk '{ for (i = 1; i < NF; i++) if ($i == "-g" || $i == "--group") print $(i+1) }'`
>>          local username=`echo "$opts" | awk '{ for (i = 1; i < NF; i++) if ($i == "-a" || $i == "--add") print $(i+1) }'`
>>          bbnote "${PN}: Running groupmems command with group $groupname and user $username"
>> @@ -82,30 +49,13 @@ perform_groupmems () {
>>                  gshadow="no"
>>                  touch $rootdir${sysconfdir}/gshadow
>>          fi
>> -       local mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $rootdir/etc/group || true`"
>> +
>> +       eval flock -x -w 100 $rootdir${sysconfdir} -c \'$PSEUDO groupmems $opts\' || true
>> +       local mem_exists=`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $rootdir/etc/group`
>>          if test "x$mem_exists" = "x"; then
>> -               local count=0
>> -               while true; do
>> -                       eval $PSEUDO groupmems $opts || true
>> -                       mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $rootdir/etc/group || true`"
>> -                       if test "x$mem_exists" = "x"; then
>> -                               bbwarn "${PN}: groupmems command did not succeed. Retrying..."
>> -                       else
>> -                               break
>> -                       fi
>> -                       count=`expr $count + 1`
>> -                       if test $count = $retries; then
>> -                               if test "x$gshadow" = "xno"; then
>> -                                       rm -f $rootdir${sysconfdir}/gshadow
>> -                                       rm -f $rootdir${sysconfdir}/gshadow-
>> -                               fi
>> -                               bbfatal "${PN}: Tried running groupmems command $retries times without success, giving up"
>> -                       fi
>> -                       sleep $count
>> -               done
>> -       else
>> -               bbnote "${PN}: group $groupname already contains $username, not re-adding it"
>> +               bbfatal "${PN}: groupmems command did not succeed."
>>          fi
>> +
>>          if test "x$gshadow" = "xno"; then
>>                  rm -f $rootdir${sysconfdir}/gshadow
>>                  rm -f $rootdir${sysconfdir}/gshadow-
>> @@ -115,56 +65,24 @@ perform_groupmems () {
>>   perform_groupdel () {
>>          local rootdir="$1"
>>          local opts="$2"
>> -       local retries="$3"
>> -       bbnote "${PN}: Performing groupdel with [$opts] and $retries times of retry"
>> +       bbnote "${PN}: Performing groupdel with [$opts]"
>> +       eval flock -x -w 100 $rootdir${sysconfdir} -c \'$PSEUDO groupdel $opts\' || true
>>          local groupname=`echo "$opts" | awk '{ print $NF }'`
>> -       local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
>> +       local group_exists=`grep "^$groupname:" $rootdir/etc/group`
>>          if test "x$group_exists" != "x"; then
>> -               local count=0
>> -               while true; do
>> -                       eval $PSEUDO groupdel $opts || true
>> -                       group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
>> -                       if test "x$group_exists" != "x"; then
>> -                               bbwarn "${PN}: groupdel command did not succeed. Retrying..."
>> -                       else
>> -                               break
>> -                       fi
>> -                       count=`expr $count + 1`
>> -                       if test $count = $retries; then
>> -                               bbfatal "${PN}: Tried running groupdel command $retries times without success, giving up"
>> -                       fi
>> -                       sleep $count
>> -               done
>> -       else
>> -               bbnote "${PN}: group $groupname doesn't exist, not removing it"
>> +               bbfatal "${PN}: groupdel command did not succeed."
>>          fi
>>   }
>>
>>   perform_userdel () {
>>          local rootdir="$1"
>>          local opts="$2"
>> -       local retries="$3"
>> -       bbnote "${PN}: Performing userdel with [$opts] and $retries times of retry"
>> +       bbnote "${PN}: Performing userdel with [$opts]"
>> +       eval flock -x -w 100 $rootdir${sysconfdir} -c \'$PSEUDO userdel $opts\' || true
>>          local username=`echo "$opts" | awk '{ print $NF }'`
>> -       local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
>> +       local user_exists=`grep "^$username:" $rootdir/etc/passwd`
>>          if test "x$user_exists" != "x"; then
>> -              local count=0
>> -              while true; do
>> -                      eval $PSEUDO userdel $opts || true
>> -                      user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
>> -                      if test "x$user_exists" != "x"; then
>> -                              bbwarn "${PN}: userdel command did not succeed. Retrying..."
>> -                      else
>> -                              break
>> -                      fi
>> -                      count=`expr $count + 1`
>> -                      if test $count = $retries; then
>> -                               bbfatal "${PN}: Tried running userdel command $retries times without success, giving up"
>> -                      fi
>> -                      sleep $count
>> -              done
>> -       else
>> -               bbnote "${PN}: user $username doesn't exist, not removing it"
>> +               bbfatal "${PN}: userdel command did not succeed."
>>          fi
>>   }
>>
>> @@ -172,59 +90,29 @@ perform_groupmod () {
>>          # Other than the return value of groupmod, there's no simple way to judge whether the command
>>          # succeeds, so we disable -e option temporarily
>>          set +e
>> +
>>          local rootdir="$1"
>>          local opts="$2"
>> -       local retries="$3"
>> -       bbnote "${PN}: Performing groupmod with [$opts] and $retries times of retry"
>> -       local groupname=`echo "$opts" | awk '{ print $NF }'`
>> -       local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
>> -       if test "x$group_exists" != "x"; then
>> -               local count=0
>> -               while true; do
>> -                       eval $PSEUDO groupmod $opts
>> -                       if test $? != 0; then
>> -                               bbwarn "${PN}: groupmod command did not succeed. Retrying..."
>> -                       else
>> -                               break
>> -                       fi
>> -                       count=`expr $count + 1`
>> -                       if test $count = $retries; then
>> -                               bbfatal "${PN}: Tried running groupmod command $retries times without success, giving up"
>> -                       fi
>> -                       sleep $count
>> -               done
>> -       else
>> -               bbwarn "${PN}: group $groupname doesn't exist, unable to modify it"
>> +       bbnote "${PN}: Performing groupmod with [$opts]"
>> +       eval flock -x -w 100 $rootdir${sysconfdir} -c \'$PSEUDO groupmod $opts\'
>> +       if test $? != 0; then
>> +               bbwarn "${PN}: groupmod command did not succeed."
>>          fi
>> +
>>          set -e
>>   }
>>
>>   perform_usermod () {
>>          # Same reason with groupmod, temporarily disable -e option
>>          set +e
>> +
>>          local rootdir="$1"
>>          local opts="$2"
>> -       local retries="$3"
>> -       bbnote "${PN}: Performing usermod with [$opts] and $retries times of retry"
>> -       local username=`echo "$opts" | awk '{ print $NF }'`
>> -       local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
>> -       if test "x$user_exists" != "x"; then
>> -              local count=0
>> -              while true; do
>> -                      eval $PSEUDO usermod $opts
>> -                      if test $? != 0; then
>> -                              bbwarn "${PN}: usermod command did not succeed. Retrying..."
>> -                      else
>> -                              break
>> -                      fi
>> -                      count=`expr $count + 1`
>> -                      if test $count = $retries; then
>> -                               bbfatal "${PN}: Tried running usermod command $retries times without success, giving up"
>> -                      fi
>> -                      sleep $count
>> -              done
>> -       else
>> -               bbwarn "${PN}: user $username doesn't exist, unable to modify it"
>> +       bbnote "${PN}: Performing usermod with [$opts]"
>> +       eval flock -x -w 100 $rootdir${sysconfdir} -c \'$PSEUDO usermod $opts\'
>> +       if test $? != 0; then
>> +               bbfatal "${PN}: usermod command did not succeed."
>>          fi
>> +
>>          set -e
>>   }
>> --
>> 2.6.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
Regards,
Neil | Kai Kang


