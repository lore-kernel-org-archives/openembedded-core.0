Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob10.myregisteredsite.com
	(atl4mhob10.myregisteredsite.com [209.17.115.48])
	by mail.openembedded.org (Postfix) with ESMTP id B673876FEA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 07:01:10 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.207])
	by atl4mhob10.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	t8H719Ni012135 for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 03:01:09 -0400
Received: (qmail 14501 invoked by uid 0); 17 Sep 2015 07:01:09 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO ?192.168.80.121?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 17 Sep 2015 07:01:09 -0000
To: openembedded-core@lists.openembedded.org
References: <1442462131-20150-1-git-send-email-net147@gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <55FA6533.1010205@topic.nl>
Date: Thu, 17 Sep 2015 09:01:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1442462131-20150-1-git-send-email-net147@gmail.com>
Subject: Re: [PATCH] image.py: make sure ROOTFS_SIZE is an integer
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
X-List-Received-Date: Thu, 17 Sep 2015 07:01:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Suggestion: Why bother so much about that last bit? If floats are being used 
(I suspect because "overhead_factor" is float), any bit-perfect accuracy has 
been thrown out the window anyway.

I suggest just saying "base_size = int(size_kb * overhead_factor)", and be 
done with it. If someone specifies "overhead_factor=1.2" or something, he 
really is not going to care about that last bit being rounded upwards. If 
everything is integer anyway, it will still be bit-perfect.


On 17-09-15 05:55, Jonathan Liu wrote:
> _get_rootfs_size was returning a float in some cases (e.g. 12288.0).
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   meta/lib/oe/image.py | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
> index 2361955..f8aa88b 100644
> --- a/meta/lib/oe/image.py
> +++ b/meta/lib/oe/image.py
> @@ -1,6 +1,7 @@
>   from oe.utils import execute_pre_post_process
>   import os
>   import subprocess
> +import math
>   import multiprocessing
>
>
> @@ -169,10 +170,7 @@ class Image(ImageDepGraph):
>           base_size = size_kb * overhead_factor
>           base_size = (base_size, rootfs_req_size)[base_size < rootfs_req_size] + \
>               rootfs_extra_space
> -
> -        if base_size != int(base_size):
> -            base_size = int(base_size + 1)
> -
> +        base_size = int(math.ceil(base_size))
>           base_size += rootfs_alignment - 1
>           base_size -= base_size % rootfs_alignment
>
>


