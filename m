Received: from smtp-relay2.palm.com ([64.28.152.243])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prvs=393c5c6b8=rich.pixley@palm.com>)
	id 1S0N0u-0007Eh-OD for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 01:58:28 +0100
X-IronPort-AV: E=Sophos;i="4.73,466,1325491200"; d="scan'208";a="11846391"
Received: from unknown (HELO ushqusdns4.palm.com) ([148.92.223.164])
	by smtp-relay2.palm.com with ESMTP; 22 Feb 2012 16:50:08 -0800
Received: from fuji.noir.com ([10.100.2.13])
	by ushqusdns4.palm.com (8.14.4/8.14.4) with ESMTP id q1N0o7gu029757;
	Wed, 22 Feb 2012 16:50:07 -0800
Message-ID: <4F458D3F.9020602@palm.com>
Date: Wed, 22 Feb 2012 16:50:07 -0800
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <4F457B4B.4000507@palm.com> <4F457D1A.8010707@linux.intel.com>
In-Reply-To: <4F457D1A.8010707@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: sharing DL_DIR?
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
X-List-Received-Date: Thu, 23 Feb 2012 00:58:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Excellent, thanks.  That's the news I was hoping for.

--rich

On 2/22/12 15:41 , Saul Wold wrote:
> On 02/22/2012 03:33 PM, Rich Pixley wrote:
>> Is it reasonable to expect to share DL_DIR between multiple builds?
>>
> Absolutely, We share DL_DIR via NFS across multiple machines and builds.
>
>> That is, are downloads properly locked so that multiple concurrent
>> downloads of the same file won't collide? And if so, are they NFS safe
>> locks?
>>
> Yes, as far as I know.
>
>> Or must each build download it's own copies of every component?
>>
> No need.
>
>> I ask because our, (Palm), branch has been, but it's a bit of a nuisance
>> to pick a suitable locking mechanism that is both functional and performant.
>>
>>    * Flock/lockf aren't reliably supported in heterogeneous environments.
>>    * The old lockfiles don't work over NFS. Lock directories apparently
>>      do, but trying to clean these up after interruptions or failures is
>>      a losing battle so if we do use these, we end up with orphan locks
>>      periodically.
>>    * With NFS as a possibility, we can't assume any kernel local IPC
>>      mechanism, so sysV ipc is out.
>>    * It seems like a pretty huge overhead to try to create any sort of
>>      zeroconf overhead.
>>
>> Our solution so far has been to use NFS lock directories for multiple
>> machine builds and flock/lockf for single machine builds. This mostly
>> works, though it's not ideal, and it's significantly faster than
>> downloading/copying all of the component source multiple times even over
>> local mirrors.
>>
> I think we are using a very basic locking mechism that creates the
> lockfile and a donefile when complete.  It seems to work well enough.
>
> Sau!
>
>> --rich
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


