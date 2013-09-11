Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 18E7C600A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 13:47:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8BDlXPh025666
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Sep 2013 06:47:33 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Wed, 11 Sep 2013 06:47:32 -0700
Message-ID: <52307475.9090901@windriver.com>
Date: Wed, 11 Sep 2013 08:47:33 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1378864775-7094-1-git-send-email-mark.hatle@windriver.com>
	<522FCFAD.2030400@windriver.com> <4927217.dsrI5AkMql@helios>
In-Reply-To: <4927217.dsrI5AkMql@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python-smartpm: Add an attempt install mode
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
X-List-Received-Date: Wed, 11 Sep 2013 13:47:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/13 5:04 AM, Paul Eggleton wrote:
> Hi Mark,
>
> On Tuesday 10 September 2013 21:04:29 Mark Hatle wrote:
>> Time measurements with:
>>
>> MACHINE = "qemux86"
>> PACKAGE_CLASSES = "package_rpm"
>> EXTRA_IMAGE_FEATURES = "dev-pkgs staticdev-pkgs doc-pkgs dbg-pkgs
>> ptest-pkgs" BB_NUMBER_THREADS ?= "8"
>> PARALLEL_MAKE ?= "-j 8"
>>
>> image: core-image-sato
>>
>> Quad Core i7 workstation...
>>
>> With all of the recipes built, and just executing the do_rootfs:
>>
>> Before this change:
>>    real    26m2.541s
>>    user    21m8.458s
>>    sys     7m9.683s
>>
>> After this change:
>>    real    14m43.436s
>>    user    15m57.525s
>>    sys     5m16.412s
>>
>> This is a significant performance boost when using the 'complementary'
>> installs and attemptonly installs.  The performance is by doing the
>> complementary installs as a batch instead of one at a time, ignoring
>> failures.
>
> This is a significant improvement, well done! My concern about not catching
> failures stands though, which is why I hadn't implemented this yet. How do we
> ensure that genuine failures are caught with this mode?

The code only ignores failures in the resolution of the dependencies.  As far as 
I'm aware, this is the correct behavior in the attempt only mode(s).  If the 
dependencies can't be resolved for some reason, we simply throw away that item 
and move on.

Any errors that occur during package installation -will- now cause a failure to 
exist, and they will be logged to the attemptonly log-file.

In the previous implementation, any error when installing an attemptonly package 
would be ignored, even if it turned out to be an installation problem and not a 
dependency issue.  So I think this is an improvement as well.

(For some of my testing I intentionally created dependency errors by adding 
things to the PACKAGE_EXCLUDE, and the system did what it was supposed to. 
Ignored the items that couldn't be installed.)

--Mark

> Cheers,
> Paul
>


