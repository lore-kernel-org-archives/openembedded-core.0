Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 279CFC77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 16:40:41 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.50531.1681144831822810500
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 09:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=QAeNYKU7;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.52, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f52.google.com with SMTP id f26so7650387ejb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1681144830; x=1683736830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAFcz3kiQaQLwH02dpb1ZWurYsjnr3hLepOOoTz2Shw=;
        b=QAeNYKU7O42GRiv0WpwWJ+LSlSEOmAYuSquRsIgr5BfAsxiz0hSMSO/WKcLBLFrgRM
         C8sot69t8RqBfoXEqapcToYW8GEIjn6QLz2nOlR//14ZqfsCcx2tz2/atVHD0NeCfi+W
         C9aaXZdn/ZgDrhfnnbMTtWCEzDBU4tW/IRkeNSVuI+wYK035v+1wfZMF08ckW7MV7WMF
         C/NcI66+IA3yTki6Xtr6ZdQ+pvEeYEDmOcgZ/Kbkr6pt5OLkOBn9dYWuWUfAN6p6B3SU
         ldRhFPBq9VhuUX/XwgG7+/ZdEssVrPwFkHHQQ1ax9KehdTE48BZ/M9pdK1paej7yScDi
         IEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681144830; x=1683736830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAFcz3kiQaQLwH02dpb1ZWurYsjnr3hLepOOoTz2Shw=;
        b=1dGRLF6XdkU8aUbspMYcyg2mCI5Lh+2kWTPse7M0Ap+hzT9qG6diDZ3RhZhjm0wQ5D
         bL2FN3/Vd1v2UAXI0sZtwXons3JvPH30iG/kKWOZJEKDaZwuOL0KzayW0XC2rozKYtbW
         PAUiJ6HsBprIHOiW1CXdId6RxJA2Iyo3YWseFsDE3EXqDebAOUzSp6WKK/9IJbBZEfA4
         SlorSjbYFhQTHSSxBxkUbnDTf+BP5hsmGl4JxOnYisJBkl+jtmN0dI81Usb1attZ0U+J
         BqIG38MUD0gPukbooppj+9i2ChE+YUNy6DFMYFHFl3oNwQ/kmU9nodJ3sApPFRMTez5C
         d2Qw==
X-Gm-Message-State: AAQBX9e8BdSCpa+c7wj5EGtoBYU7mglzjXtrjI8X2tiI7PFhnxp58dP+
	UU8uw42ZBBivSQGZ9/wxp0Du93CC8mMM3QfBiscnJg==
X-Google-Smtp-Source: AKy350ZPzwNgBegCAMDfiQosL6vDASIqVKdTMhKAVj7FQTY7Dn6kgkm9zEOMcu6COqKc8SiHJPbxGXgU1e8ilhA93AE=
X-Received: by 2002:a17:906:649:b0:90a:33e4:5a69 with SMTP id
 t9-20020a170906064900b0090a33e45a69mr3364471ejb.3.1681144829772; Mon, 10 Apr
 2023 09:40:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230330195143.64886-1-gauragup@cisco.com> <BYAPR11MB2886AB65C256C5D329D32FDFC2959@BYAPR11MB2886.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB2886AB65C256C5D329D32FDFC2959@BYAPR11MB2886.namprd11.prod.outlook.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 10 Apr 2023 06:40:18 -1000
Message-ID: <CAOSpxda9=06KFyN_ZvdT712F2uDHrU4+2=nm+SZk2Yi7vXN3wA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] Fix qemu build error with dunfell
 release "yocto-3.1.24"
To: gauragup@cisco.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 16:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179893

Hi Gaurav,

I have this patch in my current test queue.

I changed the shortlog to: "qemu: fix build error introduced by
CVE-2021-3929 fix"

Steve

On Mon, Apr 10, 2023 at 6:11=E2=80=AFAM Gaurav Gupta (gauragup) via
lists.openembedded.org <gauragup=3Dcisco.com@lists.openembedded.org>
wrote:
>
> Hello,
>
>
>
> Please let me know if there are any comments or if the patch is good.
>
>
>
> Thanks,
> Gaurav
>
>
>
> From: Gaurav Gupta <gauragup@cisco.com>
> Date: Thursday, March 30, 2023 at 12:51 PM
> To: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Cc: Gaurav Gupta (gauragup) <gauragup@cisco.com>
> Subject: [dunfell][PATCH] Fix qemu build error with dunfell release "yoct=
o-3.1.24"
>
> The patch for CVE-2021-3929 applied on dunfell returns a value for a
> void function. This results in the following compiler warning/error:
>
> hw/block/nvme.c:77:6: error: void function
> 'nvme_addr_read' should not return a value [-Wreturn-type]
>
> return NVME_DATA_TRAS_ERROR;
> ^      ~~~~~~~~~~~~~~~~~~~~
>
> In newer versions of qemu, the functions is changed to have a return
> value, but that is not present in the version of qemu used in =E2=80=9Cdu=
nfell=E2=80=9D.
>
> Backport some of the patches to correct this.
>
> Signed-off-by: Gaurav Gupta <gauragup@cisco.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc                |   2 +
>  .../recipes-devtools/qemu/qemu/CVE-2021-3929.patch |  33 ++---
>  .../qemu/hw-block-nvme-handle-dma-errors.patch     | 146 +++++++++++++++=
++++++
>  .../hw-block-nvme-refactor-nvme_addr_read.patch    |  55 ++++++++
>  4 files changed, 221 insertions(+), 15 deletions(-)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/hw-block-nvme-handle-=
dma-errors.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/hw-block-nvme-refacto=
r-nvme_addr_read.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index 0649727..4100436 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -115,6 +115,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.t=
ar.xz \
>             file://CVE-2021-3638.patch \
>             file://CVE-2021-20196.patch \
>             file://CVE-2021-3507.patch \
> +           file://hw-block-nvme-refactor-nvme_addr_read.patch \
> +           file://hw-block-nvme-handle-dma-errors.patch \
>             file://CVE-2021-3929.patch \
>             file://CVE-2022-4144.patch \
>             "
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3929.patch
> index 3df2f88..a1862f1 100644
> --- a/meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch
> @@ -1,7 +1,8 @@
> -From 736b01642d85be832385063f278fe7cd4ffb5221 Mon Sep 17 00:00:00 2001
> -From: Klaus Jensen <k.jensen@samsung.com>
> -Date: Fri, 17 Dec 2021 10:44:01 +0100
> -Subject: [PATCH] hw/nvme: fix CVE-2021-3929
> +From 2c682b5975b41495f98cc34b8243042c446eec44 Mon Sep 17 00:00:00 2001
> +From: Gaurav Gupta <gauragup@cisco.com>
> +Date: Wed, 29 Mar 2023 14:36:16 -0700
> +Subject: [PATCH] hw/nvme: fix CVE-2021-3929 MIME-Version: 1.0 Content-Ty=
pe:
> + text/plain; charset=3DUTF-8 Content-Transfer-Encoding: 8bit
>  MIME-Version: 1.0
>  Content-Type: text/plain; charset=3DUTF-8
>  Content-Transfer-Encoding: 8bit
> @@ -17,21 +18,23 @@ Reviewed-by: Keith Busch <kbusch@kernel.org>
>  Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>  Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>
> -Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/736b01642d85be832385]
> +Upstream-Status: Backport
> +[https://gitlab.com/qemu-project/qemu/-/commit/736b01642d85be832385]
>  CVE: CVE-2021-3929
>  Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +Signed-off-by: Gaurav Gupta <gauragup@cisco.com>
>  ---
>   hw/block/nvme.c | 23 +++++++++++++++++++++++
>   hw/block/nvme.h |  1 +
>   2 files changed, 24 insertions(+)
>
>  diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> -index 12d82542..e7d0750c 100644
> +index bda446d..ae9b19f 100644
>  --- a/hw/block/nvme.c
>  +++ b/hw/block/nvme.c
> -@@ -52,8 +52,31 @@
> -
> - static void nvme_process_sq(void *opaque);
> +@@ -60,8 +60,31 @@ static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr=
)
> +     return addr >=3D low && addr < hi;
> + }
>
>  +static inline bool nvme_addr_is_iomem(NvmeCtrl *n, hwaddr addr)
>  +{
> @@ -51,18 +54,18 @@ index 12d82542..e7d0750c 100644
>  +    return addr >=3D lo && addr < hi;
>  +}
>  +
> - static void nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int siz=
e)
> + static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size=
)
>   {
>  +
>  +    if (nvme_addr_is_iomem(n, addr)) {
> -+       return NVME_DATA_TRAS_ERROR;
> ++      return NVME_DATA_TRAS_ERROR;
>  +    }
>  +
> -     if (n->cmbsz && addr >=3D n->ctrl_mem.addr &&
> -                 addr < (n->ctrl_mem.addr + int128_get64(n->ctrl_mem.siz=
e))) {
> +     if (n->cmbsz && nvme_addr_is_cmb(n, addr)) {
>           memcpy(buf, (void *)&n->cmbuf[addr - n->ctrl_mem.addr], size);
> +         return 0;
>  diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> -index 557194ee..5a2b119c 100644
> +index 557194e..5a2b119 100644
>  --- a/hw/block/nvme.h
>  +++ b/hw/block/nvme.h
>  @@ -59,6 +59,7 @@ typedef struct NvmeNamespace {
> @@ -74,5 +77,5 @@ index 557194ee..5a2b119c 100644
>       MemoryRegion ctrl_mem;
>       NvmeBar      bar;
>  --
> -2.30.2
> +1.8.3.1
>
> diff --git a/meta/recipes-devtools/qemu/qemu/hw-block-nvme-handle-dma-err=
ors.patch b/meta/recipes-devtools/qemu/qemu/hw-block-nvme-handle-dma-errors=
.patch
> new file mode 100644
> index 0000000..0fdae83
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/hw-block-nvme-handle-dma-errors.pat=
ch
> @@ -0,0 +1,146 @@
> +From ea2a7c7676d8eb9d1458eaa4b717df46782dcb3a Mon Sep 17 00:00:00 2001
> +From: Gaurav Gupta <gauragup@cisco.com>
> +Date: Wed, 29 Mar 2023 14:07:17 -0700
> +Subject: [PATCH 2/2] hw/block/nvme: handle dma errors
> +
> +Handling DMA errors gracefully is required for the device to pass the
> +block/011 test ("disable PCI device while doing I/O") in the blktests
> +suite.
> +
> +With this patch the device sets the Controller Fatal Status bit in the
> +CSTS register when failing to read from a submission queue or writing to
> +a completion queue; expecting the host to reset the controller.
> +
> +If DMA errors occur at any other point in the execution of the command
> +(say, while mapping the PRPs), the command is aborted with a Data
> +Transfer Error status code.
> +
> +Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> +Signed-off-by: Gaurav Gupta <gauragup@cisco.com>
> +---
> + hw/block/nvme.c       | 41 +++++++++++++++++++++++++++++++----------
> + hw/block/trace-events |  3 +++
> + 2 files changed, 34 insertions(+), 10 deletions(-)
> +
> +diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> +index e6f24a6..bda446d 100644
> +--- a/hw/block/nvme.c
> ++++ b/hw/block/nvme.c
> +@@ -60,14 +60,14 @@ static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr add=
r)
> +     return addr >=3D low && addr < hi;
> + }
> +
> +-static void nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int siz=
e)
> ++static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size=
)
> + {
> +     if (n->cmbsz && nvme_addr_is_cmb(n, addr)) {
> +         memcpy(buf, (void *)&n->cmbuf[addr - n->ctrl_mem.addr], size);
> +-        return;
> ++        return 0;
> +     }
> +
> +-    pci_dma_read(&n->parent_obj, addr, buf, size);
> ++    return pci_dma_read(&n->parent_obj, addr, buf, size);
> + }
> +
> + static int nvme_check_sqid(NvmeCtrl *n, uint16_t sqid)
> +@@ -152,6 +152,7 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIO=
Vector *iov, uint64_t prp1,
> +     hwaddr trans_len =3D n->page_size - (prp1 % n->page_size);
> +     trans_len =3D MIN(len, trans_len);
> +     int num_prps =3D (len >> n->page_bits) + 1;
> ++    int ret;
> +
> +     if (unlikely(!prp1)) {
> +         trace_nvme_err_invalid_prp();
> +@@ -178,7 +179,11 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUI=
OVector *iov, uint64_t prp1,
> +
> +             nents =3D (len + n->page_size - 1) >> n->page_bits;
> +             prp_trans =3D MIN(n->max_prp_ents, nents) * sizeof(uint64_t=
);
> +-            nvme_addr_read(n, prp2, (void *)prp_list, prp_trans);
> ++            ret =3D nvme_addr_read(n, prp2, (void *)prp_list, prp_trans=
);
> ++            if (ret) {
> ++                trace_pci_nvme_err_addr_read(prp2);
> ++                return NVME_DATA_TRAS_ERROR;
> ++            }
> +             while (len !=3D 0) {
> +                 uint64_t prp_ent =3D le64_to_cpu(prp_list[i]);
> +
> +@@ -191,8 +196,12 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUI=
OVector *iov, uint64_t prp1,
> +                     i =3D 0;
> +                     nents =3D (len + n->page_size - 1) >> n->page_bits;
> +                     prp_trans =3D MIN(n->max_prp_ents, nents) * sizeof(=
uint64_t);
> +-                    nvme_addr_read(n, prp_ent, (void *)prp_list,
> +-                        prp_trans);
> ++                    ret =3D nvme_addr_read(n, prp_ent, (void *)prp_list=
,
> ++                                         prp_trans);
> ++                    if (ret) {
> ++                        trace_pci_nvme_err_addr_read(prp_ent);
> ++                        return NVME_DATA_TRAS_ERROR;
> ++                    }
> +                     prp_ent =3D le64_to_cpu(prp_list[i]);
> +                 }
> +
> +@@ -286,6 +295,7 @@ static void nvme_post_cqes(void *opaque)
> +     NvmeCQueue *cq =3D opaque;
> +     NvmeCtrl *n =3D cq->ctrl;
> +     NvmeRequest *req, *next;
> ++    int ret;
> +
> +     QTAILQ_FOREACH_SAFE(req, &cq->req_list, entry, next) {
> +         NvmeSQueue *sq;
> +@@ -295,15 +305,21 @@ static void nvme_post_cqes(void *opaque)
> +             break;
> +         }
> +
> +-        QTAILQ_REMOVE(&cq->req_list, req, entry);
> +         sq =3D req->sq;
> +         req->cqe.status =3D cpu_to_le16((req->status << 1) | cq->phase)=
;
> +         req->cqe.sq_id =3D cpu_to_le16(sq->sqid);
> +         req->cqe.sq_head =3D cpu_to_le16(sq->head);
> +         addr =3D cq->dma_addr + cq->tail * n->cqe_size;
> ++        ret =3D pci_dma_write(&n->parent_obj, addr, (void *)&req->cqe,
> ++                            sizeof(req->cqe));
> ++        if (ret) {
> ++            trace_pci_nvme_err_addr_write(addr);
> ++            trace_pci_nvme_err_cfs();
> ++            n->bar.csts =3D NVME_CSTS_FAILED;
> ++            break;
> ++        }
> ++        QTAILQ_REMOVE(&cq->req_list, req, entry);
> +         nvme_inc_cq_tail(cq);
> +-        pci_dma_write(&n->parent_obj, addr, (void *)&req->cqe,
> +-            sizeof(req->cqe));
> +         QTAILQ_INSERT_TAIL(&sq->req_list, req, entry);
> +     }
> +     if (cq->tail !=3D cq->head) {
> +@@ -888,7 +904,12 @@ static void nvme_process_sq(void *opaque)
> +
> +     while (!(nvme_sq_empty(sq) || QTAILQ_EMPTY(&sq->req_list))) {
> +         addr =3D sq->dma_addr + sq->head * n->sqe_size;
> +-        nvme_addr_read(n, addr, (void *)&cmd, sizeof(cmd));
> ++        if (nvme_addr_read(n, addr, (void *)&cmd, sizeof(cmd))) {
> ++            trace_pci_nvme_err_addr_read(addr);
> ++            trace_pci_nvme_err_cfs();
> ++            n->bar.csts =3D NVME_CSTS_FAILED;
> ++            break;
> ++        }
> +         nvme_inc_sq_head(sq);
> +
> +         req =3D QTAILQ_FIRST(&sq->req_list);
> +diff --git a/hw/block/trace-events b/hw/block/trace-events
> +index c03e80c..4e4ad4e 100644
> +--- a/hw/block/trace-events
> ++++ b/hw/block/trace-events
> +@@ -60,6 +60,9 @@ nvme_mmio_shutdown_set(void) "shutdown bit set"
> + nvme_mmio_shutdown_cleared(void) "shutdown bit cleared"
> +
> + # nvme traces for error conditions
> ++pci_nvme_err_addr_read(uint64_t addr) "addr 0x%"PRIx64""
> ++pci_nvme_err_addr_write(uint64_t addr) "addr 0x%"PRIx64""
> ++pci_nvme_err_cfs(void) "controller fatal status"
> + nvme_err_invalid_dma(void) "PRP/SGL is too small for transfer size"
> + nvme_err_invalid_prplist_ent(uint64_t prplist) "PRP list entry is null =
or not page aligned: 0x%"PRIx64""
> + nvme_err_invalid_prp2_align(uint64_t prp2) "PRP2 is not page aligned: 0=
x%"PRIx64""
> +--
> +1.8.3.1
> +
> diff --git a/meta/recipes-devtools/qemu/qemu/hw-block-nvme-refactor-nvme_=
addr_read.patch b/meta/recipes-devtools/qemu/qemu/hw-block-nvme-refactor-nv=
me_addr_read.patch
> new file mode 100644
> index 0000000..66ada52
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/hw-block-nvme-refactor-nvme_addr_re=
ad.patch
> @@ -0,0 +1,55 @@
> +From 55428706d5b0b8889b8e009eac77137bb556a4f0 Mon Sep 17 00:00:00 2001
> +From: Klaus Jensen <k.jensen@samsung.com>
> +Date: Tue, 9 Jun 2020 21:03:17 +0200
> +Subject: [PATCH 1/2] hw/block/nvme: refactor nvme_addr_read
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Pull the controller memory buffer check to its own function. The check
> +will be used on its own in later patches.
> +
> +Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> +Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> +Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
> +Reviewed-by: Keith Busch <kbusch@kernel.org>
> +Message-Id: <20200609190333.59390-7-its@irrelevant.dk>
> +Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> +---
> + hw/block/nvme.c | 16 ++++++++++++----
> + 1 file changed, 12 insertions(+), 4 deletions(-)
> +
> +diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> +index 12d8254..e6f24a6 100644
> +--- a/hw/block/nvme.c
> ++++ b/hw/block/nvme.c
> +@@ -52,14 +52,22 @@
> +
> + static void nvme_process_sq(void *opaque);
> +
> ++static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)
> ++{
> ++    hwaddr low =3D n->ctrl_mem.addr;
> ++    hwaddr hi  =3D n->ctrl_mem.addr + int128_get64(n->ctrl_mem.size);
> ++
> ++    return addr >=3D low && addr < hi;
> ++}
> ++
> + static void nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int siz=
e)
> + {
> +-    if (n->cmbsz && addr >=3D n->ctrl_mem.addr &&
> +-                addr < (n->ctrl_mem.addr + int128_get64(n->ctrl_mem.siz=
e))) {
> ++    if (n->cmbsz && nvme_addr_is_cmb(n, addr)) {
> +         memcpy(buf, (void *)&n->cmbuf[addr - n->ctrl_mem.addr], size);
> +-    } else {
> +-        pci_dma_read(&n->parent_obj, addr, buf, size);
> ++        return;
> +     }
> ++
> ++    pci_dma_read(&n->parent_obj, addr, buf, size);
> + }
> +
> + static int nvme_check_sqid(NvmeCtrl *n, uint16_t sqid)
> +--
> +1.8.3.1
> +
> --
> 1.8.3.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179890): https://lists.openembedded.org/g/openembedde=
d-core/message/179890
> Mute This Topic: https://lists.openembedded.org/mt/97959050/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

