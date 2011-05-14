Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QL4GV-0005kl-3E
	for openembedded-core@lists.openembedded.org;
	Sat, 14 May 2011 04:07:35 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 May 2011 19:04:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,367,1301900400"; 
   d="scan'208";a="2061037"
Received: from unknown (HELO [10.255.12.78]) ([10.255.12.78])
	by fmsmga001.fm.intel.com with ESMTP; 13 May 2011 19:04:44 -0700
Message-ID: <4DCDE342.2080403@linux.intel.com>
Date: Fri, 13 May 2011 19:04:50 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1305329659.git.dvhart@linux.intel.com>	<dda204962f3a3818351452fc0eae4c8364b685ae.1305329659.git.dvhart@linux.intel.com>
	<1305332074.2023.62.camel@scimitar>
In-Reply-To: <1305332074.2023.62.camel@scimitar>
Subject: Re: [RFC PATCH 03/10] create-pull-request: use git request-pull and arbitrary remotes
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
X-List-Received-Date: Sat, 14 May 2011 02:07:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/13/2011 05:14 PM, Joshua Lock wrote:
> On Fri, 2011-05-13 at 16:37 -0700, Darren Hart wrote:
>> Allow for arbitrary remotes via a new -u argument. Remove the hard coded
>> references to the pokylinux repositories. Create the WEB_URL from known
>> remotes. Future patches can add additional WEB_URL mappings for remotes
>> like Git Hub, Gitorious, and kernel.org.
>>
>> Rather than duplicating the git request-pull command ourselves, just use
>> the existing one.
>>
>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>> Cc: Tom Rini <tom_rini@mentor.com>
>> Cc: Martin Jansa <martin.jansa@gmail.com>
>> Cc: Otavio Salvador <otavio@ossystems.com.br>
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  scripts/create-pull-request |   74 ++++++++++++++++++++++++++++--------------
>>  1 files changed, 49 insertions(+), 25 deletions(-)
>>
>> diff --git a/scripts/create-pull-request b/scripts/create-pull-request
>> index b7e015a..c6cf817 100755
>> --- a/scripts/create-pull-request
>> +++ b/scripts/create-pull-request
>> @@ -2,14 +2,13 @@
>>  ODIR=pull-$$
>>  RELATIVE_TO="master"
>>  COMMIT_ID="HEAD"
>> -PULL_URL="git://git.pokylinux.org/poky-contrib.git"
>>  PREFIX="PATCH"
>>  
>>  usage() {
>>  CMD=$(basename $0)
>>  cat <<EOM
>> -Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to] [-i commit_id] -b contrib_branch
>> -  -b contrib_branch   Branch-name in the git.pokylinux.org/poky-contrib tree
>> +Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to] [-i commit_id] -u remote -b branch
>> +  -b branch           Branch name in the specified remote
>>    -h                  Display this help message
>>    -i commit_id        Ending commit (default: HEAD)
>>    -m msg_body_file    The file containing a blurb to be inserted into the summary email
>> @@ -17,20 +16,21 @@ Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to
>>    -p prefix           Use [prefix N/M] instead of [PATCH N/M] as the subject prefix
>>    -r relative_to      Starting commit (default: master)
>>    -s subject          The subject to be inserted into the summary email
>> +  -u remote           The git remote where the branch is located
>>  
>>   Examples:
>> -   $CMD -b nitin/basic
>> -   $CMD -r distro/master -i nitin/distro -b nitin/distro
>> -   $CMD -r master -i misc -b nitin/misc -o pull-misc
>> -   $CMD -p "RFC PATCH" -b nitin/experimental
>> +   $CMD -u contrib -b nitin/basic
>> +   $CMD -u contrib -r distro/master -i nitin/distro -b nitin/distro
>> +   $CMD -u contrib -r master -i misc -b nitin/misc -o pull-misc
>> +   $CMD -u contrib -p "RFC PATCH" -b nitin/experimental
>>  EOM
>>  }
>>  
>>  # Parse and validate arguments
>> -while getopts "b:hi:m:o:p:r:s:" OPT; do
>> +while getopts "b:hi:m:o:p:r:s:u:" OPT; do
>>  	case $OPT in
>>  	b)
>> -		CONTRIB_BRANCH="$OPTARG"
>> +		BRANCH="$OPTARG"
>>  		;;
>>  	h)
>>  		usage
>> @@ -58,23 +58,42 @@ while getopts "b:hi:m:o:p:r:s:" OPT; do
>>  	s)
>>  		SUBJECT="$OPTARG"
>>  		;;
>> +	u)
>> +		REMOTE="$OPTARG"
>> +		REMOTE_URL=$(git config remote.$REMOTE.url)
>> +		if [ $? -ne 0 ]; then
>> +			echo "ERROR: git config failed to find a url for '$REMOTE'"
>> +			exit 1
>> +		fi
>> +		;;
>>  	esac
>>  done
>>  
>> -if [ -z "$CONTRIB_BRANCH" ]; then
>> +if [ -z "$BRANCH" ] || [ -z "$REMOTE_URL" ]; then
>>  	usage
>>  	exit 1
>>  fi
>>  
>>
>> +# Set WEB_URL from known remotes
>> +case "$REMOTE_URL" in
>> +	*git.yoctoproject.org*)
>> +		WEB_URL="http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=$BRANCH"
>> +		;;
>> +	*git.pokylinux.org*)
>> +		WEB_URL="http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=$BRANCH"
>> +		;;
>> +esac
> 
> Nit: what about if this is a remote branch on that server but not for
> that repo?

Doh, that isn't a nit, that's a bug. Thanks for catching it!

--
Darren

> 
>> +
>>  # Perform a sanity test on the web URL. Issue a warning if it is not
>>  # accessible, but do not abort as users may want to run offline.
>> -WEB_URL="http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=$CONTRIB_BRANCH"
>> -wget -q $WEB_URL -O /dev/null
>> -if [ $? -ne 0 ]; then
>> -	echo "WARNING: Branch '$CONTRIB_BRANCH' was not found on the contrib git tree."
>> -	echo "         Please check your contrib-branch parameter before sending."
>> -	echo ""
>> +if [ -n "$WEB_URL" ]; then
>> +	wget -q $WEB_URL -O /dev/null
>> +	if [ $? -ne 0 ]; then
>> +		echo "WARNING: Branch '$BRANCH' was not found on the contrib git tree."
>> +		echo "         Please check your remote and branch parameter before sending."
>> +		echo ""
>> +	fi
>>  fi
>>  
>>  if [ -e $ODIR ]; then
>> @@ -90,18 +109,23 @@ git format-patch -M --subject-prefix="$PREFIX" -n -o $ODIR --thread=shallow --co
>>  
>>  # Customize the cover letter
>>  CL="$ODIR/0000-cover-letter.patch"
>> -(cat <<EOM
>> +PM="$ODIR/pull-msg"
>> +git request-pull $RELATIVE_TO $REMOTE_URL $COMMIT_ID > "$PM"
>> +if [ $? -ne 0 ]; then
>> +	echo "ERROR: git request-pull reported an error"
>> +	exit 1
>> +fi
>>  
>> -Pull URL: $PULL_URL
>> -  Branch: $CONTRIB_BRANCH
>> -  Browse: $WEB_URL
>> +# The cover letter already has a diffstat, remove it from the pull-msg
>> +# before inserting it.
>> +sed -n "0,\#$REMOTE_URL# p" "$PM" | sed -i "/BLURB HERE/ r /dev/stdin" "$CL"
>> +rm "$PM"
>>  
>> -Thanks,
>> -    $(git config user.name) <$(git config user.email)>
>> ----
>> +# Insert the WEB_URL if there is one
>> +if [ -n "$WEB_URL" ]; then
>> +	echo "  $WEB_URL" | sed -i "\#$REMOTE_URL# r /dev/stdin" "$CL"
>> +fi
>>  
>> -EOM
>> -) | sed -i "/BLURB HERE/ r /dev/stdin" "$CL"
>>  
>>  # If the user specified a message body, insert it into the cover letter and
>>  # remove the BLURB token.
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


