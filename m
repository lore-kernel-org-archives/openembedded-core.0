Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1SSHvm-00059K-Km
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 03:12:34 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 May 2012 18:01:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="141161627"
Received: from unknown (HELO [10.255.13.30]) ([10.255.13.30])
	by azsmga001.ch.intel.com with ESMTP; 09 May 2012 18:01:35 -0700
Message-ID: <4FAB136F.80800@linux.intel.com>
Date: Wed, 09 May 2012 18:01:35 -0700
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1336608479.git.josh@linux.intel.com>
	<934fed48b0c07e606c80023ba045c6c2471bf1b0.1336608479.git.josh@linux.intel.com>
	<4FAB0B6A.6010303@linux.intel.com>
In-Reply-To: <4FAB0B6A.6010303@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 3/3] sstate.bbclass: ensure sstate files are easily shared
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
X-List-Received-Date: Thu, 10 May 2012 01:12:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 09/05/12 17:27, Saul Wold wrote:
> On 05/09/2012 05:22 PM, Joshua Lock wrote:
>> In order to make sstate cache's more easily shared ensure any user of
>> the system has rwx permission by calling chown on sstate files after
>> they're created.
>>
>> Signed-off-by: Joshua Lock<josh@linux.intel.com>
>> ---
>> meta/classes/sstate.bbclass | 1 +
>> 1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
>> index a8c98e5..6707ecf 100644
>> --- a/meta/classes/sstate.bbclass
>> +++ b/meta/classes/sstate.bbclass
>> @@ -454,6 +454,7 @@ sstate_create_package () {
>> else
>> tar -cz --file=$TFILE --files-from=/dev/null
>> fi
>> + chmod 0777 $TFILE
>> mv $TFILE ${SSTATE_PKG}
>>
>> cd ${WORKDIR}
> Why execute permission, and should it not be restricted to 664 for group
> level write access? Why would multiple users be writing to the same
> sstate file anyways once it's there it could be read-only since a change
> will trigger a new sstate file, not a re-write of the existing one.

For permissions I figured that whichever I went with someone would have 
an alternative suggestion so I went with as indiscriminate as possible 
- that's the main reason this is an RFC.

When I was reproducing the bug and had read-only siginfo file things 
blew up, so I created them writeable, see [1].

Cheers,
Joshua

1. https://bugzilla.yoctoproject.org/show_bug.cgi?id=2041#c9
-- 
Joshua Lock
         Yocto Project
         Intel Open Source Technology Centre


