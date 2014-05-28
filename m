Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2AB8B6FB69
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 05:57:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4S5vrW2005692
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 May 2014 22:57:54 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 27 May 2014 22:57:53 -0700
Message-ID: <53857ADD.50902@windriver.com>
Date: Wed, 28 May 2014 13:57:49 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1401155797.git.hongxu.jia@windriver.com>
	<63ab824a613874b93978ebf17afe2f6d69a58faf.1401155797.git.hongxu.jia@windriver.com>
	<CAJTo0LZhh6WNn4vyNyzQ_yo9mKqikizb-UkkbUZGsPyN=UzxrQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZhh6WNn4vyNyzQ_yo9mKqikizb-UkkbUZGsPyN=UzxrQ@mail.gmail.com>
Cc: Saul Wold <saul.wold@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] socat: fix linux/errqueue.h not found
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
X-List-Received-Date: Wed, 28 May 2014 05:57:56 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/27/2014 07:43 PM, Burton, Ross wrote:
> On 27 May 2014 02:59, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> +-AC_CHECK_HEADERS(linux/types.h)
>> +-AC_CHECK_HEADER(linux/errqueue.h, AC_DEFINE(HAVE_LINUX_ERRQUEUE_H), [], [#include <linux/types.h>])
>> ++AC_CHECK_HEADERS(linux/types.h linux/errqueue.h)
> Have you checked the config.log and config.h to verify this is actually working?
>
> It looks like you're simply removing the AC_DEFINE of
> HAVE_LINUX_ERRQUEUE_H which is used as a guard around
> <linux/errqueue.h> in sysincludes.h.

I took a look, and found out the 'AC_DEFINE' didn't work,
...
-AC_CHECK_HEADER(linux/errqueue.h, AC_DEFINE(HAVE_LINUX_ERRQUEUE_H), [], 
[#include <linux/types.h>])
+AC_CHECK_HEADER(linux/errqueue.h, AC_DEFINE(HAVE_LINUX_ERRQUEUE_H, [1], 
[With linux errqueue header]), [], [#include <linux/types.h>])
...

The fix was the same with compile.patch, I will merged it to compile.patch.

//Hongxu

> Ross


