Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EB8F7771B5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 21:57:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1PLvMYc002635
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Feb 2016 13:57:22 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 25 Feb 2016 13:57:22 -0800
To: Joshua G Lock <joshua.g.lock@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
	<4df77b79cf9ded923721b47de270b2c43c21cc18.1456325292.git.joshua.g.lock@intel.com>
	<56CF364B.3080704@windriver.com>
	<1456436434.13135.5.camel@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56CF78C1.7060607@windriver.com>
Date: Thu, 25 Feb 2016 15:57:21 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1456436434.13135.5.camel@linux.intel.com>
Subject: Re: [PATCH 03/10] hardlink: add new recipe
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
X-List-Received-Date: Thu, 25 Feb 2016 21:57:25 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 2/25/16 3:40 PM, Joshua G Lock wrote:
> On Thu, 2016-02-25 at 11:13 -0600, Mark Hatle wrote:
>> I just noticed this, any reason to use this over fdupes?
> 
> No reason other than that hardlink is what the Clear Linux team, who
> authored swupd, are using. Is there a compelling reason to look at
> fdupes instead?

I'd used fdupes since someone else had already integrated it.  (meta-tizen
maybe?)  Also because it could do more then just setup duplicates as hardlinks.
 It can also simply display the duplicates for external processing.

I don't have any reason to prefer one over the other...

--Mark


> Thanks,
> 
> Joshua
> 
>>
>> I've used fdupes in the past for this exact thing -- primarily with
>> shrinking
>> the size of multilib SDKs with a lot of locales.
>>
>> --Mark
>>
>> On 2/24/16 8:52 AM, Joshua Lock wrote:
>>>
>>> ---
>>>  meta/recipes-extended/hardlink/hardlink_0.3.0.bb | 19
>>> +++++++++++++++++++
>>>  1 file changed, 19 insertions(+)
>>>  create mode 100644 meta/recipes-
>>> extended/hardlink/hardlink_0.3.0.bb
>>>
>>> diff --git a/meta/recipes-extended/hardlink/hardlink_0.3.0.bb
>>> b/meta/recipes-extended/hardlink/hardlink_0.3.0.bb
>>> new file mode 100644
>>> index 0000000..2e06ac2
>>> --- /dev/null
>>> +++ b/meta/recipes-extended/hardlink/hardlink_0.3.0.bb
>>> @@ -0,0 +1,19 @@
>>> +SUMMARY = "hardlink is a tool which replaces multiple copies of a
>>> file with hardlinks."
>>> +LICENSE = "MIT"
>>> +LIC_FILES_CHKSUM =
>>> "file://hardlink.c;endline=22;md5=168464a4fc92fa7389c53b0755b39fbb"
>>> +
>>> +SRC_URI = "http://jak-linux.org/projects/hardlink/${BPN}_${PV}.tar
>>> .xz"
>>> +SRC_URI[md5sum] = "72f1a460adb6874c151deab766e434ad"
>>> +SRC_URI[sha256sum] =
>>> "e8c93dfcb24aeb44a75281ed73757cb862cc63b225d565db1c270af9dbb7300f"
>>> +
>>> +DEPENDS = "libpcre attr"
>>> +
>>> +do_compile () {
>>> +	oe_runmake 'DESTDIR=${D}' 'PREFIX=${prefix}'
>>> BINDIR='${bindir}'
>>> +}
>>> +
>>> +do_install () {
>>> +	oe_runmake install 'DESTDIR=${D}' 'PREFIX=${prefix}'
>>> BINDIR='${bindir}'
>>> +}
>>> +
>>> +BBCLASSEXTEND = "native nativesdk"
>>>


