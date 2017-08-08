Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A83EE777FE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 20:41:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v78Kfbrh014989
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Aug 2017 13:41:37 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 8 Aug 2017 13:41:36 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>
References: <cover.1502206031.git.alexander.kanavin@linux.intel.com>
	<7ef3f08bdec1e383464085347222b59894526872.1502206031.git.alexander.kanavin@linux.intel.com>
	<4ae3a694-c172-c4e7-8cf9-97f6cd8507cd@windriver.com>
	<c9af037d-bd8f-691c-ec3d-ba17e723805d@linux.intel.com>
	<CAJTo0LZoTQ__hYMFjbGOYkggYoggxtMiEtwRaapSkwacNVhQMA@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <8efd92d0-80de-2f83-0b15-14f5b19b3b71@windriver.com>
Date: Tue, 8 Aug 2017 15:41:35 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZoTQ__hYMFjbGOYkggYoggxtMiEtwRaapSkwacNVhQMA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] gstreamer-plugins-bad: replace openssl dependency with nettle for hls plugin
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
X-List-Received-Date: Tue, 08 Aug 2017 20:41:36 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/8/17 2:14 PM, Burton, Ross wrote:
> On 8 August 2017 at 18:35, Alexander Kanavin <alexander.kanavin@linux.intel.com
> <mailto:alexander.kanavin@linux.intel.com>> wrote:
> 
>     On 08/08/2017 06:58 PM, Mark Hatle wrote:
> 
>         Can we somehow make openssl(10) or nettle a choice when compiling?
> 
>         I ask because I've worked on a few systems where people seem to want one
>         encryption engine for as much of the system as possible (usually openssl).
>         While gstreamer has not been a problem in such systems, I could see it being
>         something that would need to be considered.
> 
> 
>     This would need to be done across all recipes where such choice is
>     supported, as a 'preferred crypto engine' distro feature. There's been talk
>     of doing this, but I don't remember what was the outcome.
> 
> 
> There was a bug for this but I literally closed it earlier today on the grounds
> that it would mean patching every user of a crypto library to add an abstraction
> and alternative codepaths.  If you don't patch every instance then there is no
> point in a global option.

Getting a bit off-topic here, but...

I do expect that at some point in the future someone will come along and offer a
distribution wide setting for preferred (and alternative) encryption and make
the associated changes to the various recipes to enforce this.

Many of the systems I am working with are starting to have those types of needs.
 A preferred encryption resource that everything that can - should use.  Along
with alternatives that are 'acceptable' if the primary isn't available.
Otherwise other encryption would be prohibited and should trigger an automatic
blacklist or failure.

(In this case, there is a lot of work to be done, and potentially any encryption
user/provider [even internal] needs to be audited.  This is not an 'over night'
process... thus I doubt you'll be seeing it tomorrow from anyone here.)

So don't necessarily dismiss the idea -- but I do think it's outside of the
immediate scope for the Yocto Project itself, but I would expect something to
eventually be presented by a member of the larger OpenEmbedded community.

--Mark

> We can have packageconfigs, and expose the choice if the upstream does, but I
> think the only sane option is to leave it to the user to set the options.  It's
> trivial enough to blacklist openssl if you never want to use it.
> 
> Ross


