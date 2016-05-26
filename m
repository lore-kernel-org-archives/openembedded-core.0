Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B346365CC2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 14:03:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4QE30gY005847
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 26 May 2016 07:03:00 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 26 May 2016 07:03:00 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
	<e0ab0ad1-fb6d-a8a0-a31f-913b9fa4dcc2@windriver.com>
	<51113.10.252.8.31.1464181299.squirrel@linux.intel.com>
	<32be4839-8552-c5fa-6ba3-6df5d97aee7c@windriver.com>
	<5746FEED.1000907@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <a7f5143f-28c0-400d-479c-ced213c66ffd@windriver.com>
Date: Thu, 26 May 2016 09:02:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <5746FEED.1000907@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/45] Move recipes to use Python 3 whenever possible
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
X-List-Received-Date: Thu, 26 May 2016 14:03:02 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 5/26/16 8:49 AM, Alexander Kanavin wrote:
> On 05/26/2016 04:39 PM, Mark Hatle wrote:
> 
>> The interchange format of the newer createrepo is very different then the older
>> format the smartpm uses.  Thus they have to be kept in sync.  The new format
>> also does not have the extensions we added for the recommended package syntax.
>>
>> createrepo is very small, and it's not YUM dependent.  It simply reads the
>> metadata (via the rpm interface) and dumps out data in an XML format.. then does
>> a few more things as well.  So porting the existing one forward shouldn't be
>> difficult.  It's just not clear at this point what the best behavior will be to
>> do.. port createrepo forward -- or update smartpm to support the newer format
>> (with appropriate extensions.)
> 
> I still don't understand why introducing yum/dnf as a replacement for 
> smartpm should be avoided at all costs. Like smartpm, it's fully written 
> in Python, so that theoretically should be less painful that building 
> working binaries.

I never said it should be avoided at all costs.  Yum is dead.  So any
discussions would be on DNF.

DNF has many library dependencies that smartpm does not have.  It also has a
larger overhead for other resources.  (But with that said, it also has other
advantages in some cases, like support for DeltaRPM.)

We should investigate DNF, but at present DNF [and the index format] do not
understand the recommended syntax that is used by OE/RPM5.  DNF also has some
issues with the other items that RPM5 has implemented (self-signed packages,
package arch is not 'statically defined', etc.)  Smartpm does not have a problem
with any of these, and is quite small.

Smartpm however does have an issue (maybe) in that it's resolution code is
written in python and likely is much slower then using libsolv [which DNF uses].

So it's not that I'm dismissing DNF, it's that we need to determine what is
necessary to move smartpm forward.  We need to investigate what it will take to
port over DNF... and we need to understand performance impacts (runtime, disk
space, and dependency needs.)

--Mark

> Alex
> 


