Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DF8876BDD2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 03:35:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5B3YwQi021655
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2019 20:35:08 -0700
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 10 Jun 2019 20:34:47 -0700
To: Jiping Ma <jiping.ma2@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <1558595036-35165-1-git-send-email-jiping.ma2@windriver.com>
	<1558595036-35165-2-git-send-email-jiping.ma2@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <ecd20b34-e007-adee-62c1-234170db7e7a@windriver.com>
Date: Tue, 11 Jun 2019 11:34:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1558595036-35165-2-git-send-email-jiping.ma2@windriver.com>
X-Originating-IP: [128.224.162.186]
Subject: Re: [PATCH] [V2][PATCH] dhcp:"dhclient -x eth0" action is not correct.
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
X-List-Received-Date: Tue, 11 Jun 2019 03:35:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Ping


patch 0006-site.h-enable-gentle-shutdown.patch is involved by 
https://git.openembedded.org/openembedded-core/commit/?id=2c789bac353e17637549a7b31706761ba848728e

to fix problem of signal SIGTERM not handled properly. but now this 
problem have fixed by upstream.

and the patch 0006-site.h-enable-gentle-shutdown.patch will cause action 
of "dhclient -x eth0" not correct since it do some work before stop.


refer: 
http://isc-dhcp-users.2343191.n4.nabble.com/dhcpclient-and-dhcpd-do-not-stop-on-sigterm-td2528.html

On 5/23/19 3:03 PM, Jiping Ma wrote:
> Please ignore V1 of [OE-core][PATCH] dhcp:"dhclient -x eth0" action is not correct.
>
> The action of "dhclient -x eth0" and "dhclient -r eth0" is
> same when enable ENABLE_GENTLE_SHUTDOWN. Disable ENABLE_GENTLE_SHUTDOWN
> that will use the default signal hander.
>
> Signed-off-by: Jiping Ma <jiping.ma2@windriver.com>
> ---
>   .../dhcp/0006-site.h-enable-gentle-shutdown.patch  | 27 ----------------------
>   meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb       |  1 -
>   2 files changed, 28 deletions(-)
>   delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0006-site.h-enable-gentle-shutdown.patch
>
> diff --git a/meta/recipes-connectivity/dhcp/dhcp/0006-site.h-enable-gentle-shutdown.patch b/meta/recipes-connectivity/dhcp/dhcp/0006-site.h-enable-gentle-shutdown.patch
> deleted file mode 100644
> index 6ef70cc..0000000
> --- a/meta/recipes-connectivity/dhcp/dhcp/0006-site.h-enable-gentle-shutdown.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From 01641d146e4e6bea954e4a4ee1f6230b822665b4 Mon Sep 17 00:00:00 2001
> -From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Tue, 15 Aug 2017 15:37:49 +0800
> -Subject: [PATCH 06/11] site.h: enable gentle shutdown
> -
> -Upstream-Status: Inappropriate [configuration]
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -
> -Rebase to 4.3.6
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - includes/site.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -Index: dhcp-4.4.1/includes/site.h
> -===================================================================
> ---- dhcp-4.4.1.orig/includes/site.h
> -+++ dhcp-4.4.1/includes/site.h
> -@@ -295,7 +295,7 @@
> -    situations.  We plan to revisit this feature and may
> -    make non-backwards compatible changes including the
> -    removal of this define.  Use at your own risk.  */
> --/* #define ENABLE_GENTLE_SHUTDOWN */
> -+#define ENABLE_GENTLE_SHUTDOWN
> -
> - /* Include old error codes.  This is provided in case you
> -    are building an external program similar to omshell for
> diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb b/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
> index ca0daa1..b4c0d5d 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
> +++ b/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
> @@ -5,7 +5,6 @@ SRC_URI += "file://0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.pat
>               file://0003-link-with-lcrypto.patch \
>               file://0004-Fix-out-of-tree-builds.patch \
>               file://0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch \
> -            file://0006-site.h-enable-gentle-shutdown.patch \
>               file://0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch \
>               file://0009-remove-dhclient-script-bash-dependency.patch \
>               file://0012-dhcp-correct-the-intention-for-xml2-lib-search.patch \

-- 
BRs

Sandy(Li Changqing)


