Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7ED1E71476
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 04:50:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8J4o1th009837
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 21:50:01 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 18 Sep 2014 21:50:00 -0700
Message-ID: <541BB61B.7070905@windriver.com>
Date: Fri, 19 Sep 2014 12:50:35 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1411099563-29139-1-git-send-email-fahad.usman@gmail.com>
In-Reply-To: <1411099563-29139-1-git-send-email-fahad.usman@gmail.com>
X-Originating-IP: [128.224.162.187]
Subject: Re: [PATCH] sysklogd: set INHIBIT_UPDATERCD_BBCLASS if 'sysvinit' not in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 19 Sep 2014 04:50:01 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/19/2014 12:06 PM, Fahad Usman wrote:
> We need to set INHIBIT_UPDATERCD_BBCLASS to "1" if 'sysvinit' is not
> present in DISTRO_FEATURES so that any un-necessary package dependencies
> are not added by update-rc.d.bbclass
>
> Signed-off-by: Fahad Usman <fahad.usman@gmail.com>
> ---
>   meta/recipes-extended/sysklogd/sysklogd.inc |    5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
> index bcf8aa7..3cbbdfd 100644
> --- a/meta/recipes-extended/sysklogd/sysklogd.inc
> +++ b/meta/recipes-extended/sysklogd/sysklogd.inc
> @@ -56,3 +56,8 @@ pkg_prerm_${PN} () {
>   	fi
>   	fi
>   }
> +
> +python __anonymous() {
> +    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
> +        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
> +}

I'm now adding systemd support for sysklogd.
This recipe will then inherit systemd.bbclass.
And the task of setting INHIBIT_UPDATERCD_BBCLASS is automatically done.

The patches will be sent out in one day or two.

Best Regards,
Chen Qi

