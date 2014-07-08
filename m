Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AED8D65CC9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 14:33:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s68EXR5W020722
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Jul 2014 07:33:27 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 8 Jul 2014 07:33:24 -0700
Message-ID: <53BC0132.50507@windriver.com>
Date: Tue, 8 Jul 2014 22:33:22 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, Chen Qi <Qi.Chen@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1404815853.git.Qi.Chen@windriver.com>	<0464141ef5a06bfbcdb797c5a0b1b58dbd1775fd.1404815853.git.Qi.Chen@windriver.com>
	<53BBFE7A.5070408@linux.intel.com>
In-Reply-To: <53BBFE7A.5070408@linux.intel.com>
Subject: Re: [PATCH 1/1] populate-extfs.sh: fix to handle special file names correctly
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
X-List-Received-Date: Tue, 08 Jul 2014 14:33:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/08/2014 10:21 PM, Saul Wold wrote:
> On 07/08/2014 03:38 AM, Chen Qi wrote:
>> `debugfs' treats spaces and "" specially. So when we are dealing with
>> file names, great care should be taken to make sure that `debugfs'
>> recognizes file names correctly.
>>
>> The basic solution here is:
>> 1. Use quotation marks to handle spaces correctly.
>> 2. Replace "xxx" with ""xxx"" so that debugfs knows that the quotation
>>     marks are parts of the file name.
>>
>> [YOCTO #6503]
>>
> Do you mean for this to be for Dora?  The populate-extfs has now been merged
> into the upstream code and not a patch.

Yes, it is for dora only, daisy or master doesn't use the populate-extfs.sh
any more. I will talk with Qi to send it to e2fsprogs's upstream, but it is
a block issue for 1.5.3 atm. The problem was that it can't handle the filename
with quotation marks in the past, and this patch fix the problem.

// Robert

>
> Can you work with Robert to ensure it gets upstreamed and into dora if that's
> the right target.  There was another older patchset that you also sent that
> falls in this came category, I want to ensure we get these fixes into the
> upstream e2fsprogs and patched correctly in master and daisy if needed.
>
> Thanks
>      Sau!
>
>
>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   .../e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh   |   72 +++++++++++++++-----
>>   1 file changed, 54 insertions(+), 18 deletions(-)
>>
>> diff --git
>> a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh
>> b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh
>> index 47f5b5b..a1808b3 100644
>> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh
>> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh
>> @@ -30,8 +30,41 @@ DEBUGFS="debugfs"
>>
>>                   DIR="$(dirname "$DIR")"
>>
>> +                # debugfs handles the quotation mark differently from other
>> special marks like {
>> +                # If FILE contains quotation marks in its name, then we have
>> to replace " with ""
>> +                # so that debugfs could correclty recognize them. In this
>> script, we use the prefix
>> +                # of D_ to denote the file names that should be used by debugfs.
>> +                #
>> +                # The usage of case statements here is to avoid performace
>> impact.
>> +                case $FILE in
>> +                *\"*)
>> +            D_FILE="$(echo $FILE | sed -e 's#\"#\"\"#g')"
>> +            ;;
>> +                *)
>> +            D_FILE="$FILE"
>> +            ;;
>> +                esac
>> +
>> +                case $DIR in
>> +                *\"*)
>> +            D_DIR="$(echo $DIR | sed -e 's#\"#\"\"#g')"
>> +            ;;
>> +                *)
>> +            D_DIR="$DIR"
>> +            ;;
>> +                esac
>> +
>> +                case $TGT in
>> +                *\"*)
>> +            D_TGT="$(echo $TGT | sed -e 's#\"#\"\"#g')"
>> +            ;;
>> +                *)
>> +            D_TGT="$TGT"
>> +            ;;
>> +                esac
>> +
>>           if [ "$DIR" != "$CWD" ]; then
>> -            echo "cd $DIR"
>> +            echo "cd \"$D_DIR\""
>>               CWD="$DIR"
>>           fi
>>
>> @@ -41,23 +74,24 @@ DEBUGFS="debugfs"
>>
>>           case $TYPE in
>>           "directory")
>> -            echo "mkdir $TGT"
>> +            echo "mkdir \"$D_TGT\""
>>               ;;
>>           "regular file" | "regular empty file")
>> -            echo "write \"$FILE\" \"$TGT\""
>> +            echo "write \"$D_FILE\" \"$D_TGT\""
>>               ;;
>>           "symbolic link")
>>               LINK_TGT=$(readlink "$FILE")
>> -            echo "symlink \"$TGT\" \"$LINK_TGT\""
>> +            D_LINK_TGT="$(echo $LINK_TGT | sed -e 's#\"#\"\"#g')"
>> +            echo "symlink \"$D_TGT\" \"$D_LINK_TGT\""
>>               ;;
>>           "block special file")
>> -            echo "mknod \"$TGT\" b $DEVNO"
>> +            echo "mknod \"$D_TGT\" b $DEVNO"
>>               ;;
>>           "character special file")
>> -            echo "mknod \"$TGT\" c $DEVNO"
>> +            echo "mknod \"$D_TGT\" c $DEVNO"
>>               ;;
>>           "fifo")
>> -            echo "mknod \"$TGT\" p"
>> +            echo "mknod \"$D_TGT\" p"
>>               ;;
>>           *)
>>               echo "Unknown/unhandled file type '$TYPE' file: $FILE" 1>&2
>> @@ -65,19 +99,19 @@ DEBUGFS="debugfs"
>>           esac
>>
>>           # Set the file mode
>> -        echo "sif \"$TGT\" mode 0x$MODE"
>> +        echo "sif \"$D_TGT\" mode 0x$MODE"
>>
>>           # Set uid and gid
>> -        echo "sif \"$TGT\" uid $U"
>> -        echo "sif \"$TGT\" gid $G"
>> +        echo "sif \"$D_TGT\" uid $U"
>> +        echo "sif \"$D_TGT\" gid $G"
>>
>>           # Set atime, mtime and ctime
>>           AT=`echo $AT | cut -d'.' -f1 | sed -e 's#[- :]##g'`
>>           MT=`echo $MT | cut -d'.' -f1 | sed -e 's#[- :]##g'`
>>           CT=`echo $CT | cut -d'.' -f1 | sed -e 's#[- :]##g'`
>> -        echo "sif \"$TGT\" atime $AT"
>> -        echo "sif \"$TGT\" mtime $MT"
>> -        echo "sif \"$TGT\" ctime $CT"
>> +        echo "sif \"$D_TGT\" atime $AT"
>> +        echo "sif \"$D_TGT\" mtime $MT"
>> +        echo "sif \"$D_TGT\" ctime $CT"
>>       done
>>
>>       # Handle the hard links.
>> @@ -91,15 +125,17 @@ DEBUGFS="debugfs"
>>       # Use the debugfs' ln and "sif links_count" to handle them.
>>       for i in `ls $INODE_DIR`; do
>>           # The link source
>> -        SRC=`head -1 $INODE_DIR/$i`
>> +        SRC="$(head -1 $INODE_DIR/$i)"
>> +        D_SRC="$(echo $SRC | sed -e 's#\"#\"\"#g')"
>>           # Remove the files and link them again except the first one
>> -        for TGT in `sed -n -e '1!p' $INODE_DIR/$i`; do
>> -            echo "rm $TGT"
>> -            echo "ln $SRC $TGT"
>> +        sed -n -e '1!p' $INODE_DIR/$i | while read TGT; do
>> +            D_TGT="$(echo $TGT | sed -e 's#\"#\"\"#g')"
>> +            echo "rm \"$D_TGT\""
>> +            echo "ln \"$D_SRC\" \"$D_TGT\""
>>           done
>>           LN_CNT=`cat $INODE_DIR/$i | wc -l`
>>           # Set the links count
>> -        echo "sif $SRC links_count $LN_CNT"
>> +        echo "sif \"$D_SRC\" links_count $LN_CNT"
>>       done
>>       rm -fr $INODE_DIR
>>   } | $DEBUGFS -w -f - $DEVICE 2>&1 1>/dev/null | grep '.*: .*'
>>

