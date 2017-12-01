Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A472784E6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 17:43:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vB1HhWNR024419
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 1 Dec 2017 09:43:32 -0800
Received: from soho-mhatle-m.local (172.25.36.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 1 Dec 2017 09:43:31 -0800
To: Olof Johansson <olof.johansson@axis.com>,
	<openembedded-core@lists.openembedded.org>
References: <20171201155024.3002-1-olofjn@axis.com>
	<20171201155024.3002-6-olofjn@axis.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <7bb6a35d-19ac-1b50-46c1-e0395a0fee61@windriver.com>
Date: Fri, 1 Dec 2017 11:43:30 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171201155024.3002-6-olofjn@axis.com>
Cc: Olof Johansson <olofjn@axis.com>
Subject: Re: [PATCH 5/5] lib/oe/package.py: is_elf: Make it less prone to false positives
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
X-List-Received-Date: Fri, 01 Dec 2017 17:43:37 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/1/17 9:50 AM, Olof Johansson wrote:
> Avoid matching substrings that are picked up from paths, for instance.
> Do this by anchoring the tokens we look for (e.g "executable" or "not
> stripped") with whitespace and punctuation.
> 
> Submitted with this patch series is a change that adds the use of
> --brief to file. This removes the path prefix to the output, but the
> path can still be included in shebang lines (which file will report as
> something like "a /foo/bar/baz.py script").
> 
> Signed-off-by: Olof Johansson <olofjn@axis.com>
> ---
>  meta/lib/oe/package.py | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index 976d2ef36c..2bd771cfc5 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -84,17 +84,17 @@ def is_elf(path, on_error=_is_elf_error):
>          error_cb('"file %s" failed')
>          return
>  
> -    if not "ELF" in result:
> +    if not result.startswith("ELF "):
>          return 0
>  
>      exec_type = 1
> -    if "not stripped" not in result:
> +    if ", not stripped" not in result:

The original implementation did not include the ',' options because different
versions of file (as well as different architectures) would return different
strings.

They all contains the same information, but order and inclusion of ',' changed
regularly.

So I would caution that for this to check out a wide variety of host systems and
architectures would need to be verified.  (It's very possible that all modern
systems now conform to a single standard...)

(The rest of the serious looks like a very good improvement, and I've got no
further comments on that.)

--Mark

>          exec_type |= 2
> -    if "executable" in result:
> +    if " executable, " in result:
>          exec_type |= 4
> -    if "shared" in result:
> +    if " shared object, " in result:
>          exec_type |= 8
> -    if "relocatable" in result and is_kernel_module(path):
> +    if "relocatable, " in result and is_kernel_module(path):
>          exec_type |= 16
>      return exec_type
>  
> 


