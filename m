Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3DAD67706B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 08:28:11 +0000 (UTC)
Received: by qgbb65 with SMTP id b65so45462142qgb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 01:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=GxwSsdaz8Y8IPHyJDebObFb18cVKU3kYTUnCaiVJv84=;
	b=mXIGnsYItlqP0ZEsNcx9T1e0OBLP/AVWSKdVVfcC8NwSelGdb4RqzHcs/1+9KbjGke
	DDoeqRIiSeHqxKtus/+KBgcVJvnjGtUnTBiNZMkm2L9L2VlC2a1UJy0ZkfbVesYZdc6k
	GC7KeBEgjlBn6zbzBW4ddA9G7GYNepTbyQO/SV94eBT4EjSGbKwV0R7ZQeZcLeAAbdGw
	ySLnPAei4gjZYA4fMaBGMTKsGO13VgkfdAf9Twu8eEVQWEN0ZNn5UWalJxduW7vbAIg4
	WMDRp18nCNstGeYua+vztymefP0UvWG/RZXZO1HRYKSnT/fOiyVHuCKyPos1c9YXmWW3
	oPTQ==
X-Gm-Message-State: ALoCoQk5iUaYOQ+C7sctMqCqw/qfZs1bOpVRGfkZ1qOyEh718fMhSSZoObC0Bd23qFSAaJ+01Cp1
X-Received: by 10.140.96.135 with SMTP id k7mr35187247qge.34.1445243291677;
	Mon, 19 Oct 2015 01:28:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.55 with HTTP; Mon, 19 Oct 2015 01:27:52 -0700 (PDT)
In-Reply-To: <1445242541-41638-2-git-send-email-s.christ@phytec.de>
References: <1445242541-41638-1-git-send-email-s.christ@phytec.de>
	<1445242541-41638-2-git-send-email-s.christ@phytec.de>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 19 Oct 2015 10:27:52 +0200
Message-ID: <CAP71Wjz2YEuj8qLEw63027bGcYKNAPOazv-8Rd+J5RQ2C50UKA@mail.gmail.com>
To: Stefan Christ <s.christ@phytec.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] linux-dtb.inc: fix detection of ending '.dts'
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
X-List-Received-Date: Mon, 19 Oct 2015 08:28:12 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 19, 2015 at 10:15 AM, Stefan Christ <s.christ@phytec.de> wrote:
>
> Device tree files ending with ".dts" are not recognized correctly
> because of unnecessary front slashes.
>
> Signed-off-by: Stefan Christ <s.christ@phytec.de>
> ---
>  meta/recipes-kernel/linux/linux-dtb.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
> index ee3a5e1..db2afb8 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -8,7 +8,7 @@ python __anonymous () {
>  do_compile_append() {
>         if test -n "${KERNEL_DEVICETREE}"; then
>                 for DTB in ${KERNEL_DEVICETREE}; do
> -                       if echo ${DTB} | grep -q '/dts/'; then
> +                       if echo ${DTB} | grep -q 'dts'; then



My understanding is that the '/dts/' was here to catch 'boot/dts/' in
order to detect the absolute path name, not the trailing '.dts'. In
which case this patch might not be appropriate.

