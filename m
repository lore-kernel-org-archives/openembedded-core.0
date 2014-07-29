Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 16F9365E2E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 13:43:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s6TDhSfh006783
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 06:43:28 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Tue, 29 Jul 2014 06:43:28 -0700
Message-ID: <53D7A4FF.2080303@windriver.com>
Date: Tue, 29 Jul 2014 08:43:27 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1406624623-25774-1-git-send-email-ting.liu@freescale.com>
In-Reply-To: <1406624623-25774-1-git-send-email-ting.liu@freescale.com>
Subject: Re: [PATCH] base-files: set dynamic COLUMNS via resize command
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
X-List-Received-Date: Tue, 29 Jul 2014 13:43:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/14, 4:03 AM, ting.liu@freescale.com wrote:
> From: Ting Liu <ting.liu@freescale.com>
>
> By default, COLUMNS is set to 80. If possible, run 'resize' to
> determine what the current dimensions are. This avoids the final
> part of long lines overlap the start of the same line.
>
> Signed-off-by: Ting Liu <ting.liu@freescale.com>
> ---
>   meta/recipes-core/base-files/base-files/profile |    4 ++++
>   1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
> index 0b2d9d7..88ab8d8 100644
> --- a/meta/recipes-core/base-files/base-files/profile
> +++ b/meta/recipes-core/base-files/base-files/profile
> @@ -26,6 +26,10 @@ if [ -d /etc/profile.d ]; then
>     unset i
>   fi
>
> +if [ -x /usr/bin/resize ];then
> +  /usr/bin/resize >/dev/null
> +fi
> +

Not sure how useful this is -- but -- the code should dynamically check for 
${bindir} instead of hard code /usr/bin here.  On many systems people collapse 
'bindir' down to just '/bin'.

So my suggestion would be an accompanying do_install step that corrects this 
reference if necessary.. something perhaps like:

if [ "/usr/bin" != "${bindir}" ]; then
     sed -i /usr/bin/resize -e "s,/usr/bin/resize,${bindir}/resize,"
fi

I'll leave it to others to discuss the merit of adding resize.  (I don't object 
BTW).

>   export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
>
>   umask 022
>


