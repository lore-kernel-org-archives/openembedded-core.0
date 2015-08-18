Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4BB9C60043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 08:33:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 18 Aug 2015 01:33:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,700,1432623600"; d="scan'208";a="786191017"
Received: from jburrows-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.34])
	by orsmga002.jf.intel.com with ESMTP; 18 Aug 2015 01:33:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: mariano.lopez@linux.intel.com
Date: Tue, 18 Aug 2015 09:33:56 +0100
Message-ID: <3297628.6dWWSbZelC@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.4-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1439815302-12812-1-git-send-email-mariano.lopez@linux.intel.com>
References: <1439815302-12812-1-git-send-email-mariano.lopez@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] testimage: Run commands in target and host when test fails
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
X-List-Received-Date: Tue, 18 Aug 2015 08:34:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mariano,

On Monday 17 August 2015 12:41:42 mariano.lopez@linux.intel.com wrote:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
> 
> This patch modify three files altought two of them
> are minimal modifications:
> 
> testimage.bbclass:
>     Create new vars for easy modification of the dump
> directory and commands to be run on host and target
> when a test fails
>     TESTIMAGE_DUMP_DIR: Directory to save the dumps
>     TESTIMAGE_DUMP_TRG: Commands to run on target
>     TESTIMAGE_DUMP_HST: Commands to run on host

Can we please use full names (i.e. "...HOST" and "...TARGET")? We're not short 
of space here ;)
 
> targetcontrol.py:
>     Extract vars from the datastore for later use
> 
> oetest.py:
>     - Allow to use the vars defined in testimage class
>     - Now able to run commands in the host and dump the
>       results
>     - Fix an issue with the condition where to run the
>       dump commands (Before it run the commands every
>       test after a failure, now it runs the commands only
>       in tests that failed)
>     - Fix the output to stdout
> 
> [YOCTO #8118]
> 
> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> ---
>  meta/classes/testimage.bbclass |  9 +++++++++
>  meta/lib/oeqa/oetest.py        | 42
> +++++++++++++++++++++++++++--------------- meta/lib/oeqa/targetcontrol.py |
>  3 +++
>  3 files changed, 39 insertions(+), 15 deletions(-)
> 
> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
> index 140babe..1580a4e 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -56,6 +56,15 @@ TESTIMAGEDEPENDS_qemuall =
> "qemu-native:do_populate_sysroot qemu-helper-native:d TESTIMAGELOCK =
> "${TMPDIR}/testimage.lock"
>  TESTIMAGELOCK_qemuall = ""
> 
> +TESTIMAGE_DUMP_DIR ?= "/tmp/oe-saved-tests/"
> +
> +python () {
> +    target_cmds = ["top -bn1", "ps", "free", "df", "_ping", "dmesg",
> "netstat -an", "ip address", "_logs"] +    host_cmds = ["top -bn1", "ps",
> "free", "df", "memstat", "dmesg", "netstat -an"] +   
> d.setVar("TESTIMAGE_DUMP_TRG", target_cmds)
> +    d.setVar("TESTIMAGE_DUMP_HST", host_cmds)
> +}

This is isn't how I would recommend doing this. What I suggested earlier when 
we talked about this was:

testimage_dump_target() {
	top -bn1
	ps
	free
	df
	...
}

Then you'd just d.getVar('testimage_dump_target', True), and treat the 
contents as a complete shell script to be run - i.e. write it to a file with 
#!/bin/sh as a prefix and run it. As a bonus, the value can be overridden or 
appended to from elsewhere. (This is similar to how we deal with 
pkg_postinst_<packagename> for postinstall scripts.)

> +        self.dump_trg = d.getVar("TESTIMAGE_DUMP_TRG", False)
> +        self.dump_hst = d.getVar("TESTIMAGE_DUMP_HST", False)
> +        self.dump_dir = d.getVar("TESTIMAGE_DUMP_DIR", False)

As a general note - for this kind of thing, you need to be specifying True not 
False for the expansion parameter - the value may well contain references or 
other expressions (such as ${TMPDIR}) that need expanding. In fact, it's 
relatively uncommon for False to be what you want - most of the time the value 
should be expanded if you're about to use it for something.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

