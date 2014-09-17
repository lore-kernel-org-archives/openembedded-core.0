Return-Path: <raj.khem@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6548A712AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 23:14:50 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id m19so46730oag.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 16:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=6kY1FuDxYcJ5Dk0GaUxtwndRD0U45tXCuOCFoddyNhU=;
	b=fJZYnpVq5o4CyTRJe7kwgphWbVsVKrDJGdAwYGJZqcND+eK6RMJ7HDxq8bbviH2jEl
	rMhTD+57fFv195VdaF1KIjQtCkHKcpTqjs8Kaww7uv9L+PpyxlY96BKrOXara6psxnd3
	A71BFAL3weIexFtxxY3MhTxQcKwy/FA5KLw+VYxf/8RRw9p1mTFp43gPIcv0jv4vV/o5
	vtzn519D9QXCZoumQcPSaSR5LLxd6lW5J23g3lOEF4Ykcl68VqU1B6+2E/+/sXQ9G1ph
	J3QJSyGl0Zq39ExqM/WwmQlOzZuA41WdpM0eDlYlQ8ba5vbwM7NgxRPLH6yE1GJ+0Lg7
	vkLQ==
X-Received: by 10.60.174.197 with SMTP id bu5mr451403oec.3.1410995692155; Wed,
	17 Sep 2014 16:14:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.95.213 with HTTP; Wed, 17 Sep 2014 16:14:22 -0700 (PDT)
In-Reply-To: <1410942161-18469-1-git-send-email-rongqing.li@windriver.com>
References: <1410942161-18469-1-git-send-email-rongqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Sep 2014 16:14:22 -0700
Message-ID: <CAMKF1srbBfDZadaEBmLya5xDDXbVeJ6E4ERkWyuYbgnEzhTiHA@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpcbind: add option to make customer able to use fixed port number
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
X-List-Received-Date: Wed, 17 Sep 2014 23:14:54 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 17, 2014 at 1:22 AM,  <rongqing.li@windriver.com> wrote:
> From: Li Wang <li.wang@windriver.com>
>
> add option to make customer able to use fixed port number

if you have not submitted it upstream please do so. I would be
interested to hear feedback from upstream before we apply this patch

>
> Signed-off-by: Li Wang <li.wang@windriver.com>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../rpcbind_add_option_to_fix_port_number.patch    |   97 ++++++++++++++++++++
>  meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb     |    1 +
>  2 files changed, 98 insertions(+)
>  create mode 100644 meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
>
> diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch b/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
> new file mode 100644
> index 0000000..9193658
> --- /dev/null
> +++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
> @@ -0,0 +1,97 @@
> +From bb78a9571d6a3d0c542ed9d929bf71fd82448968 Mon Sep 17 00:00:00 2001
> +From: Roy Li <rongqing.li@windriver.com>
> +Date: Wed, 17 Sep 2014 13:22:14 +0800
> +Subject: [PATCH] add option to make customer able to use fixed port number
> +
> +Upstream-status: Pending
> +
> +Signed-off-by: Li Wang <li.wang@windriver.com>
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +---
> + src/rpcb_svc_com.c |   17 +++++++++++++++++
> + src/rpcbind.c      |    6 +++++-
> + 2 files changed, 22 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/rpcb_svc_com.c b/src/rpcb_svc_com.c
> +index f6bd6bd..0bbd6e4 100644
> +--- a/src/rpcb_svc_com.c
> ++++ b/src/rpcb_svc_com.c
> +@@ -48,6 +48,7 @@
> + #include <rpc/rpc.h>
> + #include <rpc/rpcb_prot.h>
> + #include <rpc/svc_dg.h>
> ++#include <rpc/rpc_com.h>
> + #include <netconfig.h>
> + #include <errno.h>
> + #include <syslog.h>
> +@@ -496,6 +497,7 @@ xdr_opaque_parms(XDR *xdrs, struct r_rmtcall_args *cap)
> +
> + static struct rmtcallfd_list *rmthead;
> + static struct rmtcallfd_list *rmttail;
> ++extern unsigned short fixed_port;
> +
> + int
> + create_rmtcall_fd(struct netconfig *nconf)
> +@@ -503,6 +505,8 @@ create_rmtcall_fd(struct netconfig *nconf)
> +       int fd;
> +       struct rmtcallfd_list *rmt;
> +       SVCXPRT *xprt;
> ++      struct __rpc_sockinfo si;
> ++      struct t_bind taddr;
> +
> +       if ((fd = __rpc_nconf2fd(nconf)) == -1) {
> +               if (debugging)
> +@@ -511,6 +515,19 @@ create_rmtcall_fd(struct netconfig *nconf)
> +                       nconf->nc_device, errno);
> +               return (-1);
> +       }
> ++
> ++      if (fixed_port) {
> ++              __rpc_fd2sockinfo(fd, &si);
> ++              memset(&taddr, 0, sizeof(taddr));
> ++              taddr.addr.maxlen = taddr.addr.len = si.si_alen;
> ++              taddr.addr.buf = malloc(si.si_alen);
> ++              if (taddr.addr.buf == NULL) {
> ++                      return -1;
> ++              }
> ++              *(unsigned short *)(&(taddr.addr.buf[0])) = si.si_af;
> ++              *(unsigned short *)(&(taddr.addr.buf[2])) = htons(fixed_port);
> ++              xprt = svc_tli_create(fd, nconf, &taddr, RPC_MAXDATASIZE, RPC_MAXDATASIZE);
> ++      } else
> +       xprt = svc_tli_create(fd, 0, (struct t_bind *) 0, 0, 0);
> +       if (xprt == NULL) {
> +               if (debugging)
> +diff --git a/src/rpcbind.c b/src/rpcbind.c
> +index 83dbe93..a2caa32 100644
> +--- a/src/rpcbind.c
> ++++ b/src/rpcbind.c
> +@@ -99,6 +99,7 @@ int runasdaemon = 0;
> + int insecure = 0;
> + int oldstyle_local = 0;
> + int verboselog = 0;
> ++unsigned short fixed_port = 0;
> +
> + char **hosts = NULL;
> + int nhosts = 0;
> +@@ -748,7 +749,7 @@ parseargs(int argc, char *argv[])
> + {
> +       int c;
> +       oldstyle_local = 1;
> +-      while ((c = getopt(argc, argv, "adh:ilswf")) != -1) {
> ++      while ((c = getopt(argc, argv, "adh:p:ilswf")) != -1) {
> +               switch (c) {
> +               case 'a':
> +                       doabort = 1;    /* when debugging, do an abort on */
> +@@ -766,6 +767,9 @@ parseargs(int argc, char *argv[])
> +                       if (hosts[nhosts - 1] == NULL)
> +                               errx(1, "Out of memory");
> +                       break;
> ++              case 'p':
> ++                      fixed_port = atoi(optarg);
> ++                      break;
> +               case 'i':
> +                       insecure = 1;
> +                       break;
> +--
> +1.7.10.4
> +
> diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
> index 4a5562b..391f094 100644
> --- a/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
> +++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
> @@ -16,6 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
>             ${UCLIBCPATCHES} \
>             file://rpcbind.conf \
>             file://rpcbind.service \
> +           file://rpcbind_add_option_to_fix_port_number.patch \
>            "
>
>  UCLIBCPATCHES_libc-uclibc = "file://0001-uclibc-nss.patch \
> --
> 1.7.10.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

