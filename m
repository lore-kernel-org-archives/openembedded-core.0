Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id E5B886B7C2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 17:26:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.95,632,1384300800"; d="scan'208";a="51840244"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 09 Jan 2014 17:26:07 +0000
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>) id 1W1JMr-0004Uo-PB
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jan 2014 17:26:05 +0000
Date: Thu, 9 Jan 2014 17:26:05 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Message-ID: <20140109172605.GA15422@mcrowe.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: sstate-diff-machines.sh encounters IndexError
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
X-List-Received-Date: Thu, 09 Jan 2014 17:26:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I just got round to trying sstate-diff-machines.sh in order to find out why
some of our recipes are thwarting the sstate cache but I couldn't make it
work. :(

With current oe-core 1028ac813fa9803ebfff6bcfa7f8b67012609b27 and bitbake
e13acb4113ce75226664c3006a9776cc885e860d I get the following error:

$ sstate-diff-machines.sh --tmpdir=tmp-eglibc --machines=qemux86 --targets=gcc-cross

[...]
NOTE: Reparsing files to collect dependency data
ERROR: An uncaught exception occured in runqueue, please see the failure below:
ERROR: Running idle function
Traceback (most recent call last):
  File "/vg0disk/mac/src/oe-core/bitbake/lib/bb/server/process.py", line 133, in ProcessServer.idle_commands(delay=0.1, fds=[<read-only Connection, handle 4>, <read-write Connection, handle 7>]):
                 try:
    >                retval = function(self, data, False)
                     if retval is False:
  File "/vg0disk/mac/src/oe-core/bitbake/lib/bb/cooker.py", line 1151, in buildTargetsIdle(server=<ProcessServer(ProcessServer-2, started)>, rq=<bb.runqueue.RunQueue instance at 0x2d118c0>, abort=False):
                 try:
    >                retval = rq.execute_runqueue()
                 except runqueue.TaskFailure as exc:
  File "/vg0disk/mac/src/oe-core/bitbake/lib/bb/runqueue.py", line 1082, in RunQueue.execute_runqueue():
             try:
    >            return self._execute_runqueue()
             except bb.runqueue.TaskFailure:
  File "/vg0disk/mac/src/oe-core/bitbake/lib/bb/runqueue.py", line 1034, in RunQueue._execute_runqueue():
                     self.dump_signatures()
    >                self.write_diffscenetasks(invalidtasks)
                     self.state = runQueueComplete
  File "/vg0disk/mac/src/oe-core/bitbake/lib/bb/runqueue.py", line 1227, in RunQueue.write_diffscenetasks(invalidtasks=set([4, 389, 136, 269, 399, 472, 147, 20, 279, 409, 159, 32, 289, 419, 169, 42, 299, 429, 179, 52, 309, 439, 189, 62, 319, 449, 199, 72, 329, 460, 209, 339, 88, 219, 349, 482, 229, 102, 359, 239, 369, 116, 379, 126, 255])):
                 matches = {k : v for k, v in matches.iteritems() if h not in k}
    >            latestmatch = sorted(matches.keys(), key=lambda f: matches[f])[-1]
                 prevh = __find_md5__.search(latestmatch).group(0)
IndexError: list index out of range

NOTE: Tasks Summary: Attempted 0 tasks of which 0 didn't need to be rerun and all succeeded.

Summary: There were 2 ERROR messages shown, returning a non-zero exit code.


Am I doing something silly or is this tool currently broken?

Thanks.

Mike.

