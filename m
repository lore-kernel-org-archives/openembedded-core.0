Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 910F271A62
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 18:55:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v78ItDhv028125
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Aug 2017 11:55:13 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 8 Aug 2017 11:55:13 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1502206031.git.alexander.kanavin@linux.intel.com>
	<7ef3f08bdec1e383464085347222b59894526872.1502206031.git.alexander.kanavin@linux.intel.com>
	<4ae3a694-c172-c4e7-8cf9-97f6cd8507cd@windriver.com>
	<c9af037d-bd8f-691c-ec3d-ba17e723805d@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <46243f22-8359-490d-d7fa-aa2ce3280fa8@windriver.com>
Date: Tue, 8 Aug 2017 13:55:00 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <c9af037d-bd8f-691c-ec3d-ba17e723805d@linux.intel.com>
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
X-List-Received-Date: Tue, 08 Aug 2017 18:55:13 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/8/17 12:35 PM, Alexander Kanavin wrote:
> On 08/08/2017 06:58 PM, Mark Hatle wrote:
>> Can we somehow make openssl(10) or nettle a choice when compiling?
>>
>> I ask because I've worked on a few systems where people seem to want one
>> encryption engine for as much of the system as possible (usually openssl).
>> While gstreamer has not been a problem in such systems, I could see it being
>> something that would need to be considered.
> 
> This would need to be done across all recipes where such choice is 
> supported, as a 'preferred crypto engine' distro feature. There's been 
> talk of doing this, but I don't remember what was the outcome.
> 
> Also, the plugin needs to be ported to 1.1 first, as the choice will 
> otherwise be taken away when 1.0 goes EOL.

For now I'm fine with 1.0 support.  So something like:

# ensure OpenSSL is used for HLS AES description instead of nettle
# (OpenSSL is a shared dependency with dtls)
PACKAGECONFIG[hls_openssl10]             = "--enable-hls
--with-hls-crypto=openssl,--disable-hls,openssl10"

PACKAGECONFIG[hls]             = "--enable-hls
--with-hls-crypto=nettle,--disable-hls,nettle"


But my concern is changing the choice of encryption engine could break various
existing uses.  (Like I said, -I- don't have that use, but I expect others do..
perhaps not with gstreamer-plugins-bad though?)

--Mark

> Alex
> 


