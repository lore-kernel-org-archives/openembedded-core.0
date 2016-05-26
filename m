Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 09E646E688
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 13:39:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4QDd9EF011275
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 26 May 2016 06:39:09 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 26 May 2016 06:39:08 -0700
To: <alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
	<e0ab0ad1-fb6d-a8a0-a31f-913b9fa4dcc2@windriver.com>
	<51113.10.252.8.31.1464181299.squirrel@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <32be4839-8552-c5fa-6ba3-6df5d97aee7c@windriver.com>
Date: Thu, 26 May 2016 08:39:08 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <51113.10.252.8.31.1464181299.squirrel@linux.intel.com>
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
X-List-Received-Date: Thu, 26 May 2016 13:39:10 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 5/25/16 8:01 AM, alexander.kanavin@linux.intel.com wrote:
>>> Consequently, rpm's python bindings (required by smartpm) stay at python
>>> 2 as well
>>> for now, even tough python 3 seems to be supported.
>>
>> Is there a porting guide or similar that can used to help identify what
>> types of
>> changes are needed.  I am not at all familiar with what python 3 needs
>> specifically, but I do expect we will need to port these items.
> 
> Of course, there's a ton of such guides on the net. Here's the official one:
> https://docs.python.org/3/howto/pyporting.html
> 
>> The yum version of createrepo will not work.  We need to port forward the
>> component as appropriate -- or modify smartpm to use a newer version --
>> assuming
>> we can add missing pieces, as necessary.  (key is smartpm and createrepo
>> need to
>> be kept in sync.)
> 
> Can you say why it won't work, specifically, if we also replace smartpm
> with yum or dnf at the same time? The only alternative I see is that we
> have to fork the old version of createrepo and the abandoned upstream of
> smartpm, port them to Python 3, and maintain them going forward - not a
> light undertaking.

The interchange format of the newer createrepo is very different then the older
format the smartpm uses.  Thus they have to be kept in sync.  The new format
also does not have the extensions we added for the recommended package syntax.

createrepo is very small, and it's not YUM dependent.  It simply reads the
metadata (via the rpm interface) and dumps out data in an XML format.. then does
a few more things as well.  So porting the existing one forward shouldn't be
difficult.  It's just not clear at this point what the best behavior will be to
do.. port createrepo forward -- or update smartpm to support the newer format
(with appropriate extensions.)

--Mark

>> Please create one (or three) defects and assign them to me for smartpm,
>> createrepo, and rpm python3 support.  (I doubt I'll be the one doing the
>> work,
>> but I'll do my best to find someone to do the work.)
> 
> Yes, I'll do that now.
> 
>>> 5) LSB spec is implicitly requiring Python 2 (via requirement for
>>> '/usr/bin/python').
>>
>> I expect the LSB will require python 2 for a while.  So we will need to
>> continue
>> to ensure that python 2 works, as well as python3.
> 
> Of course, Python 2 will be supported by upstream at least until 2020, and
> so it'll be provided by oe-core at least until then. 2.7.12 should appear
> soon.
> 
> Alex
> 


