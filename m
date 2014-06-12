Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1606165D6D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 12:07:01 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Jun 2014 05:07:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,464,1400050800"; d="scan'208";a="527396164"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 12 Jun 2014 05:07:01 -0700
Date: Thu, 12 Jun 2014 15:07:00 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: yzhu1 <Yanjun.Zhu@windriver.com>
Message-ID: <20140612120700.GA23988@lpalcu-linux>
References: <1402039028-17192-1-git-send-email-rongqing.li@windriver.com>
	<CAMKF1sp27ENENTNh6B0woVgh9AmY6zfpLX6Q19y1NciY8QUzKQ@mail.gmail.com>
	<53997D96.5040906@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53997D96.5040906@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] relocate_sdk.py: fix lib path error
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
X-List-Received-Date: Thu, 12 Jun 2014 12:07:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 12, 2014 at 06:14:46PM +0800, yzhu1 wrote:
> On 06/06/2014 08:22 PM, Khem Raj wrote:
> 
> 
> 
>     On Friday, June 6, 2014, <rongqing.li@windriver.com> wrote:
> 
>         From: yzhu1 <yanjun.zhu@windriver.com>
> 
>         In centos 5.9 32bit, ld lib does not contain some flags, so ld
>         lib is not parsed. So correct lib path is not got from ld lib.
> 
> 
>     Can you explain with examples what's going on here ?
> 
> Hi,
> 
> Before relocate_sdk.sh is executed, it needs the parameters: path/
> ld-linux-x86-64.so.2 path/dmesg.util-linux path/kill.util-linux path/
> reset.util-linux .....
> The file list (path/dmesg.util-linux path/kill.util-linux path/reset.util-linux
> .....) is collected by "grep '\(executable\|dynamically linked\)'".
> 
> So "dynamically linked" is very import to the file ld-linux-x86-64.so.2. But in
> redhat 5.9(32 bit)
> 
> This file is as below:
> 
> ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV), stripped
> 
> In Ubuntu 12.04 (64bit)
> 
> This file is as below:
> 
> ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV), dynamically
> linked, BuildID[sha1]=0xbb8c5184d8d41f31093193a2ec8d3f6f10964cd2, stripped
> 
> In this case, we can find in Ubuntu 12.04(64 bit), the flag "dynamically
> linked" is present, so ld-linux-x86-64.so.2 can be included in the file list.
> relocate_sdk.py can work according to the information from
> ld-linux-x86-64.so.2. But in redhat 5.9(32bit), the flag does not exist.
> relocate_sdk.py can not get the information from ld-linux-x86-64.so.2 since
> this file is not included in the file list.
> 
> The same error occurs on redhat6.0(32 bit).
> 
> So the direct solution to this defect is to force this file
> ld-linux-x86-64.so.2 exist in file list.
> 
> If any problem, please feel free to let me know.

This looks like a 'file' display issue. It has nothing to do with the
dynamic loader itself. However, the dynamic loader is the reason you
spotted the problem because it wasn't relocated and all the other
dynamically linked binaries depend on it...

Originally, all executable files were selected no matter if they were
scripts or other non-elf files. The relocation script checked for the
ELF magic number anyway and it moved on if the file was not ELF
format.

But, the following commit added this 'file' dependency for detecting
executables:

commit 65535bff09afd21b6d9f129651df6c70570c3aa0
Author: yzhu1 <yanjun.zhu@windriver.com>
Date:   Tue Nov 26 08:38:28 2013 +0000

    populate_sdk: verify executable or dynamically linked library

My guess is that this commit was not the right fix for the problem it
describes. In fact, I just had a better look, and I spotted the problem
you were experiencing with empty files:

in scripts/relocate_sdk.py, in get_arch(), we check for the ELF magic
number and we do a read(16). Hence, if the file was zero sized, this
read would fail...

I suggest you add a check in relocate_sdk.py and make sure the file size is
bigger than the e_ident size (which is 16). Then, you can safely revert
65535bff09afd21b6d9f129651df6c70570c3aa0. Also, the current patch would no
longer be needed.

laurentiu

