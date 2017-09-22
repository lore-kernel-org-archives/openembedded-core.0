Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E128A771F5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 17:16:04 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Sep 2017 10:16:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,427,1500966000"; d="scan'208";a="154939979"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 22 Sep 2017 10:16:05 -0700
To: Seebs <seebs@seebs.net>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1506098477-5444-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1506098477-5444-2-git-send-email-richard.purdie@linuxfoundation.org>
	<20170922115204.37ef6f2c@seebsdell>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <47d049c3-4034-7224-4f81-e1aac8f8b030@linux.intel.com>
Date: Fri, 22 Sep 2017 20:12:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170922115204.37ef6f2c@seebsdell>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] pseudo: Add fastop reply fix
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
X-List-Received-Date: Fri, 22 Sep 2017 17:16:05 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/22/2017 07:52 PM, Seebs wrote:
>> This changes the pseudo FASTOP functionality so that a reply to the
>> operation is required. This means we then cannot lose data if a
>> connection is closed. This in turn stops corruption if we run out of
>> file handles and have to close connections.
>>
>> This tweaks the connection closure patch to update the comment there
>> which is now outdated.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> This looks reasonable to me. I did some testing with a very similar
> patch and concluded that, while it slowed performance slightly, it
> didn't slow it nearly as much as the pre-fastop behavior did.

Also, the issue this patch is fixing is not theoretical. Setting max fd 
limit to a low value (192) is causing errors on my machine:

dpkg-deb: error: maintainer script 'postinst' has bad permissions 644 
(must be >=0555 and <=0775)

and with the patch they seem to go away.

Alex

