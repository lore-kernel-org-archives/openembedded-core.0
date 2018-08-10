Return-Path: <anuj.mittal@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 61C44602D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 02:36:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Aug 2018 19:36:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,217,1531810800"; d="scan'208";a="64029402"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.20.50])
	([10.221.20.50])
	by orsmga008.jf.intel.com with ESMTP; 09 Aug 2018 19:36:53 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <1532985713-15283-1-git-send-email-jaewon.lee@xilinx.com>
	<ab3cf6da-5f2a-ef98-92ca-8aaa3721df7f@intel.com>
	<12364d4c-2863-18da-1d8f-f74a80683447@xilinx.com>
	<257beb90-8a7d-2310-9c0e-ea18466fe1a6@intel.com>
	<92e7e92ca488e452bfa185d1f9b4747f3dcb5a94.camel@linuxfoundation.org>
	<430488c7-2efc-2e6e-fafe-bf8795864f42@xilinx.com>
Message-ID: <925df93a-ab97-c11d-a508-335f33bce3b7@intel.com>
Date: Fri, 10 Aug 2018 10:36:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <430488c7-2efc-2e6e-fafe-bf8795864f42@xilinx.com>
Subject: Re: [PATCH] devtool-source.bbclass: Support kernel fragments not in SRC_URI
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
X-List-Received-Date: Fri, 10 Aug 2018 02:36:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08/03/2018 04:55 AM, Alejandro Enedino Hernandez Samaniego wrote:
> We can give it a try but do you have a specific example of how it fails
> for you?
> Because I know theres lots of nested sccs on the yocto kernel cache, but
> in that case
> it wouldn't be a problem since this bug is specifically introduced by
> devtool when it
> copies local files from SRC_URI to a oe-local-files directory, it misses
> the corresponding cfg files (or patch files)
> since they're not listed in SRC_URI and it fails to build, in the case
> of the yocto kernel cache, it
> does not contain local files, so they wont be moved hence why it
> wouldn't be an issue.
> 
> From the kernel dev manual:
> https://www.yoctoproject.org/docs/latest/kernel-dev/kernel-dev.html#recipe-space-metadata
> :
> It is only necessary to specify the |.scc| files on the |SRC_URI|
> <http://www.yoctoproject.org/docs/2.5/ref-manual/ref-manual.html#var-SRC_URI>.

You are ignoring the line right next to it: "BitBake parses them and
fetches any files referenced in the .scc files by the include, patch, or
kconf commands." All files specified using 'include' will be parsed too
even if they are not in SRC_URI and this includes other scc files.

This change is good because it fixes something that is definitely
broken. My suggestion was meant to improve it further. I had provided
the test case in my reply to original patch.

And, I just tested it again using this change applied and I do see
errors when using a nested scc. Here it is again:

│   ├── linux
│   │   ├── linux-intel
│   │   │   ├── abc.scc
│   │   │   ├── def.scc

abc.scc only includes def.scc. And, def.scc includes a patch. SRC_URI
includes only abc.scc.

> 
> It specifies that only the scc files need to be on SRC_URI, which is why
> I'm saying the script
> will eventually run into them from the list.
> 
> I want to be clear that I'm not against doing this recursively, I just
> want to understand your testcase better.

I think if you'd not like to consider this use case as part of this
change, that should also be fine. But, do consider adding a new bug in
that case.

