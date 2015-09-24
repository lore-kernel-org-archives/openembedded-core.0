Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 12CF4734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 20:03:25 +0000 (UTC)
Received: by qgez77 with SMTP id z77so54062220qge.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 13:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FrnXzyM/fQhp9T/GuvfxiTAdJhXWFkPJ2wkn8BNGhf0=;
	b=IUIS7eIMX2CKhapjRyxclmmeJtPPtiipKzgjms7MnN7l90v6fkso1Gqy/RqKEF+U0T
	lJsV7YEr7BJ9t/sbtp3pZdDM9h+pxqwm6qkIbWvwbhXCHJpa1lvWWL5LC6FXF27R/p5+
	oHRTi0mjf2YoP3iolUdzlKNbMIx2tZyHCZaFTguSx8Cn8FQ6q/yXLk0fapVt/JEESDqU
	U2eDM0JIiNiN5X0iIrExOMm8OTjDVDYdczo7nsMPoN6zsbcgRh3AVYF7O6LYyjNpVaRj
	NHJ8N7aY97jvIXmmoqEPGYGupD2TJqnDkxG096KG30QBygZT541osoSoDUG0wymA8fiY
	xZ6A==
X-Gm-Message-State: ALoCoQmr3+uXmXd8W6syTKCFFE7KpwJl06KGg4GUT2WCVtN48blKhCORGitDKlAMQDp+5oGVnatE
X-Received: by 10.140.151.76 with SMTP id 73mr2036609qhx.61.1443125005569;
	Thu, 24 Sep 2015 13:03:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.55 with HTTP; Thu, 24 Sep 2015 13:03:06 -0700 (PDT)
In-Reply-To: <1443116526-16989-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1443116526-16989-1-git-send-email-alexander.kanavin@linux.intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 24 Sep 2015 13:03:06 -0700
Message-ID: <CAP71Wjz0zd_gTE8J82P0bvxvqSb_iH2CkK5jy=sGUGjKk_dGSQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: change glimagesink rank to marginal
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
X-List-Received-Date: Thu, 24 Sep 2015 20:03:27 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 24, 2015 at 10:42 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> [YOCTO #7787]
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../0001-glimagesink-Downrank-to-marginal.patch    | 32 ++++++++++++++++++++++
>  .../gstreamer/gstreamer1.0-plugins-bad_1.4.5.bb    |  4 ++-
>  2 files changed, 35 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-glimagesink-Downrank-to-marginal.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-glimagesink-Downrank-to-marginal.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-glimagesink-Downrank-to-marginal.patch
> new file mode 100644
> index 0000000..f677603
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-glimagesink-Downrank-to-marginal.patch
> @@ -0,0 +1,32 @@
> +From c6b37a80806f9128de47f1ccc3f2354f8d436bb6 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Thu, 24 Sep 2015 19:47:32 +0300
> +Subject: [PATCH] glimagesink: Downrank to marginal
> +
> +On desktop, where there is good OpenGL, xvimagesink will come up first,
> +on other platforms, OpenGL can't be trusted because it's either software (like
> +in a VM) or broken (like on embedded)., so let ximagesink come above.
> +
> +Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=751684]


fwiw... on my platforms (QCOM DragonBoard) I rely on glimagesink, and
we have good OpenGL support.. but I understand that this isn't the
norm for ARM, and more an exception.. I can manage that in my BSP
layer, if that ever gets merged. Note we might want to wait for the
upstream discussion to settle before merging.

