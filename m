Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C7FF7F30C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 10:42:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x76AfwqT017256
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Aug 2019 03:41:58 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Tue, 6 Aug 2019 03:41:46 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton
	<ross.burton@intel.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1564741458.git.liezhi.yang@windriver.com>
	<6e12b495c74cfe8497e067fe1b4c4b823c6d4abe.1564741458.git.liezhi.yang@windriver.com>
	<67a9995b-8401-7308-bb0b-b6b81da03abb@intel.com>
	<30a064b664f500e1ad1c81c97c2e93bb78034e3c.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <c64de00e-d31d-0396-02ab-b351616e21dd@windriver.com>
Date: Tue, 6 Aug 2019 18:43:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <30a064b664f500e1ad1c81c97c2e93bb78034e3c.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/1] kill-bb: Add it for killing abnormal bitbake processes
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
X-List-Received-Date: Tue, 06 Aug 2019 10:42:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi RP and Ross,

It seems that I have figured out the root cause, I can reproduce the problem
nearly 100% when parsing:

$ kill-bb; rm -fr tmp-glibc/cache/default-glibc/qemux86/x86_64/bb_cache.dat* ; 
bitbake -p

Press *one* Ctrl-C when the parsing process is at 50%, then I can reproduce the 
problem:

Keyboard Interrupt, closing down...

Timeout while waiting for a reply from the bitbake server

It hangs at process.join(), according to:

https://docs.python.org/3.7/library/multiprocessing.html

See the section "Joining processes that use queues", it is because the
result_queue is not empty, here is a draft patch to fix the problem.

diff --git a/lib/bb/cooker.py b/lib/bb/cooker.py
index b4851e1..c11cfec 100644
--- a/lib/bb/cooker.py
+++ b/lib/bb/cooker.py
@@ -2062,6 +2062,14 @@ class CookerParser(object):
              for process in self.processes:
                  self.parser_quit.put(None)

+        # Cleanup the queue before call process.join(), otherwise there might be
+        # deadlocks.
+        while True:
+            try:
+               self.result_queue.get(timeout=0.25)
+            except queue.Empty:
+                break
+
          for process in self.processes:
              if force:
                  process.join(.1)

With this patch, I can't reproduce the problem any more, we may also need
cleanup parser_quit in theory, but I'm not sure since I can't reproduce
the problem anymore.

Now the output is:
Parsing recipes:  49% |##################################################### 
                                                   | ETA:  0:00:06
Keyboard Interrupt, closing down...

Parsing recipes: 100% 
|############################################################################################################| 
Time: 0:00:08
Parsing of 2804 .bb files complete (0 cached, 1428 parsed). 1987 targets, 1618 
skipped, 0 masked, 0 errors.
Execution was interrupted, returning a non-zero exit code.


I will send out the patch after more testing.

This patch can fix the *One* KeyboardInterrupt, there are other problems with
two KeyboardInterrupt (traceback), I will try to fix that.

// Robert

On 8/2/19 11:44 PM, Richard Purdie wrote:
> On Fri, 2019-08-02 at 11:21 +0100, Ross Burton wrote:
>> On 02/08/2019 11:24, Robert Yang wrote:
>>> There might be processes left after Ctr-C, e.g.:
>>> $ rm -f tmp/cache/default-glibc/qemux86/x86_64/
>>> $ bitbake -p
>>>
>>> Press 'Ctrl-C' multiple times during parsing, then bitbake
>>> processes may not
>>> exit, and the worse is that we can't start bitbake again, we can't
>>> always
>>> reproduce this, but sometime. We can only use "ps ux" to find the
>>> processes and
>>> kill them one by one. This tool can kill all of them easily.
>> I've noticed this, and also noticed that it got a lot worse recently.
>>
>> But let's fix bitbake instead of adding tools to work around it?
> 
> Heh. As someone who spends a lot of time trying to debug this, I must
> admit I could use such a script so I'm torn on this one!
> 
> Cheers,
> 
> Richard
> 
> 
> 

