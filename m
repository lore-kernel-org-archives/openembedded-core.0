Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B25AF719A4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 01:41:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vB11fLC2001962
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 30 Nov 2017 17:41:21 -0800
Received: from localhost.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 30 Nov 2017 17:41:09 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1512006081.git.liezhi.yang@windriver.com>
	<12c2694b20a9198d2d4f02100ced3dbdc1351f75.1512006081.git.liezhi.yang@windriver.com>
	<3d8f8bf0-84a6-d9bf-6540-3cc09196fb1a@linux.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <b644f3d2-de4f-186d-241e-4b3a69bfe23b@windriver.com>
Date: Fri, 1 Dec 2017 09:40:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <3d8f8bf0-84a6-d9bf-6540-3cc09196fb1a@linux.intel.com>
Subject: Re: [PATCH 1/5] go-native: fix PATH issue when len(TMPDIR) == 410
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
X-List-Received-Date: Fri, 01 Dec 2017 01:41:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Alexander,

On 11/30/2017 07:33 PM, Alexander Kanavin wrote:
> On 11/30/2017 03:45 AM, Robert Yang wrote:
>> +-    char buf[4096];
>> ++    char buf[8192];
> 
> I understand it would take more time, but the proper way to fix this (and 
> similar issues in patches 2, 3, 5) is to use dynamic allocation. Swapping one 
> arbitrary value for another arbitrary value may still not be enough for everyone.

There are two reasons that it isn't worth to use dynamic allocation (e.g., malloc):
1) The path length has a limit defined in /usr/include/linux/limits.h,
    usually it is 4096, but a lot of tools would be failed (include python IIRC)
    when len(tmpdir) > 410 (then len(path) is about 500 since it is in workdir)
    in our testing, so make it work when len(tmp) == 410 should be enough for
    everyone in the real world, otherwise, other errors will happen.

2) Look at the context of go/src/cmd/dist/unix.c:

char*
bprintf(Buf *b, char *fmt, ...)
{
     va_list arg;
     char buf[4096];

     breset(b);
     va_start(arg, fmt);
     vsnprintf(buf, sizeof buf, fmt, arg);
[snip]

There is no easy way to know how much memory is needed, we need some ways look 
tricky which makes the code complex: (fake code)

if (length = vsnprintf(NULL, 0, fmt, arg)) >= 0) {
	char *buf = (char*) malloc(length + 1);
	if (buf){
		va_start(arg, fmt);
		vsnprintf(buf, length + 1, fmt, arg);
		[snip]
		free(buf)
	}
}

So I don't think that it is worth to use malloc here, the similar to 2 3 5.
And we had used a few similar ways to fix this kinds of issues before.

// Robert

> 
> Alex
> 

