Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C4CBB601F6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 09:57:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x249upvA025828
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Mar 2019 01:57:01 -0800
Received: from [128.224.163.177] (128.224.163.177) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 4 Mar 2019 01:56:40 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
	<raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20190204181314.22496-1-raj.khem@gmail.com>
	<e0f4b1c8-54f9-63c9-b08b-147243ebe1ce@windriver.com>
	<12b1452d894058e0a03398ae65b0f52deaeb9182.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <31ec3ae0-3d38-7725-54ab-f5c3fda864b5@windriver.com>
Date: Mon, 4 Mar 2019 18:02:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <12b1452d894058e0a03398ae65b0f52deaeb9182.camel@linuxfoundation.org>
Subject: Re: [PATCH] send-error-report: Use https instead of http protocol
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
X-List-Received-Date: Mon, 04 Mar 2019 09:57:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi RP,

On 3/4/19 5:23 PM, Richard Purdie wrote:
> On Mon, 2019-03-04 at 15:50 +0800, Robert Yang wrote:
>> Hi Khem,
>>
>> We have an internal error web server, this patch breaks it:
>>
>> You're accessing the development server over HTTPS, but it only
>> supports HTTP
>>
>> So I tried to use runsslserver, but it doesn't work either since the
>> host is
>> Ubuntu 14.04 (python 2.7.6):
>>
>> $ python manage.py runsslserver
>>
>> [snip]
>>       ssl_version=ssl.PROTOCOL_TLSv1_2,
>> AttributeError: 'module' object has no attribute 'PROTOCOL_TLSv1_2'
>>
>> This is because python is old.
>>
>> I think that make it default to https would make the server harder to
>> set up,
>> so is it possible to:
>>
>> * Make it default to http, and add an option such as --https (or --
>> ssl) for https
>>
>> Or:
>>
>> * Add an option such as --no-ssl to make it use http.
>>
>> I prefer the first one since https server is harder to setup than
>> http in django. I can work on it if no objections.
> 
> At this point the project does require python3 so python2 being old
> shouldn't be a reason to be changing this.

The python3 + error-report-web doesn't work for me:

$ python3 manage.py runserver ip:8000

And when I tried to access http://128.224.156.132:8000, it raised errors:

error-report-web/Post/views.py", line 16, in <module>
     from parser import Parser
ImportError: cannot import name 'Parser'

So I use python 2 for it. I thought that it didn't support python3, or didn't
test well.

> 
> The project also needs to be seen to encourage secure practises so I
> think https should be the default but adding an option to use http
> should be ok.

Thanks, I will send a patch for it.

// Robert

> 
> Cheers,
> 
> Richard
> 
> 
> 
> 

