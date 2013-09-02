Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 09DFB6BD13
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 02:01:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8221HuV027964
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 1 Sep 2013 19:01:18 -0700 (PDT)
Received: from [128.224.162.215] (128.224.162.215) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Sun, 1 Sep 2013 19:01:16 -0700
Message-ID: <5223F16B.5050705@windriver.com>
Date: Mon, 2 Sep 2013 10:01:15 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1377827133.git.jackie.huang@windriver.com>
	<20130830092220.GT3544@jama>
In-Reply-To: <20130830092220.GT3544@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] remove the unnecessary protocol parameters
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
X-List-Received-Date: Mon, 02 Sep 2013 02:01:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 8/30/2013 5:22 PM, Martin Jansa wrote:
> On Fri, Aug 30, 2013 at 09:56:35AM +0800, jackie.huang@windriver.com wrote:
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> What I did to remove these:
>> I checked that we only use git and svn:
>> $ find meta \( -name *.bb -o -name *.inc -o -name *.bbclass \) -exec sed -n 's/.*"\(\w*:\/\/\).*\(;protocol=\w*\)/\1 \2/p' {} \; | sort | uniq
>> git:// ;protocol=git \
>> git:// ;protocol=git"
>> git:// ;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
>> git:// ;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
>> git:// ;protocol=git" % (gstpkg_basename, branch))
>> git:// ;protocol=git;nocheckout=1;branch=${KBRANCH},${KMETA};name=machine,meta"
>> git:// ;protocol=http \
>> svn:// ;protocol=http \
>> svn:// ;protocol=http;module=trunk \
>> svn:// ;protocol=svn"
>>
>> So I think it's safe to simply remove ";protocol=git" and ";protocol=svn":
>>
>> $ find meta \( -name *.bb -o -name *.inc -o -name *.bbclass \) -exec sed -i 's/;protocol=git//; s/;protocol=svn//' {} \;
>>
>> What left with protocol parameter after removal is:
>> $ find meta \( -name *.bb -o -name *.inc -o -name *.bbclass \) -exec sed -n 's/.*"\(\w*:\/\/\).*\(;protocol=\w*\)/\1 \2/p' {} \; | sort | uniq
>> git:// ;protocol=http \
>> svn:// ;protocol=http \
>> svn:// ;protocol=http;module=trunk
>>
>> Please refer to "[OE-core] [PATCH] u-boot: update to 2013.07" for detail discussions.
>>
>> tested info:
>> MACHINE ??= "qemux86-64"
>>
>> $ bitbake world
>
> Would you mind running the same in meta-openembedded?

No, I will do it for meta-openembedded.

Thanks,
Jackie

>
> I can do the "bitbake world" part.
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

