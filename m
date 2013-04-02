Received: from mail-oa0-f48.google.com ([209.85.219.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1UN17s-00049V-58
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 15:19:48 +0200
Received: by mail-oa0-f48.google.com with SMTP id j1so350189oag.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2013 06:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=PF/WkM+2dlXDw+0wFy2OHHWdBMR9hQNzt4xw0axX8tg=;
	b=VCTgmxCKYKVvYN14W1WjkFnS80nNOTU+64nIw0g5yBNl4AoyTPQ2QiCLjaKU3tVM5/
	llnJKG0+cb2Sh8q7fXba546VSMNEMuvI8Ijp/hL19YkcBfuMMGIDZRhu+8Qwu/FedNMM
	0FLkQzj6/7krX98qBRmAXz8zbaerJDyummbIe/BfdBKUGWC+drsnoaA+3MdYtyrAwRud
	yScJyWy4p95iZpmfZeUKI4tW8HbCmkUZdc3zhDT4oRytyh/KLEYUpgIUe9NFIJ2uC4zc
	urA9vqPjLrUEopzam2o+xCtcSxbq08lSDZtZlZDmbLjscYrvmH3iQ7ooTvI7zsncrlvx
	Iv/w==
MIME-Version: 1.0
X-Received: by 10.60.19.101 with SMTP id d5mr5186500oee.115.1364907757888;
	Tue, 02 Apr 2013 06:02:37 -0700 (PDT)
Received: by 10.60.46.69 with HTTP; Tue, 2 Apr 2013 06:02:37 -0700 (PDT)
In-Reply-To: <1364907243-26346-1-git-send-email-radu.moisan@intel.com>
References: <1364907243-26346-1-git-send-email-radu.moisan@intel.com>
Date: Tue, 2 Apr 2013 15:02:37 +0200
Message-ID: <CAGiJk9chnOh7F9koDo2kEP5rjJ97kZ9bL6uEKkWYegS9g4AUnw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Radu Moisan <radu.moisan@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] systemd: set default.target to multi-user.target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Apr 2013 13:19:48 -0000
Content-Type: text/plain; charset=UTF-8

2013/4/2 Radu Moisan <radu.moisan@intel.com>:
> This fixes a service dependency issue;
> While graphical.target is the default mode, systemd
> will try to start display-manager.service which is not
> available.
>
> For xserver-nodm-init we would then have something like:
> inherit update-alternatives
> ALTERNATIVE_${PN} = "systemd-def-target"
> ALTERNATIVE_TARGET[systemd-def-target] = "${systemd_unitdir}/system/graphical.target"
> ALTERNATIVE_LINK_NAME[systemd-def-target] = "${systemd_unitdir}/system/default.target"
> ALTERNATIVE_PRIORITY[systemd-def-target] ?= "10"
>
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>  meta/recipes-core/systemd/systemd_199.bb |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
> index ba1d133..bf1eb39 100644
> --- a/meta/recipes-core/systemd/systemd_199.bb
> +++ b/meta/recipes-core/systemd/systemd_199.bb
> @@ -248,6 +248,7 @@ update-alternatives --install ${base_sbindir}/halt halt ${base_bindir}/systemctl
>  update-alternatives --install ${base_sbindir}/reboot reboot ${base_bindir}/systemctl 300
>  update-alternatives --install ${base_sbindir}/shutdown shutdown ${base_bindir}/systemctl 300
>  update-alternatives --install ${base_sbindir}/poweroff poweroff ${base_bindir}/systemctl 300
> +update-alternatives --install ${systemd_unitdir}/system/default.target systemd-def-target ${systemd_unitdir}/system/multi-user.target 1
>  }
>
>  pkg_prerm_systemd () {
> @@ -256,6 +257,7 @@ update-alternatives --remove halt ${base_bindir}/systemctl
>  update-alternatives --remove reboot ${base_bindir}/systemctl
>  update-alternatives --remove shutdown ${base_bindir}/systemctl
>  update-alternatives --remove poweroff ${base_bindir}/systemctl
> +update-alternatives --remove systemd-def-target ${systemd_unitdir}/system/multi-user.target
>  }
>
>  pkg_postinst_udev-hwdb () {
> --
> 1.7.9.5
>

Reliving a dejavu?

This was already rejected before see [1], hope you remember this.

[1] http://lists.linuxtogo.org/pipermail/openembedded-core/2013-January/034806.html

--
Regards
Samuel


