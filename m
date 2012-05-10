Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1SSW6j-0001eX-Vj
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 18:20:50 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 May 2012 09:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="139138566"
Received: from shamshir.jf.intel.com (HELO [10.24.5.145]) ([10.24.5.145])
	by orsmga001.jf.intel.com with ESMTP; 10 May 2012 09:10:54 -0700
Message-ID: <4FABE88E.4010002@linux.intel.com>
Date: Thu, 10 May 2012 09:10:54 -0700
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1336608479.git.josh@linux.intel.com>
	<4048abda9d53e155e0802663af9c78f542499e8e.1336608479.git.josh@linux.intel.com>
	<1336648944.2494.128.camel@ted>
In-Reply-To: <1336648944.2494.128.camel@ted>
Subject: Re: [RFC PATCH 2/3] lib/bb/siggen.py: create permissive files and directories
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
X-List-Received-Date: Thu, 10 May 2012 16:20:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 10/05/12 04:22, Richard Purdie wrote:
> On Wed, 2012-05-09 at 17:22 -0700, Joshua Lock wrote:
>> Create signature files, and the directories which contain them, with
>> rwx for everyone so that they are easily shared with different users
>> of the same machine.
>>
>> Signed-off-by: Joshua Lock<josh@linux.intel.com>
>> ---
>>   bitbake/lib/bb/siggen.py |    7 ++++++-
>>   1 files changed, 6 insertions(+), 1 deletions(-)
>>
>> diff --git a/bitbake/lib/bb/siggen.py b/bitbake/lib/bb/siggen.py
>> index 8c79b17..bd6d59b 100644
>> --- a/bitbake/lib/bb/siggen.py
>> +++ b/bitbake/lib/bb/siggen.py
>> @@ -201,7 +201,12 @@ class SignatureGeneratorBasic(SignatureGenerator):
>>               for dep in data['runtaskdeps']:
>>                   data['runtaskhashes'][dep] = self.taskhash[dep]
>>
>> -        p = pickle.Pickler(file(sigfile, "wb"), -1)
>> +        # Create file with permissive (0777) read/write for easier sharing
>> +        f = os.fdopen(os.open(sigfile, os.O_RDWR|os.O_CREAT), "wb")
>> +        # os.open() and os.fdopen() are affected by the users umask so brute force
>> +        # the permissions with a call to chmod
>> +        os.chmod(sigfile, 0777)
>> +        p = pickle.Pickler(f, -1)
>>           p.dump(data)
>
> Why not just run the chmod after the original pickle code? Its not as if
> you avoid a race this way :/.

Sure, that'd work as well.

Though from the general feedback it feels like this series is moot and 
all that we really want is a sanity check.

Cheers,
Joshua
-- 
Joshua Lock
         Yocto Project
         Intel Open Source Technology Centre


