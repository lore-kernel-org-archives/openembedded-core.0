Return-Path: <ross.burton@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BA3F67F7DF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 21:45:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2019 13:45:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,278,1571727600"; d="scan'208";a="412726799"
Received: from aaronsan-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.32.186])
	by fmsmga006.fm.intel.com with ESMTP; 04 Dec 2019 13:45:18 -0800
To: openembedded-core@lists.openembedded.org
References: <20191120051704.24066-1-zangrc.fnst@cn.fujitsu.com>
	<CANNYZj9Xhm3ciQZQjSy6-sGamkQTFxT0K2QZ=k0ncwnWXYuMZw@mail.gmail.com>
	<a8165efac9ffc06e16b0256e646799ded7ec272c.camel@iki.fi>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <f8308785-6319-a6c1-8b4a-768d4dfe861a@intel.com>
Date: Wed, 4 Dec 2019 21:45:17 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <a8165efac9ffc06e16b0256e646799ded7ec272c.camel@iki.fi>
Subject: Re: [PATCH] alsa-lib:upgrade 1.1.9 -> 1.2.1.1
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
X-List-Received-Date: Wed, 04 Dec 2019 21:45:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 04/12/2019 21:18, Tanu Kaskinen wrote:
> I'll have to ask upstream if the strange configure.ac addition could be
> just removed. If it for some reason won't be removed, then an OE
> specific patch is needed. Either configure.ac needs to be modified to
> operate on ${host_alias}-libtool, or I can simply remove the libtool
> modification part, because OE hasn't needed that in the past, and I
> can't see how it would be needed now.

My understanding is that the used libtool is dropped into the build tree 
by libtoolize, and we've patched libtool to prefix the binary.  So if 
the chunk at the end of configure.ac is kept, then the patch needs to 
alter the correct file.

However that chunk in the configure.ac definitely looks like something 
the author added locally as a test, and forgot to remove when 
committing...  An important line from that wiki page:

"""
Since libtool 1.5.2 (released 2004-01-25), on Linux libtool no longer 
sets RPATH for any directories in the dynamic linker search path, so 
this should no longer be an issue unless upstream used a really old 
version of libtool when creating their distribution tarball.
"""

So I'm not sure why this chunk was added at all.

Ross

