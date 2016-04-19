Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3C02C6FF9F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 12:29:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3JCTJgh000300
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Apr 2016 05:29:19 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Apr 2016 05:29:19 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>, Jeff Osier-Mixon
	<jefro@jefro.net>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
	<CALbNGRR0ySfXHZFgTAPGCi5sZXehjG3_vUzGobawrTW6-DOOVg@mail.gmail.com>
	<57152C67.1030508@windriver.com>
	<36528216.Z4AUpNFdWd@peggleto-mobl.ger.corp.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <5716249D.5010609@windriver.com>
Date: Tue, 19 Apr 2016 07:29:17 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <36528216.Z4AUpNFdWd@peggleto-mobl.ger.corp.intel.com>
Subject: Re: [PATCH 01/17] conf/bitbake.conf package.bbclass: fix dbg package not contain sources while -fdebug-prefix-map used
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
X-List-Received-Date: Tue, 19 Apr 2016 12:29:27 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 4/18/16 11:32 PM, Paul Eggleton wrote:
> On Mon, 18 Apr 2016 13:50:15 Mark Hatle wrote:
>> On 4/18/16 9:16 AM, Andreas Müller wrote:
>>> On Mon, Apr 18, 2016 at 3:55 PM, Burton, Ross <ross.burton@intel.com> 
> wrote:
>>>> On 18 April 2016 at 14:08, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>>>>> If sysroot is required, override DEBUG_FLAGS to remove
>>>>> -fdebug-prefix-map
>>>>
>>>> We should probably get this in the release notes, as many people do
>>>> indeed
>>>> want remote debug to work.
>>>>
>>>> Can you tell gdb the base path to use when looking for symbols?  I've not
>>>> done remote GDB for some time but wouldn't "set substitute-path /
>>>> //my/sysroot/" work?  Or maybe /usr /my/sysroot/usr?
>>>>
>>>> If gdb can't be told then instead of having to replace all of DEBUG_FLAGS
>>>> it would be neat if the prefix mapping variables where in another
>>>> variable that could just be unset.
>>>>
>>>> Ross
>>>
>>> OK I think I could live with removing -fdebug-prefix-map for now.
>>>
>>> A thought: We have the setting IMAGE_GEN_DEBUGFS - I have not yet
>>> tested. As far as I understand it creates an unstripped sysroot and
>>> does not affect target rootfs - is that correct? Does the sysroot
>>> created by IMAGE_GEN_DEBUGFS contain the sources? If yes we could set
>>> that as sysroot for gdb.
>>>
>>> I think one of the problems we have here is that there is no reference
>>> way documented (or it is outdated) how remote debugging is meant to be
>>> performed.
>>
>> Remote debugging is setup to always assume the remote side has access to a
>> debugable sysroot.  This isn't the project's sysroot, since that is
>> transient, but a REAL matching sysroot to the main image.
>>
>> The easiest way to do this is to add the following to your local.conf:
>>    IMAGE_GEN_DEBUGFS = '1'
>>
>> After this, look in your deploy directory and you will see the image to
>> deploy to the target, and also a matching 'debug' chunk that you keep on
>> your local host.  This way you -know- they are always in sync.
>>
>> There is class material from the various Yocto Project Dev Day classes on
>> using this.
> 
> I thought I'd seen this go into the manual but I can't seem to find it; I also 
> can't find said Dev Day class material online. Mark, would you be able to work 
> with Scott R to get this documented both within the variable reference and in 
> a task-oriented manner?
> 
> In the mean time, Jefro - is the recent dev day material available somewhere? 
> I can only find 2014 (ELCE Dusseldorf) under "Training" on the YP website.

(I thought these steps were documented as well, and also were part of the
beginner material.  But I've also not been able to find it -- as I've only got
the advanced class materials for Ireland and San Diego.)


The steps are in the Dusseldorf slides:

http://www.yoctoproject.org/bulk/devday-eu-2014/ypdd14-reyna-iot-hands-on-lab.pdf

Slide 28 shows the old way of producing the debugfs.  The new way is to use the
IMAGE_GEN_DEBUGFS = "1".  You then extract it (and the original rootfs) into a
single directory.  In the slides that directory is called "debugfs".


Start on slide 44.

The setup for GDB (on the host side):

(gdb) set sysroot debugfs
(gdb) set substitute-path /usr/src/debug debugfs/usr/src/debug
(gdb) file debugfs/usr/bin/morseapp

This assumes your CWD is the place with the exracted debugfs (produced by the
IMAGE_GEN_DEBUGFS = "1").

The substitute-path is what allows the (host) to find the matching symbols for
the items.  You simply set:

set substitute-path <piece of target path> <host equivalent>

By using the debugfs, you don't have to set this to 100 different locations, you
can simply use a single location.

--Mark

> Thanks,
> Paul
> 


