Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2E830601A0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 15:50:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s49Fo8xw000564
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 May 2014 08:50:08 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Fri, 9 May 2014 08:50:08 -0700
Message-ID: <536CF931.8070705@windriver.com>
Date: Fri, 9 May 2014 10:50:09 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, "Burton, Ross" <ross.burton@intel.com>
References: <1399591490-13000-1-git-send-email-mark.hatle@windriver.com>	<CAJTo0LZ75OkvT+yNkbczmqVT1=xSCu1PZainWDyWXAy8Frro+Q@mail.gmail.com>
	<536CF0E6.9060800@windriver.com> <536CF4D3.6020701@linux.intel.com>
In-Reply-To: <536CF4D3.6020701@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: Add /run/lock as a standard directory
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
X-List-Received-Date: Fri, 09 May 2014 15:50:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/9/14, 10:31 AM, Saul Wold wrote:
> On 05/09/2014 08:14 AM, Mark Hatle wrote:
>> On 5/9/14, 4:16 AM, Burton, Ross wrote:
>>> On 9 May 2014 00:24, Mark Hatle <mark.hatle@windriver.com> wrote:
>>>> The /run/lock directory was being dynamically created during package
>>>> install,
>>>> but should have been owned by the base-files package.
>>>
>>> Doesn't do_install generate the /var/run/lock -> /run/lock symlink, as
>>> /run is always a tmpfs so has to be populated on boot?
>>>
>>
>> The /var/run/lock -> /run/lock symlink is generated, but the /run/lock
>> is never created by anything that I could find.
>>
>> /run is not always a tmpfs...  We've got configurations where it's
>> persistent.
>>
>> With that said, the fix may be incorrect though if something is
>> generally used to create this as a tmpfs, which package would normally
>> create the directory and populate it?  the volatiles code?
>>
>
> Ross is almost correct here, there is a link generated from via the
> volatiles file in initscripts recipe, which will be created during
> package install time.

We still have the packaging issue though.  Nothing 'owns' that directory, yet 
other package(s) reference it.  At a minimum something should own it (or it 
needs to get shoved into the /etc/rpm/sysinfo/Dirnames file to show yes, the 
directory really is available.)

/proc/mounts has always been an issue since it's owned by the system, but that 
can be dealt with using the same type of this /etc/rpm/sysinfo/Providenames....

(There is a feature enhancement in the YP bugzilla to more easily support a 
persistent filesystem, vs always using the volatiles..  we probably should drop 
this for now and come back around when that is investigated.)

--Mark

> Sau!
>
>> --Mark
>>
>>> Ross
>>>
>>


