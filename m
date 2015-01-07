Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 53728728AC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 09:32:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t079WBO8009413
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 7 Jan 2015 01:32:15 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 7 Jan 2015 01:32:11 -0800
Message-ID: <54ACFD1A.5000606@windriver.com>
Date: Wed, 7 Jan 2015 17:32:10 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Mike Looijmans <mike.looijmans@topic.nl>,
	<openembedded-core@lists.openembedded.org>
References: <1420592855-20473-1-git-send-email-liezhi.yang@windriver.com>	<1420618033.25779.56.camel@linuxfoundation.org>
	<54ACFB02.5060209@topic.nl>
In-Reply-To: <54ACFB02.5060209@topic.nl>
Subject: Re: [RFC PATCH] package.bbclass: omit .pyc and .pyo file
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
X-List-Received-Date: Wed, 07 Jan 2015 09:32:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/07/2015 05:23 PM, Mike Looijmans wrote:
> On 01/07/2015 09:07 AM, Richard Purdie wrote:
>> On Tue, 2015-01-06 at 17:07 -0800, Robert Yang wrote:
>>> We should not ship .pyc or .pyo file, but there are a few packages
>>> ship .pyc, should we:
>>
>> Why should we not ship them? Doesn't python create these at runtime if
>> they're not present? What happens on a read only filesystem?
>
> You definitely SHOULD ship the .pyc files. If they don't exist, the interpreter
> is forced to re-compile the .py source, and will attempt to write the result to
> the filesystem. It won't cause harm, it won't fail, but it's very inefficient.
> It's better to let the host do the py->pyc conversion anyway.

AFAIK, the .pyc is not version compatible, the .pyc created with the
build host's python may not work with the target python.

// Robert

>
> The opposite works just fine: You can omit the .py files and ship only .pyc
> files. We do that on settopboxes that use Python for the GUI, this saves several
> megabytes of flash space.
> To accomplish that, we put the .py files into a $PN-src package.
>
> There has been general agreement that .pyo files are utterly pointless.
>
>> I'm sure we've had issues raised by someone with a read only filesystem
>> before FWIW.
>>
>> I agree there is probably an issue here but deleting them may not be the
>> best option. I'm open to ideas though.
>
> My idea would be to standardize on shipping ONLY compiled files, and put the
> source .py files into a separate package named $PN-src by default. There is no
> need to install megabytes of python source files that neither users nor the
> interpreter will ever read.
>
>
>
> Met vriendelijke groet / kind regards,
>
> Mike Looijmans
> System Expert
>
>
> TOPIC Embedded Systems
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: (+31) (0) 499 33 69 79
> Telefax:  (+31) (0) 499 33 69 70
> E-mail: mike.looijmans@topic.nl
> Website: www.topic.nl
>
> Please consider the environment before printing this e-mail
>
> Topic zoekt gedreven (embedded) software specialisten!
> http://topic.nl/vacatures/topic-zoekt-software-engineers/
>

