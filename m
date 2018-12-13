Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A11B36B55F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 01:45:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBD1iiIv024513
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Dec 2018 17:44:55 -0800
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 12 Dec 2018 17:44:33 -0800
To: Christopher Larson <kergoth@gmail.com>
References: <cover.1544597612.git.liezhi.yang@windriver.com>
	<3623f754f6cd91a1721933eed0c5a50ffbdfe14b.1544597612.git.liezhi.yang@windriver.com>
	<CABcZANnV4LG0aLwEvvyVz4qEWONZC5_UfixBiThBrQdmJhOzQA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <f53805c4-192c-227c-a4df-b1c3d5d12ddd@windriver.com>
Date: Thu, 13 Dec 2018 09:49:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CABcZANnV4LG0aLwEvvyVz4qEWONZC5_UfixBiThBrQdmJhOzQA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/6] base.bbclass: Add comments for gcc links to ccache
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
X-List-Received-Date: Thu, 13 Dec 2018 01:45:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Christopher,

On 12/12/18 11:50 PM, Christopher Larson wrote:
> This should probably remove the dirname srctool from path and check again with 
> the same direction, rather than reversing it, in case the toolchain is in 
> multiple locations in PATH, as  you’re flipping the PATH priority order doing it 
> this way. I realize you’re just updating the description, not the code, so just 
> a random th ought for the future here..

The problem is I don't know whether the code is also used for fixing other
cases. So I'm leaning to keep it as the current status since it works.

// Robert

> 
> On Tue, Dec 11, 2018 at 11:44 PM Robert Yang <liezhi.yang@windriver.com 
> <mailto:liezhi.yang@windriver.com>> wrote:
> 
>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>>
>     ---
>       meta/classes/base.bbclass | 4 ++++
>       1 file changed, 4 insertions(+)
> 
>     diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>     index e715ffa..e6af673 100644
>     --- a/meta/classes/base.bbclass
>     +++ b/meta/classes/base.bbclass
>     @@ -122,6 +122,10 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
>               desttool = os.path.join(dest, tool)
>               if not os.path.exists(desttool):
>                   srctool = bb.utils.which(path, tool, executable=True)
>     +            # gcc/g++ may link to ccache on some hosts, e.g.,
>     +            # /usr/local/bin/ccache/gcc -> /usr/bin/ccache, then which(gcc)
>     +            # would return /usr/local/bin/ccache/gcc, but what we need is
>     +            # /usr/bin/gcc, this code can check and fix that.
>                   if "ccache" in srctool:
>                       srctool = bb.utils.which(path, tool, executable=True,
>     direction=1)
>                   if srctool:
>     -- 
>     2.7.4
> 
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 
> 
> -- 
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics

