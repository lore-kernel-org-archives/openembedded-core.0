Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3AE287E97A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 02:43:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7M2hdKT020142
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 19:43:39 -0700 (PDT)
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 21 Aug 2019 19:43:38 -0700
To: Trevor Gamblin <Trevor.Gamblin@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <1566417666-22515-1-git-send-email-Trevor.Gamblin@windriver.com>
	<1566417666-22515-2-git-send-email-Trevor.Gamblin@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <aed232e0-f899-bf56-d040-a7a671d3bee3@windriver.com>
Date: Wed, 21 Aug 2019 22:43:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566417666-22515-2-git-send-email-Trevor.Gamblin@windriver.com>
X-Originating-IP: [172.25.44.5]
Subject: Re: [PATCH 2/2] quilt: added less to RDEPENDS list
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
X-List-Received-Date: Thu, 22 Aug 2019 02:43:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Re: [OE-core] [PATCH 2/2] quilt: added less to RDEPENDS list

s/added/add/

When in Rome:
$ cd .../oe-core
$ git log --oneline -10000 | grep -i add | wc -l
1376

$ git log --oneline -10000 | grep -i added | wc -l
19

On 8/21/19 4:01 PM, Trevor Gamblin wrote:
> From: Trevor Gamblin <trevor.gamblin@windriver.com>
> 
> The quilt "series" option relies on "less -R", but > BusyBox's implementation of less does not provide -R. It
> could be determined how to enable it in busybox's recipe,
> but given the use case it likely isn't needed.

That statement could be misleading, try:

The quilt "series" option relies on "less -R" but since
that option is not enabled by busybox in oe-core by default
so hard-code the dependency on 'less'.

 From 'man less':
    -r or --raw-control-chars
       Causes "raw" control characters to be displayed. ...
    -R or --RAW-CONTROL-CHARS
       Like -r, but only ANSI "color" escape sequences are
       output in "raw" form.  ...

In 2018, BusyBox's less added:
    8528d3d4f less: optional support of -R
but it is not enable by default for oe-core. While we could
enable the option, all known use-cases involve larger, more
developer-oriented recipes such as quilt or man pages.

---

I maintain that we need to resist adding one more wafer-thin
200 byte config to our default busybox config to avoid bloat
over the years. We wouldn't want the busybox package to burst!

../Randy

 > could be determined how to enable it in busybox's recipe,
 > but given the use case it likely isn't needed.
> 
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta/recipes-devtools/quilt/quilt.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
> index dcba62c..433e9b4 100644
> --- a/meta/recipes-devtools/quilt/quilt.inc
> +++ b/meta/recipes-devtools/quilt/quilt.inc
> @@ -78,7 +78,7 @@ FILES_guards = "${bindir}/guards"
>   FILES_${PN}-doc = "${mandir}/man1/quilt.1 ${docdir}/${BPN}"
>   FILES_guards-doc = "${mandir}/man1/guards.1"
>   
> -RDEPENDS_${PN} = "bash patch diffstat bzip2 util-linux"
> +RDEPENDS_${PN} = "bash patch diffstat bzip2 util-linux less"
>   RDEPENDS_${PN}_class-native = "diffstat-native patch-native bzip2-native"
>   
>   RDEPENDS_${PN}-ptest = "make file sed gawk diffutils findutils ed perl \
> 


-- 
# Randy MacLeod
# Wind River Linux

