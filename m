Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1SSHya-0005Br-5r
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 03:15:28 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 May 2012 18:05:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="138878050"
Received: from unknown (HELO [10.255.13.30]) ([10.255.13.30])
	by orsmga001.jf.intel.com with ESMTP; 09 May 2012 18:05:33 -0700
Message-ID: <4FAB145D.4080001@linux.intel.com>
Date: Wed, 09 May 2012 18:05:33 -0700
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1336608479.git.josh@linux.intel.com>
	<CABcZANkTB3_QkBcMycY9Z+pZndz7JmOUAksvsQSSiwhHE7vZnQ@mail.gmail.com>
In-Reply-To: <CABcZANkTB3_QkBcMycY9Z+pZndz7JmOUAksvsQSSiwhHE7vZnQ@mail.gmail.com>
Cc: Chris Larson <clarson@kergoth.com>
Subject: Re: [RFC PATCH 0/3] Shared state for all !
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
X-List-Received-Date: Thu, 10 May 2012 01:15:28 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/05/12 17:50, Chris Larson wrote:
> On Wed, May 9, 2012 at 5:22 PM, Joshua Lock<josh@linux.intel.com>  wrote:
>> In Yocto #2041[2]  Mark reported an issue with reusing shared state as a
>> different user on the same machine.
>>
>> Since the whole purpose of shared state is that it be shared I decided to dig
>> into this issue. I wanted to at least be able to use the shared-state cache of
>> a different user without error, even if all of the objects aren't actually used
>> (i.e. native, at least on the Edison branch I did most of the testing with).
>>
>> This is an RFC mainly because it changes the permissions of created directories,
>> sstate files and siginfo files from what they have traditionally been.
>>
>> There is more of the rhyme an reason in the patch commit headers and comments
>> but tl;dr bb.mkdirhier directories will be 0777 (rwxrwxrwx) with this patch, as
>> will all of the contents of sstate-cache (siginfo and tgz) files.
>>
>> This is actually what one would expect from reading the Python API docs for
>> os.makedirs "The default mode is 0777 (octal)."[1] but not what actually happens
>> on most modern Linux systems thanks to umask.
>>
>> Please review the following changes for suitability for inclusion. If you have
>> any objections or suggestions for improvement, please respond to the patches. If
>> you agree with the changes, please provide your Acked-by.
>
> 777 seems questionable to me, personally. Generally collaboration
> happens amongst folks within a group, and chmod g+s makes that easier.
> I'd expect 775 to be a more sane value, myself.

Do you mean for bb.mkdirhier calls, the tgz files, the siginfo files or 
everything?

I went with 777 for mkdirhier as that's the default of os.makedirs 
before umask is involved. I would likely have picked rw-rw-r-- (664) if 
I weren't trying to request comments.

Cheers,
Joshua
-- 
Joshua Lock
         Yocto Project
         Intel Open Source Technology Centre


