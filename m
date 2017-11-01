Return-Path: <Konrad.Scherer@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9634B77F34
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Nov 2017 15:35:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA1FZBEe007060
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 1 Nov 2017 08:35:11 -0700
Received: from [128.224.56.228] (128.224.56.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 1 Nov 2017 08:35:10 -0700
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>, ChenQi
	<Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
	<8d1c4aacc60173f9db4809d23303d4825cc0090d.1509094533.git.markus.lehtonen@linux.intel.com>
	<9fb0243b-5fef-e5c3-1175-3af8c3f3db7d@windriver.com>
	<0973040A-9027-4FEF-A333-5350D48E02E7@linux.intel.com>
	<8083f668-b00f-1772-805f-eb96a6d69c97@windriver.com>
	<E8F574EB-8489-49D9-8202-7DD5A77875D8@linux.intel.com>
	<ed3ef63c-70e9-71d9-c068-509f462e7f95@windriver.com>
	<9CB13C08-90ED-4213-98B1-81DD4223E5CC@linux.intel.com>
From: Konrad Scherer <Konrad.Scherer@windriver.com>
Message-ID: <ef6cb9de-02fd-06f2-3f75-57875aeac3a0@windriver.com>
Date: Wed, 1 Nov 2017 11:35:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <9CB13C08-90ED-4213-98B1-81DD4223E5CC@linux.intel.com>
X-Originating-IP: [128.224.56.228]
Subject: Re: [PATCH v5 05/10] bitbake.conf: add ip and scp to HOSTTOOLS unconditionally
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
X-List-Received-Date: Wed, 01 Nov 2017 15:35:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/31/2017 03:15 AM, Markus Lehtonen wrote:
> Hi,
> 
> Please see the 6th patch ("devtools/images: add python-pgo-image") in my patchset for python-pgo-image.
> 
> I'd like the profiling to work out-of-the-box, without requiring some
> strange-ish (i.e. modification of HOSTTOOLS) changes in local.conf.
> The required utilities, ip and scp, are rather standard tools,
> anyway. And, they used to be in HOSTTOOLS, unconditionally, before.
ip and scp are not needed for a normal build so it doesn't make sense to 
make them mandatory. Including them unconditionally caused build 
failures for us because the docker images we use for coverage builds did 
not include those binaries. I realize that doing builds in minimal 
containers is rare today, but I expect it to become more common.

Since the recipe uses the oeqa helpers, is there a way to setup the 
conditional inclusion to detect this and include the required binaries 
in HOSTTOOLS? Or have the oeqa helper modify the HOSTTOOLS before they 
are used?

-- 
Konrad Scherer, MTS, Linux Products Group, Wind River

