Return-Path: <anuj.mittal@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 2FCDA745A7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 02:55:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Aug 2018 19:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,434,1526367600"; d="scan'208";a="221065157"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.21.171])
	([10.221.21.171])
	by orsmga004.jf.intel.com with ESMTP; 01 Aug 2018 19:55:42 -0700
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	openembedded-core@lists.openembedded.org
References: <1532985713-15283-1-git-send-email-jaewon.lee@xilinx.com>
	<ab3cf6da-5f2a-ef98-92ca-8aaa3721df7f@intel.com>
	<12364d4c-2863-18da-1d8f-f74a80683447@xilinx.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <257beb90-8a7d-2310-9c0e-ea18466fe1a6@intel.com>
Date: Thu, 2 Aug 2018 10:55:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <12364d4c-2863-18da-1d8f-f74a80683447@xilinx.com>
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
X-List-Received-Date: Thu, 02 Aug 2018 02:55:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/02/2018 07:30 AM, Alejandro Enedino Hernandez Samaniego wrote:
> Hey Anuj,
> 
> 
> On 08/01/2018 04:25 AM, Anuj Mittal wrote:
>> On 07/31/2018 05:21 AM, Jaewon Lee wrote:
>>> When using a recipe space kernel-meta, scc files are added through
>>> SRC_URI, but they may include corresponding kernel fragments that are
>>> not necessarily in SRC_URI.
>>>
>>> For bitbake, this is not a problem because the kernel-yocto class adds
>>> the path where the .scc file was found to includes which consequentially
>>> makes the .cfg file available to the kernel build.
>>>
>>> However, when using devtool, only files specified in SRC_URI are copied
>>> to oe-local-files in devtool's workspace. So if the cfg file is not in
>>> SRC_URI, it won't be copied, causing a kernel build failure when trying
>>> to find it.
>>>
>>> This fix parses local .scc files in SRC_URI, copies the corresponding .cfg
>>> file to devtool's workdir, and also adds it to local_files so it is
>>> available when doing a devtool build for the kernel.
>>>
>>> [YOCTO #12858]
>>>
>>> Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
>>> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
>>> ---
>>>   meta/classes/devtool-source.bbclass | 12 ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-source.bbclass
>>> index 56882a4..c70fea2 100644
>>> --- a/meta/classes/devtool-source.bbclass
>>> +++ b/meta/classes/devtool-source.bbclass
>>> @@ -90,11 +90,23 @@ python devtool_post_unpack() {
>>>                           fname in files])
>>>           return ret
>>>   
>>> +    is_kernel_yocto = bb.data.inherits_class('kernel-yocto', d)
>>>       # Move local source files into separate subdir
>>>       recipe_patches = [os.path.basename(patch) for patch in
>>>                           oe.recipeutils.get_recipe_patches(d)]
>>>       local_files = oe.recipeutils.get_recipe_local_files(d)
>>>   
>>> +    if is_kernel_yocto:
>>> +      for key in local_files.copy():
>>> +        if key.endswith('scc'):
>>> +          sccfile = open(local_files[key], 'r')
>>> +          for l in sccfile:
>>> +            line = l.split()
>>> +            if line and line[0] == 'kconf' and line[-1].endswith('.cfg'):
>>> +              local_files[line[-1]] = os.path.join(os.path.dirname(local_files[key]), line[-1])
>>> +              shutil.copy2(os.path.join(os.path.dirname(local_files[key]), line[-1]), workdir)
>>> +          sccfile.close()
>>> +
>> Would the patches included in these .scc files also need to be handled
>> in the same way? Would this also work if there are other scc files
>> included in a scc file?
> Yes, I believe that the same mechanism should be used for patch files as 
> well,
> basically anything that may be needed to build but that its not necessarily
> explicitly listed on SRC_URI.
> 
> I believe it will work for other scc files and it doesnt have to be 
> recursive,
> because while cfg files arent required to be in SRC_URI , scc files ARE 
> required
> to be SRC_URI, which means that this will eventually find the other scc 
> file on the list

I don't think they are required to be specified except for the top level
one. At least, when I test it, I see problems. kernel-tools spp script
parses them recursively and looks for a nested scc even if it is not
specified as part of SRC_URI. That is how the top level sccs from
kernel-cache are parsed too. Can you give it a try please?

Thanks,

Anuj

