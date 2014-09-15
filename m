Return-Path: <ed.swarthout@hdebug.com>
X-Greylist: delayed 308 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 15 Sep 2014 05:15:20 UTC
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
	by mail.openembedded.org (Postfix) with ESMTP id A8EF06FE3B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 05:15:20 +0000 (UTC)
Received: from [192.168.8.4] (cpe-70-116-37-180.austin.res.rr.com
	[70.116.37.180])
	by mrelay.perfora.net (node=mreueus002) with ESMTP (Nemesis)
	id 0M3kcZ-1YKXIi1Xof-00rJgJ; Mon, 15 Sep 2014 07:10:07 +0200
Message-ID: <541674AA.8070102@hdebug.com>
Date: Mon, 15 Sep 2014 00:10:02 -0500
From: Ed Swarthout <ed.swarthout@hdebug.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org, alexandra.safta@enea.com
X-Provags-ID: V02:K0:ibopljGLS9wvAEdZm1I6xDBnO57fwWembXf2ZhEuXia
	5J2uk0p4scjg1HrgECE9SrPcymmyIwCBhturEZRNa6XK5L5Xkm
	wRqTl4AcOJ1ps+/rBelBstlISy6lv4xrIef57B7bhVmMmtLLwZ
	ww59PfSu5wapI6Sz6wwImrguoq96ACoSMF8+r5GvxHzeZdMAT2
	fn3RvdeVvaQP3dFyLntUPTcIhnv40VJ291NnMe54khti1YNiuF
	Qd431crySqE5PSNHuozgZRP0GsrtuMjPXJehgR27KO448rr1j7
	hHiSI2/qVsMqPuu+0DUc3oKN14mHVr6abw/PhNt0MilzkM/2wq
	Eq+hCyN3p6j97My1W9DiRP5C1fs1ya4SMNy3zvZhv
X-UI-Out-Filterresults: notjunk:1;
Subject: udev ptest leaves symlink loops in target sysroots
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
X-List-Received-Date: Mon, 15 Sep 2014 05:15:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I've been working on qemu crashes for the blacklisted emacs build.
As one of the fixes it would be nice to point qemu directly to the 
target sysroots directory to find the loader. But this causes qemu to 
hang because there are symlink loops in the directory tree and it does 
not know how to ignore loops.

It looks like udev ptest is the culprit:

/f/deb/home/yocto/yocto/build2014/tmp/sysroots/qemuppc/usr/lib/udev/ptest/test/sys/block/loop0/subsystem/loop0/subsystem:
   total used in directory 8 available 55515512
   drwxr-xr-x  2 ed ed0 4096 Aug 24 10:51 .
   lrwxrwxrwx  1 ed ed0   33 Aug 24 10:51 loop0 -> 
../../devices/virtual/block/loop0
   lrwxrwxrwx  1 ed ed0   33 Aug 24 10:51 loop1 -> 
../../devices/virtual/block/loop1
   lrwxrwxrwx  1 ed ed0   33 Aug 24 10:51 loop2 -> 
../../devices/virtual/block/loop2
   lrwxrwxrwx  1 ed ed0   33 Aug 24 10:51 loop3 -> 
../../devices/virtual/block/loop3

Does it have to leave these there after it completes the test?

Ed

Ed Swarthout
Austin, Tx

