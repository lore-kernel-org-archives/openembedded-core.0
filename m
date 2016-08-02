Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DDF0D73243
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 06:08:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7268AMb011723
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Aug 2016 23:08:10 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 1 Aug 2016 23:08:09 -0700
To: Seebs <seebs@seebs.net>, oe-core <openembedded-core@lists.openembedded.org>
References: <577B8AA9.5040808@windriver.com>
	<dc216358-8a1f-1490-2fc0-db22f98741c3@windriver.com>
	<579B07F9.9000708@windriver.com>
	<B3108E03-1852-4237-8320-E2BFEC66F9B3@seebs.net>
	<579EE4BB.6070709@windriver.com>
	<F5BAFB71-1FCC-4F9D-999C-5960E8CD7213@seebs.net>
	<579F0EE8.3080009@windriver.com>
	<39329191-8DC4-43B6-9B38-5AD173C8F0DC@seebs.net>
	<1470081674.9142.108.camel@linuxfoundation.org>
	<BDA8434F-AE7B-4D8D-B6C3-2D4ED599E9E8@seebs.net>
	<1470092106.9142.113.camel@linuxfoundation.org>
	<579FFCEB.6090200@windriver.com>
	<47AE4E78-D57B-44C1-B5D5-4509B15AD3BC@seebs.net>
	<57A03888.1@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57A038C8.2060003@windriver.com>
Date: Tue, 2 Aug 2016 14:08:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <57A03888.1@windriver.com>
Subject: Re: About pseudo's chmod
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
X-List-Received-Date: Tue, 02 Aug 2016 06:08:10 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/02/2016 02:07 PM, Robert Yang wrote:
>
>
> On 08/02/2016 11:43 AM, Seebs wrote:
>> On 1 Aug 2016, at 20:52, Robert Yang wrote:
>>
>>> And when remove file2, but file1's permission is changed, it should
>>> be considered as a bug.
>>
>> I'm not sure of that. My interpretation would be that hard linking under pseudo
>> to files which weren't created under the same pseudo database is
>> user error; that's not how the database is intended to work. That said, it's
>> pretty trivial to add the things to it.
>>
>> Although I'd like to know more about the use cases for these, because it
>> occurs to me that the qualifier "same pseudo database" points out another
>
> Currently, the problem in oe-core is:
>
>        1) bitbake gzip
>        2) Edit rpm-native or package.bbclass to make do_package re-run.
>        3) bitbake gzip
>        After the first build, build/version.c in gzip-dbg is 0444, but after
>        the second build, it will be 0644, this is because do_package does:
>        $ ln ${B}/version.c gzip-dbg/version.c,
>        $ chmod 0444 gzip-dbg/version.c (it runs chmod 0644 on the real filesystem)
>        And in the second build, the gzip-dbg/version.c will be removed and
>        created again, so that stat() can't get 0444 but 0644 since
>        ${B}/version.c is not tracked by pseudo.


And please see the first email in the thread for more details.

// Robert

>
> // Robert
>
>> possible failure mode: Would any of those files that are being linked to
>> be getting linked to from *more than one* pseudo database? Because if they were,
>> that would be a thing I haven't been planning for and I don't know
>> whether it'd work sanely.
>>
>> -s

