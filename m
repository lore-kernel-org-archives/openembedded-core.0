Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D53A57829E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 20:29:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v58KT6qk020448
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Jun 2017 13:29:06 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 8 Jun 2017 13:29:05 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1496932793.git.alexander.kanavin@linux.intel.com>
	<ea2b0fd4184df2bf7cc703bc0e195aa2dda1049b.1496932793.git.alexander.kanavin@linux.intel.com>
	<5cac68b8-6bf7-4453-d75a-45d8b9887d99@windriver.com>
	<3ed4da32-b4c2-69f1-c93f-9cc5ffb83dd6@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <65c9f0c2-a269-904d-85ff-3a3c8484328c@windriver.com>
Date: Thu, 8 Jun 2017 15:29:05 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <3ed4da32-b4c2-69f1-c93f-9cc5ffb83dd6@linux.intel.com>
Subject: Re: [PATCHv2 2/2] rpm: run binary package generation via thread pools
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
X-List-Received-Date: Thu, 08 Jun 2017 20:29:07 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/8/17 12:23 PM, Alexander Kanavin wrote:
> On 06/08/2017 07:55 PM, Mark Hatle wrote:
>>> +@@ -565,8 +559,8 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
>>> + 	headerCopyTags(spec->packages->header, pkg->header, copyTags);
>>> + 	
>>> + 	headerPutString(pkg->header, RPMTAG_RPMVERSION, VERSION);
>>> +-	headerPutString(pkg->header, RPMTAG_BUILDHOST, buildHost());
>>> +-	headerPutUint32(pkg->header, RPMTAG_BUILDTIME, getBuildTime(), 1);
>>> ++	headerPutString(pkg->header, RPMTAG_BUILDHOST, buildHost);
>>> ++	headerPutUint32(pkg->header, RPMTAG_BUILDTIME, &buildTime, 1);
>>
>> I don't see what the advantage of this change over the current approach is --
>> unless the first call is in a thread so the variable can clash.  If that is the
>> case, it may make more sense to ensure that these two are run very early in the
>> build process before it threads.
> 
> They're run from threads, and they do clash, and I had spent a whole day 
> tracing data corruption coredumps back to these two.
> 
> This is explained in the commit message:
> 
> "Their use is causing difficult to diagnoze data races when building 
> multiple packages in parallel..."
> 
> And I had changed the code so that they're run early in the build 
> process, and just once. See below...

Yes, but you were no longer calling them and moved to passing in a variable.
The point of my comment is two fold.

One, by changing the behavior of the function you now HAVE to record the value
or if you run it again you will get a different result.  (Likely not what is
desired in the general case...)

..and two you also had to change the function calls to pass in this single value.

Assuming that moving the call earlier (like you did) works, and the static
values are retrievable by the function.  You could have fixed this with the
snipped below (without storing the values).  This would simplify the patch.

(If there is something in the way the threads work with openmp that makes the
static variable not transfer from the main execution thread to the children
threads -- that is a different issue and should be stated in the commit.)

> 
>>> +@@ -629,6 +623,8 @@ static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const c
>>> +     struct binaryPackageTaskData *tasks = NULL;
>>> +     struct binaryPackageTaskData *task = NULL;
>>> +     struct binaryPackageTaskData *prev = NULL;
>>> ++    rpm_time_t buildTime = getBuildTime();
>>> ++    char *host = buildHost();
>>> +
>>> +     for (Package pkg = spec->packages; pkg != NULL; pkg = pkg->next) {
>>> +         task = rcalloc(1, sizeof(*task));
> 
> 
> ^^^^ right there.
> 
> Please read the code more carefully :-)
> 
> 
> Alex
> 


