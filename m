Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 42D5F6FEE0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 21:20:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8ILK8kC012783
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Sep 2017 14:20:08 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 18 Sep 2017 14:20:07 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <d8c3aa94-8f9f-2d06-0dac-9c46a1639505@windriver.com>
	<CAJ86T=XSXk4DGhJqDT4hmKO1BK0y-39rFc7r_codDWf72vAoCg@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <41556f05-e92c-1962-99af-97d1812909d1@windriver.com>
Date: Mon, 18 Sep 2017 16:20:07 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=XSXk4DGhJqDT4hmKO1BK0y-39rFc7r_codDWf72vAoCg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain / /bin/sh requirement / ldconfig backfill
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
X-List-Received-Date: Mon, 18 Sep 2017 21:20:08 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/18/17 4:05 PM, Andre McCurdy wrote:
> On Mon, Sep 18, 2017 at 12:30 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>
>> Because of this, there is no way (with a default configuration) to build
>> meta-toolchain....
>>
>> Investigating further, ldconfig support moved from "USE_LDCONFIG" to a
>> distribution configuration.  It does this via the "DISTRO_FEATURES_BACKFILL"
>> (introduced in commit: a905df2dd8f43a2febffa64a39b6e508510326a0)
> 
> The intention of that commit was only to change the way support for
> running ldconfig on the target is controlled (ie changed from an
> ad-hoc bitbake variable to a distro config option). It's enabled by
> default now, but it was enabled by default before that commit as well.
> 
> Did meta-toolchain work previously? If so, was USE_LDCONFIG being
> forced to 0 somewhere?

In many distributions, the default was 0.  The backfill change made the default
now '1'.  You have to know to 'skip' it, with the line below.

>> If I add to my configuration:
>>
>>  DISTRO_FEATURES_BACKFILL_CONSIDERED_append = " ldconfig"
>>
>> This works around the issue...  but doesn't resolve the default issue....
>>
>> So my question is, is this behavior (the failure case) really acceptable without
>> telling the user what is happening?  Or do we need to add something to the
>> system that says meta-toolchain can't be used with this DISTRO_FEATURE?  or...
>>
>> --Mark
>> --


