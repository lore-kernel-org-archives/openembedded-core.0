Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 77633731A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 07:32:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6D7WsKo026165
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 00:32:54 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 13 Jul 2016 00:32:53 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1457416218-21537-1-git-send-email-Zhixiong.Chi@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <5785EEA4.3080800@windriver.com>
Date: Wed, 13 Jul 2016 15:32:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1457416218-21537-1-git-send-email-Zhixiong.Chi@windriver.com>
Subject: Re: [PATCH] avahi: restore rlimit-nproc tweak for avahi discovery
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
X-List-Received-Date: Wed, 13 Jul 2016 07:32:54 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016年03月08日 13:50, Zhixiong Chi wrote:
> Looks like we are still falling victim to:
>     "chroot.c: fork() failed: Resource temporarily unavailable) = 57"
> So we restore the removal of rlimit-nproc in avahi.conf, and could
> receive return value from daemon process to start avahi-daemon.service
> successfully.
>
> The original patch is from
> <https://github.com/WindRiver-OpenSourceLabs/overc-installer>
> <commit 1ee34b64b676c79d71e1a9f2fb5dfa80d3616714>
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> Signed-off-by: Zhixiong Chi <Zhixiong.Chi@windriver.com>
> ---
>   meta/recipes-connectivity/avahi/avahi.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
> index faa8ee8..65bdf6b 100644
> --- a/meta/recipes-connectivity/avahi/avahi.inc
> +++ b/meta/recipes-connectivity/avahi/avahi.inc
> @@ -63,6 +63,7 @@ LDFLAGS_append_uclinux-uclibc = " -lintl"
>   
>   do_configure_prepend() {
>       sed 's:AM_CHECK_PYMOD:echo "no pymod" #AM_CHECK_PYMOD:g' -i ${S}/configure.ac
> +    sed -i "s/^.*rlimit\-nproc=.*/# rlimit-nproc=3/" ${S}/avahi-daemon/avahi-daemon.conf
>   }
>   
>   

Any comment on this patch?


Thanks.


-- 
Regards,
Neil | Kai Kang


