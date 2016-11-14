Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AF6A46FF72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 16:06:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAEG61Pf018818
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 14 Nov 2016 08:06:01 -0800 (PST)
Received: from [128.224.27.87] (128.224.27.87) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 14 Nov 2016 08:06:00 -0800
To: Christopher Larson <clarson@kergoth.com>
References: <cover.1479133967.git.liezhi.yang@windriver.com>
	<8c8065fec7073acfbe7c9ea308137e7bb8b83321.1479133967.git.liezhi.yang@windriver.com>
	<CABcZANn7+CW65pS-fV8d=0ju9v5YjAY64=b3=qZLnZ8C+uz+hg@mail.gmail.com>
	<ea0d4ea9-f9c6-64bf-2647-bd1f55b62534@windriver.com>
	<CABcZANniN3J9vLsXu=K3StVyXERoTiAHGb_Ppn_APv+0kYUPUA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <4e2659f6-3cbf-5d91-7a08-9675657d4495@windriver.com>
Date: Tue, 15 Nov 2016 00:05:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CABcZANniN3J9vLsXu=K3StVyXERoTiAHGb_Ppn_APv+0kYUPUA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] sanity.bbclass: fix check_connectivity() for BB_NO_NETWORK = "0"
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
X-List-Received-Date: Mon, 14 Nov 2016 16:06:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 11/14/2016 11:38 PM, Christopher Larson wrote:
>
> On Mon, Nov 14, 2016 at 8:37 AM, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     On 11/14/2016 11:03 PM, Christopher Larson wrote:
>
>
>         On Mon, Nov 14, 2016 at 7:34 AM, Robert Yang <liezhi.yang@windriver.com
>         <mailto:liezhi.yang@windriver.com>
>         <mailto:liezhi.yang@windriver.com <mailto:liezhi.yang@windriver.com>>>
>         wrote:
>
>             The old code:
>             network_enabled = not d.getVar('BB_NO_NETWORK', True)
>
>             It is True only when BB_NO_NETWORK is not set (None),
>             but BB_NO_NETWORK = "0" should also be True while "1" means no network,
>             "0" means need network in a normal case.
>
>             Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>         <mailto:liezhi.yang@windriver.com>
>             <mailto:liezhi.yang@windriver.com <mailto:liezhi.yang@windriver.com>>>
>             ---
>              meta/classes/sanity.bbclass | 14 +++++++++-----
>              1 file changed, 9 insertions(+), 5 deletions(-)
>
>             diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
>             index 7e383f9..c5e3809 100644
>             --- a/meta/classes/sanity.bbclass
>             +++ b/meta/classes/sanity.bbclass
>             @@ -363,15 +363,19 @@ def check_connectivity(d):
>                  test_uris = (d.getVar('CONNECTIVITY_CHECK_URIS', True) or
>         "").split()
>                  retval = ""
>
>             +    bbn = d.getVar('BB_NO_NETWORK', True)
>             +    if bbn not in (None, '0', '1'):
>             +        return 'BB_NO_NETWORK should be "0" or "1", but it is "%s"'
>         % bbn
>
>
>         Does this mirror the same logic used in bitbake? What’s the behavior if it’s
>         set, but to the empty string?
>
>
>     bitbake only checks whether it equals "1" or not. Without this patch, an empty
>     string is the same as not set since it doesn't equal to "1". But if it is
>     set to "0", bitbake uses it as enable network, sanity.bbclass uses it
>     as disable netowrk, which are conflicted. We can add checking for empty string,
>     but do we have to ? Limit it to "0" or "1" makes things clear.
>
>
> IMO if we’re going to change the semantics, we should do it in bitbake and then
> mirror that in the metadata. Sanity checking should mirror the actual variable
> behavior where it’s used.

Sounds reasonable, but I'm not sure how to do it, ways I can think out:
1) Handle "0" as enable network as bitbake does in sanity.bbclass
2) If we want to limit its values, maybe we need check it in bitbake rather
    than in sanity.bbclass, there are also other values have the similar
    problems, I did a rough grep, such as BB_FETCH_PREMIRRORONLY:

fetch2/__init__.py:        premirroronly = 
(self.d.getVar("BB_FETCH_PREMIRRORONLY", True) == "1")
fetch2/git.py:        if d.getVar("BB_FETCH_PREMIRRORONLY", True) is not None:

The __init__.py only checks whether it is "1" or not, but git.py checks if it
is None, there would be confusions when it is "" or "0".

// Robert

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics

