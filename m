Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QMOGD-0001ve-Qu
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 19:40:46 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 May 2011 10:37:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,226,1304319600"; 
   d="scan'208";a="2890248"
Received: from doubt.jf.intel.com (HELO [10.7.199.57]) ([10.7.199.57])
	by fmsmga002.fm.intel.com with ESMTP; 17 May 2011 10:37:50 -0700
Message-ID: <4DD2B281.6000300@linux.intel.com>
Date: Tue, 17 May 2011 10:38:09 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1305584418.git.dvhart@linux.intel.com>
	<eb4a98eeef982194542a33be0dd615a5c2bf3ed8.1305584418.git.dvhart@linux.intel.com>
	<442f31a687cb0362e9e0a3492eed6bb4ad5d8366.1305584418.git.dvhart@linux.intel.com>
	<BANLkTinDQ5rsDKuaXcyYxPnCoGnMNQ+7=Q@mail.gmail.com>
In-Reply-To: <BANLkTinDQ5rsDKuaXcyYxPnCoGnMNQ+7=Q@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH v2 14/15] send-pull-request: streamline git-send-email usage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 May 2011 17:40:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05/17/2011 10:05 AM, Khem Raj wrote:
> On Mon, May 16, 2011 at 3:26 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>> The script was sending one patch at a time, which defeats the internal
>> confirmation mechanism of git-send-email (which would otherwise allow
>> the user to send all patches or abort immediately).
>>
>> Rework the sending logic to use no more than two commands. Use two
>> commands when the cover letter is to be sent to all recipients with
>> the -a argument. Otherwise, send all patches via the same command.
>>
>> The script duplicates git's send confirmation, eliminate that.
>>
>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>> Reported-by: Khem Raj <raj.khem@gmail.com>
>> Cc: Khem Raj <raj.khem@gmail.com>
>> Cc: Joshua Lock <josh@linux.intel.com>
>> ---
>>  scripts/send-pull-request |   68 +++++++++++++++++---------------------------
>>  1 files changed, 26 insertions(+), 42 deletions(-)
>>
>> diff --git a/scripts/send-pull-request b/scripts/send-pull-request
>> index 21eb302..8d0bd34 100755
>> --- a/scripts/send-pull-request
>> +++ b/scripts/send-pull-request
>> @@ -1,6 +1,7 @@
>>  #!/bin/bash
>>  AUTO=0
>>  AUTO_CL=0
>> +GITSOBCC=""
>>
>>  # Prevent environment leakage to these vars.
>>  unset TO
>> @@ -59,10 +60,11 @@ while getopts "achp:t:" OPT; do
>>        case $OPT in
>>        a)
>>                AUTO_CL=1
>> -               AUTO=1
>> -               ;;
>> +               # Fall through to include -c
>> +               ;&
>>        c)
>>                AUTO=1
>> +               GITSOBCC="--signed-off-by-cc"
>>                ;;
>>        h)
>>                usage
>> @@ -130,48 +132,30 @@ if [ -z "$TO" ] && [ -z "$AUTO_CC" ]; then
>>  fi
>>
>>
>> -# Generate report for the user and require confirmation before sending
>> -cat <<EOM
>> -The following patches:
>> -$(for PATCH in $PDIR/*.patch; do echo "    $PATCH"; done)
>> +# Convert the collected addresses into git-send-email argument strings
>> +export IFS=$','
>> +GIT_TO=$(for R in $TO; do echo -n "--to='$R' "; done)
>> +GIT_CC=$(for R in $AUTO_CC; do echo -n "--cc='$R' "; done)
>> +unset IFS
>>
>> -will now be sent via the git send-email command. Git will prompt you before
>> -sending any email.
>>
>> -EOM
>> -echo "Continue? [y/N] "
>> -read cont
>> -
>> -if [ "$cont" == "y" ] || [ "$cont" == "Y" ]; then
>> -       ERROR=0
>> -       export IFS=$','
>> -       GIT_TO=$(for R in $TO; do echo -n "--to='$R' "; done)
>> -       GIT_CC=$(for R in $AUTO_CC; do echo -n "--cc='$R' "; done)
>> -       unset IFS
>> -       for PATCH in $PDIR/*patch; do
>> -               if [ $AUTO -eq 1 ]; then
>> -                       if [ $PATCH == "$CL" ] && [ $AUTO_CL -eq 1 ]; then
>> -                               # Send the cover letter to every recipient, both
>> -                               # specified as well as harvested.
>> -                               eval "git send-email $GIT_TO $GIT_CC --confirm=always --no-chain-reply-to --suppress-cc=all $PATCH"
>> -                       else
>> -                               # Send the patch to the specified recipients and
>> -                               # those git finds in this specific patch.
>> -                               eval "git send-email $GIT_TO --confirm=always --no-chain-reply-to --signed-off-by-cc $PATCH"
>> -                       fi
>> -               else
>> -                       # Only send to the explicitly specified recipients
>> -                       eval "git send-email $GIT_TO --confirm=always --no-chain-reply-to --suppress-cc=all $PATCH"
>> -               fi
>> -               if [ $? -eq 1 ]; then
>> -                       ERROR=1
>> -               fi
>> -       done
>> -
>> -       if [ $ERROR -eq 1 ]; then
>> -               echo "ERROR: Failed to send one or more messages."
>> +# Handoff to git-send-email. It will perform the send confirmation.
>> +PATCHES=$(echo $PDIR/*.patch)
>> +if [ $AUTO_CL -eq 1 ]; then
>> +       # Send the cover letter to every recipient, both specified as well as
>> +       # harvested. Then remove it from the patches list.
>> +       eval "git send-email $GIT_TO $GIT_CC --confirm=always --no-chain-reply-to --suppress-cc=all $CL"
>> +       if [ $? -eq 1 ]; then
>> +               echo "ERROR: failed to send cover-letter with automatic recipients."
>> +               exit 1
>>        fi
>> -else
>> -       echo "Send aborted."
>> +       PATCHES=${PATCHES/"$CL"/}
>>  fi
>>
>> +# Send the patch to the specified recipients and, if -c was specified, those git
>> +# finds in this specific patch.
>> +eval "git send-email $GIT_TO --confirm=always --no-chain-reply-to $GITSOBCC $PATCHES"
>> +if [ $? -eq 1 ]; then
>> +       echo "ERROR: failed to send patches."
>> +       exit 1
>> +fi
> 
> 
> now it will ask the usual git confirmation once for all the patches
> are now mentioned on the commandline instead of a loop.
> So I can say 'a'  all in the confirmation and then it will take that
> to send all patches. Is my understanding right ?
> 
> If so then it seems ok to me

That is the case if -a is not used. If -a is used, then you will get a
git confirmation for the cover letter and another for the rest of the
series, which you can say 'a' to and send all of them. This is because
-a uses a different recipients list for the cover-letter than the rest
of the patches.

This also allows for a dry-run by:

yes "n" | send-pull-request ...


> 
>> --
>> 1.7.1
>>
>>

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


