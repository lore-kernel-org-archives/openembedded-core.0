Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 82312719C9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 10:18:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uA1AIISl015686
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Nov 2016 03:18:18 -0700 (PDT)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 1 Nov 2016 03:18:17 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1477928374.git.liezhi.yang@windriver.com>
	<bc402b553331b622af35b7fea7d30d82c7f2f686.1477928374.git.liezhi.yang@windriver.com>
	<1477994978.23123.46.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <fcb641d9-c4ae-bb72-cb96-98ec92e34797@windriver.com>
Date: Tue, 1 Nov 2016 18:18:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1477994978.23123.46.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/1] oe/copy_buildsystem.py: dereference symlink
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
X-List-Received-Date: Tue, 01 Nov 2016 10:18:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/01/2016 06:09 PM, Richard Purdie wrote:
> On Mon, 2016-10-31 at 08:48 -0700, Robert Yang wrote:
>> When there is a relative symlink in the layer, for example:
>> symA -> ../out/of/layer/file
>>
>> symA will be invalid fater copied, it would be invalid from build
>> time
>> if it points to a relative path, and would be invalid after extracted
>> the sdk if it points to a absolute py. Dereference symlink when copy
>> will fix the problem.
>>
>> Use tar rather than shutil.copytree() to copy is because:
>> 1) shutil.copytree(symlinks=Fasle) has bugs when dereference
>> symlinks:
>>    https://bugs.python.org/issue21697
>>    And Ubunutu 1404 doesn't upgrade python3 to fix the problem.
>>
>> 2) shutil.copytree(symlinks=False) raises errors when there is a
>> invalid
>>    symlink, and tar just prints a warning, tar is preferred here
>> since
>>    the real world is unpredicatable
>>
>> 3) tar is faster than shutil.copytree() as said by oe.path.copytree()
>
> Could we just use oe.path.copytree() here?

I should explain why not use oe.path.copytree(), but it was late last
night, so I forgot that. We can't use oe.path.copytree() since:
1) oe.path.copytree() doesn't dereference symlink
2) We need --exclude='.git'

I'd like to add two arguments to oe.path.copytree() to do this if it is worth.

// Robert

>
> Cheers,
>
> Richard
>

