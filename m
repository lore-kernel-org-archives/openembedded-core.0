Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 24C1B60034
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 01:43:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t691hZn4001060
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 8 Jul 2015 18:43:35 -0700 (PDT)
Received: from [128.224.162.176] (128.224.162.176) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 8 Jul 2015 18:43:34 -0700
Message-ID: <559DD1C5.2090905@windriver.com>
Date: Thu, 9 Jul 2015 09:43:33 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1436340750-18379-1-git-send-email-wenzong.fan@windriver.com>
	<CAJTo0LbWB--Pgd9WT_u6R=vcQz65G54YXdjJ2Tw-DwU3VbpbnA@mail.gmail.com>
In-Reply-To: <CAJTo0LbWB--Pgd9WT_u6R=vcQz65G54YXdjJ2Tw-DwU3VbpbnA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Fix packet discards HTTP redirect.
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
X-List-Received-Date: Thu, 09 Jul 2015 01:43:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2015 10:12 PM, Burton, Ross wrote:
> As per our commit guidelines, the commit message needs to start with the
> name of the recipe that was modified.

Fixed it, please refer to: [OE-core] [PATCH v2] apr: Fix packet discards 
HTTP redirect

Thanks
Wenzong

>
> Ross
>
> On 8 July 2015 at 08:32, <wenzong.fan@windriver.com
> <mailto:wenzong.fan@windriver.com>> wrote:
>
>     From: Li Wang <li.wang@windriver.com <mailto:li.wang@windriver.com>>
>
>     Disconnect the connection by poll() timeout.
>     If timeout=0 and apr_wait_for_io_or_timeout()=APR_TIMEUP then
>     apr_socket_recv() returns EAGAIN.
>
>     Signed-off-by: Noriaki Yoshitane <yoshitane.nrs@cnt.ncos.nec.co.jp
>     <mailto:yoshitane.nrs@cnt.ncos.nec.co.jp>>
>     Signed-off-by: Li Wang <li.wang@windriver.com
>     <mailto:li.wang@windriver.com>>
>     ---
>       .../apr/Fix-packet-discards-HTTP-redirect.patch    | 32
>     ++++++++++++++++++++++
>       meta/recipes-support/apr/apr_1.5.2.bb <http://apr_1.5.2.bb>
>            |  1 +
>       2 files changed, 33 insertions(+)
>       create mode 100644
>     meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-redirect.patch
>
>     diff --git
>     a/meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-redirect.patch
>     b/meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-redirect.patch
>     new file mode 100644
>     index 0000000..6805b8b
>     --- /dev/null
>     +++
>     b/meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-redirect.patch
>     @@ -0,0 +1,32 @@
>     +Fix packet discards HTTP redirect.
>     +
>     +Disconnect the connection by poll() timeout.
>     +If timeout=0 and apr_wait_for_io_or_timeout()=APR_TIMEUP then
>     +apr_socket_recv() returns EAGAIN.
>     +
>     +Upstream-Status: Pending
>     +
>     +Signed-off-by: Noriaki Yoshitane <yoshitane.nrs@cnt.ncos.nec.co.jp
>     <mailto:yoshitane.nrs@cnt.ncos.nec.co.jp>>
>     +Signed-off-by: Li Wang <li.wang@windriver.com
>     <mailto:li.wang@windriver.com>>
>     +---
>     + network_io/unix/sendrecv.c |    4 ++++
>     + 1 file changed, 4 insertions(+)
>     +
>     +diff --git a/network_io/unix/sendrecv.c b/network_io/unix/sendrecv.c
>     +index c133a26..e8faf15 100644
>     +--- a/network_io/unix/sendrecv.c
>     ++++ b/network_io/unix/sendrecv.c
>     +@@ -85,6 +85,10 @@ apr_status_t apr_socket_recv(apr_socket_t *sock,
>     char *buf, apr_size_t *len)
>     +                       && (sock->timeout > 0)) {
>     + do_select:
>     +         arv = apr_wait_for_io_or_timeout(NULL, sock, 1);
>     ++        if ((arv == APR_TIMEUP) && (sock->timeout == 0)) {
>     ++            *len = 0;
>     ++            return EAGAIN;
>     ++        }
>     +         if (arv != APR_SUCCESS) {
>     +             *len = 0;
>     +             return arv;
>     +--
>     +1.7.9.5
>     +
>     diff --git a/meta/recipes-support/apr/apr_1.5.2.bb
>     <http://apr_1.5.2.bb> b/meta/recipes-support/apr/apr_1.5.2.bb
>     <http://apr_1.5.2.bb>
>     index aac6276..c1f7f38 100644
>     --- a/meta/recipes-support/apr/apr_1.5.2.bb <http://apr_1.5.2.bb>
>     +++ b/meta/recipes-support/apr/apr_1.5.2.bb <http://apr_1.5.2.bb>
>     @@ -15,6 +15,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
>                  file://configfix.patch \
>                  file://run-ptest \
>                  file://upgrade-and-fix-1.5.1.patch \
>     +           file://Fix-packet-discards-HTTP-redirect.patch \
>       "
>
>       SRC_URI[md5sum] = "4e9769f3349fe11fc0a5e1b224c236aa"
>     --
>     1.9.1
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

