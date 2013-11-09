Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C3876D320
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2013 05:26:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA95QX40015762
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Nov 2013 21:26:33 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Fri, 8 Nov 2013 21:26:33 -0800
Message-ID: <527DC789.6050307@windriver.com>
Date: Sat, 9 Nov 2013 13:26:33 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1383558655.git.hongxu.jia@windriver.com>
	<1383565168.6271.107.camel@ted>
In-Reply-To: <1383565168.6271.107.camel@ted>
X-Originating-IP: [128.224.162.213]
Subject: Re: [PATCH V2 0/5] fix WARNING: QA Issue on kmod/udev/nfs-utils (unsafe references [/ references to /usr/lib])
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
X-List-Received-Date: Sat, 09 Nov 2013 05:26:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2013 07:39 PM, Richard Purdie wrote:
> On Mon, 2013-11-04 at 17:56 +0800, Hongxu Jia wrote:
>> Change in V2: The fourth patch fixed the QA Issue on udev, it was missed on previous version.
>>
>> //Hongxu
>>
>> The following changes since commit f3541226b8b1187e79dec0f6f9f3c58cedf9ac9b:
>>
>>    bitbake: hob: do not display the "Package list may be incomplete!" dialog (2013-11-01 17:59:31 +0000)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib hongxu/fix-qa-issue
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-qa-issue
>>
>> Hongxu Jia (5):
>>    insane.bbclass: support to skip  unsafe references in binaries qa
>>      check.
>>    kmod: fix QA issue
>>    udev: fix  QA issue
>>    udev: fix QA issue
>>    nfs-utils: fix QA issue
> Last time these warnings came up I asked for a clear plan about what
> needed to live in / and what needed to live in /usr and how we were
> going to fix things once and for all (or forget this idea).
>
> Where is the plan? Why is it ok to just ignore these particular
> warnings?
>
> Cheers,
>
> Richard

Hi Richard,

I want to propose the following solution for this unsafe reference issue.

The solution is based on the following two principles.
1. With /usr on a seperate partition, system should boot up without any error.
2. Without /usr, system should be able to boot into single user mode without any error.

When a QA warning about unsafe references is encountered, the above two principles,
together with FHS, are taken into consideration before making a decision.

For example, libkmod is moved to /lib because /lib/udevd requires it; libgudevd
is moved to /usr/lib because it's a GObject wrapper for libudev and it's obviously
not necessary for booting into single user mode.

The final goals of the solution:
1. Performing a world build doesn't report any warning about unsafe references.
2. System can boot into runlevel 5 without any error if /usr is on another partition.
3. System can boot into single user mode without any error even if /usr is missing.


Patches of this solution have been sent to this mailing list.

Best Regards,
Chen Qi

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


