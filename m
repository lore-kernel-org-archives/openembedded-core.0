Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A6BC6DD10
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 21:18:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB2LIQkI020263
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 2 Dec 2013 13:18:26 -0800 (PST)
Received: from [147.11.117.81] (147.11.117.81) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 2 Dec 2013 13:18:26 -0800
Message-ID: <529CF916.5030703@windriver.com>
Date: Mon, 2 Dec 2013 16:18:14 -0500
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>, Robert Yang
	<liezhi.yang@windriver.com>
References: <1382561247-30349-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1382561247-30349-1-git-send-email-kergoth@gmail.com>
X-Originating-IP: [147.11.117.81]
Subject: Re: [PATCH] base.bbclass: fix nondeterministic PACKAGECONFIG processing order
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
X-List-Received-Date: Mon, 02 Dec 2013 21:18:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-10-23 04:47 PM, Christopher Larson wrote:
> The PACKAGECONFIG flags were iterated over using dict.items(), but this
> returns the items in an undefined order. As this order determines the
> EXTRA_OECONF append order, we can get EXTRA_OECONF which are functionally
> equivalent, but whose contents differ, resulting in not using shared state
> archives we should be using.
>
> Signed-off-by: Christopher Larson <kergoth@gmail.com>

Robert,

Can this commit be pulled into dora?
More deterministic behaviour is more supportable behaviour!

It's:
    843a5dd
    base.bbclass: fix nondeterministic PACKAGECONFIG processing order
on master.

../Randy

> ---
>   meta/classes/base.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index dfa580c..93bc700 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -433,7 +433,7 @@ python () {
>           extradeps = []
>           extrardeps = []
>           extraconf = []
> -        for flag, flagval in pkgconfigflags.items():
> +        for flag, flagval in sorted(pkgconfigflags.items()):
>               if flag == "defaultval":
>                   continue
>               items = flagval.split(",")
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

