Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QL5Qo-0006o2-Ex
	for openembedded-core@lists.openembedded.org;
	Sat, 14 May 2011 05:22:18 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 May 2011 20:19:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,367,1301900400"; 
   d="scan'208";a="2072872"
Received: from unknown (HELO [10.255.12.78]) ([10.255.12.78])
	by fmsmga001.fm.intel.com with ESMTP; 13 May 2011 20:19:16 -0700
Message-ID: <4DCDF4BA.1000909@linux.intel.com>
Date: Fri, 13 May 2011 20:19:22 -0700
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
X-List-Received-Date: Sat, 14 May 2011 03:22:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


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


I'll roll a fix into V2, how about this:

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 43a4b74..869e6e8 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -70,6 +70,7 @@ while getopts "b:chi:m:o:p:r:s:u:" OPT; do
                        echo "ERROR: git config failed to find a url for '$REMOTE'"
                        exit 1
                fi
+               REMOTE_REPO=$(echo $REMOTE_URL | sed "s#.*/\(.*\)\(.git\)#\1#")
 
                # Rewrite known private URLs to public URLs
                case "$REMOTE_URL" in
@@ -97,10 +98,10 @@ fi
 # Set WEB_URL from known remotes
 case "$REMOTE_URL" in
        *git.yoctoproject.org*)
-               WEB_URL="http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=$BRANCH"
+               WEB_URL="http://git.yoctoproject.org/cgit.cgi/$REMOTE_REPO/log/?h=$BRANCH"
                ;;
        *git.pokylinux.org*)
-               WEB_URL="http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=$BRANCH"
+               WEB_URL="http://git.pokylinux.org/cgit.cgi/$REMOTE_REPO/log/?h=$BRANCH"
                ;;
 esac

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


