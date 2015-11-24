Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DDAE5601D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 05:30:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAO5UtoQ010740
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 21:30:55 -0800 (PST)
Received: from [128.224.162.134] (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 23 Nov 2015 21:30:55 -0800
To: Chen Qi <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1448342223.git.Qi.Chen@windriver.com>
	<0f73a35f4fdbd74e380aa823d436a67f841b9d76.1448342223.git.Qi.Chen@windriver.com>
From: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <5653F60D.4040009@windriver.com>
Date: Tue, 24 Nov 2015 13:30:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <0f73a35f4fdbd74e380aa823d436a67f841b9d76.1448342223.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 1/1] dhcp: enable gentle shutdown
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
X-List-Received-Date: Tue, 24 Nov 2015 05:30:56 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年11月24日 13:21, Chen Qi wrote:
> For now, `systemctl stop dhcpd' cannot stop dhcpd correctly, the SIGTERM
> signal would time out, causing a SIGKILL signal sent to dhcpd.
>
> Patch site.h to enable gentle shutdown to so that dhcpd could be stopped
> by SIGTERM.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   .../dhcp/0001-site.h-enable-gentle-shutdown.patch  | 25 ++++++++++++++++++++++
>   meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb       |  1 +
>   2 files changed, 26 insertions(+)
>   create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-site.h-enable-gentle-shutdown.patch
>
> diff --git a/meta/recipes-connectivity/dhcp/dhcp/0001-site.h-enable-gentle-shutdown.patch b/meta/recipes-connectivity/dhcp/dhcp/0001-site.h-enable-gentle-shutdown.patch
> new file mode 100644
> index 0000000..4344212
> --- /dev/null
> +++ b/meta/recipes-connectivity/dhcp/dhcp/0001-site.h-enable-gentle-shutdown.patch
> @@ -0,0 +1,25 @@
> +Upstream-Status: Inappropriate [configuration]
> +
> +Subject: [PATCH] site.h: enable gentle shutdown
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + includes/site.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/includes/site.h b/includes/site.h
> +index 73fa4e8..9c33de3 100644
> +--- a/includes/site.h
> ++++ b/includes/site.h
> +@@ -280,7 +280,7 @@
> +    situations.  We plan to revisit this feature and may
> +    make non-backwards compatible changes including the
> +    removal of this define.  Use at your own risk.  */
> +-/* #define ENABLE_GENTLE_SHUTDOWN */
> ++#define ENABLE_GENTLE_SHUTDOWN

how about to pass the macro in TARGET_CFLAGS

TARGET_CFLAGS += "-DENABLE_GENTLE_SHUTDOWN"


-Roy

> +
> + /* Include old error codes.  This is provided in case you
> +    are building an external program similar to omshell for
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb b/meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb
> index b4a05fc..60ca4e3 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb
> +++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb
> @@ -6,6 +6,7 @@ SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
>               file://fixsepbuild.patch \
>               file://dhclient-script-drop-resolv.conf.dhclient.patch \
>               file://replace-ifconfig-route.patch \
> +            file://0001-site.h-enable-gentle-shutdown.patch \
>              "
>
>   SRC_URI[md5sum] = "5a284875dd2c12ddd388416d69156a67"
>

-- 
Best Reagrds,
Roy | RongQing Li

