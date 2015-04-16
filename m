Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2C7E57226D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 08:32:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3G8WmJP013200
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Apr 2015 01:32:48 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 16 Apr 2015 01:32:56 -0700
Message-ID: <552F73AE.4070403@windriver.com>
Date: Thu, 16 Apr 2015 16:32:46 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1429002519.git.liezhi.yang@windriver.com>	
	<39bde4872c0287e3617e2e8af5768903e1d33cfc.1429002519.git.liezhi.yang@windriver.com>
	<1429130322.6976.154.camel@linuxfoundation.org>
In-Reply-To: <1429130322.6976.154.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] libxml2: fix python path and add libxml2-python
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
X-List-Received-Date: Thu, 16 Apr 2015 08:32:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/16/2015 04:38 AM, Richard Purdie wrote:
> On Tue, 2015-04-14 at 02:08 -0700, Robert Yang wrote:
>> We have libxml2-python for native and nativesdk, but don't have it for
>> target, and can't find the reason from the git log, libxml2-python is
>> widely used, after looked into it's configure.in, we can add it
>> by PACKAGECONFIG.
>>
>> The previous --with-python=${STAGING_BINDIR}/python is incorrect, it
>> acted as work becase it's conigure can check automatically, python is in
>> ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}, as known as
>> ${PYTHON}.
>>
>> Add python to PACKAGECONFIG, since createrepo rdepends on
>> libxml2-python, otherwise the target createrepo can't work.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>
> Something here caused a load of failures:
>
> http://errors.yoctoproject.org/Errors/Search/?items=10&query=90b8d406488b0a3c42b2a745526e5b1273d8a982
>
> e.g. specifically http://errors.yoctoproject.org/Errors/Details/9808/

Sorry, I updated it in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/6fixes

It was because of this line:
PACKAGECONFIG_linuxstdbase ??= ""

We need remove it to use:
PACKAGECONFIG ??= "python"

// Robert

>
> Cheers,
>
> Richard
>
>
>

