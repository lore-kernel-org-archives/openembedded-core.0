X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
MIME-Version: 1.0
References: <20221011160336.39990-1-vkumbhar@mvista.com>
In-Reply-To: <20221011160336.39990-1-vkumbhar@mvista.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 11 Oct 2022 11:31:29 -1000
Message-ID: <CAOSpxdbcTMK0qO3=3mO+GuJMGqd=zQXY+sbMwTLf=T4DeXDF4g@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] bluez: fix CVE-2022-39177
Content-Type: text/plain; charset="UTF-8"
List-id: <openembedded-core.lists.openembedded.org>
To: vkumbhar <vkumbhar@mvista.com>
Cc: openembedded-core@lists.openembedded.org

On Tue, Oct 11, 2022 at 6:04 AM vkumbhar <vkumbhar@mvista.com> wrote:
>
> Source: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=e2b0f0d8d63e1223bb714a9efb37e2257818268b
> MR: 122138
> Type: Security Fix
> Disposition: Backport from https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=e2b0f0d8d63e1223bb714a9efb37e2257818268b
> ChangeID: 680cf2af29d34d7925523e413b40008a71b0a26c
> Description:
>     avrcp: Fix not checking if params_len match number of received bytes
>
>     This makes sure the number of bytes in the params_len matches the
>     remaining bytes received so the code don't end up accessing invalid
>     memory.
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>  .../bluez5/bluez5/0001-CVE-2022-39177.patch   | 34 +++++++++++++++++++

In V2 please remove the leading 0001- from the CVE patch name.

>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-CVE-2022-39177.patch
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
> index f34ba0dce5..f7d5f57c75 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -52,6 +52,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
>             file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
>             file://0001-test-gatt-Fix-hung-issue.patch \
> +           file://0001-CVE-2022-39177.patch \

I suspect you are not working from the current dunfell HEAD since this
patch doesn't apply:

Applying: bluez: fix CVE-2022-39177
Using index info to reconstruct a base tree...
M meta/recipes-connectivity/bluez5/bluez5.inc
.git/rebase-apply/patch:42: space before tab in indent.
  goto err_metadata;
.git/rebase-apply/patch:43: space before tab in indent.
  }
.git/rebase-apply/patch:44: trailing whitespace.

.git/rebase-apply/patch:53: space before tab in indent.
  for (handler = session->control_handlers; handler->pdu_id; handler++) {
.git/rebase-apply/patch:54: space before tab in indent.
  if (handler->pdu_id == pdu->pdu_id)
warning: squelched 3 whitespace errors
warning: 8 lines add whitespace errors.
Falling back to patching base and 3-way merge...
Auto-merging meta/recipes-connectivity/bluez5/bluez5.inc
CONFLICT (content): Merge conflict in
meta/recipes-connectivity/bluez5/bluez5.inc
error: Failed to merge in the changes.
Patch failed at 0001 bluez: fix CVE-2022-39177

Please rebase on the current head and send a V2.

Thanks!

Steve

>             "
>  S = "${WORKDIR}/bluez-${PV}"
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-CVE-2022-39177.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-CVE-2022-39177.patch
> new file mode 100644
> index 0000000000..54709e0cb1
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-CVE-2022-39177.patch
> @@ -0,0 +1,34 @@
> +From e5c8613fe171f0dc3aa812270bb15063aaa73d45 Mon Sep 17 00:00:00 2001
> +From: Vivek Kumbhar <vkumbhar@mvista.com>
> +Date: Sun, 9 Oct 2022 21:06:51 +0530
> +Subject: [PATCH] CVE-2022-39177
> +
> +Upstream-Status: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=e2b0f0d8d63e1223bb714a9efb37e2257818268b
> +CVE: CVE-2022-39177
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + profiles/audio/avrcp.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/profiles/audio/avrcp.c b/profiles/audio/avrcp.c
> +index d9471c0..0233d53 100644
> +--- a/profiles/audio/avrcp.c
> ++++ b/profiles/audio/avrcp.c
> +@@ -1916,6 +1916,14 @@ static size_t handle_vendordep_pdu(struct avctp *conn, uint8_t transaction,
> +               goto err_metadata;
> +       }
> +
> ++      operands += sizeof(*pdu);
> ++      operand_count -= sizeof(*pdu);
> ++
> ++      if (pdu->params_len != operand_count) {
> ++              DBG("AVRCP PDU parameters length don't match");
> ++              pdu->params_len = operand_count;
> ++      }
> ++
> +       for (handler = session->control_handlers; handler->pdu_id; handler++) {
> +               if (handler->pdu_id == pdu->pdu_id)
> +                       break;
> +--
> +2.25.1
> +
> --
> 2.25.1
>
>
> 
>
