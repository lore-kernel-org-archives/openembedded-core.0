Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A0C1E788E0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 11:45:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Mar 2018 04:45:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,344,1517904000"; d="scan'208";a="44359589"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 22 Mar 2018 04:45:04 -0700
To: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1521503987-70014-1-git-send-email-ee.peng.yeoh@intel.com>
	<cec1c204-c8c1-74da-d89d-bba2ed0d369c@linux.intel.com>
	<9DDD2658D1FE414E99172D2DB1E4D04335DFA1B9@PGSMSX109.gar.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <a60cf40f-d4f3-c8a1-fa2b-42e31cc91518@linux.intel.com>
Date: Thu, 22 Mar 2018 13:38:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <9DDD2658D1FE414E99172D2DB1E4D04335DFA1B9@PGSMSX109.gar.corp.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] oe-selftest: crosstap: add tests for crosstap script
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
X-List-Received-Date: Thu, 22 Mar 2018 11:45:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/22/2018 02:50 AM, Yeoh, Ee Peng wrote:
>  From my understanding, oeqa.utils.commands.runqemu will start and stop qemu in a single call.

That's not the case at all. Please look at the example below again:

                     with runqemu('core-image-minimal') as qemu:
                          # Make the test echo a string and search for 
that as
                          # run_serial()'s status code is useless.'
                          for filename in ("rootfs", "delayed-a",
"delayed-b"):
                              status, output = qemu.run_serial("test -f 
%s && echo found" % os.path.join(targettestdir, filename))
                              self.assertEqual(output, "found", "%s was 
not present on boot" % filename)

It starts qemu, then does things (qemu.run_serial() ) with that running 
qemu instance. How and where qemu gets stopped is the 'magic' of 'with' 
statement.

The key part is that runqemu() has a @contextmanager decorator and 
contains this statement inside:

	yield qemu

which 'suspends' the runqemu() execution and resumes the caller 
function, passing it the qemu object. Once the 'with' block completes in 
the caller, the runqemu() function is allowed to resume and clean up the 
running qemu instance. It's definitely not a synchronous call/return 
thing. You can read all about it here:

https://docs.python.org/3/library/contextlib.html


> For crosstap testcase, it require the steps below:
> 	- start qemu
> 	- call to crosstap to ssh into qemu to use systemtap
> 	- stop qemu
> 
> Therefore, crosstap testcase use the oeqa.targetcontrol.QemuTarget (used by runqemu) to first start qemu, perform call to crosstap, then stop qemu.

runqemu() was written for precisely this use case.


Alex

