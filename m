Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 97E2577BC5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 01:26:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5M1QesU002308
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 18:26:40 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 21 Jun 2018 18:26:39 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20180621203549.6187-1-damien.riegel@savoirfairelinux.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <e3c72d4c-57bd-a444-43c8-0796939089d8@windriver.com>
Date: Fri, 22 Jun 2018 09:29:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180621203549.6187-1-damien.riegel@savoirfairelinux.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH] systemd: quote SYSTEMD_SERVICE in prerm and postinst
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
X-List-Received-Date: Fri, 22 Jun 2018 01:26:40 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Damien,

If some recipe has more than one unit file, this patch will cause 
problem for it.

Best Regards,
Chen Qi


On 06/22/2018 04:35 AM, Damien Riegel wrote:
> Systemd mount configuration file must have a name that match the mount
> point directory they control. So for instance, if a mount file contains
>
>      [Mount]
>      ...
>      Where=/mnt/my-data
>
> The file must be named `mnt-my\x2ddata.mount`, or systemd will refuse to
> honour it.
>
> If this config file contains an [Install] section, it will silently fail
> because the unit file is not quoted when systemctl is called. To fix
> that, quote `${SYSTEMD_SERVICE}` in prerm and postinst hooks.
>
> Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
> ---
>   meta/classes/systemd.bbclass | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
> index 1b134322fb..589e73c855 100644
> --- a/meta/classes/systemd.bbclass
> +++ b/meta/classes/systemd.bbclass
> @@ -34,10 +34,10 @@ if type systemctl >/dev/null 2>/dev/null; then
>   		systemctl daemon-reload
>   	fi
>   
> -	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
> +	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} "${SYSTEMD_SERVICE}"
>   
>   	if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
> -		systemctl --no-block restart ${SYSTEMD_SERVICE}
> +		systemctl --no-block restart "${SYSTEMD_SERVICE}"
>   	fi
>   fi
>   }
> @@ -51,10 +51,10 @@ fi
>   
>   if type systemctl >/dev/null 2>/dev/null; then
>   	if [ -z "$D" ]; then
> -		systemctl stop ${SYSTEMD_SERVICE}
> +		systemctl stop "${SYSTEMD_SERVICE}"
>   	fi
>   
> -	systemctl $OPTS disable ${SYSTEMD_SERVICE}
> +	systemctl $OPTS disable "${SYSTEMD_SERVICE}"
>   fi
>   }
>   



