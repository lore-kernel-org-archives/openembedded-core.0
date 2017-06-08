Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 454D17827E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 17:23:46 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2017 10:23:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="271901326"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 08 Jun 2017 10:23:44 -0700
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1496932793.git.alexander.kanavin@linux.intel.com>
	<ea2b0fd4184df2bf7cc703bc0e195aa2dda1049b.1496932793.git.alexander.kanavin@linux.intel.com>
	<5cac68b8-6bf7-4453-d75a-45d8b9887d99@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <3ed4da32-b4c2-69f1-c93f-9cc5ffb83dd6@linux.intel.com>
Date: Thu, 8 Jun 2017 20:23:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <5cac68b8-6bf7-4453-d75a-45d8b9887d99@windriver.com>
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
X-List-Received-Date: Thu, 08 Jun 2017 17:23:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2017 07:55 PM, Mark Hatle wrote:
>> +@@ -565,8 +559,8 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
>> + 	headerCopyTags(spec->packages->header, pkg->header, copyTags);
>> + 	
>> + 	headerPutString(pkg->header, RPMTAG_RPMVERSION, VERSION);
>> +-	headerPutString(pkg->header, RPMTAG_BUILDHOST, buildHost());
>> +-	headerPutUint32(pkg->header, RPMTAG_BUILDTIME, getBuildTime(), 1);
>> ++	headerPutString(pkg->header, RPMTAG_BUILDHOST, buildHost);
>> ++	headerPutUint32(pkg->header, RPMTAG_BUILDTIME, &buildTime, 1);
>
> I don't see what the advantage of this change over the current approach is --
> unless the first call is in a thread so the variable can clash.  If that is the
> case, it may make more sense to ensure that these two are run very early in the
> build process before it threads.

They're run from threads, and they do clash, and I had spent a whole day 
tracing data corruption coredumps back to these two.

This is explained in the commit message:

"Their use is causing difficult to diagnoze data races when building 
multiple packages in parallel..."

And I had changed the code so that they're run early in the build 
process, and just once. See below...


>> +@@ -629,6 +623,8 @@ static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const c
>> +     struct binaryPackageTaskData *tasks = NULL;
>> +     struct binaryPackageTaskData *task = NULL;
>> +     struct binaryPackageTaskData *prev = NULL;
>> ++    rpm_time_t buildTime = getBuildTime();
>> ++    char *host = buildHost();
>> +
>> +     for (Package pkg = spec->packages; pkg != NULL; pkg = pkg->next) {
>> +         task = rcalloc(1, sizeof(*task));


^^^^ right there.

Please read the code more carefully :-)


Alex

