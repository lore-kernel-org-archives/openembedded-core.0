Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9A63260721
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 05:36:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2U5aJqK001338
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Mar 2016 22:36:19 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 29 Mar 2016 22:36:18 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<ross.burton@intel.com>, <mark.hatle@windriver.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
	<ff32532a209902db6637c34b408e77abf7a1fda6.1459147231.git.hongxu.jia@windriver.com>
	<1459291086.21672.43.camel@linuxfoundation.org>
	<56FB32D3.3080504@windriver.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <56FB65CE.1050908@windriver.com>
Date: Wed, 30 Mar 2016 13:36:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56FB32D3.3080504@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 03/17] conf/bitbake.conf package.bbclass: improve dbg package sources generation from work-shared
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
X-List-Received-Date: Wed, 30 Mar 2016 05:36:21 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/30/2016 09:58 AM, Hongxu Jia wrote:
>
>>
>> Its possible software may mix from shared-work and from some local
>> kernel module build too, not sure if/how well the code copes with that
>> case.
>
> Currently kernel module has no dbg package generated, but I will
> try to open it, and please wait my report for this case.

Hi Richard,

It is hardly to generate dbg for kernel module, it explicitly ignore 
them and strip them.

In meta/classes/package.bbclass:
...
  377     # We ignore kernel modules, we don't generate debug info files.
  378     if file.find("/lib/modules/") != -1 and file.endswith(".ko"):
  379         return 1
...
  943     if (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):
  944         for root, dirs, files in cpath.walk(dvar):
  945             for f in files:
  946                 file = os.path.join(root, f)
  947                 if file.endswith(".ko") and 
file.find("/lib/modules/") != -1:
  948                     kernmods.append(file)
  949                     continue
...
(I tried, but lots of failures and make no sense)

I could not get a case that software gets sources from shared-work and
local kernel module build. But if local kernel module build does not in
work-shared or software's WORKDIR, this fix could not do the collection
from local kernel module.

This fix could collect sources from work-shared and recipes's WORKDIR
(such as gcc).

//Hongxu


