Return-Path: <gernot.hillier@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id E44FF77AB7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 06:13:36 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v3P6DXOD007288
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 25 Apr 2017 08:13:33 +0200
Received: from linux-mf4q.internal.hillier.de ([146.254.78.56])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id v3P6DWpS023425;
	Tue, 25 Apr 2017 08:13:32 +0200
To: "Burton, Ross" <ross.burton@intel.com>
References: <20170420190815.15000-1-gernot.hillier@siemens.com>
	<20170420190815.15000-3-gernot.hillier@siemens.com>
	<CAJTo0LYSrvNfA290aqFP1Wv2CUbxgf9JBAx-wpFkYduqYGNxyg@mail.gmail.com>
From: Gernot Hillier <gernot.hillier@siemens.com>
Message-ID: <d2f083da-ab0a-864c-cc3c-680c392e19da@siemens.com>
Date: Tue, 25 Apr 2017 08:13:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYSrvNfA290aqFP1Wv2CUbxgf9JBAx-wpFkYduqYGNxyg@mail.gmail.com>
Cc: Tim Offermann <tim.offermann@siemens.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/2] tcf-agent: enable default target debugging features
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
X-List-Received-Date: Tue, 25 Apr 2017 06:13:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 21.04.2017 18:39, Burton, Ross wrote:
> 
> On 20 April 2017 at 20:08, Gernot Hillier <gernot.hillier@siemens.com
> <mailto:gernot.hillier@siemens.com>> wrote:
> 
>     A number of features were disabled in OE due to historic problems
>     on ARM. In tcf-agent 1.4, they compile cleanly on all architectures
>     besides mips. These features are required for target debugging with
>     Eclipse Neon, CDT and TCF plugins - for example used by Xilinx Vivado
>     SDK 2016.4.
> 
> 
> Would this be responsible for this failure under musl on the autobuilder:
> 
> system/GNU/Linux/tcf/context-linux.c:490:10: error: variable 'cmd' has
> initializer but incomplete type
>      enum __ptrace_request cmd = PTRACE_SINGLESTEP;
>           ^~~~~~~~~~~~~~~~

Thanks to pointing me to this!

Looks like we need to disable the advanced tcf-agent features for musl
again as it seems to lack the necessary ptrace header.

I'll double-check other builders and post an updated patch series soon.

-- 
Gernot
Siemens AG, Corporate Competence Center Embedded Linux


