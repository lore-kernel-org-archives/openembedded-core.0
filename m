Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 69C3A73D87
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 16:04:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 20 Apr 2015 09:04:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,609,1422950400"; d="scan'208";a="716362536"
Received: from eestrada-mobl1.amr.corp.intel.com (HELO [10.252.249.183])
	([10.252.249.183])
	by orsmga002.jf.intel.com with ESMTP; 20 Apr 2015 09:04:45 -0700
Message-ID: <553523B8.8010002@linux.intel.com>
Date: Mon, 20 Apr 2015 11:05:12 -0500
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1429177203.git.alejandro.hernandez@linux.intel.com>		
	<1ca6d1e0276189ecb640f08ce5afee34a788c163.1429177203.git.alejandro.hernandez@linux.intel.com>	
	<1429307402.6976.207.camel@linuxfoundation.org>	
	<5531A32F.2010302@linux.intel.com>
	<1429429781.6976.217.camel@linuxfoundation.org>
In-Reply-To: <1429429781.6976.217.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] python3-native: Fix pip install issue due to unclean build directory
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
X-List-Received-Date: Mon, 20 Apr 2015 16:04:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/04/15 02:49, Richard Purdie wrote:
> On Fri, 2015-04-17 at 19:19 -0500, Alejandro Hernandez wrote:
>> On 17/04/15 16:50, Richard Purdie wrote:
>>> On Thu, 2015-04-16 at 09:45 +0000, Alejandro Hernandez wrote:
>>>> When installing python3-native sometimes pips default build
>>>> directory (which is on the host and is user dependant) is left unclean,
>>>> due to this, when python3-core is being installed it tries to use
>>>> the same directory producing an error, this explicitly removes
>>>> what the previous installation might have left behind, fixing the issue.
>>>>
>>>> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
>>>> ---
>>>>    .../python/python3-native_3.4.2.bb                 |  1 +
>>>>    .../python3/pip_build_directory_unclean.patch      | 28 ++++++++++++++++++++++
>>>>    2 files changed, 29 insertions(+)
>>>>    create mode 100644 meta/recipes-devtools/python/python3/pip_build_directory_unclean.patch
> I tried it on the autobuilder and it failed again. I think part of the
> problem is that this part of the process runs under pseudo so it thinks
> its root, yet can't clear root's pip directory in /tmp.
>
> I suspect we are going to have to tell pip to use WORKDIR somehow, even
> if we have to patch it to take some kind of prompt from the environment
> for example.
>
> Cheers,
>
> Richard
>

Yes, the problem does happen when it uses pseudo and it thinks its root, 
I thought removing the files inside the same python code would be able 
to do it, ok I will find another workaround.


