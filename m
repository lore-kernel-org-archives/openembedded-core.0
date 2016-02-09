Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B507D6011C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 14:56:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u19Eusrt013861
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Feb 2016 06:56:55 -0800 (PST)
Received: from [128.224.56.84] (128.224.56.84) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 9 Feb 2016 06:56:53 -0800
To: <openembedded-core@lists.openembedded.org>, <maciej.borzecki@open-rnd.pl>
References: <1454926183-22439-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<1454926183-22439-7-git-send-email-maciej.borzecki@open-rnd.pl>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <56B9FE35.5060109@windriver.com>
Date: Tue, 9 Feb 2016 09:56:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1454926183-22439-7-git-send-email-maciej.borzecki@open-rnd.pl>
X-Originating-IP: [128.224.56.84]
Subject: Re: [PATCH 6/6] systemd: remove unnecessary code
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
X-List-Received-Date: Tue, 09 Feb 2016 14:56:56 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-02-08 05:09 AM, Maciej Borzecki wrote:
> Remove unnecessary chown on journal file.

I assume that it's unnecessary because the ownership bits
are fine. Could you state whether the default ownership
is root:systemd-journal or that's it's not root:systemd-journal
but it doesn't matter for some reason.

>
> Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> ---
>   meta/recipes-core/systemd/systemd_228.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_228.bb b/meta/recipes-core/systemd/systemd_228.bb
> index 40ed81a37e78c67bae13f7ee7018d85efa2f6b7d..03434ff9d5ff19fe043332b0b53a4fa96ab2b120 100644
> --- a/meta/recipes-core/systemd/systemd_228.bb
> +++ b/meta/recipes-core/systemd/systemd_228.bb
> @@ -209,7 +209,7 @@ do_install() {
>   		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
>   	fi
>
> -	chown root:systemd-journal ${D}/${localstatedir}/log/journal
> +        # chown root:systemd-journal ${D}/${localstatedir}/log/journal

If it's not needed, remove it rather than comment it out.

>
>           # Delete journal README, as log can be symlinked inside volatile.
>           rm -f ${D}/${localstatedir}/log/README
>


Thanks for this and the other commits to allow us to trim down the
systemd footprint. Reducing the image size by a few MB does matter
to some people!

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

